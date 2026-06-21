---
name: mac-setup-bundle-builder
description: "Create personalized AI-agent-driven Mac rebuild bundles from a user's current Mac. Use when asked to inventory a Mac and generate a tailored setup/rebuild bundle covering whatever is actually installed: apps, package managers, runtime/version managers, dotfiles, system settings, app settings, private migration notes, containers, virtual machines, local services, AI tools, repos, live progress logs, verification checks, and final HTML reports for recreating that user's Mac setup on a new machine."
---

# Mac Setup Bundle Builder

Build a self-contained Mac rebuild bundle that another AI coding agent, automation runner, or user-supervised terminal session can use to recreate a person's Mac on a new machine. The bundle should be a structured set of instructions, manifests, docs, private-transfer notes, helper scripts, live progress logs, verification checks, and a final report generator.

## Required Reading

Before creating or substantially updating a bundle, read:

- `references/bundle-blueprint.md` for the target output structure and privacy rules.
- `references/feature-matrix.md` for the full capability checklist.
- `references/script-catalog.md` for the scripts to generate and what each script should do.

Use `assets/templates/` as starting points. Those templates are part of this skill and may be copied into the generated bundle, then customized.

## Workflow

1. Choose a bundle root and a generated-script root in the user's repo. Ask if the user wants specific names; otherwise use neutral names that fit their repo and carry those names consistently through every generated file.
2. Inventory the current Mac with non-destructive commands and app metadata. Do not assume any shell, package manager, container engine, virtualization tool, language manager, editor, AI tool, or service exists until discovery confirms it.
3. Ask for clarification only when an assumption would be risky: target Mac architecture, private data handling, VM provider choice, or whether to include large state.
4. Generate the manifest, setup prompt, setup order, package-manager files, dotfiles, editor/IDE extension inventories, docs, and scripts.
5. Build live progress logging into all long-running scripts.
6. Add verification and report generation.
7. Validate generated scripts, detected shell config files, YAML, VM/provider config files, and any generated config with validators appropriate to the discovered tools.
8. Summarize what was captured, what was skipped, and what needs manual login/licensing/private transfer.

## Output Principles

- Make the bundle agent-neutral. Use “AI setup agent” or “setup agent,” not a specific product name.
- Make the bundle concrete enough to run on a new Mac, but do not embed secrets.
- Prefer reproducible installs over opaque backups: detected package managers, official installers, manifests, source-controlled config, and documented private transfer steps.
- Include fallbacks for package-manager failures, app-store automation hangs, container registry auth failures, VM provider limitations, and app preference restore failures.
- Keep local-only and private artifacts out of tracked files. Use ignored `private/` folders and documentation.
- Make progress visible while setup is running, not only in the final report.

## Minimum Required Bundle

Generate these unless the user explicitly narrows scope:

```text
<bundle_dir>/
  PROMPT.md
  manifest.yaml
  setup-order.md
  package-manager files named for the detected tools
  RECOMMENDATIONS.md
  macos-defaults.md
  app-settings.md
  finder-favorites.md
  ai-tools.md
  developer-tools.md or editor/provider-specific docs
  unclassified-configs.md
  container image inventories named for the detected engines
  vm-labs or provider-specific VM folders
  dotfiles/
  private/
  reports/
<script_dir>/
  bootstrap-progress.sh
  bootstrap-check.sh
  generate-bootstrap-report.sh
  update-setup-inventory.sh
  apply-macos-defaults.sh
  restore-app-settings.sh
  restore-finder-favorites.sh
  restore-container-images.sh or engine-specific equivalent
  setup-vm-labs.sh or provider-specific equivalent
  setup-editor-tooling.sh or editor/IDE-specific equivalent
  setup-local-tools.sh or category-specific equivalents
  setup-launchers.sh
  start-local-tool.sh
  stop-local-tool.sh
```

Adjust names and paths to the user's repo. If a feature is not relevant, omit it and explain why.

## Inventory Rules

- Use read-only commands first. Examples include OS metadata, package-manager inventory commands, application discovery, container image lists, local model lists, runtime-manager lists, `defaults read`, and app preference inspection.
- Treat named technologies as probes and examples, not requirements. A user may use zsh, bash, fish, tcsh, nushell, or another shell; Homebrew, Nix, MacPorts, pkgsrc, vendor installers, or no system package manager; Docker, Podman, Colima, Lima, OrbStack, Rancher Desktop, containerd/nerdctl, or another container runtime. Capture what is present, generate files for that setup, and document unsupported or unknown tools with best-effort restore instructions.
- Think beyond this checklist. If discovery finds app config, plugins, extensions, project templates, snippets, workspace settings, CLI config, local services, LaunchAgents, package registries, certificates, VPN profiles, browser extensions, cloud CLIs, or any other reproducible state not named here, add a manifest section, docs, restore/check steps, and private-transfer notes as appropriate.
- For editors and IDEs, capture extensions/plugins, settings, keybindings, snippets, tasks, debug profiles, workspace templates, MCP/agent config, and sync/account boundaries where safe. Examples include VS Code, Cursor, JetBrains IDEs, Xcode, Zed, Sublime, Vim/Neovim, Emacs, Nova, Android Studio, or anything else detected.
- For every detected runtime or version manager, capture all installed versions, default/global selections, aliases, shims/init requirements, and global packages where the tool exposes them. Examples include pyenv, tfenv, rbenv, nvm, asdf, mise, jenv, sdkman, rustup, goenv, plenv, phpenv, luarocks, conda, uv, or any equivalent.
- Capture container images as remote pullable tags only. Exclude dangling tags and local-only build names without a registry.
- Capture private data only into ignored local folders such as the generated bundle's `private/`; never print secrets or private key contents.
- Treat auth tokens, browser profiles, session databases, app caches, large model weights, VM disk images, ROMs, Photos/Music libraries, and cloud credentials as manual/private transfer items unless explicitly requested.
- Record permission failures and unavailable daemons as limitations with retry instructions.

## Script Requirements

Every generated shell script must start with a short docblock explaining its purpose in the machine setup context.

Long-running setup scripts must source the generated progress helper and write:

- current work and completed steps to a live status log
- dependency-driven extra installs/config changes to an additional-changes log

If a step discovers a missing prerequisite, install it with the safest available method, log the action live, append it to additional changes, and include it in the final report.

## Validation

Before finishing, run the relevant checks:

```sh
bundle_dir="${BUNDLE_DIR:?Set BUNDLE_DIR to the generated bundle directory before validating}"
script_dir="${SCRIPT_DIR:?Set SCRIPT_DIR to the generated script directory before validating}"
for f in "$script_dir"/*.sh; do [ -e "$f" ] || continue; bash -n "$f" || exit 1; done
find "$bundle_dir/dotfiles" -type f -name '*.zsh' -exec zsh -n {} \; 2>/dev/null || true
find "$bundle_dir/dotfiles" -type f -name '*.bash' -exec bash -n {} \; 2>/dev/null || true
find "$bundle_dir/dotfiles" -type f -name '*.sh' -exec sh -n {} \; 2>/dev/null || true
find "$bundle_dir/dotfiles" -type f -name '*.fish' -exec fish --no-execute {} \; 2>/dev/null || true
find "$bundle_dir" -name Vagrantfile -exec ruby -c {} \; 2>/dev/null || true
```

Also validate YAML if a parser is available. If the repo is not a Git repository or private files are intentionally ignored, say so.
