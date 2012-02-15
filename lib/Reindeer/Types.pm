#
# This file is part of Reindeer
#
# This software is Copyright (c) 2011 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
package Reindeer::Types;
{
  $Reindeer::Types::VERSION = '0.007';
}

# ABSTRACT: Reindeer combined type library

use strict;
use warnings;

use base 'MooseX::Types::Combine';

use Reindeer::Util;

# no provision for filtering
__PACKAGE__->provide_types_from(Reindeer::Util::type_libraries());

!!42;



=pod

=encoding utf-8

=head1 NAME

Reindeer::Types - Reindeer combined type library

=head1 VERSION

This document describes 0.007 of Reindeer::Types - released February 14, 2012 as part of Reindeer.

=head1 SYNOPSIS

    package Foo;
    use Moose;
    use Reindeer::Types ':all';

=head1 DESCRIPTION

This is a combined type library, allowing for the quick and easy import of all
the type libraries L<Reindeer> provides by default.  Its primary goal is to
make the types easily available even when using Reindeer isn't an option.

It is not necessary (or prudent) to directly use this in a Reindeer class (or
role).

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Reindeer|Reindeer>

=item *

L<L<Reindeer> has the full list of type libraries we incorporate.|L<Reindeer> has the full list of type libraries we incorporate.>

=item *

L<L<MooseX::Types::Combine>.|L<MooseX::Types::Combine>.>

=back

=head1 SOURCE

The development version is on github at L<http://github.com/RsrchBoy/reindeer>
and may be cloned from L<git://github.com/RsrchBoy/reindeer.git>

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/RsrchBoy/reindeer/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Chris Weyl.

This is free software, licensed under:

  The GNU Lesser General Public License, Version 2.1, February 1999

=cut


__END__

