use strict;
use warnings;
use Test::More tests=>2;
use Data::Dumper;

use File::Basename qw/dirname/;
use FindBin qw/$RealBin/;
use lib "$RealBin/../lib/perl5";

my $thisDir = dirname($0);

use_ok("Option::Hash");

subtest 'de novo hash' => sub{
  my %hash = ();
  tie %hash, 'Option::Hash';
  $hash{foo} = "bar";
  $hash{10}  = "something";
  $hash{something} = 10;

  is($hash{foo}->unwrap(), "bar", "Unwrap foo => bar");
  is($hash{10}->unwrap(), "something", "Unwrap 10 => something");
  is($hash{something}->unwrap(), "10", "Unwrap something => 10");
};

