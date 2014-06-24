#!/usr/bin/env perl

package Euler::2;

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

sub odd  { $_[0] % 2 }
sub even { !odd $_[0] }

sub answer
{
	my ( $max ) = @_;
	
	$max = 4_000_000 if !defined $max;
	
	my $sum = 0;
	
	my $a = 1;
	my $b = 2;
	
	while ( $b <= $max )
	{
		$sum += $b if even( $b );
		
		($a, $b) = ($b, $a + $b);
	}
	
	return $sum;
}

print answer(), "\n" if !caller;

1;
