#!/bin/bash
from sys import argv
# store the command parameters in variable
script, logFileName_ = argv
# open a file reader
logFile = open(logFileName_, 'r')
# read the file line by line
ts = 0
tj = 0
count = 0

for line in logFile:
	# Maybe you can decide to somehow 'mark' those log records that you care about?
        if not '####' in line:
                continue
	# Clean the string, remove the mark, and tokenize it
        times = line.strip()[4:].split(' ')
	# times is an array that contains the sample values ...
	# print them? use them to calculate averages? etc.
        print "Value 1: " + times[0] + " " + ", Value 2: " + times[1]
        tj += float(times[0])
        ts += float(times[1])
        count = count + 1

tj = tj / count;
ts = ts / count;

print "TJ: " + str(tj)
print "TS: " + str(ts)