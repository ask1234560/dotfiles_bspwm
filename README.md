# dotfiles_bspwm
```
dotfiles/
├── bashrc
├── config
│   ├── alacritty
│   ├── alias_and_keybinds
│   ├── browser_extensions_backup
│   ├── bspwm
│   ├── cpupower_gui
│   ├── dunst
│   ├── gdb
│   ├── gtk-2.0
│   ├── gtk-3.0
│   ├── gtk-4.0
│   ├── htop
│   ├── Kvantum
│   ├── mimeapps.list
│   ├── mpv
│   ├── mutt
│   ├── newsboat
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
│   ├── X11
│   ├── yay
│   └── zathura
├── local
│   └── share
└── zshrc
```

## Requirements
* [dotdrop](https://aur.archlinux.org/packages/dotdrop-git)
* place [wallpapers](https://github.com/ask1234560/wallpapers) in ```~/Pictures``` for selecting wallpapers using sxiv and during startup

## Installation
```
* git clone --single-branch --branch performance https://github.com/ask1234560/dotfiles_bspwm ~/.config/dotfiles_bspwm
* cd ~/.config/dotfiles_bspwm
* config.yaml is for user specific configs and global-config.yaml for system wide configs. Edit the yaml files with the hostname and the required configs
* dotdrop install
* Other installation
    * nvim
        * git clone --single-branch --branch performance https://github.com/ask1234560/neovim-config.git ~/.config/nvim
    * dmenu
        * git clone https://github.com/ask1234560/dmenu.git ~/.config/dmenu
        * build dmenu
           * cd ~/.config/dmenu
           * sudo make install
    * slock
       * cd ~/.config/slock
       * sudo make install
* set qt theme to Adapta Nokto(kvantum, qt5ct).
* for changing theme, change in alacritty, nvim, ~/.Xresources, dmenu, dunst, polybar(reads Xresources), cursor, mpv. Scrot custom region screenclip and bspwm focused window border have same width and color.
* Terminal font nerd-fonts-jetbrains-mono, ttf-fira-code for remaining apps and otf-font-awesome for polybar glyphs.
```

## Explicitly installed packages
```
abook adapta-gtk-theme alacritty alsa-firmware alsa-utils aspell aspell-en autoconf automake autopep8 base bc binutils bison brave-bin breeze-blue-cursor-theme broadcom-wl-dkms bspwm-git cpupower-gui-git cronie dmidecode dnsmasq dosfstools dotdrop-git dunst efibootmgr exa exiv2 fakeroot ffmpegthumbnailer file findutils flex gawk gcc gettext gimp git git-lfs gnome-calculator-gtk3 gnome-keyring grep groff grub gtk-engine-murrine gzip hsetroot htop-vim-git imagemagick inetutils intel-ucode iptables-nft kvantum libreoffice-fresh libtool linux-firmware linux-zen linux-zen-headers lsof ltrace lynx m4 make man-db megasync-bin mpv mutt-wizard-git neovim networkmanager newsboat noto-fonts npm ntfs-3g numlockx openresolv otf-font-awesome p7zip pacman pacman-contrib papirus-icon-theme paru-git patch perl-image-exiftool pfetch-git pkgconf polybar-git pulseaudio pulseaudio-alsa python-pip python-pynvim python-ueberzug-git qemu-desktop qt5ct ranger-git redshift-minimal rmtrash rustup scrot sed simple-mtpfs starship strace subliminal-git sudo sxhkd-git sxiv syncthing telegram-desktop texinfo thunar timeshift tor-browser transmission-cli trash-cli ttf-fira-code ttf-jetbrains-mono-nerd ttf-ms-fonts ttf-roboto ttf-symbola ttf-vista-fonts unclutter unrar unzip virt-manager visual-studio-code-bin weechat wget which xclip xdg-user-dirs xdotool xf86-video-intel xorg-server xorg-xdpyinfo xorg-xev xorg-xinit xorg-xrandr xorg-xsetroot yt-dlp-git z-git zathura zathura-pdf-poppler zip zsh zsh-autosuggestions-git zsh-syntax-highlighting-git
```
