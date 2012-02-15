use strict;
use warnings;

use Test::More;
use Test::Fatal;
use Test::Moose::More;

use Reindeer::Util 'type_libraries';

use ok 'Reindeer::Types';

# We're going to test both the library and the exports as generated by
# Reindeer at the same time: unless someone monkeys around with the library
# list via Reindeer::Builder, they should be identical anyways.
#
# This will test _everything_, obviating the need for individual tests for
# each type library we provide.

for my $library (type_libraries) {

    subtest "checking $library" => sub {

        # the library should already be loaded by virtue of Util

        for my $type ($library->type_names) {

            note $type;
            check_type_from_reindeer($library, $type);
            check_type_from_library($library, $type);
        }
    };
}

done_testing; # <=============

my $class = 'Class001';

sub check_type_from_reindeer {
    my ($library, $typename) = @_;

    $class++;

    my $lives = exception { eval qq{
        {
            package TestClass::$class;
            use Reindeer;
            has foo => (is => 'ro', isa => $typename);
        }
    } };

    is $lives, undef, "No blowing up on $library / $typename";
}

sub check_type_from_library {
    my ($library, $typename) = @_;

    $class++;

    my $lives = exception { eval qq{
        {
            package TestClass::$class;
            use Moose;
            use $library ':all';
            has foo => (is => 'ro', isa => $typename);
        }
    } };

    is $lives, undef, "No blowing up on $library / $typename";
}


