use strict;
use warnings;

open In, "$ARGV[0]" or die "$!";

my %gene;

while (<In>) {
chomp;
my @temp=split (/\t/, $_);
if (! exists $gene{$temp[0]}) {
my @hits;
push (@hits, $_);
my $ref = \@hits;
$gene{$temp[0]} = $ref;
} else {
push (@{$gene{$temp[0]}},$_);
}
}

#print "@{$gene{Mcavernosa13337}}\n";
open Out, ">$ARGV[0].cluster.out" or die "$!";

foreach my $key (sort keys %gene) {
my %hash = ();
my %identity =();
#my $sef = shift @{$gene{$key}};
#my @unit =  split (/\t/, $ref);
my $len;
my $ident;
#if ($unit[0] eq $unit[1] ) { $len = $unit[3]};
    
    foreach my $row (@{$gene{$key}}) {
    my @tmp = split (/\t/, $row);
#    if ($tmp[0] eq $tmp[1]) {$len = $tmp[3];}
    if (! exists $hash{$tmp[1]}) {
     my @length;
     my @iden;
     push (@length, $tmp[3]);
     push (@iden, $tmp[2]);
     my $refer = \@length;
     my $refer1 = \@iden;
     $hash{$tmp[1]} = $refer;
     $identity{$tmp[1]} = $refer1;
   } else {
   push (@{$hash{$tmp[1]}}, $tmp[3]);
   push (@{$identity{$tmp[1]}}, $tmp[2]);
  #  $hash{$tmp[1]} = $hash{$tmp[1]} + $tmp[3];
    }
    }
       @{$hash{$key}}=sort {$a<=>$b}@{$hash{$key}};
       
       $len = ${$hash{$key}}[(scalar@{$hash{$key}})-1];

        foreach my $gene1 (sort keys %hash) {
                @{$hash{$gene1}}=sort {$a<=>$b}@{$hash{$gene1}};                
                @{$identity{$gene1}}= sort {$a<=>$b}@{$identity{$gene1}};

                my $coverage = ${$hash{$gene1}}[(scalar@{$hash{$gene1}})-1] / $len ;  
                my $new_coverage = sprintf ("%.2f", $coverage);
                if ($coverage > 0.6) {
                print Out "$key\t$gene1\t$new_coverage\t$len\t${$identity{$gene1}}[0]\t${$hash{$gene1}}[(scalar@{$hash{$gene1}})-1]\n";
        }
}
}






