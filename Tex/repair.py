#!/usr/bin/python
# coding=utf8

import sys,re


count = 0;

for x in sys.stdin:
    if x[0:9]=="\\section*":
	count = count+1;
    if count<=1:
	print(x[0:len(x)-1]);
