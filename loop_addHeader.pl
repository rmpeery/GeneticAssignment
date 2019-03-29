#!/opt/local/bin/perl
use strict;
use warnings;

opendir(DIR, ".");
my @files = grep(/\.txt$/,readdir(DIR));
closedir(DIR);

my $file = ();

foreach $file (@files) {
	my $cmd = "cat header $file > $file.head";
	system($cmd);
	}
print "done\n";