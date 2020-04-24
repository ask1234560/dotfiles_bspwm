# dotfiles_bspwm
```
dotfiles_bspwm/dotfiles
├── bashrc
├── config
│  ├── alacritty
│  ├── bspwm
│  ├── dunst
│  ├── htop
│  ├── mpv
│  ├── newsboat
│  ├── nvim
│  ├── polybar
│  ├── ranger
│  ├── scripts
│  ├── sxhkd
│  └── sxiv
├── etc
│  ├── openvpn
│  └── pacman.conf
├── gitconfig
├── icons
│  └── Breeze-Red
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
<img src="Screenshots/Screenshot_from_2020-04-24_16:12:39.png" width=1000px>


## Requirements
* working arch linux with bspwm
* pipenv
* zsh
* change shell to zsh
  * chsh -s $(which zsh)

## Installation 
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
* substitute username 
   * awk '{gsub(/arch/,"username")} {print $0}' config.yaml.bak | tee config.yaml
* ./dotdrop.sh install
* (optional) to remove backup files
   * find ~ -regextype grep -regex '.*/*dotdropbak' -exec rm {} \\;
