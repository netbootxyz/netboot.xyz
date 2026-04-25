#!/usr/bin/env bash
# MANUAL FALLBACK — normally the iso-watcher container handles this automatically.
# Only run this if the watcher container is not running (e.g. during development).
#
# Scans the isos/ folder (including subfolders) and writes menus/local-isos.ipxe.
# Subfolders become category headers in the boot menu.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ISOS_DIR="${SCRIPT_DIR}/isos"
OUTPUT_FILE="${SCRIPT_DIR}/menus/local-isos.ipxe"

mkdir -p "${SCRIPT_DIR}/menus"

# Collect ALL .iso files recursively, sorted by path (groups subfolders together)
mapfile -d '' ALL_ISOS < <(find "${ISOS_DIR}" -name "*.iso" -print0 2>/dev/null | sort -z)

ISO_COUNT=${#ALL_ISOS[@]}

if [ "${ISO_COUNT}" -eq 0 ]; then
  echo "No .iso files found in ${ISOS_DIR}/ (or subfolders)."
  echo "Drop .iso files there — subfolders like isos/linux/ or isos/windows/ are supported."
  cat > "${OUTPUT_FILE}" <<'PLACEHOLDER'
#!ipxe
echo No local ISOs found.
echo Drop .iso files into the isos/ folder (subfolders are supported).
echo Then run ./generate-iso-menu.sh on the host.
echo.
prompt Press any key to return...
exit 1
PLACEHOLDER
  exit 0
fi

# ── Build the menu header ────────────────────────────────────────────────────
cat > "${OUTPUT_FILE}" <<'HEADER'
#!ipxe
###
### Local ISO Boot Menu  (auto-generated — do not edit by hand)
### Re-run ./generate-iso-menu.sh to refresh after adding/moving ISOs.
###

:local_iso_menu
clear iso_choice
menu Local ISO Boot Menu
HEADER

# ── Menu items, grouped by subfolder ─────────────────────────────────────────
# When the parent folder changes, emit a --gap separator with the folder name.
# ISOs directly in isos/ appear under "General".
declare -a ITEM_ISOS=()
last_dir=""
idx=0

for isofile in "${ALL_ISOS[@]}"; do
  rel="${isofile#"${ISOS_DIR}/"}"        # e.g. linux/ubuntu.iso  or  ubuntu.iso
  dir="$(dirname "${rel}")"              # e.g. linux             or  .
  filename="$(basename "${rel}")"
  label="${filename%.iso}"               # strip .iso for display

  # Emit a category gap whenever the directory changes
  if [ "${dir}" != "${last_dir}" ]; then
    if [ "${dir}" = "." ]; then
      echo 'item --gap -- === General ===' >> "${OUTPUT_FILE}"
    else
      echo "item --gap -- === ${dir} ===" >> "${OUTPUT_FILE}"
    fi
    last_dir="${dir}"
  fi

  printf 'item iso_%d    %s\n' "${idx}" "${label}" >> "${OUTPUT_FILE}"
  ITEM_ISOS+=("${rel}")
  idx=$((idx + 1))
done

# ── Footer of menu items ─────────────────────────────────────────────────────
cat >> "${OUTPUT_FILE}" <<'MID'
item --gap --
item iso_back  Go back
choose iso_choice || goto iso_back
goto ${iso_choice}

MID

# ── Boot entries ─────────────────────────────────────────────────────────────
# ISOs are served by the container's HTTP server:
#   container port 80 → host port 8080  (docker-compose.yml)
#   URL:  http://${boot_domain}/isos/<relative-path>
# ${boot_domain} is resolved by iPXE to the IP that delivered the boot file.
# Subfolders are preserved in the URL path automatically.
for i in "${!ITEM_ISOS[@]}"; do
  rel="${ITEM_ISOS[$i]}"
  filename="$(basename "${rel}")"
  urlpath="isos/${rel}"    # e.g. isos/linux/ubuntu.iso
  cat >> "${OUTPUT_FILE}" <<ENTRY
:iso_${i}
echo Booting ${filename} ...
kernel http://\${boot_domain}/memdisk raw iso
initrd http://\${boot_domain}/${urlpath}
boot || goto local_iso_menu

ENTRY
done

# ── Final label ──────────────────────────────────────────────────────────────
cat >> "${OUTPUT_FILE}" <<'FOOTER'
:iso_back
exit 1
FOOTER

echo "Generated: ${OUTPUT_FILE}"
echo "Found ${ISO_COUNT} ISO file(s):"
for f in "${ALL_ISOS[@]}"; do
  rel="${f#"${ISOS_DIR}/"}"
  echo "  - ${rel}"
done
echo
echo "ISOs are served at:  http://YOUR_SERVER_IP:8080/isos/"
echo "Refresh the page in the netboot.xyz web UI if the menu doesn't update."
