#!/usr/bin/env perl

package Euler::6;

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
	my @set = 1 .. 100;
	
	my $sum = sum( @set );
	
	my $square_of_sum = $sum * $sum;
	
	my $sum_of_squares = sum( map { $_ * $_ } @set );
	
	my $diff = $square_of_sum - $sum_of_squares;
	
	return $diff;
}

print answer(), "\n" if !caller;

1;
