#!/usr/bin/env perl

package Euler::5;

use warnings;
use strict;

use lib 'lib/perl';

use Prime;

*nth_prime = \&Prime::nth_prime;


sub prime_factorization
{
	my ( $product ) = @_;
	
	my %result;
	
	my $i = 0;
	
	while ( $product > 1 )
	{
		my $factor = nth_prime( $i );
		
		my $n = 0;
		
		while ( $product % $factor == 0 )
		{
			$product /= $factor;
		
			++$n;
		}
		
		$result{ $factor } = $n  if $n;
		
		++$i;
	}
	
	return \%result;
}

sub merge_maps
{
	my %result;
	
	die "undef" if grep { !defined } values %result;
	
	foreach my $map ( @_ )
	{
		my %map = %$map;
		
		foreach my $key ( keys %map )
		{
			if ( $map{ $key } > ($result{ $key } || 0) )
			{
				$result{ $key } = $map{ $key };
			}
		}
	}
	
	die "undef" if grep { !defined } values %result;
	
	return \%result;
}

sub product
{
	my $result = shift @_;
	
	while ( @_ )
	{
		$result *= shift @_;
	}
	
	return $result;
}

sub lcm
{
	my $pf = merge_maps( map { prime_factorization( $_ ) } @_ );
	
	my @factors = map { $_ ** $pf->{ $_ } } keys %$pf;
	
	return product( @factors );
}

sub answer
{
	my @all = 1 .. 20;
	
	return lcm( @all );
}

print answer(), "\n" if !caller;

1;
