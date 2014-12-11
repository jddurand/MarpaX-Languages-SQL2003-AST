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
        subtest $testName => sub {
            foreach (split(/\n/, ${$stringp})) {
                my $input = $_;
                $input =~ s/^\s*//;
                $input =~ s/\s*$//;
                if (length($input) > 0 && substr($input, 0, 2) ne '/*') {
                    my $xml = $tokenObj->asXML($input
                                               # , trace_terminals => 1
                        );
                    my %wantedLexemes = ();
                    map {$wantedLexemes{$_} = 0} split(/,/, (split(/:/, $testName))[-1]);
                    my %unwantedLexemes = ();
                    foreach ($xml->findnodes($lexemesXpath)) {
                        my $localname = $_->localname();
                        if (exists($wantedLexemes{$localname})) {
                            $wantedLexemes{$localname}++;
                        } else {
                            $unwantedLexemes{$localname}++;
                        }
                    }
                    if (%unwantedLexemes) {
                        fail("$testName: $input");
                        diag("Some lexemes are not of type " . join(', or ', keys %wantedLexemes) . ": " . join(', ', keys %unwantedLexemes) . ". XML AST is:\n" . $xml->toString(1) . "\n");
                    } elsif (grep {$wantedLexemes{$_} <= 0} keys %wantedLexemes) {
                        fail("$testName: $input");
                        diag("Some lexemes are not found: " . join(', ', grep {$wantedLexemes{$_} <= 0} keys %wantedLexemes) . ". XML AST is:\n" . $xml->toString(1) . "\n");

                    } else {
                        pass("$testName: $input");
                    }
                }
            }
        }
    } else {
        ok(defined($obj->parse(${$stringp}
                               # , trace_terminals => 1
                   )), $testName);
    }
}

__DATA__
__[ <001> token:Identifier:Regular_Identifier ]__
/***************************************************************************/
A
A0
A_0
A_0_B

__[ <002> token:Reserved:ADD ]__
/***************************************************************************/
ADD

__[ <002> token:Reserved:ALL ]__
/***************************************************************************/
ALL

__[ <003> token:Numeric:Unsigned_Numeric_Literal ]__
/***************************************************************************/
0
0.21
.22
1E+10
1E-20

__[ <004> token:National String:National_Character_String_Literal ]__
/***************************************************************************/
N'some text'
n'some text'

__[ <005> token:National String:National_Character_String_Literal ]__
/***************************************************************************/
N'some text'/*A comment */'Another text'
n'some text'/*A comment */'Another text'/* Another comment */

__[ <006> token:String:Character_String_Literal ]__
/***************************************************************************/
_utf8'some text'
_latin1'string'
_utf8'some text'/* A comment */'Something else'
'hello'

__[ <007> token:Unicode:Unicode_Delimited_Identifier_Value ]__
/***************************************************************************/
U&"\0441\043F\0430\0441\0438\0431\043E"
U&"m\00fcde"
U&'\0441\043F\0430\0441\0438\0431\043E'
U&'m\00fcde'

__[ <007> token:Large object:Large_Object_Length_Token ]__
/***************************************************************************/
1M
100K
2G

__[ <100> SELECT ]__
/***************************************************************************/
/* Please note that SQL2003 *REQUIRES* a FROM */
SELECT _latin1'string' FROM dual;
/*
SELECT _latin1'string' COLLATE latin1_danish_ci FROM dual;
SELECT N'some text' FROM dual;
SELECT n'some text' FROM dual;
SELECT _utf8'some text' FROM dual;
SELECT 'hello', '"hello"', '""hello""', 'hel''lo', '\'hello' FROM dual;
SELECT "hello", "'hello'", "''hello''", "hel""lo", "\"hello" FROM dual;
SELECT 'This\nIs\nFour\nLines' FROM dual;
SELECT 'disappearing\ backslash' FROM dual;
*/
__[ <101> CREATE CHARACTER SET ]__
CREATE CHARACTER SET bob.charset_1 AS GET LATIN1;
/*
CREATE CHARACTER SET bob.charset_1 GET LATIN1;
CREATE CHARACTER SET bob.charset_1 AS GET LATIN1 COLLATE bob.collation_1;
*/
