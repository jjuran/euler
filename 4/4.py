#!/usr/bin/env python

def is_palindrome( x ):
	while len( x ) > 1:
		if x[ 0 ] != x[ -1 ]:
			return 0
		x = x[ 1:-1 ]
	return 1

max = 999
min = 100

solution = 0

for a in range( max, min, -1 ):
	if a * a < solution:
		break
	for b in range( a, min, -1 ):
		x = a * b
		if x < solution:
			break
		if is_palindrome( str( x ) ):
			solution = x
			break

print solution
