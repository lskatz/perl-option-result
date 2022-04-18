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

  $arr[3]=4;

  pass("arrays not yet working");
};

