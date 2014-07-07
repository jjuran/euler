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
