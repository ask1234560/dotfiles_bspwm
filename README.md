# dotfiles_bspwm
```
.config/dotfiles_bspwm/dotfiles
├── bashrc
├── config
│  ├── .aliasrc
│  ├── alacritty
│  ├── bspwm
│  ├── dunst
│  ├── gtk-3.0
│  ├── htop
│  ├── mpv
│  ├── newsboat
│  ├── nvim
│  ├── polybar
│  ├── ranger
│  ├── scripts
│  ├── sxhkd
│  ├── sxiv
│  └── zathura
├── etc
│  ├── openvpn
│  └── pacman.conf
├── gitconfig
├── gtkrc-2.0
├── icons
│  ├── Breeze-Red
│  └── default
├── irssi
│  └── config
├── local
│  └── share
├── xinitrc
├── Xmodmap
├── xprofile
├── Xresources
└── zshrc
```

## Screenshots
<img src="Screenshots/Screenshot_from_2020-05-01_13:03:56.png" width=1000px>
<img src="Screenshots/Screenshot_from_2020-05-01_12:06:45.png" width=1000px>
<img src="Screenshots/Screenshot_from_2020-05-01_13:04:51.png" width=1000px>


## Requirements
* working arch linux with bspwm
* python3, pipenv
* zsh
* change shell to zsh
  * ```chsh -s $(which zsh)```

## Installation 
 ```
* cd ~/.config
* git clone https://github.com/ask1234560/dotfiles_bspwm
* cd dotfiles_bspwm
* pipenv --three
* git submodule init 
* git submodule update --recursive 
* update submodules(dotdrop, nvim, ranger_devicons)
   * git submodule foreach git pull origin master
* pipenv install -r dotdrop/requirements.txt
* pipenv shell
* cp config.yaml config.yaml.bak
* substitute hostname
   * awk '{gsub(/arch/,"hostname")} {print $0}' config.yaml.bak | tee config.yaml
* ./dotdrop.sh install
* place wallpapers in ~/Pictures/.wallpaper for selecting random wallpapers during startup, and in ~/Pictures/Wallpapers for selecting wallpapers using sxiv
* (optional) to remove backup files
   * find ~ -regextype grep -regex '.*/*dotdropbak' -exec rm {} \;
```
   
## (Optional) Explicitly installed packages  
```
yay -S adapta-gtk-theme alacritty alsa-firmware alsa-utils autoconf automake base bc betterlockscreen binutils bison broadcom-wl-dkms bspwm chromium cronie dmenu dosfstools dunst efibootmgr exa exiv2 fakeroot file findutils flex gawk gcc gettext gimp git grep groff grub gtk-engine-murrine gzip hsetroot htop imagemagick libreoffice-fresh libtool linux-firmware linux-lts linux-lts-headers lynx m4 make man-db mlocate mpv neofetch neovim networkmanager newsboat noto-fonts npm numlockx openresolv openvpn pacman pacman-contrib papirus-icon-theme patch pavucontrol picom pkgconf polybar pulseaudio pulseaudio-alsa python-pip ranger redshift-minimal rmtrash scrot sed simplenote-electron-bin sudo sxhkd sxiv syncthing texinfo thunar timeshift trash-cli ttf-indic-otf ttf-ms-fonts ttf-roboto ttf-vista-fonts vi which xclip xdg-user-dirs xdman xorg-server xorg-xev xorg-xinit xorg-xsetroot yay zathura zathura-pdf-poppler zsh
```
