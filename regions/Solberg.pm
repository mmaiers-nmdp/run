##############################################################################
# PACKAGE NAME:	Solberg.pm
# DESCRIPTION:	
#
# DATE WRITTEN: 2017-06-21
# WRITTEN BY:   Martin Maiers
#
##############################################################################
package Solberg;
use strict;    # always
use warnings;  # or else


my $init = 0;
my $threshold = 1/1000;
my %D;
my %C;

sub getcont {
  initialize() unless $init;
  my $typ = shift;
  my ($loc, $allele) = split /\*/, $typ;
  
  return undef unless defined $D{$loc};
  return undef unless defined $D{$loc}{$allele};
  my %R;
  foreach my $pop (keys %{$D{$loc}{$allele}}) {
    next unless $D{$loc}{$allele}{$pop} > $threshold;
    my $c = $C{$pop};
    $R{$c}++;
  }
  return (sort keys %R);
}

sub get_threshold {
  return $threshold;
}

sub set_threshold {
  my $t = shift;
  $threshold = $t;
}

sub initialize {
  my $file = "./refdata/1-locus-alleles.dat";
  # dataset popname contin  complex latit   longit  coord   locus   allele_v2       allele_v3       allele.freq     allele.count    gametes
  open FILE, $file or die "$!: $file";
  while(<FILE>) {
    chomp;
    my ($dataset, $pop, $contin, $complex, $lat, $long, $coord, 
          $loc, $av2, $av3, $freq, $count, $gametes) = split /	/;
    next if $contin eq "OTH";
    $D{$loc}{$av3}{$pop}=$freq;
    $C{$pop} = $contin;
  }
  $init=1;
}
1;
