#!/usr/bin/env perl

package Euler::4;

use warnings;
use strict;

sub is_palindrome
{
	my ( $x ) = @_;
	
	while ( length $x > 1 )
	{
		if ( $x !~ m{^ (.) (.*) \1 $}x )
		{
			return 0;
		}
		
		$x = $2;
	}
	
	return 1;
}

sub answer
{
	my $max = 999;
	my $min = 100;
	
	my $solution = 0;
	
	for ( my $a = $max;  $a >= $min;  --$a )
	{
		if ( $a * $a < $solution )
		{
			last;
		}
		
		for ( my $b = $a;  $b >= $min;  --$b )
		{
			my $x = $a * $b;
			
			if ( $x <= $solution )
			{
				last;
			}
	
			if ( is_palindrome( $x ) )
			{
				$solution = $x;
				
				last;
			}
		}
	}
	
	return $solution;
}

print answer(), "\n" if !caller;

1;
