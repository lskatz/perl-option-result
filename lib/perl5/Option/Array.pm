package Option::Array;

=pod

=head1 NAME

Option:Array

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
use Tie::Array;

our @ISA = qw(Tie::Array);

# unimplemented mandatory methods
sub FETCH { ... }
 
sub STORESIZE { ... }   # mandatory if elements can be added/deleted
sub EXISTS { ... }      # mandatory if exists() expected to work
sub DELETE { ... }      # mandatory if delete() expected to work
 
# optional methods - for efficiency
sub CLEAR { ... }
sub PUSH { ... }
sub POP { ... }
sub SHIFT { ... }
sub UNSHIFT { ... }
sub SPLICE { ... }
sub EXTEND { ... }
sub DESTROY { }

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
  #die Dumper \@_;
  my($self, $index, $value) = @_;
  my $opt = Option::Option->new($value);
  #die Dumper \@_;
  #$$self[0]{$key} = $opt;
}
sub FETCHSIZE { 
  return scalar($$_[0]);
}

sub TIEARRAY { 
  my ($class, $opts) = @_;
  return bless [ ], $class;
}


1;

