# dotfiles_bspwm

## Screenshots
<img src="Screenshots/Screenshot_from_2025-01-05_17:50:39.png" width=1000px>
<img src="Screenshots/Screenshot_from_2025-01-05_17:50:52.png" width=1000px>
<img src="Screenshots/Screenshot_from_2025-01-05_17:54:20.png" width=1000px>
<img src="Screenshots/Screenshot_from_2025-01-05_17:57:09.png" width=1000px>
<img src="Screenshots/Screenshot_from_2025-01-05_18:38:32.png" width=1000px>

## General
This branch mainly focuses on performance. For transparency use [picom](https://github.com/ask1234560/dotfiles_bspwm/tree/master/dotfiles/config/picom) from master branch.

## Available dotfiles
```
dotfiles/
├── bashrc
├── config
│   ├── alacritty
│   ├── alias_and_keybinds
│   ├── browser_extensions_backup
│   ├── bspwm
│   ├── cpupower_gui
│   ├── dmenu
│   ├── dunst
│   ├── eza
│   ├── gdb
│   ├── git
│   ├── gtk-2.0
│   ├── gtk-3.0
│   ├── gtk-4.0
│   ├── htop
│   ├── Kvantum
│   ├── mimeapps.list
│   ├── mpv
│   ├── mutt
│   ├── newsboat
│   ├── nvim
│   ├── paru
│   ├── picom
│   ├── polybar
│   ├── qt5ct
│   ├── ranger
│   ├── scripts
│   ├── slock
│   ├── starship.toml
│   ├── sxhkd
│   ├── sxiv
│   ├── tmux
│   ├── X11
│   ├── yay
│   └── zathura
├── Desktop
│   └── xtra
├── local
│   └── share
└── zshrc
```

## Requirements
* [dotdrop](https://aur.archlinux.org/packages/dotdrop-git)
* place [wallpapers](https://github.com/ask1234560/wallpapers) in ```~/Pictures``` for selecting wallpapers using sxiv and during startup

## Installation
```
* git clone --recurse-submodules --single-branch --branch performance https://github.com/ask1234560/dotfiles_bspwm ~/.config/dotfiles_bspwm
* cd ~/.config/dotfiles_bspwm
* config.yaml is for user specific configs and global-config.yaml for system wide configs. Edit the yaml files with the hostname and the required configs
* dotdrop install
* Other installation
    * nvim
        * open nvim, :PlugInstall for installing plugins.
    * dmenu
        * build dmenu
           * cd ~/.config/dmenu
           * sudo make install
    * slock
       * build slock
           * cd ~/.config/slock
           * sudo make install
* set qt theme to Adapta Nokto(kvantum, qt5ct).
* for changing theme, change in alacritty, nvim, ~/.config/X11/xresources, dmenu, dunst, polybar(reads Xresources), cursor, mpv. Scrot custom region screenclip and bspwm focused window border have same width and color.
* Terminal font nerd-fonts-jetbrains-mono, ttf-fira-code for remaining apps and otf-font-awesome for polybar glyphs.
```

## Explicitly installed packages
```
7zip abook adapta-gtk-theme alacritty alsa-firmware alsa-utils amd-ucode arandr aspell aspell-en autopep8 base base-devel bc brave-bin bspwm-git cmake cpupower-gui-git cronie dafny-bin dmidecode dnsmasq docker docker-compose dosfstools dotdrop-git dotnet-sdk dunst efibootmgr entr exiv2 eza ffmpegthumbnailer gimp git git-lfs gnome-calculator-gtk3 gnome-keyring gnu-free-fonts grub gtk-engine-murrine hsetroot htop-git htop-git-debug imagemagick inetutils iptables-nft jdk-openjdk kvantum kvantum-qt5 less libomxil-bellagio libreoffice-fresh libxft libxinerama linux-firmware linux-lts linux-lts-headers lsof ltrace lua53 lynx man-db mpv mutt-wizard-git neovim networkmanager newsboat noto-fonts noto-fonts-emoji npm ntfs-3g numlockx nvidia-open-dkms nvidia-utils openbsd-netcat openresolv os-prober otf-font-awesome pacman-contrib pandoc-bin pandoc-bin-debug papirus-icon-theme paru-git paru-git-debug perl-image-exiftool pfetch-git polybar-git polybar-git-debug pulseaudio pulseaudio-alsa python-click-option-group python-docopt python-numpy python-pip python-pipx python-poetry python-pynvim python-yaml qemu-desktop qpdf qt5ct ranger-git redshift-minimal rmtrash rustup scrot simple-mtpfs sshpass starship strace subliminal-git sudo swtpm sxhkd-git sxhkd-git-debug sxiv telegram-desktop texlive-fontsrecommended texlive-latex texlive-latexextra texlive-latexrecommended thunar timeshift tk transmission-cli trash-cli ttf-dejavu ttf-fira-code ttf-jetbrains-mono-nerd ttf-roboto typst ueberzugpp unclutter unrar unzip virt-manager visual-studio-code-bin weechat wget xclip xdg-user-dirs xdotool xorg-server xorg-xdpyinfo xorg-xev xorg-xinit xorg-xrandr xorg-xsetroot yt-dlp-git z-git zathura zathura-pdf-poppler zip zsh zsh-autosuggestions-git zsh-syntax-highlighting-git
```
