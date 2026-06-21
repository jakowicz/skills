# Skills

Reusable AI-agent skills for specialized workflows.

## Available Skills

### mac-setup-bundle-builder

Path: `skills/mac-setup-bundle-builder`

Creates a personalized Mac rebuild bundle from a user's current machine. The skill guides an AI setup agent through discovering what is actually installed and configured, then generating a self-contained setup bundle for recreating that Mac on a new machine.

Use it when you want to:

- Inventory apps, package managers, language runtimes, version managers, shells, dotfiles, repos, containers, virtual machines, local services, AI tools, editor plugins, and app settings.
- Generate a setup prompt, manifest, setup order, helper scripts, verification checks, live progress logs, and final HTML report.
- Preserve reproducible configuration without embedding secrets, tokens, browser sessions, caches, or other unsafe private state.
- Build a bundle tailored to the current machine instead of assuming a fixed toolchain such as Homebrew, zsh, Docker, pyenv, or VS Code.

The skill is discovery-led: named tools are examples, not requirements. If a user has different shells, package managers, version managers, editors, container runtimes, VM providers, or app/plugin ecosystems, the generated bundle should adapt to those findings and document anything that needs manual or private transfer.
