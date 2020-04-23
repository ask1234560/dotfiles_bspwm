import subprocess
import sys

cmd = """awk -F "|" -v q=\""""+" ".join(sys.argv[1:])+"""\" 'BEGIN{gsub(/ /, ".*", q)}  { if(tolower($1) ~ q){ print $1} }'  ~/.z"""
print(cmd)

directories,error = subprocess.Popen(cmd, shell=True, executable="/bin/bash", stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
directories = directories.decode("utf-8", "ignore")
directories = directories.rstrip('\n').split("\n")
print(directories)

print("cd " + min(directories))
