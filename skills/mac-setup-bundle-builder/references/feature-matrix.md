# Feature Matrix

Use this checklist to decide what to include in a generated Mac setup bundle.

## Discovery Principle

The generated bundle must be tailored to the observed machine. Named tools below are examples and probes, not required outputs. If the user has different tools, create equivalent manifest sections, docs, scripts, checks, and fallbacks for those tools.

## Base System

- macOS version/build and target architecture.
- Xcode or Command Line Tools.
- Detected package manager prefixes/paths and shell initialization for whichever shells are actually used.
- Rosetta policy for Intel-only software.
- App store sign-in and CLI automation readiness where available.
- FileVault/manual System Settings notes.

## Package Managers

- System package managers: examples include Homebrew, MacPorts, Nix, pkgsrc, vendor CLIs, app-store CLIs, or any equivalent discovered on the machine.
- Language/runtime managers: examples include Node, Python, Ruby, Go, Java, Rust, Terraform, PHP, .NET, Elixir/Erlang, Haskell, Lua, Zig, Deno, Bun, or anything else detected.
- Per-language package managers and global packages: examples include npm/yarn/pnpm/bun, pip/pipx/uv/poetry/conda, cargo, gem/bundler, go install tools, Maven/Gradle, Composer, Mix/Rebar, Cabal/Stack, and equivalents.
- Version managers: examples include pyenv, tfenv, rbenv, nvm, asdf, mise, jenv, sdkman, rustup, goenv, plenv, phpenv, conda, uv, or any equivalent. Capture all installed versions, default/global/local selections, aliases, shims/init requirements, and global packages where available.
- Version pinning and legacy runtimes: capture installed versions, default versions, and why old versions are needed.
- Unknown package managers: if a recognizable CLI has list/export commands, use them; otherwise record install path and manual restore notes.

## Apps And Settings

- Installed apps by source: examples include package-manager casks/bundles, app stores, vendor installers, manual installs, enterprise/self-service portals, or any equivalent.
- App preference plists and app support settings where safe.
- App plugins/extensions/add-ons where the app exposes a safe list/export/install mechanism.
- Apps requiring login/licensing/manual restore.
- Browser extensions as an inventory where safely discoverable; browser profiles and caches as manual/private transfer items unless explicitly requested.
- Window manager settings, terminal settings, editor settings, keyboard shortcuts.
- Unknown app state: if a config directory or plist looks important but has no known restore method, document its path, privacy risk, backup choice, and manual restore notes.

## Shell And Developer Environment

- Detect every active shell and config style, such as zsh, bash, fish, tcsh, nushell, or anything else in use.
- Capture relevant dotfiles, aliases, functions, completions, prompts, frameworks, themes, plugins, and shell-specific PATH setup.
- Secret placeholders such as `.secrets`, `.env`, shell-specific secret files, or private includes; never values.
- PATH assumptions and legacy paths.
- Git config, SSH config/inventory, GPG migration instructions.
- `/etc/hosts`.

## macOS Defaults

- Dock, Finder, keyboard, text correction, trackpad/mouse, screenshots, hot corners, locale, appearance, desktop visibility.
- Finder sidebar favorites need a special restore/manual fallback; they are not ordinary defaults.

## Virtualization, Containers, And Local Services

- Container engines: examples include Docker Desktop, Colima, Podman, Rancher Desktop, Lima, nerdctl/containerd, OrbStack, or any equivalent.
- Container artifacts: remote pullable image tags, compose files, Kubernetes contexts, local registries, private registry auth notes, volumes that need backup.
- Virtualization: examples include VirtualBox, VMware Fusion, Parallels, UTM/QEMU, Multipass, Vagrant, Tart, Lima, cloud CLIs, or any equivalent.
- VM/lab artifacts: boxes, images, templates, providers, architecture compatibility, networking, shared folders, and startup commands.
- Desktop VM labs: only create labs the user asks for or that are clearly part of the current setup; do not assume Ubuntu/Kali/Parrot.
- Large VM disks and container volumes usually should not live in git; document backup/private transfer.

## Local AI, Coding Assistants, And Developer Tools

- Local model runtimes: discover any installed runtime, model store, server port, model list, and startup method.
- AI coding tools: discover CLIs/apps, config files, extensions/plugins, auth boundaries, and launchers.
- IDEs/editors: discover extensions/plugins, settings, keybindings, snippets, tasks, debug profiles, workspace templates, MCP/agent config, and sync/account boundaries for VS Code, Cursor, JetBrains, GoLand, Xcode, Zed, Sublime, Vim/Neovim, Emacs, Nova, Android Studio, or anything present.
- For tools with extension CLIs, generate install lists and restore scripts. For tools without CLIs, document marketplace names, config paths, and manual restore steps.
- Local services: databases, queues, search engines, web servers, reverse proxies, tunnels, background agents, LaunchAgents, menu-bar helpers, and start/stop scripts.
- Secret-bearing tools: record placeholders and login instructions, never token values.
- Start/stop launchers: create launchers only for tools/services the user wants managed.

## Repositories

- Clone path, remote, branch, local status note.
- Preserve uncommitted work; never delete or reset without explicit permission.
- SSH verification before private clones.

## Verification

- Check commands/apps/files/models/repos/VM labs/container images/local services/editor extension inventories where possible.
- Include fallback guidance for every failure.
- Generate raw log and HTML report.
- Include live progress and additional changes in final report.
