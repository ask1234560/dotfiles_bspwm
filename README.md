# dotfiles_bspwm
configs, scripts, themes and wallpapers included 

## Requirements
* working arch linux with bspwm
* pipenv
* zsh
* change shell to zsh
  * chsh -s $(which zsh)

## Installation 
* cd ~
* git clone https://github.com/ask1234560/dotfiles_bspwm
* cd dotfiles
* pipenv --three
* git submodule init 
* git submodule update --recursive 
* pipenv install -r dotdrop/requirements.txt
* pipenv shell
* substitute username 
   * < config.yaml |  awk '{gsub(/arch/,"username")} {print $0}' | tee config.yaml
* ./dotdrop.sh install
* to remove backup files
   * find ~ -regextype grep -regex '.*/*dotdropbak' -exec rm {} \\;
