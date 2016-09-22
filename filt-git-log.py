#!/usr/bin/python

import re
import sys

a = sys.stdin.readline()
c = 'unknown'
while a:
    m = re.match('commit ([0-9a-f]+)', a)
    if m:
        c = m.group(1)
    sys.stdout.write("%s %s" % (c, a))

    a = sys.stdin.readline()
