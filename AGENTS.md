# AGENTS.md

Guidelines for AI coding agents working in the netboot.xyz repository.

## Project Summary

netboot.xyz generates iPXE bootloaders and menus for 190+ operating systems using Ansible and Jinja2 templates. There is no application code in a traditional sense — the project produces `.ipxe` scripts and bootloader binaries.

## Build Commands

```bash
# Syntax check (fast, run first)
ansible-playbook site.yml --syntax-check

# Lint Ansible tasks
ansible-lint -v roles/netbootxyz/tasks

# Full local build (generates menus + bootloaders to /var/www/html)
ansible-playbook site.yml

# Menu-only build (skip bootloader compilation)
ansible-playbook site.yml -e "generate_disks=false generate_checksums=false generate_signatures=false"

# Docker build (outputs to buildout/)
docker build -t localbuild --platform=linux/amd64 -f Dockerfile .
docker run --rm -it --platform=linux/amd64 -v $(pwd):/buildout localbuild

# Release builds
./script/build_release dev      # Development
./script/build_release pr       # Pull request test
./script/build_release rc       # Release candidate
./script/build_release release  # Production
./script/build_release rolling  # Rolling
```

### CI Checks (what PRs must pass)

1. `ansible-playbook site.yml --syntax-check`
2. `ansible-lint -v roles/netbootxyz/tasks`
3. Full Docker build via `./script/build_release pr`

### Testing

Molecule tests exist but require Docker:
```bash
pip install molecule molecule-docker
molecule test
```

There are no unit tests. Validation is done through syntax checks, linting, and full builds.

## Code Style

### YAML / Ansible

- Start every YAML file with `---` on line 1.
- Use 2-space indentation consistently.
- Use **fully-qualified collection names** (FQCN) for all modules:
  - `ansible.builtin.template`, `ansible.builtin.set_fact`, `ansible.builtin.shell`, etc.
  - Never use short names like `template:` or `shell:`.
- Use `snake_case` for all variable names: `boot_domain`, `generate_menus`, `netbootxyz_root`.
- Guard booleans with the `| default(true) | bool` pattern:
  ```yaml
  when:
    - generate_menus | default(true) | bool
  ```
- Use `when:` as a list even for single conditions.
- Use descriptive `name:` for every task.
- The `.ansible-lint` config skips these rules (do not add workarounds for them):
  - `command-instead-of-module`, `command-instead-of-shell`
  - `no-changed-when`, `risky-shell-pipe`
  - `literal-compare`, `var-naming[no-role-prefix]`

### iPXE Templates (`.ipxe.j2` files)

- Start with `#!ipxe` shebang on line 1.
- Add a comment header with OS name and URL on lines 2-4.
- iPXE scripts are **flat** — do not indent iPXE commands.
- Use `#` for comments inside templates.
- Variable conventions:
  - iPXE runtime variables: `${variable_name}` (evaluated at boot time)
  - Jinja2 template variables: `{{ variable }}` (evaluated at build time)
  - These are often mixed: `${live_endpoint}{{ endpoints.foo.path }}`
- Labels use `:label_name` in `snake_case`.
- Navigation pattern: `goto ${menu} ||` at template start.
- User selection: `choose <var> || goto <exit_label>`.
- Exit pattern: clear menu and `exit 0`:
  ```ipxe
  :distro_exit
  clear menu
  exit 0
  ```
- Error pattern: echo, prompt, return to menu:
  ```ipxe
  :error
  echo Error occurred, press any key to return to menu
  prompt
  goto main_menu
  ```
- Fallback chains: `command || goto fallback` for graceful degradation.
- Architecture mapping varies by OS family:
  - Red Hat: `x86_64` → `x86_64`, `arm64` → `aarch64`
  - Debian: `x86_64` → `amd64`, `arm64` → `arm64`
- Guard optional values: `isset ${variable}` in iPXE, `{% if value.field is defined %}` in Jinja2.

### Jinja2 Patterns

