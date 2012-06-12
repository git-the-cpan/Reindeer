
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
    "Test::Fatal" => 0,
    "Test::Moose" => 0,
    "Test::Moose::More" => "0.009",
    "Test::More" => "0.88",
    "Test::Requires" => 0,
    "ok" => 0
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
    "Moose" => "1.15",
    "Moose::Exporter" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "MooseX::AbstractMethod" => "0.003",
    "MooseX::AlwaysCoerce" => "0.16",
    "MooseX::AttributeShortcuts" => "0.006",
    "MooseX::ClassAttribute" => "0.26",
    "MooseX::CurriedDelegation" => 0,
    "MooseX::LazyRequire" => "0.07",
    "MooseX::MarkAsMethods" => "0.14",
    "MooseX::NewDefaults" => "0.003",
    "MooseX::StrictConstructor" => "0.19",
    "MooseX::Traits" => 0,
    "MooseX::Types::Combine" => 0,
    "MooseX::Types::Common::Numeric" => "0.001004",
    "MooseX::Types::Common::String" => "0.001004",
    "MooseX::Types::LoadableClass" => "0.006",
    "MooseX::Types::Moose" => "0.31",
    "MooseX::Types::Path::Class" => "0.05",
    "MooseX::Types::Tied::Hash::IxHash" => "0.003",
    "Path::Class" => "0.24",
    "Sub::Exporter" => 0,
    "Sub::Install" => 0,
    "Try::Tiny" => "0.11",
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.012",
  "test" => {
    "TESTS" => "t/*.t t/builder/*.t t/moosex-abstract/*.t t/moosex-currieddelegation/*.t t/moosex-markasmethods/*.t t/moosex-newdefaults/*.t t/moosex-strictconstructor/*.t t/moosex-traits/*.t t/optional-traits/*.t"
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



