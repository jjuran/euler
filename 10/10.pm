#!/usr/bin/env perl

package Euler::10;

use warnings;
use strict;

use lib 'lib/perl';

use Prime;

*nth_prime = \&Prime::nth_prime;


my $limit = 2_000_000;

sub answer
{
	my $sum = 0;
	
	my $x = 0;
	
	for ( my $i = 0;  ;  ++$i )
	{
		$x = nth_prime( $i );
		
		last  if $x >= $limit;
		
		$sum += $x;
	}
	
	return $sum;
}

print answer(), "\n" if !caller;

1;
