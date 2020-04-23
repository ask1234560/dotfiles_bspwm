#!/bin/python3

import subprocess

subprocess.Popen("rm ~/.config/dconf.BAK", shell=True, executable="/bin/bash", stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()

cmd = "dconf dump {} >> ~/.config/dconf.BAK"
sp = 'echo "\n\n==== section {} ====\n\n" >> ~/.config/dconf.BAK'
dirs = ["/com/gexperts/Tilix/", "/com/solus-project/budgie-panel/", "/org/gnome/desktop/wm/keybindings/", "/org/gnome/gnome-screenshot/", "/org/gnome/settings-daemon/plugins/media-keys/"]

for i in dirs:

    
    ex = sp.format(i)
    ex += ';' + cmd.format(i)
    print(i)
    op,error = subprocess.Popen(ex, shell=True, executable="/bin/bash", stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
