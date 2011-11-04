#
# This file is part of Reindeer
#
# This software is Copyright (c) 2011 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
package Reindeer::Role;
{
  $Reindeer::Role::VERSION = '0.002';
}

# ABSTRACT: Reindeer in role form

use strict;
use warnings;

use Reindeer::Util;
use Moose::Exporter;

my (undef, undef, $init_meta) = Moose::Exporter->build_import_methods(
    install => [ qw{ import unimport }                      ],
    also    => [ 'Moose::Role', Reindeer::Util::also_list() ],
);

sub init_meta {
    my ($class, %options) = @_;
    my $for_class = $options{for_class};

    ### $for_class
    Moose::Role->init_meta(for_class => $for_class);
    Reindeer::Util->import_type_libraries({ -into => $for_class });
    Try::Tiny->export_to_level(1);
    MooseX::MarkAsMethods->import({ into => $for_class }, autoclean => 1);

    goto $init_meta if defined $init_meta;
}

!!42;



=pod

=head1 NAME

Reindeer::Role - Reindeer in role form

=head1 VERSION

version 0.002

=head1 SYNOPSIS

    # ta-da!
    use Reindeer::Role;

=head1 DESCRIPTION

For now, see the L<Reindeer> docs for information about what meta extensions
are automatically applied.

=head1 SEE ALSO

L<Reindeer>, L<Moose::Role>

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Chris Weyl.

This is free software, licensed under:

  The GNU Lesser General Public License, Version 2.1, February 1999

=cut


__END__

