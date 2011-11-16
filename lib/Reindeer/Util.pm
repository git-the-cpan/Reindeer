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
  $Reindeer::Util::VERSION = '0.004';
}

# ABSTRACT: Common and utility functions for Reindeer

use strict;
use warnings;

use Class::Load 'load_class';

use Moose                                   ( );
use MooseX::AlwaysCoerce                    ( );
use MooseX::AbstractMethod                  ( );
use MooseX::AttributeShortcuts 0.006        ( );
use MooseX::ClassAttribute 0.26             ( );
use MooseX::LazyRequire 0.07                ( );
use MooseX::MarkAsMethods 0.14              ( );
use MooseX::NewDefaults                     ( );
use MooseX::StrictConstructor               ( );
use MooseX::Types::Moose                    ( );
use MooseX::Types::Common::String           ( );
use MooseX::Types::Common::Numeric          ( );
use MooseX::Types::Path::Class              ( );
use MooseX::Types::Tied::Hash::IxHash 0.002 ( );

use Path::Class 0.24 ( );
use Try::Tiny 0.11   ( );

# SlurpyConstructor, Params::Validate

sub trait_aliases {

    # note that merely specifing aliases does not load the packages; Moose
    # will handle that when (if) the trait is ever used.
    return (
        [ 'MooseX::AutoDestruct::Trait::Attribute'           => 'AutoDestruct'  ],
        [ 'MooseX::MultiInitArg::Trait'                      => 'MultiInitArg'  ],
        [ 'MooseX::TrackDirty::Attributes::Trait::Attribute' => 'TrackDirty'    ],
        [ 'MooseX::UndefTolerant::Attribute'                 => 'UndefTolerant' ],

        # LazyRequire doesn't export a trait_alias, so let's create one
        'MooseX::LazyRequire::Meta::Attribute::Trait::LazyRequire',

        # this one is a little funky, in that it replaces the accessor
        # metaclass, rather than just applying a trait to it
        [ 'Moose::Meta::Attribute::Custom::Trait::MergeHashRef' => 'MergeHashRef' ],
    );
}

# If an extension doesn't have a trait that's directly loadable, we build subs
# to do it here.

sub SetOnce { _lazy('MooseX::SetOnce', 'MooseX::SetOnce::Attribute') }
sub _lazy { load_class(shift); shift }

sub as_is {

    return (
        \&SetOnce,
    );
}

# Types:
# Tied, Perl, IxHash, ENV

# Roles:
# TraitConstructor, Traits

sub also_list {

    return qw{
        MooseX::AbstractMethod
        MooseX::AlwaysCoerce
        MooseX::AttributeShortcuts
        MooseX::ClassAttribute
        MooseX::LazyRequire
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
        MooseX::Types::Path::Class
        MooseX::Types::Tied::Hash::IxHash
    };
}

!!42;



=pod

=head1 NAME

Reindeer::Util - Common and utility functions for Reindeer

=head1 VERSION

version 0.004

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

