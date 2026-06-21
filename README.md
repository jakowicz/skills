# Skills

[![skills.sh](https://skills.sh/b/jakowicz/skills)](https://skills.sh/jakowicz/skills)

Reusable AI-agent skills for specialized workflows.

## Install

Install these skills with:

```sh
npx skills add jakowicz/skills
```

This repository uses the common skills repository layout:

```text
skills/
  mac-setup-bundle-builder/
    SKILL.md
    assets/
    references/
```

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

## Discovery

The repo can be found directly on GitHub at:

```text
https://github.com/jakowicz/skills
```

Once installed through the `skills` CLI, it should also become discoverable through skills directories such as skills.sh.
