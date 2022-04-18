use strict;
use warnings;
use Test::More tests=>2;
use Data::Dumper;

use File::Basename qw/dirname/;
use FindBin qw/$RealBin/;
use lib "$RealBin/../lib/perl5";

my $thisDir = dirname($0);

use_ok("Option::Array");

subtest 'de novo array' => sub{
  my @arr;
  tie @arr, "Option::Array";

  $arr[0]=4;
  $arr[1]="bar";
  
  is(ref($arr[0]), "Option::Option", "Correct class for 0th element");
  is($arr[0]->unwrap(), 4, "unwrap 0th => 4");
  is($arr[1]->unwrap(), "bar", "unwrap 1st => bar");
};

