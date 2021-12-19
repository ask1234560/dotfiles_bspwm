#!/bin/python3
from docopt import docopt
from os import getenv
from requests import get
from sys import exit

doc = """
Search word in oxford dictionary.

Usage:
  dict-search <word> [--lan=<code>]
  dict-search (-h | --help)

Options:
  -h --help     show this.
  --lan=<code>  language code [default: en].

"""

args = docopt(doc)
app_id, app_key = getenv('OXFORD_app_id'), getenv('OXFORD_app_key')

code, url = 1, 'https://od-api.oxforddictionaries.com:443/api/v2/entries/{}/{}'.format(
    args['--lan'], args['<word>'].strip().lower())

try:
    r = get(url, headers={'app_id': app_id, 'app_key': app_key}, timeout=10)
    data = r.json()
    if r.status_code != 200:
        print("No results found")
    else:
        results = data["results"][0]["lexicalEntries"][0]["entries"][0]["senses"]
        for j, i in enumerate(results, 1):
            print(str(j)+" =>", "Definitions :- {}".format(i.get("definitions")), "Domains :- {}".format(i.get("domains")),
                  "Examples :- {}".format(i.get("examples")), "Synonyms :- {}".format(i.get("synonyms")), sep="\n")
        code = 0
except Exception as e:
    print(e)
exit(code)
