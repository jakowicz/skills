# Setup Order

1. Reach the desktop, connect network, enable FileVault if desired.
2. Start the live progress log.
3. Install macOS updates and reboot.
4. Install Xcode or Command Line Tools.
5. Install the user's detected system package manager(s), if any, and add required initialization for the detected shells.
6. Sign into app stores and install any app-store automation CLIs the user relies on.
7. Restore shell basics and secrets placeholders.
8. Restore SSH/GPG/private transfer material safely.
9. Restore `/etc/hosts`.
10. Run generated package-manager install files in dependency order.
11. Install app fallbacks.
12. Start detected container engine(s) and pull remote container images.
13. Install detected VM provider(s) and configure VM labs.
14. Restore app settings after apps are quit.
15. Apply macOS defaults.
16. Install language runtimes and global packages.
17. Install developer tools, local AI/model runtimes, services, and shortcuts/launchers.
18. Clone repos and switch to manifest branches.
19. Restore Finder/sidebar favorites.
20. Run verification.
21. Generate the final HTML report.
