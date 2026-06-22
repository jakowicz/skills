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

#### How to use it

After installing the skill, ask your AI agent for a task that matches the skill description. The skill is not a command you run directly; it is guidance and templates the agent loads when the request fits.

Example full-generation prompt:

```text
Use the mac-setup-bundle-builder skill to create a personalized Mac setup bundle from this machine.

Inventory my installed apps, package managers, shells, dotfiles, version managers, language runtimes, editor extensions, containers, VMs, local AI tools, repos, app settings, and system settings.

Create a self-contained setup bundle that an AI setup agent can use to rebuild this Mac on a new machine. Do not copy secrets or private session data. Include live progress logging, verification scripts, and a final report generator.
```

Example planning-only prompt:

```text
Use the mac-setup-bundle-builder skill to inspect this Mac and tell me what setup bundle files you would create. Do not write files yet.
```

Example with explicit output paths:

```text
Use the mac-setup-bundle-builder skill and create the bundle in ./mac-bootstrap with helper scripts in ./scripts.
```

If your agent does not automatically detect the skill, name it explicitly:

```text
Use the installed skill named mac-setup-bundle-builder.
```

## Discovery

The repo can be found directly on GitHub at:

```text
https://github.com/jakowicz/skills
```

Once installed through the `skills` CLI, it should also become discoverable through skills directories such as skills.sh.
