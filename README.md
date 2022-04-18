# perl-option-result

Produce option objects like in Rust.
Here is the Rust doc: https://doc.rust-lang.org/rust-by-example/error/multiple_error_types/option_result.html

# Synopsis

```perl
use Option::Option;

my $option = Option::Option->new("something");

# This croaks:
print $option;

# This works
my $var = $option->unwrap();
print $var;

# This also works and has a helpful error message
my $var = $option->expect("get my something");
print $var;
```

Hashes and arrays

```perl
# Make a hash where all values are automatically made into options
tie my %hash, 'Option::Hash';
$hash{foo} = "bar";
# dies if you print directly
print $hash{foo};
# this works
print $hash{foo}->unwrap();

# Make an array but this is mainly incomplete
tie my @arr, 'Option::Array';
$arr[0] = "bar";
# dies if you print directly
print $arr[0];
# This works
print $arr[0]->unwrap();
```

In the future I have a factory module reserved but I have no immediate plans.
Help is welcome if you wish to contribute in the issues tab on github.

```perl
use Option::Factory;

my $opts = Option::Factory->new();
my $var  = $opts->scalar("something");
my $str  = $var->unwrap();
```

# Installation

    cpanm -l ~ Option::Option

## From source

    git clone https://github.com/lskatz/perl-option-result
    cd perl-option-result
    cpanm -l ~ .

# Further help

Please use the issues tab on github for interactive help.

Use perldoc for up to date documentation.

```shell
perldoc lib/perl/Option/Option.pm
perldoc lib/perl/Option/Hash.pm
perldoc lib/perl/Option/Array.pm
perldoc lib/perl/Option/Factory.pm
```

