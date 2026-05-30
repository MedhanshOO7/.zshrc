# Personal & Machine-Specific Flags Audit

This file details all the hardcoded paths, personal configurations, and machine-specific hardware scripts identified in this dotfiles repository. Review this table to decide what should be stripped, abstracted, or moved to a local configuration file (`99-local.zsh`) before pushing the repository public.

| File | Line(s) | Content | Why it's personal | Safe to publish? |
| :--- | :--- | :--- | :--- | :--- |
| `.zshrc` | 28 | `export PATH="$PATH:/home/medhansh/.lmstudio/bin"` | Hardcoded home folder username (`/home/medhansh`) for LM Studio. | **No** (leaks username, path won't exist for others) |
| `.zshrc` | 33-34, 38 | `export CLAUDE_CODE_USE_BEDROCK=1`<br>`export AWS_REGION=us-east-1` | Personal cloud environment preferences and configurations. | **No** (specific to owner's AWS account setup) |
| `.zshrc` | 36, 41, 43 | `source ~/.config/zshrc.d/dots-hyprland.zsh` | Sourcing external window manager configs that are not part of this repository. | **No** (will throw errors if Hyprland dots aren't installed) |
| `.zsh/30-aliases.zsh` | 102 | `alias guide='~/.predatorThings \| less -R'` | Points to a personal document or script (`~/.predatorThings`) outside the repository. | **No** (will fail on other machines) |
| `.zsh/30-aliases.zsh` | 104 | `alias todo="/home/medhansh/.conky/todo/todo.sh"` | Hardcoded home folder username (`/home/medhansh`) and path to a specific Conky theme widget. | **No** (leaks username, specific to custom Conky setup) |
| `.zsh/40-tools.zsh` | 15 | `brave --new-tab ...` | Hardcoded assumption that Brave Browser is installed. | **Yes** (harmless, but non-portable) |
| `.zsh/40-tools.zsh` | 20-37 | `pacman -S ...`, `yay -S ...` | Arch-specific package manager commands. | **Yes** (harmless, but fails on Debian/Fedora/macOS) |
| `.zsh/100-setting.zsh` | Whole File | Hardware settings for Acer Predator keyboard, fans, LCD, and battery. | Targets hardware driver `/sys/` paths for a specific laptop. | **No** (useless for non-Acer Predator laptops, throws errors) |
| `.zsh/120-update.sh` | 147 | `local repo_dir="$HOME/.local/src/Linuwu-Sense"` | Reference to a specific hardware driver repository compilation path. | **Yes** (but non-portable for other users) |
| `.zsh/script.sh` | Whole File | Matugen keyboard backlight synchronization using the Faustus driver. | Specific to the Faustus kernel module and custom window manager themes. | **No** (hardware-specific path `/sys/devices/platform/faustus`) |
| `.zsh/monitors -11.conf` | Filename | `monitors -11.conf` | A config file with spaces in the name, specific to the user's monitor configuration. | **Yes** (but redundant and badly named) |
