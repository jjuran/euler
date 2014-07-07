#!/usr/bin/env python

primes = [ 2 ]

def next_prime():
	global primes
	x = primes[ -1 ]
	while True:
		x += 1
		for prime in primes:
			if x % prime == 0:
				break
		else:
			primes += [ x ]
			return x

def nth_prime( i ):
	if i < len( primes ):
		return primes[ i ]
	for _ in range( len( primes ), i + 1 ):
		prime = next_prime()
	return prime

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
