#!/usr/bin/python
# coding=utf8

import sys,re


count = 0;

prev='';

for x in sys.stdin:
    x=x[0:len(x)-1];
    print prev;
    if prev=='' and (x[0:2] == '\\\\'):
	x=x[2:len(x)];
    prev=x;
print prev;
