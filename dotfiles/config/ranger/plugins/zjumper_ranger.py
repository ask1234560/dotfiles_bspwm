import ranger.api
from ranger.api.commands import *
from os import getenv


class z(Command):
    """:z
    Uses .z file to set the current directory.
    """
    def execute(self):

        # location of .z file
        z_loc = getenv("HOME")+"/.config/.z"
        with open(z_loc,"r") as fobj:
            flists = fobj.readlines()

        # user given directory
        req = self.args[1]
        req_lists = []
        for i in flists:
            if req in i:
                req_lists.append(i)

        directories = map(lambda x: x.split("|")[0],req_lists)

        try:
            #  smallest(length) directory will be the directory required
            self.fm.execute_console("cd " + min(directories,key=lambda x: len(x)))
        except Exception as e:
            raise Exception("Directory not found")
