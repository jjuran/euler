#!/usr/bin/env perl

package Euler::3;

use warnings;
use strict;

my @primes = ( 2 );

sub next_prime
{
	my $x = $primes[ -1 ];
	
	NUMBER: while ( 1 )
	{
		++$x;
		
		foreach my $prime ( @primes )
		{
			next NUMBER if $x % $prime == 0;
		}
		
		push @primes, $x;
		
		return $x;
	}
}

sub nth_prime
{
	my ( $i ) = @_;
	
	return $primes[ $i ]  if exists $primes[ $i ];
	
	my $prime;
	
	foreach ( @primes .. $i )
	{
		$prime = next_prime();
	}
	
	return $prime;
}

sub answer
{
	my ( $product ) = @_;
	
	$product = 600851475143 if !defined $product;
	
	my $max = 1;
	
	my $i = 0;
	
	while ( $product > 1 )
	{
		my $factor = nth_prime( $i );
		
		while ( $product % $factor == 0 )
		{
			$product /= $factor;
			
			$max = $factor;
		}
		
		++$i;
	}
	
	return $max;
}

print answer(), "\n" if !caller;

1;
