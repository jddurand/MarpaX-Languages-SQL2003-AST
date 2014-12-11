#!perl -T
use strict;
use warnings FATAL => 'all';
use Data::Section -setup;
use Test::More;
use XML::LibXML;

our $lexemesXpath = XML::LibXML::XPathExpression->new('//*[@start]');

plan tests => 3 + scalar(__PACKAGE__->section_data_names);

use_ok('MarpaX::Languages::SQL2003::AST');

my $obj = new_ok('MarpaX::Languages::SQL2003::AST');
my $tokenObj;
{
    no warnings;
    local $MarpaX::Languages::SQL2003::AST::start = ":start ::= <Tokens>\n<Tokens> ::= <Token>+\n";
    $tokenObj = new_ok('MarpaX::Languages::SQL2003::AST');
    diag("Second grammar with <token>+ as value");
}
foreach (sort __PACKAGE__->section_data_names) {
    my $testName = $_;
    my $stringp = __PACKAGE__->section_data($testName);
    if ($testName =~ /\btoken:/) {
        my $wantedLexeme = (split(/:/, $testName))[-1];
        subtest $testName => sub {
            foreach (split(/\n/, ${$stringp})) {
                my $input = $_;
                $input =~ s/^\s*//;
                $input =~ s/\s*$//;
                if (length($input) > 0) {
                    my $xml = $tokenObj->asXML($input
                                               , trace_terminals => 1
                        );
                    if (! grep {$_->localname() ne $wantedLexeme} $xml->findnodes($lexemesXpath)) {
                        pass("$testName: $input");
                    } else {
                        fail("$testName: $input");
                        diag("Some lexemes are not of type $wantedLexeme. XML AST is:\n" . $xml->toString(1) . "\nbut got lexemes of type" . join(', ', map {$_->localname()} grep {$_->localname() ne $wantedLexeme} $xml->findnodes($lexemesXpath)));
                    }
                }
            }
        }
    } else {
        ok(defined($obj->parse(${$stringp})), $testName);
    }
}

__DATA__
__[ <001> token:Regular Identifier:SQL_Language_Identifier ]__
A
A0
A_0
A_0_B
__[ <002> token:Reserved Word:ADD ]__
ADD
__[ <002> token:Reserved Word:ALL ]__
ALL
__[ <003> token:Unsigned Numeric Literal:Unsigned_Numeric_Literal ]__
0
0.21
.22
1E+10
1E-20
__[ <004> token:National Character String Literal:National_Character_String_Literal ]__
_latin1'string'
N'some text'
n'some text'
_utf8'some text'
'hello'
'"hello"'
'""hello""'
'hel''lo'
'\'hello'
"hello"
"'hello'"
"''hello''"
"hel""lo"
"\"hello"
'This\nIs\nFour\nLines'
'disappearing\ backslash'
__[ <100> String Literals ]__
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
__[ <101> Character Set ]__
CREATE CHARACTER SET bob.charset_1 AS GET LATIN1;
CREATE CHARACTER SET bob.charset_1 GET LATIN1;
CREATE CHARACTER SET bob.charset_1 AS GET LATIN1 COLLATE bob.collation_1;
