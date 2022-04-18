package Option::Hash;

=pod

=head1 NAME

Option::Hash

=head1 SYNOPSIS

=head1 AUTHOR

Lee Katz

=head1 METHODS

=cut

use strict;
use warnings;
use Carp qw/confess croak/;
use Data::Dumper;
use Option::Option;

#require Tie::ExtraHash;

our @ISA = qw(Tie::ExtraHash);

=pod

=over

=item STORE

Transforms the value into an Option::Option

    use Data::Dumper;
    use Option::Hash;
    use strict;
    use warnings;

    my %hash;
    tie %hash, 'Option::Hash';
    $hash{foo} = "bar";
    print Dumper \%hash;

    $VAR1 = {
      'foo' => bless( {
        'var => 'bar'
      }, 'Option::Option' )
    };

=back

=cut

sub STORE{
  my($self, $key, $value) = @_;
  my $opt = Option::Option->new($value);
  $$self[0]{$key} = $opt;
}

1;

