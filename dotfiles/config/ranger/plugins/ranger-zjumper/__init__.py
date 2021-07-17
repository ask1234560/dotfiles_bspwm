import ranger.api
from ranger.api.commands import *
from os import getenv
import re


class z(Command):
    """:z
    Uses .z file to set the current directory.
    """
    def execute(self):

        # location of .z file
        z_loc = getenv("_Z_DATA") or getenv("HOME")+"/.z"
        with open(z_loc,"r") as fobj:
            flists = fobj.readlines()

        # user given directory
        req = re.compile(".*".join(self.args[1:]),re.IGNORECASE)
        directories = []
        for i in flists:
            if req.search(i):
                directories.append(i.split("|")[0])

        try:
            #  smallest(length) directory will be the directory required
            self.fm.execute_console("cd " + min(directories,key=lambda x: len(x)))
        except Exception as e:
            raise Exception("Directory not found")
