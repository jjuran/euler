#!/usr/bin/env python

import sys

sys.path.append( "lib/python" )

from prime import nth_prime

print nth_prime( 10001 - 1 )
