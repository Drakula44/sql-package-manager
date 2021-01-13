#!/usr/bin/env python3

import os
import re


def get_installed_packages():
    stream = os.popen('pacman -Qe')
    text = stream.read()
    text = text.split('\n')
    text = [line.split(' ') for line in text]
    return text


def get_all_packages():
    stream = os.popen('pacman -Q')
    text = stream.read()
    text = text.split('\n')
    text = [line.split(' ') for line in text]
    return text


def get_dependencies():
    stream = os.popen('pacman -Qi')
    text = stream.read()
    text = text.split('\n\n')
    text = [line.split("\n") for line in text]
    prefixes = ['Description','Architecture','Licenses','Groups','Provides','Optional Deps','Optional For','Conflicts With','Replaces','Packager','Build Date','Install Script','Validated By']
    for pack in text:
        for k
    text = [[line.split(":") for line in pack] for pack in text]


    dict = {}

    return text




a = get_dependencies()
print(a[0])
