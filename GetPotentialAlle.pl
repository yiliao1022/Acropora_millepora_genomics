use strict;
use warnings;

open In, "$ARGV[0]" or die "$!";

while (<In>) {
chomp;
my @temp = split (/\s/,$_);
if ( $temp[2] eq $temp[7]) {
#print "$_\n";
} else {
my $len = $temp[6]-$temp[5];
my $rate = $temp[1]/$len;
if ($rate > 65 and $len > 50000) {
print "$_\n";

}



}

#my $rate = $temp[1]/$temp[3];
#print "$rate\n";
}
