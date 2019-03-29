#!/opt/local/bin/perl
use strict;
use warnings;

opendir(DIR, ".");
my @files = grep(/\.str$/,readdir(DIR));
closedir(DIR);

my $file = ();
foreach $file (@files) {
	my $cmd = "/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Commands/java -Xmx1024m -Xms512m -jar /Applications/PGDSpider_2.1.1.5/PGDSpider2-cli.jar -inputfile $file -inputformat STRUCTURE -outputfile $file.txt -outputformat GENEPOP -SPID str2genepop.spid";
	system($cmd);
	}
print "done\n";