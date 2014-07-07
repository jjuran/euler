package Prime;

use warnings;
use strict;

my @primes = ( 2 );

sub next_prime
{
	my $x = $primes[ -1 ];
	
	NUMBER: while ( 1 )
	{
		++$x;
		
		foreach my $prime ( @primes )
		{
			next NUMBER if $x % $prime == 0;
		}
		
		push @primes, $x;
		
		return $x;
	}
}

sub nth_prime
{
	my ( $i ) = @_;
	
	return $primes[ $i ]  if exists $primes[ $i ];
	
	my $prime;
	
	foreach ( @primes .. $i )
	{
		$prime = next_prime();
	}
	
	return $prime;
}

1;
