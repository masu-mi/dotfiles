#!/usr/bin/env python
# vim: fileencoding=utf-8

import sys, os

def main():
    for p in sys.path:
        if os.path.isdir(p):
            print(p)

if __name__ == "__main__":
    main()
