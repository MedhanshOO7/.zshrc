# My Dotfiles Cleanup Checklist (Personal & Machine-Specific Flags)

Just a quick audit of the hardcoded paths, personal configs, and hardware-specific scripts I've got in this repo. I need to review these and figure out what to clean up, abstract, or move into a local configuration file (`99-local.zsh`) before I make this repository public.

| File | Line(s) | Content | Why it's personal to me | Safe to publish? |
| :--- | :--- | :--- | :--- | :--- |
| `.zshrc` | 29 | `export PATH="$PATH:/home/medhansh/.lmstudio/bin"` | Hardcoded my home folder path (`/home/medhansh`) for LM Studio. | **No** (leaks my username and the path won't exist for others) |
| `.zshrc` | 34-35 | `export CLAUDE_CODE_USE_BEDROCK=1`<br>`export AWS_REGION=us-east-1` | My personal cloud preferences and AWS configuration. | **No** (specific to my own AWS account setup) |
| `.zshrc` | 38 | `source ~/.config/zshrc.d/dots-hyprland.zsh` | Sourcing my external Hyprland configs which aren't in this repository. | **No** (will throw errors if those Hyprland dots aren't installed) |
| `.zsh/30-aliases.zsh` | 104 | `alias guide='~/.predatorThings \| less -R'` | Points to my personal `~/.predatorThings` file/script outside this repo. | **No** (will just fail on other machines) |
| `.zsh/30-aliases.zsh` | 106 | `alias todo="/home/medhansh/.conky/todo/todo.sh"` | Hardcoded my username (`/home/medhansh`) and the path to my Conky todo widget. | **No** (leaks my username and depends on my custom Conky setup) |
| `.zsh/40-tools.zsh` | 15 | `brave --new-tab ...` | Assumes I use Brave Browser as my default. | **Yes** (harmless, but not portable for others) |
| `.zsh/40-tools.zsh` | 20-37 | `pacman -S ...`, `yay -S ...` | Arch-specific package manager commands I use. | **Yes** (harmless, but will fail if someone runs it on Debian/Fedora/macOS) |
| `.zsh/100-setting.zsh` | Whole File | Hardware settings for Acer Predator keyboard, fans, LCD, and battery. | Targets hardware driver `/sys/` paths specifically for my laptop. | **No** (useless for non-Acer Predator laptops and will throw errors) |
| `.zsh/120-update.sh` | 143 | `local repo_dir="$HOME/.local/src/Linuwu-Sense"` | Reference to my local compilation path for the Linuwu-Sense driver. | **Yes** (but won't work out of the box for others) |
| `.zsh/kb-wallpaper.sh` | Whole File | Matugen keyboard backlight synchronization using the Faustus driver. | Specific to the Faustus kernel module and my custom window manager themes. | **No** (points to my hardware path `/sys/devices/platform/faustus`) |
| `.zsh/monitors-11.conf` | Filename | `monitors-11.conf` | A config file specific to my monitor configuration. | **Yes** (but redundant) |
