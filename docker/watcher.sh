#!/bin/sh
# Watches /isos for changes and auto-regenerates /menus/local-isos.ipxe
# Runs inside the iso-watcher container — nothing needs to be done manually.

ISOS_DIR="/isos"
OUTPUT="/menus/local-isos.ipxe"
TMPLIST="/tmp/iso_list.txt"
CHANGED="/tmp/iso_changed"

generate_menu() {
  mkdir -p /menus

  # Collect all ISOs recursively, sorted by path
  find "${ISOS_DIR}" -name "*.iso" 2>/dev/null | sort > "${TMPLIST}"
  ISO_COUNT="$(wc -l < "${TMPLIST}" | tr -d ' ')"

  if [ "${ISO_COUNT}" = "0" ]; then
    printf '#!ipxe\necho No ISOs found. Drop .iso files into the isos/ folder.\necho.\nprompt Press any key to return...\nexit 1\n' \
      > "${OUTPUT}"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [iso-watcher] No ISOs found — menu cleared"
    return
  fi

  # ── Header ──────────────────────────────────────────────────────────────────
  cat > "${OUTPUT}" <<'HEADER'
#!ipxe
###
### Local ISO Boot Menu (auto-generated — managed by iso-watcher container)
###

:local_iso_menu
clear iso_choice
menu Local ISO Boot Menu
HEADER

  # ── Menu items, grouped by subfolder ────────────────────────────────────────
  last_dir=""
  idx=0
  while IFS= read -r isofile; do
    [ -z "${isofile}" ] && continue
    rel="${isofile#${ISOS_DIR}/}"
    dir="$(dirname "${rel}")"
    filename="$(basename "${rel}")"
    label="${filename%.iso}"

    # Emit a category gap whenever the directory changes
    if [ "${dir}" != "${last_dir}" ]; then
      if [ "${dir}" = "." ]; then
        printf 'item --gap -- === General ===\n' >> "${OUTPUT}"
      else
        printf 'item --gap -- === %s ===\n' "${dir}" >> "${OUTPUT}"
      fi
      last_dir="${dir}"
    fi

    printf 'item iso_%d    %s\n' "${idx}" "${label}" >> "${OUTPUT}"
    idx=$((idx + 1))
  done < "${TMPLIST}"

  # ── Navigation footer ────────────────────────────────────────────────────────
  printf 'item --gap --\nitem iso_back  Go back\nchoose iso_choice || goto iso_back\ngoto ${iso_choice}\n\n' \
    >> "${OUTPUT}"

  # ── Boot entries ─────────────────────────────────────────────────────────────
  # ${boot_domain} is an iPXE variable — the $ is intentionally literal here.
  # ISOs in subfolders are served at http://${boot_domain}/isos/subfolder/name.iso
  idx=0
  while IFS= read -r isofile; do
    [ -z "${isofile}" ] && continue
    rel="${isofile#${ISOS_DIR}/}"
    filename="$(basename "${rel}")"
    printf ':iso_%d\necho Booting %s ...\nkernel http://${boot_domain}/memdisk raw iso\ninitrd http://${boot_domain}/isos/%s\nboot || goto local_iso_menu\n\n' \
      "${idx}" "${filename}" "${rel}" >> "${OUTPUT}"
    idx=$((idx + 1))
  done < "${TMPLIST}"

  printf ':iso_back\nexit 1\n' >> "${OUTPUT}"

  echo "$(date '+%Y-%m-%d %H:%M:%S') [iso-watcher] Menu updated — ${ISO_COUNT} ISO(s)"
}

echo "[iso-watcher] Starting. Watching ${ISOS_DIR} for changes ..."
generate_menu

# ── Background watcher ────────────────────────────────────────────────────────
# inotifywait fires on any file event; we touch a flag file as the signal.
# The main loop checks every 2 s and regenerates only once per burst of events.
(
  while true; do
    inotifywait -r -e create,delete,move,close_write -q "${ISOS_DIR}" 2>/dev/null \
      && touch "${CHANGED}"
    sleep 1
  done
) &

while true; do
  sleep 2
  if [ -f "${CHANGED}" ]; then
    rm -f "${CHANGED}"
    generate_menu
  fi
done
