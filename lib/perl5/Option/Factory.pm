package Option::Factory;

=pod

=head1 NAME

Option::Factory

=head1 SYNOPSIS

Generates new objects that encode Option::Option objects

    use Option::Factory;

    my $opts = Option::Factory->new();
    my $var  = $opts->scalar("something");
    my $str  = $var->unwrap();

=head1 AUTHOR

Lee Katz

=head1 METHODS

=cut

use strict;
use warnings;
use Carp qw/confess croak/;
use Exporter qw/import/;
use File::Basename qw/dirname/;
  #use FindBin;
  #use lib dirname($INC{"Option/Factory.pm"})."..";
  #use Option::Option;


our $VERSION = $Option::Option::VERSION;

=pod

=over

=item new()

Creates a new factory

=cut

sub new{
  my($class) = @_;

  my $self = {
  };

  bless($self, $class);

  return $self;
}

=pod

=item scalar()

returns a scalar with a value

=back

=cut

sub scalar{
  my($self, $var) = @_;

  my $opt = Option::Option->new($var);

  return $opt;
}

=pod

=over

=item $factory->hash(\%hash)

Returns a new hash ref. If %hash is given, then copies
the hash. If no %hash is given, then a blank hash ref
is returned.

=back

=cut

sub hash{
  my($self, $hash) = @_;
  if(!defined $hash){
    $hash = {};
  }
  my %new_hash = %$hash;
  tie %new_hash, 'Option::Hash';
  return \%new_hash;
}
sub array{
  ...;
}

1;

