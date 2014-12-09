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
__[ String Literals ]__
/* Please note that SQL2003 *REQUIRES* a FROM */
SELECT _latin1'string' FROM dual;
SELECT _latin1'string' COLLATE latin1_danish_ci FROM dual;
SELECT N'some text' FROM dual;
SELECT n'some text' FROM dual;
SELECT _utf8'some text' FROM dual;
SELECT 'hello', '"hello"', '""hello""', 'hel''lo', '\'hello' FROM dual;
SELECT "hello", "'hello'", "''hello''", "hel""lo", "\"hello" FROM dual;
SELECT 'This\nIs\nFour\nLines' FROM dual;
SELECT 'disappearing\ backslash' FROM dual;

__[ Character Set ]__
CREATE CHARACTER SET bob.charset_1 AS GET LATIN1;
CREATE CHARACTER SET bob.charset_1 GET LATIN1;
CREATE CHARACTER SET bob.charset_1 AS GET LATIN1 COLLATE bob.collation_1;
