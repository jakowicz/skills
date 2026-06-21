# Mac Setup Bundle Blueprint

This reference defines the generated bundle, not this skill's own folder. All paths below are paths the agent should create in the user's target repository.

## Core Generated Files

`PROMPT.md`: A self-contained setup prompt for a future AI setup agent. It must name every input file and script, define setup order, require live progress logging, require safe fallback handling, and require the final report. Keep it product-neutral.

`manifest.yaml`: The structured source of truth. Include machine info, target machine assumptions, shell, package managers, system files, apps, developer tools, editor/IDE extensions and settings, virtualization/containerization, local services, language runtimes, shortcuts/launchers, repos, unclassified config, and post-setup checks.

`setup-order.md`: The ordered dependency graph. Put OS updates and platform developer tools first; detected package managers before packages; app-store login before app-store automation; shell/SSH/hosts before repo clone; container engines before container image pulls; VM providers before VM labs; apps before restoring app settings; verification/report last.

Package-manager files: Generate whatever the user's system needs. Examples include a Homebrew `Brewfile`, Nix flake/config, MacPorts list, app-store CLI list, language package manifests, or tool-specific export files. Prefer current stable packages unless the manifest documents a pin or legacy requirement.

`RECOMMENDATIONS.md`: Gaps and future improvements: secrets checklist, app settings missed, backup requirements, manual login/licensing, large data that should not live in git.

`unclassified-configs.md`: Best-effort inventory for discovered config/state that does not fit a known restore flow. Include paths, owner app/tool, privacy risk, whether copied privately or only documented, and suggested restore/check steps.

## Generated Manifest Sections

- `source_machine`: macOS version, build, architecture, capture date.
- `target_machine`: expected model, architecture, package-manager prefixes/paths, Rosetta/emulation policy.
- `shell`: login shell, framework, theme, plugins, dotfiles, secrets placeholders.
- `package_managers`: detected package managers, export files, install order, fallback methods.
- `system_files`: hosts, SSH, GPG if relevant, macOS defaults, app settings, Finder favorites, live progress, verification, report generation.
- `apps`: installed apps grouped by source, including package managers, app stores, vendor/manual installers, and unknown/manual lookup failures.
- `containers`: detected container engines, remote image inventories, compose/kubernetes/local registry notes, private registry auth notes.
- `virtualization`: detected VM managers, labs/images/templates, provider notes, architecture limitations.
- `developer_tools`: IDEs/editors, extension/plugin inventories, settings/keybindings/snippets/tasks/debug profiles, CLIs, coding assistants, local model tools, launchers, and secret placeholders.
- `unclassified_configs`: config/state found during discovery that needs backup, manual restore, or future automation.
- `languages`: every detected runtime/version manager/package manager, installed/default versions, global packages, legacy requirements.
- `services`: local databases, queues, web servers, background daemons, LaunchAgents, menu-bar helpers, start/stop commands.
- `shortcuts`: menu-bar or double-click launchers and what they start/stop.
- `repos`: path, remote, branch, status notes; never delete local work.
- `post_setup_checks`: commands and scripts to run after setup.

## Live Progress And Reporting

Create a shared progress helper with functions such as:

- `bootstrap_step`
- `bootstrap_done`
- `bootstrap_warn`
- `bootstrap_fail`
- `bootstrap_change`

Generated report files should live under the chosen bundle directory:

```text
<bundle_dir>/reports/live-bootstrap-status.log
<bundle_dir>/reports/additional-changes.log
<bundle_dir>/reports/bootstrap-check-*.log
<bundle_dir>/reports/bootstrap-report-*.html
```

The HTML report should include machine metadata, pass/fail/warn counts, failures, fallback guidance, manual attention, live progress, additional changes, repository status, and raw check log.

## Privacy And Safety

- Never print private key contents.
- Never stage or commit ignored private bundles.
- Do not copy auth tokens, browser profiles, app session databases, AI assistant auth/history/logs, or cloud credentials.
- Prefer secret placeholders and manual login instructions.
- For private registries or package feeds, record the auth requirement without credentials.
- Do not use destructive commands to clean user state unless explicitly requested.

## User-Facing Explanation

Explain that the generated bundle is for an AI setup agent to run on a new Mac, not a manual checklist. Make the live log path obvious so the user can monitor long installs without reading raw agent output.