- Loop over releases: `{% for item in releases.<distro>.versions %}`
- Sort by name: `{% for key, value in releases.items() | sort(attribute='1.name') %}`
- Filter enabled items: `{% if value.enabled is defined and value.enabled | bool %}`
- Template iteration uses `with_community.general.filetree` in tasks.

### OS Definition Schema (`defaults/main.yml`)

```yaml
releases:
  distro_key:          # lowercase, no hyphens (e.g., almalinux, rockylinux)
    name: "Display Name"
    mirror: "http://mirror.url"
    base_dir: "path/on/mirror"
    enabled: true
    menu: linux         # one of: linux, bsd, dos, unix
    versions:
      - code_name: "version_id"
        name: "Display Version"
```

Optional fields: `archive_mirror`, `paths`, `flavors`, `platforms`, `version`.

### Utility Definition Schema (`defaults/main.yml`)

```yaml
utilitiesefi:          # or utilitiespcbios64, utilitiespcbios32, utilitiesarm
  utility_key:
    name: "Display Name"
    enabled: true
    type: direct        # one of: direct, ipxemenu, memdisk, memtest, sanboot
    kernel: "<url>"
    initrd: "<url>"     # optional
```

## File Organization

| Path | Purpose |
|------|---------|
| `site.yml` | Main playbook entry point |
| `defaults/main.yml` | All OS/utility definitions and default config |
| `endpoints.yml` | Live image endpoint URLs |
| `user_overrides.yml` | Local overrides (not committed) |
| `templates/menu/*.ipxe.j2` | ~100 iPXE menu templates |
| `templates/disks/*.j2` | Bootloader embedded scripts |
| `templates/pipxe/*.j2` | Raspberry Pi Makefile templates |
| `tasks/*.yml` | 14 Ansible task files |
| `vars/{debian,redhat,ubuntu}.yml` | Per-distro package lists |
| `script/` | Build and release shell scripts |

## Menu Hierarchy

```
menu.ipxe (main) → linux.ipxe → ubuntu.ipxe, fedora.ipxe, ...
                  → bsd.ipxe   → freebsd.ipxe, openbsd.ipxe, ...
                  → live.ipxe  → live-ubuntu.ipxe, ...
                  → utils-*.ipxe
                  → windows.ipxe
```

Menus chain via `chain ${menu}.ipxe || goto error`. Signature verification gates chaining when `sigs_enabled` is true.

## Error Handling

- **Ansible**: Relies on default fail-fast behavior. No `block/rescue/always`. Guard tasks with `when:` conditions. Use `| default()` to prevent undefined variable errors.
- **iPXE**: Use `command || goto fallback` chains. Protocol degradation: HTTPS → HTTP → local boot. Always provide a `:error` label that prompts the user.
- **Shell scripts**: Use `set -e` at the top of all scripts.

## Adding a New Operating System

1. Add entry to `releases:` in `roles/netbootxyz/defaults/main.yml`.
2. Create `roles/netbootxyz/templates/menu/<distro>.ipxe.j2` following existing templates.
3. The menu template is auto-discovered via `filetree` iteration — no registration needed.
4. Add the distro to the appropriate category menu (e.g., `linux.ipxe.j2`) if it needs a menu entry.
5. If using live images, add endpoint to `endpoints.yml`.
6. Test: `ansible-playbook site.yml --syntax-check && ansible-lint -v roles/netbootxyz/tasks`

## Key Variables

- **`boot_domain`**: Target domain for generated menus.
- **`boot_version`**: Version string for releases.
- **`site_name`**: Custom branding (defaults to `netboot.xyz`).
- **`generate_menus` / `generate_disks`**: Enable/disable build components.
- **`sigs_enabled`**: Enable signature verification for menu chaining.
- **`live_endpoint`**: Base URL for live/rescue images.
- **Runtime variables**: `${distro}_mirror` and `${distro}_base_dir` are auto-generated from `releases:` entries in `boot.cfg.j2` and available to all menu templates at boot time.

## Git Workflow

- **`development`**: Main development branch, default PR target.
- **`RC`**: Release candidate staging.
- **`master`**: Production releases.
- Commit style: imperative mood, descriptive. Automated commits use `Version bump for ...` format.
