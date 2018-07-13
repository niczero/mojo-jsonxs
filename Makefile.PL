use 5.010_001;
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojo::JSON_XS',
  VERSION_FROM => 'lib/Mojo/JSON_XS.pm',
  ABSTRACT     => 'Use XS JSON with Mojolicious',
  AUTHOR       => 'Nic Sandfield <niczero@cpan.org>',
  LICENSE      => 'artistic_2',
  META_MERGE   => {
    'meta-spec' => { version => 2 },
    dynamic_config => 0,
    requires  => {perl => 5.010_001},
    resources => {
      license     => 'http://www.opensource.org/licenses/artistic-license-2.0',
      homepage    => 'http://niczero.github.io/mojo-jsonxs',
      repository => {
        url => 'https://github.com/niczero/mojo-jsonxs.git',
        web => 'https://github.com/niczero/mojo-jsonxs',
        type => 'git',
      },
      bugtracker => {
        web => 'http://github.com/niczero/mojo-jsonxs/issues',
      },
    },
    no_index => {directory => [qw(data test)]}
  },
  TEST_REQUIRES => {'Test::More' => 0},
  CONFIGURE_REQUIRES => {'ExtUtils::MakeMaker' => 6.3},
  PREREQ_PM => {
    Mojolicious => 5.66,
    'Cpanel::JSON::XS' => 3.0109
  },
  EXE_FILES => [],
  test => {TESTS => 'test/*.t'}
);
