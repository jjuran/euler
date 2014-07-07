#!/usr/bin/env python

def sum( terms ):
	result = 0
	for x in terms:
		result += x
	return result

set = range( 1, 100 + 1 )

sigma = sum( set )

delta = sigma * sigma - sum( x * x for x in set )

print delta
