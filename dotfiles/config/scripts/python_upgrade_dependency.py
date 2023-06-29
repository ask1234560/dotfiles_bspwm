import os
import shlex
import subprocess

PATH = '/usr/lib/python3.11/site-packages'


def main():
    if not os.path.exists(PATH):
        print(PATH, 'could not be found. No packages will need to be rebuilt.')
        return
    
    command = ['pacman' , '-Qmq']
    aur_list = subprocess.check_output(command, stderr=subprocess.PIPE, universal_newlines=True).split('\n')[:-1]

    packages = set()
    for name in os.listdir(PATH):
        command = ['pacman', '-Qoq', os.path.join(PATH, name)]
        try:
            output = subprocess.check_output(command, stderr=subprocess.PIPE, universal_newlines=True)
        except subprocess.CalledProcessError as exception:
            print(f'Failed to execute "{" ".join(shlex.quote(part) for part in command)}": {exception.stderr.strip()}')
            continue

        # a file or folder might be owned by many packages, for example __pycache__
        pkg = output.strip().split('\n')
        if pkg[0] in aur_list:
            packages.update(pkg)

    for pkg in sorted(packages):
        print(pkg)

if __name__ == '__main__':
    main()
