#!/opt/local/bin/perl
use strict;
use warnings;

opendir(DIR, ".");
my @files = grep(/\.head$/,readdir(DIR));
closedir(DIR);

my $file = ();


foreach $file (@files) {
	my $cmd = "datamash transpose <$file >$file.txt;";
	system($cmd);

	}
print "done\n";

