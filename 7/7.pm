#!/usr/bin/env perl

package Euler::7;

use warnings;
use strict;

use lib 'lib/perl';

use Prime;

*nth_prime = \&Prime::nth_prime;


sub answer
{
	return nth_prime( 10001 - 1 );
}

print answer(), "\n" if !caller;

1;
