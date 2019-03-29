#!/usr/bin/env perl
## USE: perl ./SeparateSNPfiles.pl inputlistfile snpCallFile

use strict;
use warnings;

my %list=();
my $count = 0;
my $inputlistfile = shift;

open FH, "<$inputlistfile";
while (<FH>) {
##AX_146289055
#	if (/^(AX-\d+)/) {
##M001_01_02_04A
	if (/^(M\S+)/) {
		my $ID = $1;
		$list{$ID} = 1;
		$count++;
		}
	}
print "$count\n";

my $snpCallFile = shift;

open FH1, "<$snpCallFile";
open OUT, ">$snpCallFile.keep.txt";
open OUT1, ">$snpCallFile.toss.txt";

my $flag = 0;
while (<FH1>) {
##AX-117397292	T/C	T/T	T/C	T/C	T/C	T/C	T/C	T/T	T/C	C/C	T/T	T/T	---	T/C	T/T	T/T	---
#	if (/^(AX-\d+)/) {	
##M001_01_01_03U	A/G	T/T	T/C	A/C	G/G	C/C	C/C	G/G	A/G
	if (/^(M\S+)\t/) {
		my $ID = $1; $flag = 0;
		if (exists $list{$ID}) {
			$flag = 1; }
		}
	if ($flag == 1) {
		print OUT; }
	else {
	print OUT1;
	}
}

close FH;
close FH1;
close OUT;
close OUT1;