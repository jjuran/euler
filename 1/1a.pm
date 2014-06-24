#!/usr/bin/env perl

package Euler::1;

use warnings;
use strict;

sub sum
{
	my $sum = 0;
	
	while ( my $x = shift @_ )
	{
		$sum += $x;
	}
	
	return $sum;
}

sub answer
{
	my ( $n ) = @_;
	
	$n = 1000 if !defined $n;
	
	sum( grep { ($_ % 3) == 0  ||  ($_ % 5) == 0 } 1 .. ($n - 1) );
}

print answer(), "\n" if !caller;

1;
