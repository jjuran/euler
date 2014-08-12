#!/usr/bin/env perl

package Euler::9;

use warnings;
use strict;


my $target = 1000;


sub make_pythagorean_triplet
{
	my ( $a, $b ) = @_;
	
	my $c2 = $a * $a + $b * $b;
	
	my $c = sqrt( $c2 );
	
	return $c  if $c == int $c;
	
	return;
}

sub answer
{
	for ( my $b = 2;  $b < 500;  ++$b )
	{
		for ( my $a = 1;  $a < $b;  ++$a )
		{
			if ( my $c = make_pythagorean_triplet( $a, $b ) )
			{
				my $sum = $a + $b + $c;
				
				return $a * $b * $c  if $sum == $target;
			}
		}
	}
}

print answer(), "\n" if !caller;

1;
