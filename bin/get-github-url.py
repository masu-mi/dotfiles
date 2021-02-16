#!/usr/bin/env python3

# coding: utf-8

from urllib.parse import urlparse
import sys, subprocess
from os import chdir, path

p = sys.argv[1]
dir_path = path.dirname(p)
file_name = path.basename(p)
if file_name == "":
    print("directory not supported", file=sys.stderr)
    sys.exit(1)

def get_stdout_as_str(command_line):
    return subprocess.run(command_line.split(' '),
                   capture_output=True).stdout.strip(b'\n').decode('utf-8')

chdir(dir_path)

prefix = get_stdout_as_str('git rev-parse --show-prefix')
commit_hash = get_stdout_as_str('git rev-parse HEAD')
url_str = get_stdout_as_str('git remote get-url origin')

url = urlparse(url_str)
print("{}://{}{}/blob/{}/{}{}".format(url.scheme,
                         url.netloc.split('@')[-1],
                         url.path,
                         commit_hash,
                         prefix,
                         file_name))
