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
Use the mac-setup-bundle-builder skill and create a self-contained setup bundle in ./mac-bootstrap.

Put the machine-readable setup files in ./mac-bootstrap. This should include PROMPT.md, manifest.yaml, setup-order.md, package manager inventories, app/settings docs, dotfiles, editor extension inventories, VM/container inventories, private transfer placeholders, live-progress report paths, verification expectations, and recommendations.

Put executable helper scripts in ./mac-bootstrap/scripts. This should include setup/check/report scripts such as bootstrap-progress.sh, bootstrap-check.sh, generate-bootstrap-report.sh, restore-app-settings.sh, setup-editor-tooling.sh, setup-local-tools.sh, and any tool-specific install/restore scripts discovered from this machine.
```

This self-contained layout is the recommended default because users can move one folder to the new Mac. If you prefer repo-root scripts for an existing repository, ask for that explicitly:

```text
Use the mac-setup-bundle-builder skill and create the setup bundle in ./mac-bootstrap. Put helper scripts in ./scripts and make every generated path match that layout.
```

If your agent does not automatically detect the skill, name it explicitly:

```text
Use the installed skill named mac-setup-bundle-builder.
```

#### Moving the bundle to a new Mac

The generated bundle is meant to be carried to the new Mac and given to an AI setup agent there.

Common transfer options:

```sh
# If the bundle is safe to publish, push the repo and clone it on the new Mac.
git clone git@github.com:your-user/your-setup-bundle.git

# For a private local transfer, archive the repo.
tar -czf mac-setup-bundle.tgz ./mac-bootstrap

# Copy directly over SSH.
rsync -av ./mac-bootstrap user@new-mac.local:~/setup-bundle/

# Or copy with AirDrop, an encrypted external drive, or a private cloud folder.
```

If the bundle uses a `private/` directory for SSH keys, app plist files, GPG material, license files, or other sensitive local state, those files should usually be gitignored. That means they will not be present when someone clones the Git repo on the new Mac.

Transfer private files separately only after reviewing them:

```sh
# Example: copy private files over SSH without committing them to git.
rsync -av ./mac-bootstrap/private/ user@new-mac.local:~/setup-bundle/mac-bootstrap/private/

# Example: create an encrypted archive for manual transfer.
tar -czf private-transfer.tgz ./mac-bootstrap/private
gpg -c private-transfer.tgz
```

Do not publish private keys, tokens, browser sessions, app databases, account caches, or cloud credentials. Prefer password managers, manual sign-in, and documented placeholders where possible.

#### Configuring the new Mac

On the new Mac:

1. Copy or clone the generated bundle.
2. Copy any reviewed private files separately if the setup requires them.
3. Open your AI coding agent with the copied bundle or containing repository as the workspace. For example, open the folder that contains `mac-bootstrap/`.
4. Open the generated `mac-bootstrap/PROMPT.md`.
5. Copy the full contents of `PROMPT.md` and paste it as the first message to the AI setup agent. If your agent supports file references, you can instead send a short message such as:

   ```text
   Read mac-bootstrap/PROMPT.md and follow it to configure this new Mac. Use this copied repository as the setup workspace.
   ```

   If your bundle used a different directory name, replace `mac-bootstrap/PROMPT.md` with the generated prompt path.
6. Watch the live progress log named in the manifest while long installs run.
7. Run the generated verification script.
8. Open the generated final report and review failures, fallback installs, missing private files, and manual login/licensing steps.

## Discovery

The repo can be found directly on GitHub at:

```text
https://github.com/jakowicz/skills
```

Once installed through the `skills` CLI, it should also become discoverable through skills directories such as skills.sh.
