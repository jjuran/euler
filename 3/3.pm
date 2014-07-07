#!/usr/bin/env perl

package Euler::3;

use warnings;
use strict;

use lib 'lib/perl';

use Prime;

*nth_prime = \&Prime::nth_prime;


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
