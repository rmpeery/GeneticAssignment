#!/opt/local/bin/perl
use strict;
use warnings;

opendir(DIR, ".");
my @files = grep(/\.txt$/,readdir(DIR));
closedir(DIR);

my $file = ();

foreach $file (@files) {
	my $cmd = "tail -r $file | tail +57 | tail -r > $file.known.txt";
	system($cmd);
	}
print "done\n";

