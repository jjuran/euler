#!/usr/bin/env python

import sys

sys.path.append( "lib/python" )

from prime import nth_prime

def prime_factorization( x ):
	result = {}
	i = 0
	while x > 1:
		factor = nth_prime( i )
		n = 0
		while x % factor == 0:
			x /= factor
			n += 1
		if n:
			result[ factor ] = n
		i += 1
	return result

def merge_maps( maps ):
	result = {}
	for map in maps:
		for key, value in map.items():
			if not key in result or value > result[ key ]:
				result[ key ] = value
	return result

def product( factors ):
	result = 1
	for x in factors:
		result *= x
	return result

def lcm( inputs ):
	pf = merge_maps( prime_factorization( x ) for x in inputs )
	factors = [key ** value for key, value in pf.items()]
	return product( factors )

print lcm( range( 1, 20 + 1 ) )
