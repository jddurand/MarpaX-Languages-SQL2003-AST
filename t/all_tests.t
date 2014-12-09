#!perl -T
use strict;
use warnings FATAL => 'all';
use Data::Section -setup;
use Test::More;

plan tests => 2 + (2 * scalar(__PACKAGE__->section_data_names));

use_ok('MarpaX::Languages::SQL2003::AST');

my $obj = new_ok('MarpaX::Languages::SQL2003::AST');
foreach (__PACKAGE__->section_data_names) {
  my $stringp = __PACKAGE__->section_data($_);
  ok(defined($obj->asBlessed(${$stringp})), $_ . ': asBlessed() is ok');
  ok(defined($obj->asXML(${$stringp})), $_ . ': asXML() is ok');
}

__DATA__
__[ CHARACTER SET ]__

CREATE CHARACTER SET bob.charset_1 AS GET LATIN1;
CREATE CHARACTER SET bob.charset_1 GET LATIN1;
CREATE CHARACTER SET bob.charset_1 AS GET LATIN1 COLLATE bob.collation_1;
