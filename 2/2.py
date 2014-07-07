#!/usr/bin/env python

max = 4000000

sum = 0

a = 1
b = 2

while b <= max:
	if b % 2 == 0:
		sum += b
	a, b = b, a + b

print sum
