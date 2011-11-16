
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Moose with more antlers",
  "AUTHOR" => "Chris Weyl <cweyl\@alumni.drew.edu>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Moose::Util" => 0,
    "Test::Moose" => 0,
    "Test::More" => "0.88"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Reindeer",
  "EXE_FILES" => [],
  "LICENSE" => "lgpl",
  "NAME" => "Reindeer",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Class::Load" => 0,
    "Moose" => 0,
    "Moose::Exporter" => 0,
    "MooseX::AbstractMethod" => 0,
    "MooseX::AlwaysCoerce" => 0,
    "MooseX::AttributeShortcuts" => "0.006",
    "MooseX::ClassAttribute" => "0.26",
    "MooseX::LazyRequire" => "0.07",
    "MooseX::MarkAsMethods" => "0.14",
    "MooseX::NewDefaults" => 0,
    "MooseX::StrictConstructor" => 0,
    "MooseX::Types::Common::Numeric" => 0,
    "MooseX::Types::Common::String" => 0,
    "MooseX::Types::Moose" => 0,
    "MooseX::Types::Path::Class" => 0,
    "MooseX::Types::Tied::Hash::IxHash" => "0.002",
    "Path::Class" => "0.24",
    "Sub::Install" => 0,
    "Try::Tiny" => "0.11",
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.004",
  "test" => {
    "TESTS" => "t/*.t t/builder/*.t t/moosex-markasmethods/*.t t/moosex-newdefaults/*.t t/optional-traits/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



