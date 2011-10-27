#
# This file is part of Reindeer
#
# This software is Copyright (c) 2011 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
package Reindeer::Util;
{
  $Reindeer::Util::VERSION = '0.001'; # TRIAL
}

# ABSTRACT: The great new Reindeer!

use strict;
use warnings;

#use namespace::autoclean;
#use common::sense;
#use Moose::Exporter;

use Moose                      ( );
use MooseX::AlwaysCoerce       ( );
use MooseX::AbstractMethod     ( );
use MooseX::AttributeShortcuts ( );
use MooseX::NewDefaults        ( );
use MooseX::MarkAsMethods      ( ); #
use MooseX::StrictConstructor  ( );
use MooseX::Types::Moose       ( );

use MooseX::Types::Moose           ( );
use MooseX::Types::Common::String  ( );
use MooseX::Types::Common::Numeric ( );

sub also_list {

    return qw{
        MooseX::AbstractMethod
        MooseX::AlwaysCoerce
        MooseX::AttributeShortcuts
        MooseX::NewDefaults
        MooseX::StrictConstructor
    };
}

sub import_type_libraries {
    my ($class, $opts) = @_;

    #$_->import({ -into => $opts->{for_class} }, ':all')
    $_->import($opts, ':all')
        for type_libraries();

    return;
}

sub type_libraries {

    return qw{
        MooseX::Types::Moose
        MooseX::Types::Common::String
        MooseX::Types::Common::Numeric
    };
}

!!42;



=pod

=head1 NAME

Reindeer::Util - The great new Reindeer!

=head1 VERSION

version 0.001

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SEE ALSO

=head1 BUGS

All complex software has bugs lurking in it, and this module is no exception.

Bugs, feature requests and pull requests through GitHub are most welcome; our
page and repo (same URI):

    https://github.com/RsrchBoy/reindeer

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Chris Weyl.

This is free software, licensed under:

  The GNU Lesser General Public License, Version 2.1, February 1999

=cut


__END__

