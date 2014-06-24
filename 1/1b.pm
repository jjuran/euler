#!/usr/bin/env perl

package Euler::1;

use warnings;
use strict;

sub seq_sum
{
	my ( $x ) = @_;
	
	my $even = not $x % 2;
	
	return ($x + $even) * ($x + 1 >> 1);
}

sub answer
{
	my ( $n ) = @_;
	
	$n = 1000 if !defined $n;
	
	--$n;
	
	return 0 if $n <= 0;
	
	my $m = 7;  # number of multiples in 0 .. 14
	my $v = 45;  # sum of multiples in 0 .. 14
	
	my @counts =
	(
		0, 0, 0, 1,
		1, 2, 3, 3,
		3, 4, 5, 5,
		6, 6, 6,
	);
	
	my @tails = ( 0, 3, 8, 14, 23, 33, 45 );
	
	my $q = int( $n / 15 );  # 66
	
	my $sum = $q * $v + 15 * $m * seq_sum( $q - 1 );
	
	my $r = $n % 15;
	
	my $count = $counts[ $r ];
	
	$sum += $tails[ $count ];
	
	$sum += 15 * $q * ($count + 1);
	
	return $sum;
}

print answer(), "\n" if !caller;

my %seq_sum_tests =
(
	0 =>  0,
	1 =>  1,  # 1 * 1
	2 =>  3,  # 3 * 1
	3 =>  6,  # 3 * 2
	4 => 10,  # 5 * 2
	5 => 15,  # 5 * 3
	6 => 21,  # 7 * 3
	7 => 28,  # 7 * 4
);

for ( sort keys %seq_sum_tests )
{
	my $expected = $seq_sum_tests{ $_ };
	my $received = seq_sum( $_ );
	
	$received == $expected or die "seq_sum($_) got $received, not $expected\n";
}

1;
