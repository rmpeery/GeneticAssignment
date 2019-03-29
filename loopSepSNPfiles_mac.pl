#!/opt/local/bin/perl
use strict;
use warnings;

opendir(DIR, ".");
my @files = grep(/\.list$/,readdir(DIR));
closedir(DIR);

my $file = ();

foreach $file (@files) {
	my $cmd = "perl SeparateSNPfiles.pl $file tLD.txt";
	system($cmd);
	}
print "done\n";

