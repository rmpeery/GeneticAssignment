#!/opt/local/bin/perl
use strict;
use warnings;

opendir(DIR, ".");
my @files = grep(/\.csv$/,readdir(DIR));
closedir(DIR);

my $file = ();

foreach $file (@files) {
	my $cmd = "awk -F";" '{ print $2 "\t" $3 }' $file > $file.txt";
	system($cmd);
	}
print "done\n";

