#
# This file is part of Reindeer
#
# This software is Copyright (c) 2011 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
my @sugar = qw{ has around augment inner before after blessed confess };

sub check_sugar_removed_ok {
    my $t = shift @_;

    # check some (not all) Moose sugar to make sure it has been cleared
    #my @sugar = qw{ has around augment inner before after blessed confess };
    ok !$t->can($_) => "$t cannot $_" for @sugar;

    return;
}

sub check_sugar_ok {
    my $t = shift @_;

    # check some (not all) Moose sugar to make sure it has been cleared
    #my @sugar = qw{ has around augment inner before after blessed confess };
    ok $t->can($_) => "$t can $_" for @sugar;

    return;
}

!!42;
