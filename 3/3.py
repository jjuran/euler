#!/usr/bin/env python

import sys

sys.path.append( "lib/python" )

from prime import nth_prime

product = 600851475143

result = 1
i = 0

while product > 1:
	factor = nth_prime( i )
	while product % factor == 0:
		product /= factor
		result = factor
	i += 1

print result
