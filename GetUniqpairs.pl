use strict;
use warnings;

open In, "$ARGV[0]" or die "$!";
open Out, ">$ARGV[0].out" or die "$!";
my %hash;

while (<In>) {
chomp;
my @temp = split (/\t/, $_);
my $key = join ("_",($temp[0],$temp[1]));
$hash{$key} = 1;
}

my %hash1;

foreach my $key (keys %hash) {
my @unit = split (/_/, $key);
my $newkey = join ("_",($unit[1],$unit[0]));

if (exists $hash{$newkey} && !exists $hash1{$newkey}) {
my $k1 =uc($unit[0]);
my $k2 =uc($unit[1]);

print Out "$k1\t$k2\n";
  }
$hash1{$key}=0;
$hash1{$newkey} = 1;

}



