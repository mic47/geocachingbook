#!/usr/bin/python
# coding=utf8

import sys,re

prog =  re.compile('<location>[NS][ \t]*[0-9]*[ \t]*[0-9.]*[ \t]*[WE][ \t]*[0-9]*[ \t]*[0-9.]*[ \t]*<\/location>')
prog2 = re.compile('<position>[NS][ \t]*[0-9]*[ \t]*[0-9.]*[ \t]*[WE][ \t]*[0-9]*[ \t]*[0-9.]*[ \t]*<\/position>')

def removeNonAscii(s): return "".join(i for i in s if ord(i)<128)

for x in sys.stdin:
    m = prog.search(removeNonAscii(x))
    m2 = prog2.search(removeNonAscii(x))
    if m or m2: 
	k = m2;
	if m:
		k=m
	s = k.group(0)[10:len(k.group(0))-11]
	a = removeNonAscii(s).split();
	n = float(a[1])+float(a[2])/60.0;
	if a[0]=='S' : n = -n;
	e = float(a[4])+float(a[5])/60.0;
	if a[3]=='W': e = -e;
	if m:
		print "  <location>"+str(n)+" "+str(e)+"</location>";
	else:
		
		print "    <position>"+str(n)+" "+str(e)+"</position>";
    else:
	print x[0:len(x)-1]
