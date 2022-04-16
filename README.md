# perl-option-result

Produce option objects like in Rust.

# Synopsis

     use Option::Option;

     my $option = Option::Option->new("something");

     # This croaks:
     print $var;

     # This works
     my $var = $option->unwrap();
     print $var;

     # This also works and has a helpful error message
     my $var = $option->expect("get my something");
     print $var;


# Further help

Please use the issues tab on github for interactive help.

Use perldoc for up to date documentation.

```shell
perldoc lib/perl/Option/Option.pm
```
