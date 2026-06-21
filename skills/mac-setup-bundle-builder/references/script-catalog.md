# Script Catalog

Generate scripts only for features the user wants, but keep these purposes and patterns.

## Required Foundation

`bootstrap-progress.sh`: Shared helper sourced by long-running scripts. Writes live status and additional changes.

`bootstrap-check.sh`: Verifies expected commands, apps, files, models, package managers, container images, VM labs, services, shortcuts, defaults, and repo branches. Emits `PASS`, `FAIL`, and `WARN` lines.

`generate-bootstrap-report.sh`: Creates an HTML report from check output, live progress, additional changes, machine metadata, repo status, manual attention, and raw logs.

`update-setup-inventory.sh`: Refreshes generated inventories from the current Mac. Must warn the user to review/redact secrets.

## System Restore Scripts

`apply-macos-defaults.sh`: Applies selected safe `defaults write` values and restarts affected services.

`restore-app-settings.sh`: Copies selected app settings from an ignored private bundle after apps are installed and quit.

`restore-finder-favorites.sh`: Restores Finder sidebar favorites if a helper is available; otherwise prints manual fallback.

## Containers, VMs, And Services

`restore-container-images.sh`: Pulls remote images for the detected container engine. Name it for the actual engine when useful, for example `pull-docker-images.sh` or `pull-podman-images.sh`. Skip non-pullable entries and log private registry failures.

`setup-vm-labs.sh`: Creates VM/lab folders, writes provider configs, downloads boxes/images/templates for the chosen VM manager, and records provider/architecture limitations. Name it for the actual tool when useful, for example `setup-vagrant-labs.sh` or `setup-utm-labs.sh`.

`setup-local-services.sh`: Optional. Configures local databases, queues, servers, LaunchAgents, tunnels, or app-specific background services discovered on the source Mac.

## Developer Tooling Scripts

`setup-local-tools.sh`: Installs/configures discovered developer tools, local AI tools, coding assistants, IDE extensions, model runtimes, and helper CLIs. Name it more specifically if the bundle has a narrow scope.

`setup-editor-tooling.sh`: Optional. Reinstalls editor/IDE extensions or plugins from generated inventories and restores safe editor config after the editor is installed.

`setup-launchers.sh`: Creates `.command`, shell, LaunchAgent, or platform-appropriate launchers for start/stop actions.

`start-local-tool.sh`: Starts one managed tool/service or a default tool set. Use env vars for model paths, ports, project roots, and profiles.

`stop-local-tool.sh`: Stops one managed tool/service or the managed tool set.

## Script Standards

- Add a purpose docblock immediately after the shebang.
- Use `set -u` or `set -euo pipefail` where appropriate.
- Avoid printing secrets.
- Use functions for command discovery and fallback installs.
- Log long-running steps with the progress helper.
- Continue on recoverable failures, collect failures, and summarize them.
- Validate with `bash -n`.
