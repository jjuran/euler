#!/usr/bin/env perl

use warnings;
use strict;

my %answers =
(
	1 => 233168,
	2 => 4613732,
	3 => 6857,
	4 => 906609,
	5 => 232792560,
	6 => 25164150,
	7 => 104743,
	8 => 23514624000,
	9 => 31875000,
	10 => 142913828922,
);

my $n_fails = 0;

sub check_answer
{
	my ( $i, $path ) = @_;
	
	die "No answer recorded for problem #$i\n" if !exists $answers{ $i };
	
	-e $path or die "$path: Doesn't exist\n";
	-f $path or die "$path: Not a file\n";
	-x $path or die "$path: Not executable\n";
	
	my $answer = $answers{ $i };
	
	my $submission = substr( `$path`, 0, -1 );
	
	if ( $submission != $answer )
	{
		++$n_fails;
		
		warn "$path: $submission != $answer\n";
	}
}

sub check_problem
{
	my ( $i ) = @_;
	
	opendir my $d, "$i" or die "$i: $!\n";
	
	my @items = grep { m{^ [^.] }x } readdir( $d );
	
	warn "No solutions for $i\n" if !@items;
	
	foreach my $name ( @items )
	{
		check_answer( $i, "$i/$name" );
	}
}

sub check
{
	foreach ( @_ )
	{
		my ($i) = m{^ ( [0-9]+ ) (/ .*)? $}x or die "Bad argument '$_'\n";
		
		-f $_ ? check_answer( $i, $_ ) : check_problem( $i );
	}
}

my @args = @ARGV ? @ARGV : keys %answers;

check( @args );

exit $n_fails ? 1 : 0;
