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

    text = [[line.split(":") for line in pack] for pack in text]


    dict = {}

    return text

def get_files():
    with open("test.txt", encoding = 'utf-8') as f:
        text = f.read()
        text.split()

def get_programs():
    stringic = ''
    with open("./data/deps") as f:
        text = f.read()
        text = text.split("Name            :")
        for i in text[1:]:
            i = i.split('Version         :')
            i[0] = i[0].replace(' ','')
            i[0] = i[0].replace('\n','')
            i[1] = i[1].split('\n')[0]
            i[1] = i[1].replace(' ','')
            i[1] = i[1].replace('\n','')
            stringic += i[0]+','+i[1]+'\n'
        text_file = open("./data/programs.csv", "w")
        text_file.write(stringic)
        text_file.close()
def get_deps():
    stringic = ''
    with open("./data/deps") as f:
        text = f.read()
        text = text.split("Name            :")
        for i in text[1:]:
            i = i.split('Depends On      :')
            i[0] = i[0].split('\n')[0]
            i[0] = i[0].replace(' ','')
            i[0] = i[0].replace('\n','')
            i[1] = i[1].split('\n')[0].strip()
            i[1] = i[1].split('  ')
            for j in i[1]:
                j = j.replace(' ','')
                j = j.replace('\n','')
                if j == 'None':
                    continue
                j = j.split('=')
                if len(j) == 1:
                    j.append('NULL')
                stringic += i[0]+','+j[0]+','+j[1]+'\n'
        print(stringic)
        text_file = open("./data/deps.csv", "w")
        text_file.write(stringic)
        text_file.close()


a = get_deps()
