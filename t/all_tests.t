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
  ok(defined($obj->asBlessed(${$stringp}, trace_terminals => 1)), $_ . ': asBlessed() is ok');
  ok(defined($obj->asXML(${$stringp})), $_ . ': asXML() is ok');
}

__DATA__
__[ String Literals ]__
SELECT _latin1'string' FROM dual;
SELECT _latin1'string' COLLATE latin1_danish_ci;
SELECT N'some text';
SELECT n'some text';
SELECT _utf8'some text';
SELECT 'hello', '"hello"', '""hello""', 'hel''lo', '\'hello';
SELECT "hello", "'hello'", "''hello''", "hel""lo", "\"hello";
SELECT 'This\nIs\nFour\nLines';
SELECT 'disappearing\ backslash';

__[ CHARACTER SET ]__

CREATE CHARACTER SET bob.charset_1 AS GET LATIN1;
CREATE CHARACTER SET bob.charset_1 GET LATIN1;
CREATE CHARACTER SET bob.charset_1 AS GET LATIN1 COLLATE bob.collation_1;
