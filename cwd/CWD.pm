#!/usr/bin/env perl
##############################################################################
# PACKAGE NAME:	CWD.pm
# DESCRIPTION:	module for using CWD list
# PARAMETERS:	none
# OUTPUT:	
# TABLES:       
#
# DATE WRITTEN: 2013-06-04
# WRITTEN BY:   Martin J. Maiers
#
# REVISION HISTORY: 
# REVISION DATE		REVISED BY	DESCRIPTION 
# ------- ----------	--------------	-------------------------------------
#
#       COPYRIGHT (C) 2011 NATIONAL MARROW DONOR PROGRAM.  
#               ALL RIGHTS RESERVED        
##############################################################################
package CWD;
use strict;    # always
use warnings;  # or else
use lib "/MDP/prod/research/lib/perl";

my $init =0;

my %CWD;

sub initialize {
  my $file = "./refdata/Table_S1.txt";
  open FILE, $file or die "$!: $file\n";
  while(<FILE>) {
    chomp;
    next if /^CWD/;
    next if /^Locus/i;
    next if /^Classical/i;
    next unless /\d/;
    my ($loc, $acc, $allele, $cwd1, $post215, $cwd2) = split /	/;
    $CWD{$loc}{$allele}{CWD1} = $cwd1;
    $CWD{$loc}{$allele}{CWD2} = $cwd2;
  }
  $init =1;
}


# extend
sub getCWDn {
  my ($loc, $allele, $version) = @_;
  if ($allele!~/\*/) {
    $allele= join ('*', $loc, $allele);
  }
  my $ret = getCWD($loc, $allele, $version);
  if (defined $ret) {
    return $ret;
  } else {
    $ret = getCWD($loc, $allele.":01", $version);
    if (defined $ret) {
      return $ret;
    } else {
      $ret = getCWD($loc, $allele.":01:01", $version);
      if (defined $ret) {
        return $ret;
      } else {
        $ret = getCWD($loc, $allele.":02", $version);
        if (defined $ret) {
          return $ret;
        } else {
          return 0;
        }
      }
    }
  }
}

sub getCWD {
  initialize() unless $init;
  my ($loc, $allele, $version) = @_;
  return $CWD{$loc}{$allele}{$version} if defined $CWD{$loc}{$allele}{$version};
  return undef;
}

1;
