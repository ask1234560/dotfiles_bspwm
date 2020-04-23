#!/bin/python3

import os
import sys

home=os.getenv('HOME')
dpath=os.path.join(home,"Downloads")
os.chdir(dpath)
RED   = "\033[1;31m"
BLUE  = "\033[1;34m"
CYAN  = "\033[1;36m"
GREEN = "\033[1;32m"
WHITE='\033[1;37m'
RESET = "\033[0;0m"
BOLD    = "\033[;1m"
REVERSE = "\033[;7m"

if os.path.exists(dpath):
    sys.stdout.write(BLUE)
    print("\n\nInside downloads directory")
    folders=[ i for i in os.listdir() if os.path.isdir(i) and os.path.isdir(os.path.join(dpath,i,".git")) ]
    folders.sort(key=lambda x:x.lower())
    sys.stdout.write(GREEN)
    print("\n\nFolders with git",folders)
    for j,i in enumerate(folders,0):
        os.chdir(os.path.join(dpath,i))

        if j%2 == 0:
            sys.stdout.write(WHITE)
        else:
            sys.stdout.write(CYAN)

        print("\n--> In the directory",i)
        try:
            os.system("git pull")
        except Exception as e:
            sys.stdout.write(RED)
            print(e)







