use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::SQL2003::AST;

# ABSTRACT: Translate SQL-2003 source to an AST in XML format

use Log::Any qw/$log/;
use Carp qw/croak/;

# VERSION

=head1 DESCRIPTION

This module translates SQL-2003 to an AST in XML format.

=head1 SYNOPSIS

    use strict;
    use warnings FATAL => 'all';
    use MarpaX::Languages::SQL2003::AST;
    #
    # Parse SQL
    #
    my $input = 'select * from myTable;';
    my $xml = MarpaX::Languages::SQL2003::AST->new()->xml($input);

=head1 SUBROUTINES/METHODS

=head2 new($class)

Instantiate a new object.

=back

=cut

# ----------------------------------------------------------------------------------------
sub new {
  my ($class, %opts) = @_;

  my $self  = {};

  bless($self, $class);

  return $self;
}

# ----------------------------------------------------------------------------------------

=head2 xml($self, $input)

Return the AST of $input as an XML::LibXML::Document object.

=cut

sub parse {
  my ($self, $input) = @_;

}

=head1 SEE ALSO

L<Marpa::R2>, L<XML::LibXML>

=cut

1;

__DATA__
inaccessible is ok by default
:default ::= action => nonTerminalSemantic
lexeme default = action => [start,length,value] latm => 1

:start ::= <SQL_Start_Sequence>
<SQL_Start_many> ::= <SQL_Start>+ rank => 0
<SQL_Start_Sequence> ::= <SQL_Start_many> rank => 0
<SQL_Start> ::= <Preparable_Statement> rank => 0
              | <Direct_SQL_Statement> rank => -1
              | <Embedded_SQL_Declare_Section> rank => -2
              | <Embedded_SQL_Host_Program> rank => -3
              | <Embedded_SQL_Statement> rank => -4
              | <SQL_Client_Module_Definition> rank => -5
<SQL_Terminal_Character> ::= <SQL_Language_Character> rank => 0
<SQL_Language_Character> ::= <Simple_Latin_Letter> rank => 0
                           | <Digit> rank => -1
                           | <SQL_Special_Character> rank => -2
<Simple_Latin_Letter> ::= <Simple_Latin_Upper_Case_Letter> rank => 0
                        | <Simple_Latin_Lower_Case_Letter> rank => -1
<Simple_Latin_Upper_Case_Letter> ::= <Lex001> rank => 0
<Simple_Latin_Lower_Case_Letter> ::= <Lex002> rank => 0
<Digit> ::= <Lex003> rank => 0
<SQL_Special_Character> ::= <Space> rank => 0
                          | <Double_Quote> rank => -1
                          | <Percent> rank => -2
                          | <Ampersand> rank => -3
                          | <Quote> rank => -4
                          | <Left_Paren> rank => -5
                          | <Right_Paren> rank => -6
                          | <Asterisk> rank => -7
                          | <Plus_Sign> rank => -8
                          | <Comma> rank => -9
                          | <Minus_Sign> rank => -10
                          | <Period> rank => -11
                          | <Solidus> rank => -12
                          | <Colon> rank => -13
                          | <Semicolon> rank => -14
                          | <Less_Than_Operator> rank => -15
                          | <Equals_Operator> rank => -16
                          | <Greater_Than_Operator> rank => -17
                          | <Question_Mark> rank => -18
                          | <Left_Bracket> rank => -19
                          | <Right_Bracket> rank => -20
                          | <Circumflex> rank => -21
                          | <Underscore> rank => -22
                          | <Vertical_Bar> rank => -23
                          | <Left_Brace> rank => -24
                          | <Right_Brace> rank => -25
<Space> ::= <Lex004> rank => 0
<Double_Quote> ::= <Lex005> rank => 0
<Percent> ::= <Lex006> rank => 0
<Ampersand> ::= <Lex007> rank => 0
<Quote> ::= <Lex008> rank => 0
<Left_Paren> ::= <Lex009> rank => 0
<Right_Paren> ::= <Lex010> rank => 0
<Asterisk> ::= <Lex011> rank => 0
<Plus_Sign> ::= <Lex012> rank => 0
<Comma> ::= <Lex013> rank => 0
<Minus_Sign> ::= <Lex014> rank => 0
<Period> ::= <Lex015> rank => 0
<Solidus> ::= <Lex016> rank => 0
<Colon> ::= <Lex017> rank => 0
<Semicolon> ::= <Lex018> rank => 0
<Less_Than_Operator> ::= <Lex019> rank => 0
<Equals_Operator> ::= <Lex020> rank => 0
<Greater_Than_Operator> ::= <Lex021> rank => 0
<Question_Mark> ::= <Lex022> rank => 0
<Left_Bracket_Or_Trigraph> ::= <Left_Bracket> rank => 0
                             | <Left_Bracket_Trigraph> rank => -1
<Right_Bracket_Or_Trigraph> ::= <Right_Bracket> rank => 0
                              | <Right_Bracket_Trigraph> rank => -1
<Left_Bracket> ::= <Lex023> rank => 0
<Left_Bracket_Trigraph> ::= <Lex024> rank => 0
<Right_Bracket> ::= <Lex025> rank => 0
<Right_Bracket_Trigraph> ::= <Lex026> rank => 0
<Circumflex> ::= <Lex027> rank => 0
<Underscore> ::= <Lex028> rank => 0
<Vertical_Bar> ::= <Lex029> rank => 0
<Left_Brace> ::= <Lex030> rank => 0
<Right_Brace> ::= <Lex031> rank => 0
<Token> ::= <Nondelimiter_Token> rank => 0
          | <Delimiter_Token> rank => -1
<Nondelimiter_Token> ::= <Regular_Identifier> rank => 0
                       | <Key_Word> rank => -1
                       | <Unsigned_Numeric_Literal> rank => -2
                       | <National_Character_String_Literal> rank => -3
                       | <Large_Object_Length_Token> rank => -4
                       | <Multiplier> rank => -5
<Regular_Identifier> ::= <SQL_Language_Identifier> rank => 0
<Digit_many> ::= <Digit>+ rank => 0
<Large_Object_Length_Token> ::= <Digit_many> <Multiplier> rank => 0
<Multiplier> ::= <K> rank => 0
               | <M> rank => -1
               | <G> rank => -2
<Delimited_Identifier> ~ <Lex035> <Delimited_Identifier_Body> <Lex036>
<GenLex092> ~ <Delimited_Identifier_Part>
<GenLex092_many> ~ <GenLex092>+
<Delimited_Identifier_Body> ~ <GenLex092_many>
<Delimited_Identifier_Part> ~ <Nondoublequote_Character>
                              | <Doublequote_Symbol>
<Unicode_Delimited_Identifier> ~ <Lex037> <Lex038> <Lex039> <Unicode_Delimiter_Body> <Lex040> <Unicode_Escape_Specifier>
<GenLex098> ~ <Lex041> <Lex042> <Unicode_Escape_Character> <Lex043>
<GenLex098_maybe> ~ <GenLex098>
<GenLex098_maybe> ~
<Unicode_Escape_Specifier> ~ <GenLex098_maybe>
<GenLex102> ~ <Unicode_Identifier_Part>
<GenLex102_many> ~ <GenLex102>+
<Unicode_Delimiter_Body> ~ <GenLex102_many>
<Unicode_Identifier_Part> ~ <Unicode_Delimited_Identifier_Part>
                            | <Unicode_Escape_Value_Internal>
<Unicode_Delimited_Identifier_Part> ~ <Nondoublequote_Character>
                                      | <Doublequote_Symbol>
<Unicode_Escape_Value_Internal> ~ <Unicode_4_Digit_Escape_Value>
                                  | <Unicode_6_Digit_Escape_Value>
                                  | <Unicode_Character_Escape_Value>
<Unicode_Escape_Value> ~ <Unicode_Escape_Value_Internal>
<Unicode_Hexit> ~ <Lex044>
<Unicode_4_Digit_Escape_Value> ~ <Unicode_Escape_Character> <Unicode_Hexit> <Unicode_Hexit> <Unicode_Hexit> <Unicode_Hexit>
<Unicode_6_Digit_Escape_Value> ~ <Unicode_Escape_Character> <Lex045> <Unicode_Hexit> <Unicode_Hexit> <Unicode_Hexit> <Unicode_Hexit> <Unicode_Hexit> <Unicode_Hexit>
<Unicode_Character_Escape_Value> ~ <Unicode_Escape_Character> <Unicode_Escape_Character>
<Unicode_Escape_Character> ~ <Lex046>
<Nondoublequote_Character> ~ <Lex047>
<Doublequote_Symbol> ~ <Lex048>
<Delimiter_Token> ::= <Character_String_Literal> rank => 0
                    | <Date_String> rank => -1
                    | <Time_String> rank => -2
                    | <Timestamp_String> rank => -3
                    | <Interval_String> rank => -4
                    | <Delimited_Identifier> rank => -5
                    | <Unicode_Delimited_Identifier> rank => -6
                    | <SQL_Special_Character> rank => -7
                    | <Not_Equals_Operator> rank => -8
                    | <Greater_Than_Or_Equals_Operator> rank => -9
                    | <Less_Than_Or_Equals_Operator> rank => -10
                    | <Concatenation_Operator> rank => -11
                    | <Right_Arrow> rank => -12
                    | <Left_Bracket_Trigraph> rank => -13
                    | <Right_Bracket_Trigraph> rank => -14
                    | <Double_Colon> rank => -15
                    | <Double_Period> rank => -16
<Not_Equals_Operator> ::= <Less_Than_Operator> <Greater_Than_Operator> rank => 0
<Greater_Than_Or_Equals_Operator> ::= <Greater_Than_Operator> <Equals_Operator> rank => 0
<Less_Than_Or_Equals_Operator> ::= <Less_Than_Operator> <Equals_Operator> rank => 0
<Concatenation_Operator> ::= <Vertical_Bar> <Vertical_Bar> rank => 0
<Right_Arrow> ::= <Minus_Sign> <Greater_Than_Operator> rank => 0
<Double_Colon> ::= <Colon> <Colon> rank => 0
<Double_Period> ::= <Period> <Period> rank => 0
<Gen144> ::= <Comment> rank => 0
           | <Space> rank => -1
<Gen144_many> ::= <Gen144>+ rank => 0
<Separator> ::= <Gen144_many> rank => 0
<Comment> ::= <Simple_Comment> rank => 0
            | <Bracketed_Comment> rank => -1
<Comment_Character_any> ::= <Comment_Character>* rank => 0
<Simple_Comment> ::= <Simple_Comment_Introducer> <Comment_Character_any> <Newline> rank => 0
<Minus_Sign_any> ::= <Minus_Sign>* rank => 0
<Simple_Comment_Introducer> ::= <Minus_Sign> <Minus_Sign> <Minus_Sign_any> rank => 0
<Bracketed_Comment> ::= <Bracketed_Comment_Introducer> <Bracketed_Comment_Contents> <Bracketed_Comment_Terminator> rank => 0
<Bracketed_Comment_Introducer> ::= <Solidus> <Asterisk> rank => 0
<Bracketed_Comment_Terminator> ::= <Asterisk> <Solidus> rank => 0
<Gen157> ::= <Comment_Character> rank => 0
           | <Separator> rank => -1
<Gen157_any> ::= <Gen157>* rank => 0
<Bracketed_Comment_Contents> ::= <Gen157_any> rank => 0
<Comment_Character> ::= <Nonquote_Character> rank => 0
                      | <Quote> rank => -1
<Newline> ::= <Lex049> rank => 0
<Key_Word> ::= <Reserved_Word> rank => 0
             | <Non_Reserved_Word> rank => -1
<Non_Reserved_Word> ::= <A> rank => 0
                      | <ABS> rank => -1
                      | <ABSOLUTE> rank => -2
                      | <ACTION> rank => -3
                      | <ADA> rank => -4
                      | <ADMIN> rank => -5
                      | <AFTER> rank => -6
                      | <ALWAYS> rank => -7
                      | <ASC> rank => -8
                      | <ASSERTION> rank => -9
                      | <ASSIGNMENT> rank => -10
                      | <ATTRIBUTE> rank => -11
                      | <ATTRIBUTES> rank => -12
                      | <AVG> rank => -13
                      | <BEFORE> rank => -14
                      | <BERNOULLI> rank => -15
                      | <BREADTH> rank => -16
                      | <C> rank => -17
                      | <CARDINALITY> rank => -18
                      | <CASCADE> rank => -19
                      | <CATALOG> rank => -20
                      | <Lex071> rank => -21
                      | <CEIL> rank => -22
                      | <CEILING> rank => -23
                      | <CHAIN> rank => -24
                      | <CHARACTERISTICS> rank => -25
                      | <CHARACTERS> rank => -26
                      | <Lex077> rank => -27
                      | <Lex078> rank => -28
                      | <Lex079> rank => -29
                      | <Lex080> rank => -30
                      | <Lex081> rank => -31
                      | <CHECKED> rank => -32
                      | <Lex083> rank => -33
                      | <COALESCE> rank => -34
                      | <COBOL> rank => -35
                      | <Lex086> rank => -36
                      | <COLLATION> rank => -37
                      | <Lex088> rank => -38
                      | <Lex089> rank => -39
                      | <Lex090> rank => -40
                      | <COLLECT> rank => -41
                      | <Lex092> rank => -42
                      | <Lex093> rank => -43
                      | <Lex094> rank => -44
                      | <COMMITTED> rank => -45
                      | <CONDITION> rank => -46
                      | <Lex097> rank => -47
                      | <Lex098> rank => -48
                      | <CONSTRAINTS> rank => -49
                      | <Lex100> rank => -50
                      | <Lex101> rank => -51
                      | <Lex102> rank => -52
                      | <CONSTRUCTORS> rank => -53
                      | <CONTAINS> rank => -54
                      | <CONVERT> rank => -55
                      | <CORR> rank => -56
                      | <COUNT> rank => -57
                      | <Lex108> rank => -58
                      | <Lex109> rank => -59
                      | <Lex110> rank => -60
                      | <Lex111> rank => -61
                      | <Lex112> rank => -62
                      | <DATA> rank => -63
                      | <Lex114> rank => -64
                      | <Lex115> rank => -65
                      | <DEFAULTS> rank => -66
                      | <DEFERRABLE> rank => -67
                      | <DEFERRED> rank => -68
                      | <DEFINED> rank => -69
                      | <DEFINER> rank => -70
                      | <DEGREE> rank => -71
                      | <Lex122> rank => -72
                      | <DEPTH> rank => -73
                      | <DERIVED> rank => -74
                      | <DESC> rank => -75
                      | <DESCRIPTOR> rank => -76
                      | <DIAGNOSTICS> rank => -77
                      | <DISPATCH> rank => -78
                      | <DOMAIN> rank => -79
                      | <Lex130> rank => -80
                      | <Lex131> rank => -81
                      | <EQUALS> rank => -82
                      | <EVERY> rank => -83
                      | <EXCEPTION> rank => -84
                      | <EXCLUDE> rank => -85
                      | <EXCLUDING> rank => -86
                      | <EXP> rank => -87
                      | <EXTRACT> rank => -88
                      | <FINAL> rank => -89
                      | <FIRST> rank => -90
                      | <FLOOR> rank => -91
                      | <FOLLOWING> rank => -92
                      | <FORTRAN> rank => -93
                      | <FOUND> rank => -94
                      | <FUSION> rank => -95
                      | <G> rank => -96
                      | <GENERAL> rank => -97
                      | <GO> rank => -98
                      | <GOTO> rank => -99
                      | <GRANTED> rank => -100
                      | <HIERARCHY> rank => -101
                      | <IMPLEMENTATION> rank => -102
                      | <INCLUDING> rank => -103
                      | <INCREMENT> rank => -104
                      | <INITIALLY> rank => -105
                      | <INSTANCE> rank => -106
                      | <INSTANTIABLE> rank => -107
                      | <INTERSECTION> rank => -108
                      | <INVOKER> rank => -109
                      | <ISOLATION> rank => -110
                      | <K> rank => -111
                      | <KEY> rank => -112
                      | <Lex161> rank => -113
                      | <Lex162> rank => -114
                      | <LAST> rank => -115
                      | <LENGTH> rank => -116
                      | <LEVEL> rank => -117
                      | <LN> rank => -118
                      | <LOCATOR> rank => -119
                      | <LOWER> rank => -120
                      | <M> rank => -121
                      | <MAP> rank => -122
                      | <MATCHED> rank => -123
                      | <MAX> rank => -124
                      | <MAXVALUE> rank => -125
                      | <Lex173> rank => -126
                      | <Lex174> rank => -127
                      | <Lex175> rank => -128
                      | <MIN> rank => -129
                      | <MINVALUE> rank => -130
                      | <MOD> rank => -131
                      | <MORE> rank => -132
                      | <MUMPS> rank => -133
                      | <NAME> rank => -134
                      | <NAMES> rank => -135
                      | <NESTING> rank => -136
                      | <NEXT> rank => -137
                      | <NORMALIZE> rank => -138
                      | <NORMALIZED> rank => -139
                      | <NULLABLE> rank => -140
                      | <NULLIF> rank => -141
                      | <NULLS> rank => -142
                      | <NUMBER> rank => -143
                      | <OBJECT> rank => -144
                      | <OCTETS> rank => -145
                      | <Lex193> rank => -146
                      | <OPTION> rank => -147
                      | <OPTIONS> rank => -148
                      | <ORDERING> rank => -149
                      | <ORDINALITY> rank => -150
                      | <OTHERS> rank => -151
                      | <OVERLAY> rank => -152
                      | <OVERRIDING> rank => -153
                      | <PAD> rank => -154
                      | <Lex202> rank => -155
                      | <Lex203> rank => -156
                      | <Lex204> rank => -157
                      | <Lex205> rank => -158
                      | <Lex206> rank => -159
                      | <Lex207> rank => -160
                      | <PARTIAL> rank => -161
                      | <PASCAL> rank => -162
                      | <PATH> rank => -163
                      | <Lex211> rank => -164
                      | <Lex212> rank => -165
                      | <Lex213> rank => -166
                      | <PLACING> rank => -167
                      | <PLI> rank => -168
                      | <POSITION> rank => -169
                      | <POWER> rank => -170
                      | <PRECEDING> rank => -171
                      | <PRESERVE> rank => -172
                      | <PRIOR> rank => -173
                      | <PRIVILEGES> rank => -174
                      | <PUBLIC> rank => -175
                      | <RANK> rank => -176
                      | <READ> rank => -177
                      | <RELATIVE> rank => -178
                      | <REPEATABLE> rank => -179
                      | <RESTART> rank => -180
                      | <Lex228> rank => -181
                      | <Lex229> rank => -182
                      | <Lex230> rank => -183
                      | <Lex231> rank => -184
                      | <ROLE> rank => -185
                      | <ROUTINE> rank => -186
                      | <Lex234> rank => -187
                      | <Lex235> rank => -188
                      | <Lex236> rank => -189
                      | <Lex237> rank => -190
                      | <Lex238> rank => -191
                      | <SCALE> rank => -192
                      | <SCHEMA> rank => -193
                      | <Lex241> rank => -194
                      | <Lex242> rank => -195
                      | <Lex243> rank => -196
                      | <Lex244> rank => -197
                      | <SECTION> rank => -198
                      | <SECURITY> rank => -199
                      | <SELF> rank => -200
                      | <SEQUENCE> rank => -201
                      | <SERIALIZABLE> rank => -202
                      | <Lex250> rank => -203
                      | <SESSION> rank => -204
                      | <SETS> rank => -205
                      | <SIMPLE> rank => -206
                      | <SIZE> rank => -207
                      | <SOURCE> rank => -208
                      | <SPACE> rank => -209
                      | <Lex257> rank => -210
                      | <SQRT> rank => -211
                      | <STATE> rank => -212
                      | <STATEMENT> rank => -213
                      | <Lex261> rank => -214
                      | <Lex262> rank => -215
                      | <STRUCTURE> rank => -216
                      | <STYLE> rank => -217
                      | <Lex265> rank => -218
                      | <SUBSTRING> rank => -219
                      | <SUM> rank => -220
                      | <TABLESAMPLE> rank => -221
                      | <Lex269> rank => -222
                      | <TEMPORARY> rank => -223
                      | <TIES> rank => -224
                      | <Lex272> rank => -225
                      | <TRANSACTION> rank => -226
                      | <Lex274> rank => -227
                      | <Lex275> rank => -228
                      | <Lex276> rank => -229
                      | <TRANSFORM> rank => -230
                      | <TRANSFORMS> rank => -231
                      | <TRANSLATE> rank => -232
                      | <Lex280> rank => -233
                      | <Lex281> rank => -234
                      | <Lex282> rank => -235
                      | <TRIM> rank => -236
                      | <TYPE> rank => -237
                      | <UNBOUNDED> rank => -238
                      | <UNCOMMITTED> rank => -239
                      | <UNDER> rank => -240
                      | <UNNAMED> rank => -241
                      | <USAGE> rank => -242
                      | <Lex290> rank => -243
                      | <Lex291> rank => -244
                      | <Lex292> rank => -245
                      | <Lex293> rank => -246
                      | <VIEW> rank => -247
                      | <WORK> rank => -248
                      | <WRITE> rank => -249
                      | <ZONE> rank => -250
<Reserved_Word> ::= <ADD> rank => 0
                  | <ALL> rank => -1
                  | <ALLOCATE> rank => -2
                  | <ALTER> rank => -3
                  | <AND> rank => -4
                  | <ANY> rank => -5
                  | <ARE> rank => -6
                  | <ARRAY> rank => -7
                  | <AS> rank => -8
                  | <ASENSITIVE> rank => -9
                  | <ASYMMETRIC> rank => -10
                  | <AT> rank => -11
                  | <ATOMIC> rank => -12
                  | <AUTHORIZATION> rank => -13
                  | <BEGIN> rank => -14
                  | <BETWEEN> rank => -15
                  | <BIGINT> rank => -16
                  | <BINARY> rank => -17
                  | <BLOB> rank => -18
                  | <BOOLEAN> rank => -19
                  | <BOTH> rank => -20
                  | <BY> rank => -21
                  | <CALL> rank => -22
                  | <CALLED> rank => -23
                  | <CASCADED> rank => -24
                  | <CASE> rank => -25
                  | <CAST> rank => -26
                  | <CHAR> rank => -27
                  | <CHARACTER> rank => -28
                  | <CHECK> rank => -29
                  | <CLOB> rank => -30
                  | <CLOSE> rank => -31
                  | <COLLATE> rank => -32
                  | <COLUMN> rank => -33
                  | <COMMIT> rank => -34
                  | <CONNECT> rank => -35
                  | <CONSTRAINT> rank => -36
                  | <CONTINUE> rank => -37
                  | <CORRESPONDING> rank => -38
                  | <CREATE> rank => -39
                  | <CROSS> rank => -40
                  | <CUBE> rank => -41
                  | <CURRENT> rank => -42
                  | <Lex341> rank => -43
                  | <Lex342> rank => -44
                  | <Lex343> rank => -45
                  | <Lex344> rank => -46
                  | <Lex345> rank => -47
                  | <Lex346> rank => -48
                  | <Lex347> rank => -49
                  | <Lex348> rank => -50
                  | <CURSOR> rank => -51
                  | <CYCLE> rank => -52
                  | <DATE> rank => -53
                  | <DAY> rank => -54
                  | <DEALLOCATE> rank => -55
                  | <DEC> rank => -56
                  | <DECIMAL> rank => -57
                  | <DECLARE> rank => -58
                  | <DEFAULT> rank => -59
                  | <DELETE> rank => -60
                  | <DEREF> rank => -61
                  | <DESCRIBE> rank => -62
                  | <DETERMINISTIC> rank => -63
                  | <DISCONNECT> rank => -64
                  | <DISTINCT> rank => -65
                  | <DOUBLE> rank => -66
                  | <DROP> rank => -67
                  | <DYNAMIC> rank => -68
                  | <EACH> rank => -69
                  | <ELEMENT> rank => -70
                  | <ELSE> rank => -71
                  | <END> rank => -72
                  | <Lex371> rank => -73
                  | <ESCAPE> rank => -74
                  | <EXCEPT> rank => -75
                  | <EXEC> rank => -76
                  | <EXECUTE> rank => -77
                  | <EXISTS> rank => -78
                  | <EXTERNAL> rank => -79
                  | <FALSE> rank => -80
                  | <FETCH> rank => -81
                  | <FILTER> rank => -82
                  | <FLOAT> rank => -83
                  | <FOR> rank => -84
                  | <FOREIGN> rank => -85
                  | <FREE> rank => -86
                  | <FROM> rank => -87
                  | <FULL> rank => -88
                  | <FUNCTION> rank => -89
                  | <GET> rank => -90
                  | <GLOBAL> rank => -91
                  | <GRANT> rank => -92
                  | <GROUP> rank => -93
                  | <GROUPING> rank => -94
                  | <HAVING> rank => -95
                  | <HOLD> rank => -96
                  | <HOUR> rank => -97
                  | <IDENTITY> rank => -98
                  | <IMMEDIATE> rank => -99
                  | <IN> rank => -100
                  | <INDICATOR> rank => -101
                  | <INNER> rank => -102
                  | <INOUT> rank => -103
                  | <INPUT> rank => -104
                  | <INSENSITIVE> rank => -105
                  | <INSERT> rank => -106
                  | <INT> rank => -107
                  | <INTEGER> rank => -108
                  | <INTERSECT> rank => -109
                  | <INTERVAL> rank => -110
                  | <INTO> rank => -111
                  | <IS> rank => -112
                  | <ISOLATION> rank => -113
                  | <JOIN> rank => -114
                  | <LANGUAGE> rank => -115
                  | <LARGE> rank => -116
                  | <LATERAL> rank => -117
                  | <LEADING> rank => -118
                  | <LEFT> rank => -119
                  | <LIKE> rank => -120
                  | <LOCAL> rank => -121
                  | <LOCALTIME> rank => -122
                  | <LOCALTIMESTAMP> rank => -123
                  | <MATCH> rank => -124
                  | <MEMBER> rank => -125
                  | <MERGE> rank => -126
                  | <METHOD> rank => -127
                  | <MINUTE> rank => -128
                  | <MODIFIES> rank => -129
                  | <MODULE> rank => -130
                  | <MONTH> rank => -131
                  | <MULTISET> rank => -132
                  | <NATIONAL> rank => -133
                  | <NATURAL> rank => -134
                  | <NCHAR> rank => -135
                  | <NCLOB> rank => -136
                  | <NEW> rank => -137
                  | <NO> rank => -138
                  | <NONE> rank => -139
                  | <NOT> rank => -140
                  | <NULL> rank => -141
                  | <NUMERIC> rank => -142
                  | <OF> rank => -143
                  | <OLD> rank => -144
                  | <ON> rank => -145
                  | <ONLY> rank => -146
                  | <OPEN> rank => -147
                  | <OR> rank => -148
                  | <ORDER> rank => -149
                  | <OUT> rank => -150
                  | <OUTER> rank => -151
                  | <OUTPUT> rank => -152
                  | <OVER> rank => -153
                  | <OVERLAPS> rank => -154
                  | <PARAMETER> rank => -155
                  | <PARTITION> rank => -156
                  | <PRECISION> rank => -157
                  | <PREPARE> rank => -158
                  | <PRIMARY> rank => -159
                  | <PROCEDURE> rank => -160
                  | <RANGE> rank => -161
                  | <READS> rank => -162
                  | <REAL> rank => -163
                  | <RECURSIVE> rank => -164
                  | <REF> rank => -165
                  | <REFERENCES> rank => -166
                  | <REFERENCING> rank => -167
                  | <Lex465> rank => -168
                  | <Lex466> rank => -169
                  | <Lex467> rank => -170
                  | <Lex468> rank => -171
                  | <Lex469> rank => -172
                  | <Lex470> rank => -173
                  | <Lex471> rank => -174
                  | <Lex472> rank => -175
                  | <Lex473> rank => -176
                  | <RELEASE> rank => -177
                  | <RESULT> rank => -178
                  | <RETURN> rank => -179
                  | <RETURNS> rank => -180
                  | <REVOKE> rank => -181
                  | <RIGHT> rank => -182
                  | <ROLLBACK> rank => -183
                  | <ROLLUP> rank => -184
                  | <ROW> rank => -185
                  | <ROWS> rank => -186
                  | <SAVEPOINT> rank => -187
                  | <SCROLL> rank => -188
                  | <SEARCH> rank => -189
                  | <SECOND> rank => -190
                  | <SELECT> rank => -191
                  | <SENSITIVE> rank => -192
                  | <Lex490> rank => -193
                  | <SET> rank => -194
                  | <SIMILAR> rank => -195
                  | <SMALLINT> rank => -196
                  | <SOME> rank => -197
                  | <SPECIFIC> rank => -198
                  | <SPECIFICTYPE> rank => -199
                  | <SQL> rank => -200
                  | <SQLEXCEPTION> rank => -201
                  | <SQLSTATE> rank => -202
                  | <SQLWARNING> rank => -203
                  | <START> rank => -204
                  | <STATIC> rank => -205
                  | <SUBMULTISET> rank => -206
                  | <SYMMETRIC> rank => -207
                  | <SYSTEM> rank => -208
                  | <Lex506> rank => -209
                  | <TABLE> rank => -210
                  | <THEN> rank => -211
                  | <TIME> rank => -212
                  | <TIMESTAMP> rank => -213
                  | <Lex511> rank => -214
                  | <Lex512> rank => -215
                  | <TO> rank => -216
                  | <TRAILING> rank => -217
                  | <TRANSLATION> rank => -218
                  | <TREAT> rank => -219
                  | <TRIGGER> rank => -220
                  | <TRUE> rank => -221
                  | <UESCAPE> rank => -222
                  | <UNION> rank => -223
                  | <UNIQUE> rank => -224
                  | <UNKNOWN> rank => -225
                  | <UNNEST> rank => -226
                  | <UPDATE> rank => -227
                  | <UPPER> rank => -228
                  | <USER> rank => -229
                  | <USING> rank => -230
                  | <VALUE> rank => -231
                  | <VALUES> rank => -232
                  | <Lex530> rank => -233
                  | <Lex531> rank => -234
                  | <VARCHAR> rank => -235
                  | <VARYING> rank => -236
                  | <WHEN> rank => -237
                  | <WHENEVER> rank => -238
                  | <WHERE> rank => -239
                  | <Lex537> rank => -240
                  | <WINDOW> rank => -241
                  | <WITH> rank => -242
                  | <WITHIN> rank => -243
                  | <WITHOUT> rank => -244
                  | <YEAR> rank => -245
<Literal> ::= <Signed_Numeric_Literal> rank => 0
            | <General_Literal> rank => -1
<Unsigned_Literal> ::= <Unsigned_Numeric_Literal> rank => 0
                     | <General_Literal> rank => -1
<General_Literal> ::= <Character_String_Literal> rank => 0
                    | <National_Character_String_Literal> rank => -1
                    | <Unicode_Character_String_Literal> rank => -2
                    | <Binary_String_Literal> rank => -3
                    | <Datetime_Literal> rank => -4
                    | <Interval_Literal> rank => -5
                    | <Boolean_Literal> rank => -6
<Gen674> ::= <Introducer> <Character_Set_Specification> rank => 0
<Gen674_maybe> ::= <Gen674> rank => 0
<Gen674_maybe> ::= rank => -1
<Character_Representation_any> ::= <Character_Representation>* rank => 0
<Gen678> ::= <Separator> <Quote> <Character_Representation_any> <Quote> rank => 0
<Gen678_any> ::= <Gen678>* rank => 0
<Character_String_Literal> ::= <Gen674_maybe> <Quote> <Character_Representation_any> <Quote> <Gen678_any> rank => 0
<Introducer> ::= <Underscore> rank => 0
<Character_Representation> ::= <Nonquote_Character> rank => 0
                             | <Quote_Symbol> rank => -1
<Nonquote_Character> ::= <Lex543> rank => 0
<Quote_Symbol> ::= <Quote> <Quote> rank => 0
<Gen686> ::= <Separator> <Quote> <Character_Representation_any> <Quote> rank => 0
<Gen686_any> ::= <Gen686>* rank => 0
<National_Character_String_Literal> ::= <N> <Quote> <Character_Representation_any> <Quote> <Gen686_any> rank => 0
<Gen689> ::= <Introducer> <Character_Set_Specification> rank => 0
<Gen689_maybe> ::= <Gen689> rank => 0
<Gen689_maybe> ::= rank => -1
<Unicode_Representation_any> ::= <Unicode_Representation>* rank => 0
<Gen693> ::= <Separator> <Quote> <Unicode_Representation_any> <Quote> rank => 0
<Gen693_any> ::= <Gen693>* rank => 0
<Gen695> ::= <ESCAPE> <Escape_Character> rank => 0
<Gen695_maybe> ::= <Gen695> rank => 0
<Gen695_maybe> ::= rank => -1
<Unicode_Character_String_Literal> ::= <Gen689_maybe> <U> <Ampersand> <Quote> <Unicode_Representation_any> <Quote> <Gen693_any> <Gen695_maybe> rank => 0
<Unicode_Representation> ::= <Character_Representation> rank => 0
                           | <Unicode_Escape_Value> rank => -1
<Gen701> ::= <Hexit> <Hexit> rank => 0
<Gen701_any> ::= <Gen701>* rank => 0
<Gen703> ::= <Hexit> <Hexit> rank => 0
<Gen703_any> ::= <Gen703>* rank => 0
<Gen705> ::= <Separator> <Quote> <Gen703_any> <Quote> rank => 0
<Gen705_any> ::= <Gen705>* rank => 0
<Gen707> ::= <ESCAPE> <Escape_Character> rank => 0
<Gen707_maybe> ::= <Gen707> rank => 0
<Gen707_maybe> ::= rank => -1
<Binary_String_Literal> ::= <X> <Quote> <Gen701_any> <Quote> <Gen705_any> <Gen707_maybe> rank => 0
<Hexit> ::= <Digit> rank => 0
          | <A> rank => -1
          | <B> rank => -2
          | <C> rank => -3
          | <D> rank => -4
          | <E> rank => -5
          | <F> rank => -6
          | <a> rank => -7
          | <b> rank => -8
          | <c> rank => -9
          | <d> rank => -10
          | <e> rank => -11
          | <f> rank => -12
<Sign_maybe> ::= <Sign> rank => 0
<Sign_maybe> ::= rank => -1
<Signed_Numeric_Literal> ::= <Sign_maybe> <Unsigned_Numeric_Literal> rank => 0
<Unsigned_Numeric_Literal> ::= <Exact_Numeric_Literal> rank => 0
                             | <Approximate_Numeric_Literal> rank => -1
<Unsigned_Integer> ::= <Lex557_many> rank => 0
<Unsigned_Integer_maybe> ::= <Unsigned_Integer> rank => 0
<Unsigned_Integer_maybe> ::= rank => -1
<Gen732> ::= <Period> <Unsigned_Integer_maybe> rank => 0
<Gen732_maybe> ::= <Gen732> rank => 0
<Gen732_maybe> ::= rank => -1
<Exact_Numeric_Literal> ::= <Unsigned_Integer> <Gen732_maybe> rank => 0
                          | <Period> <Unsigned_Integer> rank => -1
<Sign> ::= <Plus_Sign> rank => 0
         | <Minus_Sign> rank => -1
<Approximate_Numeric_Literal> ::= <Mantissa> <E> <Exponent> rank => 0
<Mantissa> ::= <Exact_Numeric_Literal> rank => 0
<Exponent> ::= <Signed_Integer> rank => 0
<Signed_Integer> ::= <Sign_maybe> <Unsigned_Integer> rank => 0
<Datetime_Literal> ::= <Date_Literal> rank => 0
                     | <Time_Literal> rank => -1
                     | <Timestamp_Literal> rank => -2
<Date_Literal> ::= <DATE> <Date_String> rank => 0
<Time_Literal> ::= <TIME> <Time_String> rank => 0
<Timestamp_Literal> ::= <TIMESTAMP> <Timestamp_String> rank => 0
<Date_String> ::= <Quote> <Unquoted_Date_String> <Quote> rank => 0
<Time_String> ::= <Quote> <Unquoted_Time_String> <Quote> rank => 0
<Timestamp_String> ::= <Quote> <Unquoted_Timestamp_String> <Quote> rank => 0
<Time_Zone_Interval> ::= <Sign> <Hours_Value> <Colon> <Minutes_Value> rank => 0
<Date_Value> ::= <Years_Value> <Minus_Sign> <Months_Value> <Minus_Sign> <Days_Value> rank => 0
<Time_Value> ::= <Hours_Value> <Colon> <Minutes_Value> <Colon> <Seconds_Value> rank => 0
<Interval_Literal> ::= <INTERVAL> <Sign_maybe> <Interval_String> <Interval_Qualifier> rank => 0
<Interval_String> ::= <Quote> <Unquoted_Interval_String> <Quote> rank => 0
<Unquoted_Date_String> ::= <Date_Value> rank => 0
<Time_Zone_Interval_maybe> ::= <Time_Zone_Interval> rank => 0
<Time_Zone_Interval_maybe> ::= rank => -1
<Unquoted_Time_String> ::= <Time_Value> <Time_Zone_Interval_maybe> rank => 0
<Unquoted_Timestamp_String> ::= <Unquoted_Date_String> <Space> <Unquoted_Time_String> rank => 0
<Gen762> ::= <Year_Month_Literal> rank => 0
           | <Day_Time_Literal> rank => -1
<Unquoted_Interval_String> ::= <Sign_maybe> <Gen762> rank => 0
<Gen765> ::= <Years_Value> <Minus_Sign> rank => 0
<Gen765_maybe> ::= <Gen765> rank => 0
<Gen765_maybe> ::= rank => -1
<Year_Month_Literal> ::= <Years_Value> rank => 0
                       | <Gen765_maybe> <Months_Value> rank => -1
<Day_Time_Literal> ::= <Day_Time_Interval> rank => 0
                     | <Time_Interval> rank => -1
<Gen772> ::= <Colon> <Seconds_Value> rank => 0
<Gen772_maybe> ::= <Gen772> rank => 0
<Gen772_maybe> ::= rank => -1
<Gen775> ::= <Colon> <Minutes_Value> <Gen772_maybe> rank => 0
<Gen775_maybe> ::= <Gen775> rank => 0
<Gen775_maybe> ::= rank => -1
<Gen778> ::= <Space> <Hours_Value> <Gen775_maybe> rank => 0
<Gen778_maybe> ::= <Gen778> rank => 0
<Gen778_maybe> ::= rank => -1
<Day_Time_Interval> ::= <Days_Value> <Gen778_maybe> rank => 0
<Gen782> ::= <Colon> <Seconds_Value> rank => 0
<Gen782_maybe> ::= <Gen782> rank => 0
<Gen782_maybe> ::= rank => -1
<Gen785> ::= <Colon> <Minutes_Value> <Gen782_maybe> rank => 0
<Gen785_maybe> ::= <Gen785> rank => 0
<Gen785_maybe> ::= rank => -1
<Gen788> ::= <Colon> <Seconds_Value> rank => 0
<Gen788_maybe> ::= <Gen788> rank => 0
<Gen788_maybe> ::= rank => -1
<Time_Interval> ::= <Hours_Value> <Gen785_maybe> rank => 0
                  | <Minutes_Value> <Gen788_maybe> rank => -1
                  | <Seconds_Value> rank => -2
<Years_Value> ::= <Datetime_Value> rank => 0
<Months_Value> ::= <Datetime_Value> rank => 0
<Days_Value> ::= <Datetime_Value> rank => 0
<Hours_Value> ::= <Datetime_Value> rank => 0
<Minutes_Value> ::= <Datetime_Value> rank => 0
<Seconds_Fraction_maybe> ::= <Seconds_Fraction> rank => 0
<Seconds_Fraction_maybe> ::= rank => -1
<Gen801> ::= <Period> <Seconds_Fraction_maybe> rank => 0
<Gen801_maybe> ::= <Gen801> rank => 0
<Gen801_maybe> ::= rank => -1
<Seconds_Value> ::= <Seconds_Integer_Value> <Gen801_maybe> rank => 0
<Seconds_Integer_Value> ::= <Unsigned_Integer> rank => 0
<Seconds_Fraction> ::= <Unsigned_Integer> rank => 0
<Datetime_Value> ::= <Unsigned_Integer> rank => 0
<Boolean_Literal> ::= <TRUE> rank => 0
                    | <FALSE> rank => -1
                    | <UNKNOWN> rank => -2
<Identifier> ::= <Actual_Identifier> rank => 0
<Actual_Identifier> ::= <Regular_Identifier> rank => 0
                      | <Delimited_Identifier> rank => -1
<GenLex814> ~ <Lex559>
<GenLex814_any> ~ <GenLex814>*
<SQL_Language_Identifier> ~ <Lex558> <GenLex814_any>
<Authorization_Identifier> ::= <Role_Name> rank => 0
                             | <User_Identifier> rank => -1
<Table_Name> ::= <Local_Or_Schema_Qualified_Name> rank => 0
<Domain_Name> ::= <Schema_Qualified_Name> rank => 0
<Unqualified_Schema_Name> ::= <Identifier> rank => 0
<Gen822> ::= <Catalog_Name> <Period> rank => 0
<Gen822_maybe> ::= <Gen822> rank => 0
<Gen822_maybe> ::= rank => -1
<Schema_Name> ::= <Gen822_maybe> <Unqualified_Schema_Name> rank => 0
<Catalog_Name> ::= <Identifier> rank => 0
<Gen827> ::= <Schema_Name> <Period> rank => 0
<Gen827_maybe> ::= <Gen827> rank => 0
<Gen827_maybe> ::= rank => -1
<Schema_Qualified_Name> ::= <Gen827_maybe> <Qualified_Identifier> rank => 0
<Gen831> ::= <Local_Or_Schema_Qualifier> <Period> rank => 0
<Gen831_maybe> ::= <Gen831> rank => 0
<Gen831_maybe> ::= rank => -1
<Local_Or_Schema_Qualified_Name> ::= <Gen831_maybe> <Qualified_Identifier> rank => 0
<Local_Or_Schema_Qualifier> ::= <Schema_Name> rank => 0
                              | <MODULE> rank => -1
<Qualified_Identifier> ::= <Identifier> rank => 0
<Column_Name> ::= <Identifier> rank => 0
<Correlation_Name> ::= <Identifier> rank => 0
<Query_Name> ::= <Identifier> rank => 0
<SQL_Client_Module_Name> ::= <Identifier> rank => 0
<Procedure_Name> ::= <Identifier> rank => 0
<Schema_Qualified_Routine_Name> ::= <Schema_Qualified_Name> rank => 0
<Method_Name> ::= <Identifier> rank => 0
<Specific_Name> ::= <Schema_Qualified_Name> rank => 0
<Cursor_Name> ::= <Local_Qualified_Name> rank => 0
<Gen847> ::= <Local_Qualifier> <Period> rank => 0
<Gen847_maybe> ::= <Gen847> rank => 0
<Gen847_maybe> ::= rank => -1
<Local_Qualified_Name> ::= <Gen847_maybe> <Qualified_Identifier> rank => 0
<Local_Qualifier> ::= <MODULE> rank => 0
<Host_Parameter_Name> ::= <Colon> <Identifier> rank => 0
<SQL_Parameter_Name> ::= <Identifier> rank => 0
<Constraint_Name> ::= <Schema_Qualified_Name> rank => 0
<External_Routine_Name> ::= <Identifier> rank => 0
                          | <Character_String_Literal> rank => -1
<Trigger_Name> ::= <Schema_Qualified_Name> rank => 0
<Collation_Name> ::= <Schema_Qualified_Name> rank => 0
<Gen859> ::= <Schema_Name> <Period> rank => 0
<Gen859_maybe> ::= <Gen859> rank => 0
<Gen859_maybe> ::= rank => -1
<Character_Set_Name> ::= <Gen859_maybe> <SQL_Language_Identifier> rank => 0
<Transliteration_Name> ::= <Schema_Qualified_Name> rank => 0
<Transcoding_Name> ::= <Schema_Qualified_Name> rank => 0
<User_Defined_Type_Name> ::= <Schema_Qualified_Type_Name> rank => 0
<Schema_Resolved_User_Defined_Type_Name> ::= <User_Defined_Type_Name> rank => 0
<Gen867> ::= <Schema_Name> <Period> rank => 0
<Gen867_maybe> ::= <Gen867> rank => 0
<Gen867_maybe> ::= rank => -1
<Schema_Qualified_Type_Name> ::= <Gen867_maybe> <Qualified_Identifier> rank => 0
<Attribute_Name> ::= <Identifier> rank => 0
<Field_Name> ::= <Identifier> rank => 0
<Savepoint_Name> ::= <Identifier> rank => 0
<Sequence_Generator_Name> ::= <Schema_Qualified_Name> rank => 0
<Role_Name> ::= <Identifier> rank => 0
<User_Identifier> ::= <Identifier> rank => 0
<Connection_Name> ::= <Simple_Value_Specification> rank => 0
<Sql_Server_Name> ::= <Simple_Value_Specification> rank => 0
<Connection_User_Name> ::= <Simple_Value_Specification> rank => 0
<SQL_Statement_Name> ::= <Statement_Name> rank => 0
                       | <Extended_Statement_Name> rank => -1
<Statement_Name> ::= <Identifier> rank => 0
<Scope_Option_maybe> ::= <Scope_Option> rank => 0
<Scope_Option_maybe> ::= rank => -1
<Extended_Statement_Name> ::= <Scope_Option_maybe> <Simple_Value_Specification> rank => 0
<Dynamic_Cursor_Name> ::= <Cursor_Name> rank => 0
                        | <Extended_Cursor_Name> rank => -1
<Extended_Cursor_Name> ::= <Scope_Option_maybe> <Simple_Value_Specification> rank => 0
<Descriptor_Name> ::= <Scope_Option_maybe> <Simple_Value_Specification> rank => 0
<Scope_Option> ::= <GLOBAL> rank => 0
                 | <LOCAL> rank => -1
<Window_Name> ::= <Identifier> rank => 0
<Data_Type> ::= <Predefined_Type> rank => 0
              | <Row_Type> rank => -1
              | <Path_Resolved_User_Defined_Type_Name> rank => -2
              | <Reference_Type> rank => -3
              | <Collection_Type> rank => -4
<Gen898> ::= <CHARACTER> <SET> <Character_Set_Specification> rank => 0
<Gen898_maybe> ::= <Gen898> rank => 0
<Gen898_maybe> ::= rank => -1
<Collate_Clause_maybe> ::= <Collate_Clause> rank => 0
<Collate_Clause_maybe> ::= rank => -1
<Predefined_Type> ::= <Character_String_Type> <Gen898_maybe> <Collate_Clause_maybe> rank => 0
                    | <National_Character_String_Type> <Collate_Clause_maybe> rank => -1
                    | <Binary_Large_Object_String_Type> rank => -2
                    | <Numeric_Type> rank => -3
                    | <Boolean_Type> rank => -4
                    | <Datetime_Type> rank => -5
                    | <Interval_Type> rank => -6
<Gen910> ::= <Left_Paren> <Length> <Right_Paren> rank => 0
<Gen910_maybe> ::= <Gen910> rank => 0
<Gen910_maybe> ::= rank => -1
<Gen913> ::= <Left_Paren> <Length> <Right_Paren> rank => 0
<Gen913_maybe> ::= <Gen913> rank => 0
<Gen913_maybe> ::= rank => -1
<Gen916> ::= <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Gen916_maybe> ::= <Gen916> rank => 0
<Gen916_maybe> ::= rank => -1
<Gen919> ::= <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Gen919_maybe> ::= <Gen919> rank => 0
<Gen919_maybe> ::= rank => -1
<Gen922> ::= <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Gen922_maybe> ::= <Gen922> rank => 0
<Gen922_maybe> ::= rank => -1
<Character_String_Type> ::= <CHARACTER> <Gen910_maybe> rank => 0
                          | <CHAR> <Gen913_maybe> rank => -1
                          | <CHARACTER> <VARYING> <Left_Paren> <Length> <Right_Paren> rank => -2
                          | <CHAR> <VARYING> <Left_Paren> <Length> <Right_Paren> rank => -3
                          | <VARCHAR> <Left_Paren> <Length> <Right_Paren> rank => -4
                          | <CHARACTER> <LARGE> <OBJECT> <Gen916_maybe> rank => -5
                          | <CHAR> <LARGE> <OBJECT> <Gen919_maybe> rank => -6
                          | <CLOB> <Gen922_maybe> rank => -7
<Gen933> ::= <Left_Paren> <Length> <Right_Paren> rank => 0
<Gen933_maybe> ::= <Gen933> rank => 0
<Gen933_maybe> ::= rank => -1
<Gen936> ::= <Left_Paren> <Length> <Right_Paren> rank => 0
<Gen936_maybe> ::= <Gen936> rank => 0
<Gen936_maybe> ::= rank => -1
<Gen939> ::= <Left_Paren> <Length> <Right_Paren> rank => 0
<Gen939_maybe> ::= <Gen939> rank => 0
<Gen939_maybe> ::= rank => -1
<Gen942> ::= <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Gen942_maybe> ::= <Gen942> rank => 0
<Gen942_maybe> ::= rank => -1
<Gen945> ::= <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Gen945_maybe> ::= <Gen945> rank => 0
<Gen945_maybe> ::= rank => -1
<Gen948> ::= <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Gen948_maybe> ::= <Gen948> rank => 0
<Gen948_maybe> ::= rank => -1
<National_Character_String_Type> ::= <NATIONAL> <CHARACTER> <Gen933_maybe> rank => 0
                                   | <NATIONAL> <CHAR> <Gen936_maybe> rank => -1
                                   | <NCHAR> <Gen939_maybe> rank => -2
                                   | <NATIONAL> <CHARACTER> <VARYING> <Left_Paren> <Length> <Right_Paren> rank => -3
                                   | <NATIONAL> <CHAR> <VARYING> <Left_Paren> <Length> <Right_Paren> rank => -4
                                   | <NCHAR> <VARYING> <Left_Paren> <Length> <Right_Paren> rank => -5
                                   | <NATIONAL> <CHARACTER> <LARGE> <OBJECT> <Gen942_maybe> rank => -6
                                   | <NCHAR> <LARGE> <OBJECT> <Gen945_maybe> rank => -7
                                   | <NCLOB> <Gen948_maybe> rank => -8
<Gen960> ::= <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Gen960_maybe> ::= <Gen960> rank => 0
<Gen960_maybe> ::= rank => -1
<Gen963> ::= <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Gen963_maybe> ::= <Gen963> rank => 0
<Gen963_maybe> ::= rank => -1
<Binary_Large_Object_String_Type> ::= <BINARY> <LARGE> <OBJECT> <Gen960_maybe> rank => 0
                                    | <BLOB> <Gen963_maybe> rank => -1
<Numeric_Type> ::= <Exact_Numeric_Type> rank => 0
                 | <Approximate_Numeric_Type> rank => -1
<Gen970> ::= <Comma> <Scale> rank => 0
<Gen970_maybe> ::= <Gen970> rank => 0
<Gen970_maybe> ::= rank => -1
<Gen973> ::= <Left_Paren> <Precision> <Gen970_maybe> <Right_Paren> rank => 0
<Gen973_maybe> ::= <Gen973> rank => 0
<Gen973_maybe> ::= rank => -1
<Gen976> ::= <Comma> <Scale> rank => 0
<Gen976_maybe> ::= <Gen976> rank => 0
<Gen976_maybe> ::= rank => -1
<Gen979> ::= <Left_Paren> <Precision> <Gen976_maybe> <Right_Paren> rank => 0
<Gen979_maybe> ::= <Gen979> rank => 0
<Gen979_maybe> ::= rank => -1
<Gen982> ::= <Comma> <Scale> rank => 0
<Gen982_maybe> ::= <Gen982> rank => 0
<Gen982_maybe> ::= rank => -1
<Gen985> ::= <Left_Paren> <Precision> <Gen982_maybe> <Right_Paren> rank => 0
<Gen985_maybe> ::= <Gen985> rank => 0
<Gen985_maybe> ::= rank => -1
<Exact_Numeric_Type> ::= <NUMERIC> <Gen973_maybe> rank => 0
                       | <DECIMAL> <Gen979_maybe> rank => -1
                       | <DEC> <Gen985_maybe> rank => -2
                       | <SMALLINT> rank => -3
                       | <INTEGER> rank => -4
                       | <INT> rank => -5
                       | <BIGINT> rank => -6
<Gen995> ::= <Left_Paren> <Precision> <Right_Paren> rank => 0
<Gen995_maybe> ::= <Gen995> rank => 0
<Gen995_maybe> ::= rank => -1
<Approximate_Numeric_Type> ::= <FLOAT> <Gen995_maybe> rank => 0
                             | <REAL> rank => -1
                             | <DOUBLE> <PRECISION> rank => -2
<Length> ::= <Unsigned_Integer> rank => 0
<Multiplier_maybe> ::= <Multiplier> rank => 0
<Multiplier_maybe> ::= rank => -1
<Char_Length_Units_maybe> ::= <Char_Length_Units> rank => 0
<Char_Length_Units_maybe> ::= rank => -1
<Large_Object_Length> ::= <Unsigned_Integer> <Multiplier_maybe> <Char_Length_Units_maybe> rank => 0
                        | <Large_Object_Length_Token> <Char_Length_Units_maybe> rank => -1
<Char_Length_Units> ::= <CHARACTERS> rank => 0
                      | <Lex086> rank => -1
                      | <OCTETS> rank => -2
<Precision> ::= <Unsigned_Integer> rank => 0
<Scale> ::= <Unsigned_Integer> rank => 0
<Boolean_Type> ::= <BOOLEAN> rank => 0
<Gen1014> ::= <Left_Paren> <Time_Precision> <Right_Paren> rank => 0
<Gen1014_maybe> ::= <Gen1014> rank => 0
<Gen1014_maybe> ::= rank => -1
<Gen1017> ::= <With_Or_Without_Time_Zone> rank => 0
<Gen1017_maybe> ::= <Gen1017> rank => 0
<Gen1017_maybe> ::= rank => -1
<Gen1020> ::= <Left_Paren> <Timestamp_Precision> <Right_Paren> rank => 0
<Gen1020_maybe> ::= <Gen1020> rank => 0
<Gen1020_maybe> ::= rank => -1
<Gen1023> ::= <With_Or_Without_Time_Zone> rank => 0
<Gen1023_maybe> ::= <Gen1023> rank => 0
<Gen1023_maybe> ::= rank => -1
<Datetime_Type> ::= <DATE> rank => 0
                  | <TIME> <Gen1014_maybe> <Gen1017_maybe> rank => -1
                  | <TIMESTAMP> <Gen1020_maybe> <Gen1023_maybe> rank => -2
<With_Or_Without_Time_Zone> ::= <WITH> <TIME> <ZONE> rank => 0
                              | <WITHOUT> <TIME> <ZONE> rank => -1
<Time_Precision> ::= <Time_Fractional_Seconds_Precision> rank => 0
<Timestamp_Precision> ::= <Time_Fractional_Seconds_Precision> rank => 0
<Time_Fractional_Seconds_Precision> ::= <Unsigned_Integer> rank => 0
<Interval_Type> ::= <INTERVAL> <Interval_Qualifier> rank => 0
<Row_Type> ::= <ROW> <Row_Type_Body> rank => 0
<Gen1036> ::= <Comma> <Field_Definition> rank => 0
<Gen1036_any> ::= <Gen1036>* rank => 0
<Row_Type_Body> ::= <Left_Paren> <Field_Definition> <Gen1036_any> <Right_Paren> rank => 0
<Scope_Clause_maybe> ::= <Scope_Clause> rank => 0
<Scope_Clause_maybe> ::= rank => -1
<Reference_Type> ::= <REF> <Left_Paren> <Referenced_Type> <Right_Paren> <Scope_Clause_maybe> rank => 0
<Scope_Clause> ::= <SCOPE> <Table_Name> rank => 0
<Referenced_Type> ::= <Path_Resolved_User_Defined_Type_Name> rank => 0
<Path_Resolved_User_Defined_Type_Name> ::= <User_Defined_Type_Name> rank => 0
<Collection_Type> ::= <Array_Type> rank => 0
                    | <Multiset_Type> rank => -1
<Gen1047> ::= <Left_Bracket_Or_Trigraph> <Unsigned_Integer> <Right_Bracket_Or_Trigraph> rank => 0
<Gen1047_maybe> ::= <Gen1047> rank => 0
<Gen1047_maybe> ::= rank => -1
<Array_Type> ::= <Data_Type> <ARRAY> <Gen1047_maybe> rank => 0
<Multiset_Type> ::= <Data_Type> <MULTISET> rank => 0
<Reference_Scope_Check_maybe> ::= <Reference_Scope_Check> rank => 0
<Reference_Scope_Check_maybe> ::= rank => -1
<Field_Definition> ::= <Field_Name> <Data_Type> <Reference_Scope_Check_maybe> rank => 0
<Value_Expression_Primary> ::= <Parenthesized_Value_Expression> rank => 0
                             | <Nonparenthesized_Value_Expression_Primary> rank => -1
<Parenthesized_Value_Expression> ::= <Left_Paren> <Value_Expression> <Right_Paren> rank => 0
<Nonparenthesized_Value_Expression_Primary> ::= <Unsigned_Value_Specification> rank => 0
                                              | <Column_Reference> rank => -1
                                              | <Set_Function_Specification> rank => -2
                                              | <Window_Function> rank => -3
                                              | <Scalar_Subquery> rank => -4
                                              | <Case_Expression> rank => -5
                                              | <Cast_Specification> rank => -6
                                              | <Field_Reference> rank => -7
                                              | <Subtype_Treatment> rank => -8
                                              | <Method_Invocation> rank => -9
                                              | <Static_Method_Invocation> rank => -10
                                              | <New_Specification> rank => -11
                                              | <Attribute_Or_Method_Reference> rank => -12
                                              | <Reference_Resolution> rank => -13
                                              | <Collection_Value_Constructor> rank => -14
                                              | <Array_Element_Reference> rank => -15
                                              | <Multiset_Element_Reference> rank => -16
                                              | <Routine_Invocation> rank => -17
                                              | <Next_Value_Expression> rank => -18
<Value_Specification> ::= <Literal> rank => 0
                        | <General_Value_Specification> rank => -1
<Unsigned_Value_Specification> ::= <Unsigned_Literal> rank => 0
                                 | <General_Value_Specification> rank => -1
<General_Value_Specification> ::= <Host_Parameter_Specification> rank => 0
                                | <SQL_Parameter_Reference> rank => -1
                                | <Dynamic_Parameter_Specification> rank => -2
                                | <Embedded_Variable_Specification> rank => -3
                                | <Current_Collation_Specification> rank => -4
                                | <Lex342> rank => -5
                                | <Lex343> rank => -6
                                | <Lex344> rank => -7
                                | <Lex347> <Path_Resolved_User_Defined_Type_Name> rank => -8
                                | <Lex348> rank => -9
                                | <Lex490> rank => -10
                                | <Lex506> rank => -11
                                | <USER> rank => -12
                                | <VALUE> rank => -13
<Simple_Value_Specification> ::= <Literal> rank => 0
                               | <Host_Parameter_Name> rank => -1
                               | <SQL_Parameter_Reference> rank => -2
                               | <Embedded_Variable_Name> rank => -3
<Target_Specification> ::= <Host_Parameter_Specification> rank => 0
                         | <SQL_Parameter_Reference> rank => -1
                         | <Column_Reference> rank => -2
                         | <Target_Array_Element_Specification> rank => -3
                         | <Dynamic_Parameter_Specification> rank => -4
                         | <Embedded_Variable_Specification> rank => -5
<Simple_Target_Specification> ::= <Host_Parameter_Specification> rank => 0
                                | <SQL_Parameter_Reference> rank => -1
                                | <Column_Reference> rank => -2
                                | <Embedded_Variable_Name> rank => -3
<Indicator_Parameter_maybe> ::= <Indicator_Parameter> rank => 0
<Indicator_Parameter_maybe> ::= rank => -1
<Host_Parameter_Specification> ::= <Host_Parameter_Name> <Indicator_Parameter_maybe> rank => 0
<Dynamic_Parameter_Specification> ::= <Question_Mark> rank => 0
<Indicator_Variable_maybe> ::= <Indicator_Variable> rank => 0
<Indicator_Variable_maybe> ::= rank => -1
<Embedded_Variable_Specification> ::= <Embedded_Variable_Name> <Indicator_Variable_maybe> rank => 0
<INDICATOR_maybe> ::= <INDICATOR> rank => 0
<INDICATOR_maybe> ::= rank => -1
<Indicator_Variable> ::= <INDICATOR_maybe> <Embedded_Variable_Name> rank => 0
<Indicator_Parameter> ::= <INDICATOR_maybe> <Host_Parameter_Name> rank => 0
<Target_Array_Element_Specification> ::= <Target_Array_Reference> <Left_Bracket_Or_Trigraph> <Simple_Value_Specification> <Right_Bracket_Or_Trigraph> rank => 0
<Target_Array_Reference> ::= <SQL_Parameter_Reference> rank => 0
                           | <Column_Reference> rank => -1
<Current_Collation_Specification> ::= <Lex111> <Left_Paren> <String_Value_Expression> <Right_Paren> rank => 0
<Contextually_Typed_Value_Specification> ::= <Implicitly_Typed_Value_Specification> rank => 0
                                           | <Default_Specification> rank => -1
<Implicitly_Typed_Value_Specification> ::= <Null_Specification> rank => 0
                                         | <Empty_Specification> rank => -1
<Null_Specification> ::= <NULL> rank => 0
<Empty_Specification> ::= <ARRAY> <Left_Bracket_Or_Trigraph> <Right_Bracket_Or_Trigraph> rank => 0
                        | <MULTISET> <Left_Bracket_Or_Trigraph> <Right_Bracket_Or_Trigraph> rank => -1
<Default_Specification> ::= <DEFAULT> rank => 0
<Gen1132> ::= <Period> <Identifier> rank => 0
<Gen1132_any> ::= <Gen1132>* rank => 0
<Identifier_Chain> ::= <Identifier> <Gen1132_any> rank => 0
<Basic_Identifier_Chain> ::= <Identifier_Chain> rank => 0
<Column_Reference> ::= <Basic_Identifier_Chain> rank => 0
                     | <MODULE> <Period> <Qualified_Identifier> <Period> <Column_Name> rank => -1
<SQL_Parameter_Reference> ::= <Basic_Identifier_Chain> rank => 0
<Set_Function_Specification> ::= <Aggregate_Function> rank => 0
                               | <Grouping_Operation> rank => -1
<Gen1141> ::= <Comma> <Column_Reference> rank => 0
<Gen1141_any> ::= <Gen1141>* rank => 0
<Grouping_Operation> ::= <GROUPING> <Left_Paren> <Column_Reference> <Gen1141_any> <Right_Paren> rank => 0
<Window_Function> ::= <Window_Function_Type> <OVER> <Window_Name_Or_Specification> rank => 0
<Window_Function_Type> ::= <Rank_Function_Type> <Left_Paren> <Right_Paren> rank => 0
                         | <Lex238> <Left_Paren> <Right_Paren> rank => -1
                         | <Aggregate_Function> rank => -2
<Rank_Function_Type> ::= <RANK> rank => 0
                       | <Lex122> rank => -1
                       | <Lex213> rank => -2
                       | <Lex110> rank => -3
<Window_Name_Or_Specification> ::= <Window_Name> rank => 0
                                 | <In_Line_Window_Specification> rank => -1
<In_Line_Window_Specification> ::= <Window_Specification> rank => 0
<Case_Expression> ::= <Case_Abbreviation> rank => 0
                    | <Case_Specification> rank => -1
<Gen1157> ::= <Comma> <Value_Expression> rank => 0
<Gen1157_many> ::= <Gen1157>+ rank => 0
<Case_Abbreviation> ::= <NULLIF> <Left_Paren> <Value_Expression> <Comma> <Value_Expression> <Right_Paren> rank => 0
                      | <COALESCE> <Left_Paren> <Value_Expression> <Gen1157_many> <Right_Paren> rank => -1
<Case_Specification> ::= <Simple_Case> rank => 0
                       | <Searched_Case> rank => -1
<Simple_When_Clause_many> ::= <Simple_When_Clause>+ rank => 0
<Else_Clause_maybe> ::= <Else_Clause> rank => 0
<Else_Clause_maybe> ::= rank => -1
<Simple_Case> ::= <CASE> <Case_Operand> <Simple_When_Clause_many> <Else_Clause_maybe> <END> rank => 0
<Searched_When_Clause_many> ::= <Searched_When_Clause>+ rank => 0
<Searched_Case> ::= <CASE> <Searched_When_Clause_many> <Else_Clause_maybe> <END> rank => 0
<Simple_When_Clause> ::= <WHEN> <When_Operand> <THEN> <Result> rank => 0
<Searched_When_Clause> ::= <WHEN> <Search_Condition> <THEN> <Result> rank => 0
<Else_Clause> ::= <ELSE> <Result> rank => 0
<Case_Operand> ::= <Row_Value_Predicand> rank => 0
                 | <Overlaps_Predicate> rank => -1
<When_Operand> ::= <Row_Value_Predicand> rank => 0
                 | <Comparison_Predicate_Part_2> rank => -1
                 | <Between_Predicate_Part_2> rank => -2
                 | <In_Predicate_Part_2> rank => -3
                 | <Character_Like_Predicate_Part_2> rank => -4
                 | <Octet_Like_Predicate_Part_2> rank => -5
                 | <Similar_Predicate_Part_2> rank => -6
                 | <Null_Predicate_Part_2> rank => -7
                 | <Quantified_Comparison_Predicate_Part_2> rank => -8
                 | <Match_Predicate_Part_2> rank => -9
                 | <Overlaps_Predicate_Part_2> rank => -10
                 | <Distinct_Predicate_Part_2> rank => -11
                 | <Member_Predicate_Part_2> rank => -12
                 | <Submultiset_Predicate_Part_2> rank => -13
                 | <Set_Predicate_Part_2> rank => -14
                 | <Type_Predicate_Part_2> rank => -15
<Result> ::= <Result_Expression> rank => 0
           | <NULL> rank => -1
<Result_Expression> ::= <Value_Expression> rank => 0
<Cast_Specification> ::= <CAST> <Left_Paren> <Cast_Operand> <AS> <Cast_Target> <Right_Paren> rank => 0
<Cast_Operand> ::= <Value_Expression> rank => 0
                 | <Implicitly_Typed_Value_Specification> rank => -1
<Cast_Target> ::= <Domain_Name> rank => 0
                | <Data_Type> rank => -1
<Next_Value_Expression> ::= <NEXT> <VALUE> <FOR> <Sequence_Generator_Name> rank => 0
<Field_Reference> ::= <Value_Expression_Primary> <Period> <Field_Name> rank => 0
<Subtype_Treatment> ::= <TREAT> <Left_Paren> <Subtype_Operand> <AS> <Target_Subtype> <Right_Paren> rank => 0
<Subtype_Operand> ::= <Value_Expression> rank => 0
<Target_Subtype> ::= <Path_Resolved_User_Defined_Type_Name> rank => 0
                   | <Reference_Type> rank => -1
<Method_Invocation> ::= <Direct_Invocation> rank => 0
                      | <Generalized_Invocation> rank => -1
<SQL_Argument_List_maybe> ::= <SQL_Argument_List> rank => 0
<SQL_Argument_List_maybe> ::= rank => -1
<Direct_Invocation> ::= <Value_Expression_Primary> <Period> <Method_Name> <SQL_Argument_List_maybe> rank => 0
<Generalized_Invocation> ::= <Left_Paren> <Value_Expression_Primary> <AS> <Data_Type> <Right_Paren> <Period> <Method_Name> <SQL_Argument_List_maybe> rank => 0
<Method_Selection> ::= <Routine_Invocation> rank => 0
<Constructor_Method_Selection> ::= <Routine_Invocation> rank => 0
<Static_Method_Invocation> ::= <Path_Resolved_User_Defined_Type_Name> <Double_Colon> <Method_Name> <SQL_Argument_List_maybe> rank => 0
<Static_Method_Selection> ::= <Routine_Invocation> rank => 0
<New_Specification> ::= <NEW> <Routine_Invocation> rank => 0
<New_Invocation> ::= <Method_Invocation> rank => 0
                   | <Routine_Invocation> rank => -1
<Attribute_Or_Method_Reference> ::= <Value_Expression_Primary> <Dereference_Operator> <Qualified_Identifier> <SQL_Argument_List_maybe> rank => 0
<Dereference_Operator> ::= <Right_Arrow> rank => 0
<Dereference_Operation> ::= <Reference_Value_Expression> <Dereference_Operator> <Attribute_Name> rank => 0
<Method_Reference> ::= <Value_Expression_Primary> <Dereference_Operator> <Method_Name> <SQL_Argument_List> rank => 0
<Reference_Resolution> ::= <DEREF> <Left_Paren> <Reference_Value_Expression> <Right_Paren> rank => 0
<Array_Element_Reference> ::= <Array_Value_Expression> <Left_Bracket_Or_Trigraph> <Numeric_Value_Expression> <Right_Bracket_Or_Trigraph> rank => 0
<Multiset_Element_Reference> ::= <ELEMENT> <Left_Paren> <Multiset_Value_Expression> <Right_Paren> rank => 0
<Value_Expression> ::= <Common_Value_Expression> rank => 0
                     | <Boolean_Value_Expression> rank => -1
                     | <Row_Value_Expression> rank => -2
<Common_Value_Expression> ::= <Numeric_Value_Expression> rank => 0
                            | <String_Value_Expression> rank => -1
                            | <Datetime_Value_Expression> rank => -2
                            | <Interval_Value_Expression> rank => -3
                            | <User_Defined_Type_Value_Expression> rank => -4
                            | <Reference_Value_Expression> rank => -5
                            | <Collection_Value_Expression> rank => -6
<User_Defined_Type_Value_Expression> ::= <Value_Expression_Primary> rank => 0
<Reference_Value_Expression> ::= <Value_Expression_Primary> rank => 0
<Collection_Value_Expression> ::= <Array_Value_Expression> rank => 0
                                | <Multiset_Value_Expression> rank => -1
<Collection_Value_Constructor> ::= <Array_Value_Constructor> rank => 0
                                 | <Multiset_Value_Constructor> rank => -1
<Numeric_Value_Expression> ::= <Term> rank => 0
                             | <Numeric_Value_Expression> <Plus_Sign> <Term> rank => -1
                             | <Numeric_Value_Expression> <Minus_Sign> <Term> rank => -2
<Term> ::= <Factor> rank => 0
         | <Term> <Asterisk> <Factor> rank => -1
         | <Term> <Solidus> <Factor> rank => -2
<Factor> ::= <Sign_maybe> <Numeric_Primary> rank => 0
<Numeric_Primary> ::= <Value_Expression_Primary> rank => 0
                    | <Numeric_Value_Function> rank => -1
<Numeric_Value_Function> ::= <Position_Expression> rank => 0
                           | <Extract_Expression> rank => -1
                           | <Length_Expression> rank => -2
                           | <Cardinality_Expression> rank => -3
                           | <Absolute_Value_Expression> rank => -4
                           | <Modulus_Expression> rank => -5
                           | <Natural_Logarithm> rank => -6
                           | <Exponential_Function> rank => -7
                           | <Power_Function> rank => -8
                           | <Square_Root> rank => -9
                           | <Floor_Function> rank => -10
                           | <Ceiling_Function> rank => -11
                           | <Width_Bucket_Function> rank => -12
<Position_Expression> ::= <String_Position_Expression> rank => 0
                        | <Blob_Position_Expression> rank => -1
<Gen1264> ::= <USING> <Char_Length_Units> rank => 0
<Gen1264_maybe> ::= <Gen1264> rank => 0
<Gen1264_maybe> ::= rank => -1
<String_Position_Expression> ::= <POSITION> <Left_Paren> <String_Value_Expression> <IN> <String_Value_Expression> <Gen1264_maybe> <Right_Paren> rank => 0
<Blob_Position_Expression> ::= <POSITION> <Left_Paren> <Blob_Value_Expression> <IN> <Blob_Value_Expression> <Right_Paren> rank => 0
<Length_Expression> ::= <Char_Length_Expression> rank => 0
                      | <Octet_Length_Expression> rank => -1
<Gen1271> ::= <Lex081> rank => 0
            | <Lex077> rank => -1
<Gen1273> ::= <USING> <Char_Length_Units> rank => 0
<Gen1273_maybe> ::= <Gen1273> rank => 0
<Gen1273_maybe> ::= rank => -1
<Char_Length_Expression> ::= <Gen1271> <Left_Paren> <String_Value_Expression> <Gen1273_maybe> <Right_Paren> rank => 0
<Octet_Length_Expression> ::= <Lex193> <Left_Paren> <String_Value_Expression> <Right_Paren> rank => 0
<Extract_Expression> ::= <EXTRACT> <Left_Paren> <Extract_Field> <FROM> <Extract_Source> <Right_Paren> rank => 0
<Extract_Field> ::= <Primary_Datetime_Field> rank => 0
                  | <Time_Zone_Field> rank => -1
<Time_Zone_Field> ::= <Lex511> rank => 0
                    | <Lex512> rank => -1
<Extract_Source> ::= <Datetime_Value_Expression> rank => 0
                   | <Interval_Value_Expression> rank => -1
<Cardinality_Expression> ::= <CARDINALITY> <Left_Paren> <Collection_Value_Expression> <Right_Paren> rank => 0
<Absolute_Value_Expression> ::= <ABS> <Left_Paren> <Numeric_Value_Expression> <Right_Paren> rank => 0
<Modulus_Expression> ::= <MOD> <Left_Paren> <Numeric_Value_Expression> <Comma> <Numeric_Value_Expression> <Right_Paren> rank => 0
<Natural_Logarithm> ::= <LN> <Left_Paren> <Numeric_Value_Expression> <Right_Paren> rank => 0
<Exponential_Function> ::= <EXP> <Left_Paren> <Numeric_Value_Expression> <Right_Paren> rank => 0
<Power_Function> ::= <POWER> <Left_Paren> <Numeric_Value_Expression_Base> <Comma> <Numeric_Value_Expression_Exponent> <Right_Paren> rank => 0
<Numeric_Value_Expression_Base> ::= <Numeric_Value_Expression> rank => 0
<Numeric_Value_Expression_Exponent> ::= <Numeric_Value_Expression> rank => 0
<Square_Root> ::= <SQRT> <Left_Paren> <Numeric_Value_Expression> <Right_Paren> rank => 0
<Floor_Function> ::= <FLOOR> <Left_Paren> <Numeric_Value_Expression> <Right_Paren> rank => 0
<Gen1295> ::= <CEIL> rank => 0
            | <CEILING> rank => -1
<Ceiling_Function> ::= <Gen1295> <Left_Paren> <Numeric_Value_Expression> <Right_Paren> rank => 0
<Width_Bucket_Function> ::= <Lex537> <Left_Paren> <Width_Bucket_Operand> <Comma> <Width_Bucket_Bound_1> <Comma> <Width_Bucket_Bound_2> <Comma> <Width_Bucket_Count> <Right_Paren> rank => 0
<Width_Bucket_Operand> ::= <Numeric_Value_Expression> rank => 0
<Width_Bucket_Bound_1> ::= <Numeric_Value_Expression> rank => 0
<Width_Bucket_Bound_2> ::= <Numeric_Value_Expression> rank => 0
<Width_Bucket_Count> ::= <Numeric_Value_Expression> rank => 0
<String_Value_Expression> ::= <Character_Value_Expression> rank => 0
                            | <Blob_Value_Expression> rank => -1
<Character_Value_Expression> ::= <Concatenation> rank => 0
                               | <Character_Factor> rank => -1
<Concatenation> ::= <Character_Value_Expression> <Concatenation_Operator> <Character_Factor> rank => 0
<Character_Factor> ::= <Character_Primary> <Collate_Clause_maybe> rank => 0
<Character_Primary> ::= <Value_Expression_Primary> rank => 0
                      | <String_Value_Function> rank => -1
<Blob_Value_Expression> ::= <Blob_Concatenation> rank => 0
                          | <Blob_Factor> rank => -1
<Blob_Factor> ::= <Blob_Primary> rank => 0
<Blob_Primary> ::= <Value_Expression_Primary> rank => 0
                 | <String_Value_Function> rank => -1
<Blob_Concatenation> ::= <Blob_Value_Expression> <Concatenation_Operator> <Blob_Factor> rank => 0
<String_Value_Function> ::= <Character_Value_Function> rank => 0
                          | <Blob_Value_Function> rank => -1
<Character_Value_Function> ::= <Character_Substring_Function> rank => 0
                             | <Regular_Expression_Substring_Function> rank => -1
                             | <Fold> rank => -2
                             | <Transcoding> rank => -3
                             | <Character_Transliteration> rank => -4
                             | <Trim_Function> rank => -5
                             | <Character_Overlay_Function> rank => -6
                             | <Normalize_Function> rank => -7
                             | <Specific_Type_Method> rank => -8
<Gen1328> ::= <FOR> <String_Length> rank => 0
<Gen1328_maybe> ::= <Gen1328> rank => 0
<Gen1328_maybe> ::= rank => -1
<Gen1331> ::= <USING> <Char_Length_Units> rank => 0
<Gen1331_maybe> ::= <Gen1331> rank => 0
<Gen1331_maybe> ::= rank => -1
<Character_Substring_Function> ::= <SUBSTRING> <Left_Paren> <Character_Value_Expression> <FROM> <Start_Position> <Gen1328_maybe> <Gen1331_maybe> <Right_Paren> rank => 0
<Regular_Expression_Substring_Function> ::= <SUBSTRING> <Left_Paren> <Character_Value_Expression> <SIMILAR> <Character_Value_Expression> <ESCAPE> <Escape_Character> <Right_Paren> rank => 0
<Gen1336> ::= <UPPER> rank => 0
            | <LOWER> rank => -1
<Fold> ::= <Gen1336> <Left_Paren> <Character_Value_Expression> <Right_Paren> rank => 0
<Transcoding> ::= <CONVERT> <Left_Paren> <Character_Value_Expression> <USING> <Transcoding_Name> <Right_Paren> rank => 0
<Character_Transliteration> ::= <TRANSLATE> <Left_Paren> <Character_Value_Expression> <USING> <Transliteration_Name> <Right_Paren> rank => 0
<Trim_Function> ::= <TRIM> <Left_Paren> <Trim_Operands> <Right_Paren> rank => 0
<Trim_Specification_maybe> ::= <Trim_Specification> rank => 0
<Trim_Specification_maybe> ::= rank => -1
<Trim_Character_maybe> ::= <Trim_Character> rank => 0
<Trim_Character_maybe> ::= rank => -1
<Gen1346> ::= <Trim_Specification_maybe> <Trim_Character_maybe> <FROM> rank => 0
<Gen1346_maybe> ::= <Gen1346> rank => 0
<Gen1346_maybe> ::= rank => -1
<Trim_Operands> ::= <Gen1346_maybe> <Trim_Source> rank => 0
<Trim_Source> ::= <Character_Value_Expression> rank => 0
<Trim_Specification> ::= <LEADING> rank => 0
                       | <TRAILING> rank => -1
                       | <BOTH> rank => -2
<Trim_Character> ::= <Character_Value_Expression> rank => 0
<Gen1355> ::= <FOR> <String_Length> rank => 0
<Gen1355_maybe> ::= <Gen1355> rank => 0
<Gen1355_maybe> ::= rank => -1
<Gen1358> ::= <USING> <Char_Length_Units> rank => 0
<Gen1358_maybe> ::= <Gen1358> rank => 0
<Gen1358_maybe> ::= rank => -1
<Character_Overlay_Function> ::= <OVERLAY> <Left_Paren> <Character_Value_Expression> <PLACING> <Character_Value_Expression> <FROM> <Start_Position> <Gen1355_maybe> <Gen1358_maybe> <Right_Paren> rank => 0
<Normalize_Function> ::= <NORMALIZE> <Left_Paren> <Character_Value_Expression> <Right_Paren> rank => 0
<Specific_Type_Method> ::= <User_Defined_Type_Value_Expression> <Period> <SPECIFICTYPE> rank => 0
<Blob_Value_Function> ::= <Blob_Substring_Function> rank => 0
                        | <Blob_Trim_Function> rank => -1
                        | <Blob_Overlay_Function> rank => -2
<Gen1367> ::= <FOR> <String_Length> rank => 0
<Gen1367_maybe> ::= <Gen1367> rank => 0
<Gen1367_maybe> ::= rank => -1
<Blob_Substring_Function> ::= <SUBSTRING> <Left_Paren> <Blob_Value_Expression> <FROM> <Start_Position> <Gen1367_maybe> <Right_Paren> rank => 0
<Blob_Trim_Function> ::= <TRIM> <Left_Paren> <Blob_Trim_Operands> <Right_Paren> rank => 0
<Trim_Octet_maybe> ::= <Trim_Octet> rank => 0
<Trim_Octet_maybe> ::= rank => -1
<Gen1374> ::= <Trim_Specification_maybe> <Trim_Octet_maybe> <FROM> rank => 0
<Gen1374_maybe> ::= <Gen1374> rank => 0
<Gen1374_maybe> ::= rank => -1
<Blob_Trim_Operands> ::= <Gen1374_maybe> <Blob_Trim_Source> rank => 0
<Blob_Trim_Source> ::= <Blob_Value_Expression> rank => 0
<Trim_Octet> ::= <Blob_Value_Expression> rank => 0
<Gen1380> ::= <FOR> <String_Length> rank => 0
<Gen1380_maybe> ::= <Gen1380> rank => 0
<Gen1380_maybe> ::= rank => -1
<Blob_Overlay_Function> ::= <OVERLAY> <Left_Paren> <Blob_Value_Expression> <PLACING> <Blob_Value_Expression> <FROM> <Start_Position> <Gen1380_maybe> <Right_Paren> rank => 0
<Start_Position> ::= <Numeric_Value_Expression> rank => 0
<String_Length> ::= <Numeric_Value_Expression> rank => 0
<Datetime_Value_Expression> ::= <Datetime_Term> rank => 0
                              | <Interval_Value_Expression> <Plus_Sign> <Datetime_Term> rank => -1
                              | <Datetime_Value_Expression> <Plus_Sign> <Interval_Term> rank => -2
                              | <Datetime_Value_Expression> <Minus_Sign> <Interval_Term> rank => -3
<Datetime_Term> ::= <Datetime_Factor> rank => 0
<Time_Zone_maybe> ::= <Time_Zone> rank => 0
<Time_Zone_maybe> ::= rank => -1
<Datetime_Factor> ::= <Datetime_Primary> <Time_Zone_maybe> rank => 0
<Datetime_Primary> ::= <Value_Expression_Primary> rank => 0
                     | <Datetime_Value_Function> rank => -1
<Time_Zone> ::= <AT> <Time_Zone_Specifier> rank => 0
<Time_Zone_Specifier> ::= <LOCAL> rank => 0
                        | <TIME> <ZONE> <Interval_Primary> rank => -1
<Datetime_Value_Function> ::= <Current_Date_Value_Function> rank => 0
                            | <Current_Time_Value_Function> rank => -1
                            | <Current_Timestamp_Value_Function> rank => -2
                            | <Current_Local_Time_Value_Function> rank => -3
                            | <Current_Local_Timestamp_Value_Function> rank => -4
<Current_Date_Value_Function> ::= <Lex341> rank => 0
<Gen1405> ::= <Left_Paren> <Time_Precision> <Right_Paren> rank => 0
<Gen1405_maybe> ::= <Gen1405> rank => 0
<Gen1405_maybe> ::= rank => -1
<Current_Time_Value_Function> ::= <Lex345> <Gen1405_maybe> rank => 0
<Gen1409> ::= <Left_Paren> <Time_Precision> <Right_Paren> rank => 0
<Gen1409_maybe> ::= <Gen1409> rank => 0
<Gen1409_maybe> ::= rank => -1
<Current_Local_Time_Value_Function> ::= <LOCALTIME> <Gen1409_maybe> rank => 0
<Gen1413> ::= <Left_Paren> <Timestamp_Precision> <Right_Paren> rank => 0
<Gen1413_maybe> ::= <Gen1413> rank => 0
<Gen1413_maybe> ::= rank => -1
<Current_Timestamp_Value_Function> ::= <Lex346> <Gen1413_maybe> rank => 0
<Gen1417> ::= <Left_Paren> <Timestamp_Precision> <Right_Paren> rank => 0
<Gen1417_maybe> ::= <Gen1417> rank => 0
<Gen1417_maybe> ::= rank => -1
<Current_Local_Timestamp_Value_Function> ::= <LOCALTIMESTAMP> <Gen1417_maybe> rank => 0
<Interval_Value_Expression> ::= <Interval_Term> rank => 0
                              | <Interval_Value_Expression_1> <Plus_Sign> <Interval_Term_1> rank => -1
                              | <Interval_Value_Expression_1> <Minus_Sign> <Interval_Term_1> rank => -2
                              | <Left_Paren> <Datetime_Value_Expression> <Minus_Sign> <Datetime_Term> <Right_Paren> <Interval_Qualifier> rank => -3
<Interval_Term> ::= <Interval_Factor> rank => 0
                  | <Interval_Term_2> <Asterisk> <Factor> rank => -1
                  | <Interval_Term_2> <Solidus> <Factor> rank => -2
                  | <Term> <Asterisk> <Interval_Factor> rank => -3
<Interval_Factor> ::= <Sign_maybe> <Interval_Primary> rank => 0
<Interval_Qualifier_maybe> ::= <Interval_Qualifier> rank => 0
<Interval_Qualifier_maybe> ::= rank => -1
<Interval_Primary> ::= <Value_Expression_Primary> <Interval_Qualifier_maybe> rank => 0
                     | <Interval_Value_Function> rank => -1
<Interval_Value_Expression_1> ::= <Interval_Value_Expression> rank => 0
<Interval_Term_1> ::= <Interval_Term> rank => 0
<Interval_Term_2> ::= <Interval_Term> rank => 0
<Interval_Value_Function> ::= <Interval_Absolute_Value_Function> rank => 0
<Interval_Absolute_Value_Function> ::= <ABS> <Left_Paren> <Interval_Value_Expression> <Right_Paren> rank => 0
<Boolean_Value_Expression> ::= <Boolean_Term> rank => 0
                             | <Boolean_Value_Expression> <OR> <Boolean_Term> rank => -1
<Boolean_Term> ::= <Boolean_Factor> rank => 0
                 | <Boolean_Term> <AND> <Boolean_Factor> rank => -1
<NOT_maybe> ::= <NOT> rank => 0
<NOT_maybe> ::= rank => -1
<Boolean_Factor> ::= <NOT_maybe> <Boolean_Test> rank => 0
<Gen1446> ::= <IS> <NOT_maybe> <Truth_Value> rank => 0
<Gen1446_maybe> ::= <Gen1446> rank => 0
<Gen1446_maybe> ::= rank => -1
<Boolean_Test> ::= <Boolean_Primary> <Gen1446_maybe> rank => 0
<Truth_Value> ::= <TRUE> rank => 0
                | <FALSE> rank => -1
                | <UNKNOWN> rank => -2
<Boolean_Primary> ::= <Predicate> rank => 0
                    | <Boolean_Predicand> rank => -1
<Boolean_Predicand> ::= <Parenthesized_Boolean_Value_Expression> rank => 0
                      | <Nonparenthesized_Value_Expression_Primary> rank => -1
<Parenthesized_Boolean_Value_Expression> ::= <Left_Paren> <Boolean_Value_Expression> <Right_Paren> rank => 0
<Array_Value_Expression> ::= <Array_Concatenation> rank => 0
                           | <Array_Factor> rank => -1
<Array_Concatenation> ::= <Array_Value_Expression_1> <Concatenation_Operator> <Array_Factor> rank => 0
<Array_Value_Expression_1> ::= <Array_Value_Expression> rank => 0
<Array_Factor> ::= <Value_Expression_Primary> rank => 0
<Array_Value_Constructor> ::= <Array_Value_Constructor_By_Enumeration> rank => 0
                            | <Array_Value_Constructor_By_Query> rank => -1
<Array_Value_Constructor_By_Enumeration> ::= <ARRAY> <Left_Bracket_Or_Trigraph> <Array_Element_List> <Right_Bracket_Or_Trigraph> rank => 0
<Gen1466> ::= <Comma> <Array_Element> rank => 0
<Gen1466_any> ::= <Gen1466>* rank => 0
<Array_Element_List> ::= <Array_Element> <Gen1466_any> rank => 0
<Array_Element> ::= <Value_Expression> rank => 0
<Order_By_Clause_maybe> ::= <Order_By_Clause> rank => 0
<Order_By_Clause_maybe> ::= rank => -1
<Array_Value_Constructor_By_Query> ::= <ARRAY> <Left_Paren> <Query_Expression> <Order_By_Clause_maybe> <Right_Paren> rank => 0
<Gen1473> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<Gen1475> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<Multiset_Value_Expression> ::= <Multiset_Term> rank => 0
                              | <Multiset_Value_Expression> <MULTISET> <UNION> <Gen1473> <Multiset_Term> rank => -1
                              | <Multiset_Value_Expression> <MULTISET> <EXCEPT> <Gen1475> <Multiset_Term> rank => -2
<Gen1480> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<Multiset_Term> ::= <Multiset_Primary> rank => 0
                  | <Multiset_Term> <MULTISET> <INTERSECT> <Gen1480> <Multiset_Primary> rank => -1
<Multiset_Primary> ::= <Multiset_Value_Function> rank => 0
                     | <Value_Expression_Primary> rank => -1
<Multiset_Value_Function> ::= <Multiset_Set_Function> rank => 0
<Multiset_Set_Function> ::= <SET> <Left_Paren> <Multiset_Value_Expression> <Right_Paren> rank => 0
<Multiset_Value_Constructor> ::= <Multiset_Value_Constructor_By_Enumeration> rank => 0
                               | <Multiset_Value_Constructor_By_Query> rank => -1
                               | <Table_Value_Constructor_By_Query> rank => -2
<Multiset_Value_Constructor_By_Enumeration> ::= <MULTISET> <Left_Bracket_Or_Trigraph> <Multiset_Element_List> <Right_Bracket_Or_Trigraph> rank => 0
<Gen1492> ::= <Comma> <Multiset_Element> rank => 0
<Gen1492_any> ::= <Gen1492>* rank => 0
<Multiset_Element_List> ::= <Multiset_Element> <Gen1492_any> rank => 0
<Multiset_Element> ::= <Value_Expression> rank => 0
<Multiset_Value_Constructor_By_Query> ::= <MULTISET> <Left_Paren> <Query_Expression> <Right_Paren> rank => 0
<Table_Value_Constructor_By_Query> ::= <TABLE> <Left_Paren> <Query_Expression> <Right_Paren> rank => 0
<Row_Value_Constructor> ::= <Common_Value_Expression> rank => 0
                          | <Boolean_Value_Expression> rank => -1
                          | <Explicit_Row_Value_Constructor> rank => -2
<Explicit_Row_Value_Constructor> ::= <Left_Paren> <Row_Value_Constructor_Element> <Comma> <Row_Value_Constructor_Element_List> <Right_Paren> rank => 0
                                   | <ROW> <Left_Paren> <Row_Value_Constructor_Element_List> <Right_Paren> rank => -1
                                   | <Row_Subquery> rank => -2
<Gen1504> ::= <Comma> <Row_Value_Constructor_Element> rank => 0
<Gen1504_any> ::= <Gen1504>* rank => 0
<Row_Value_Constructor_Element_List> ::= <Row_Value_Constructor_Element> <Gen1504_any> rank => 0
<Row_Value_Constructor_Element> ::= <Value_Expression> rank => 0
<Contextually_Typed_Row_Value_Constructor> ::= <Common_Value_Expression> rank => 0
                                             | <Boolean_Value_Expression> rank => -1
                                             | <Contextually_Typed_Value_Specification> rank => -2
                                             | <Left_Paren> <Contextually_Typed_Row_Value_Constructor_Element> <Comma> <Contextually_Typed_Row_Value_Constructor_Element_List> <Right_Paren> rank => -3
                                             | <ROW> <Left_Paren> <Contextually_Typed_Row_Value_Constructor_Element_List> <Right_Paren> rank => -4
<Gen1513> ::= <Comma> <Contextually_Typed_Row_Value_Constructor_Element> rank => 0
<Gen1513_any> ::= <Gen1513>* rank => 0
<Contextually_Typed_Row_Value_Constructor_Element_List> ::= <Contextually_Typed_Row_Value_Constructor_Element> <Gen1513_any> rank => 0
<Contextually_Typed_Row_Value_Constructor_Element> ::= <Value_Expression> rank => 0
                                                     | <Contextually_Typed_Value_Specification> rank => -1
<Row_Value_Constructor_Predicand> ::= <Common_Value_Expression> rank => 0
                                    | <Boolean_Predicand> rank => -1
                                    | <Explicit_Row_Value_Constructor> rank => -2
<Row_Value_Expression> ::= <Row_Value_Special_Case> rank => 0
                         | <Explicit_Row_Value_Constructor> rank => -1
<Table_Row_Value_Expression> ::= <Row_Value_Special_Case> rank => 0
                               | <Row_Value_Constructor> rank => -1
<Contextually_Typed_Row_Value_Expression> ::= <Row_Value_Special_Case> rank => 0
                                            | <Contextually_Typed_Row_Value_Constructor> rank => -1
<Row_Value_Predicand> ::= <Row_Value_Special_Case> rank => 0
                        | <Row_Value_Constructor_Predicand> rank => -1
<Row_Value_Special_Case> ::= <Nonparenthesized_Value_Expression_Primary> rank => 0
<Table_Value_Constructor> ::= <VALUES> <Row_Value_Expression_List> rank => 0
<Gen1531> ::= <Comma> <Table_Row_Value_Expression> rank => 0
<Gen1531_any> ::= <Gen1531>* rank => 0
<Row_Value_Expression_List> ::= <Table_Row_Value_Expression> <Gen1531_any> rank => 0
<Contextually_Typed_Table_Value_Constructor> ::= <VALUES> <Contextually_Typed_Row_Value_Expression_List> rank => 0
<Gen1535> ::= <Comma> <Contextually_Typed_Row_Value_Expression> rank => 0
<Gen1535_any> ::= <Gen1535>* rank => 0
<Contextually_Typed_Row_Value_Expression_List> ::= <Contextually_Typed_Row_Value_Expression> <Gen1535_any> rank => 0
<Where_Clause_maybe> ::= <Where_Clause> rank => 0
<Where_Clause_maybe> ::= rank => -1
<Group_By_Clause_maybe> ::= <Group_By_Clause> rank => 0
<Group_By_Clause_maybe> ::= rank => -1
<Having_Clause_maybe> ::= <Having_Clause> rank => 0
<Having_Clause_maybe> ::= rank => -1
<Window_Clause_maybe> ::= <Window_Clause> rank => 0
<Window_Clause_maybe> ::= rank => -1
<Table_Expression> ::= <From_Clause> <Where_Clause_maybe> <Group_By_Clause_maybe> <Having_Clause_maybe> <Window_Clause_maybe> rank => 0
<From_Clause> ::= <FROM> <Table_Reference_List> rank => 0
<Gen1548> ::= <Comma> <Table_Reference> rank => 0
<Gen1548_any> ::= <Gen1548>* rank => 0
<Table_Reference_List> ::= <Table_Reference> <Gen1548_any> rank => 0
<Sample_Clause_maybe> ::= <Sample_Clause> rank => 0
<Sample_Clause_maybe> ::= rank => -1
<Table_Reference> ::= <Table_Primary_Or_Joined_Table> <Sample_Clause_maybe> rank => 0
<Table_Primary_Or_Joined_Table> ::= <Table_Primary> rank => 0
                                  | <Joined_Table> rank => -1
<Repeatable_Clause_maybe> ::= <Repeatable_Clause> rank => 0
<Repeatable_Clause_maybe> ::= rank => -1
<Sample_Clause> ::= <TABLESAMPLE> <Sample_Method> <Left_Paren> <Sample_Percentage> <Right_Paren> <Repeatable_Clause_maybe> rank => 0
<Sample_Method> ::= <BERNOULLI> rank => 0
                  | <SYSTEM> rank => -1
<Repeatable_Clause> ::= <REPEATABLE> <Left_Paren> <Repeat_Argument> <Right_Paren> rank => 0
<Sample_Percentage> ::= <Numeric_Value_Expression> rank => 0
<Repeat_Argument> ::= <Numeric_Value_Expression> rank => 0
<AS_maybe> ::= <AS> rank => 0
<AS_maybe> ::= rank => -1
<Gen1566> ::= <Left_Paren> <Derived_Column_List> <Right_Paren> rank => 0
<Gen1566_maybe> ::= <Gen1566> rank => 0
<Gen1566_maybe> ::= rank => -1
<Gen1569> ::= <AS_maybe> <Correlation_Name> <Gen1566_maybe> rank => 0
<Gen1569_maybe> ::= <Gen1569> rank => 0
<Gen1569_maybe> ::= rank => -1
<Gen1572> ::= <Left_Paren> <Derived_Column_List> <Right_Paren> rank => 0
<Gen1572_maybe> ::= <Gen1572> rank => 0
<Gen1572_maybe> ::= rank => -1
<Gen1575> ::= <Left_Paren> <Derived_Column_List> <Right_Paren> rank => 0
<Gen1575_maybe> ::= <Gen1575> rank => 0
<Gen1575_maybe> ::= rank => -1
<Gen1578> ::= <Left_Paren> <Derived_Column_List> <Right_Paren> rank => 0
<Gen1578_maybe> ::= <Gen1578> rank => 0
<Gen1578_maybe> ::= rank => -1
<Gen1581> ::= <Left_Paren> <Derived_Column_List> <Right_Paren> rank => 0
<Gen1581_maybe> ::= <Gen1581> rank => 0
<Gen1581_maybe> ::= rank => -1
<Gen1584> ::= <Left_Paren> <Derived_Column_List> <Right_Paren> rank => 0
<Gen1584_maybe> ::= <Gen1584> rank => 0
<Gen1584_maybe> ::= rank => -1
<Gen1587> ::= <AS_maybe> <Correlation_Name> <Gen1584_maybe> rank => 0
<Gen1587_maybe> ::= <Gen1587> rank => 0
<Gen1587_maybe> ::= rank => -1
<Table_Primary> ::= <Table_Or_Query_Name> <Gen1569_maybe> rank => 0
                  | <Derived_Table> <AS_maybe> <Correlation_Name> <Gen1572_maybe> rank => -1
                  | <Lateral_Derived_Table> <AS_maybe> <Correlation_Name> <Gen1575_maybe> rank => -2
                  | <Collection_Derived_Table> <AS_maybe> <Correlation_Name> <Gen1578_maybe> rank => -3
                  | <Table_Function_Derived_Table> <AS_maybe> <Correlation_Name> <Gen1581_maybe> rank => -4
                  | <Only_Spec> <Gen1587_maybe> rank => -5
                  | <Left_Paren> <Joined_Table> <Right_Paren> rank => -6
<Only_Spec> ::= <ONLY> <Left_Paren> <Table_Or_Query_Name> <Right_Paren> rank => 0
<Lateral_Derived_Table> ::= <LATERAL> <Table_Subquery> rank => 0
<Gen1599> ::= <WITH> <ORDINALITY> rank => 0
<Gen1599_maybe> ::= <Gen1599> rank => 0
<Gen1599_maybe> ::= rank => -1
<Collection_Derived_Table> ::= <UNNEST> <Left_Paren> <Collection_Value_Expression> <Right_Paren> <Gen1599_maybe> rank => 0
<Table_Function_Derived_Table> ::= <TABLE> <Left_Paren> <Collection_Value_Expression> <Right_Paren> rank => 0
<Derived_Table> ::= <Table_Subquery> rank => 0
<Table_Or_Query_Name> ::= <Table_Name> rank => 0
                        | <Query_Name> rank => -1
<Derived_Column_List> ::= <Column_Name_List> rank => 0
<Gen1608> ::= <Comma> <Column_Name> rank => 0
<Gen1608_any> ::= <Gen1608>* rank => 0
<Column_Name_List> ::= <Column_Name> <Gen1608_any> rank => 0
<Joined_Table> ::= <Cross_Join> rank => 0
                 | <Qualified_Join> rank => -1
                 | <Natural_Join> rank => -2
                 | <Union_Join> rank => -3
<Cross_Join> ::= <Table_Reference> <CROSS> <JOIN> <Table_Primary> rank => 0
<Join_Type_maybe> ::= <Join_Type> rank => 0
<Join_Type_maybe> ::= rank => -1
<Qualified_Join> ::= <Table_Reference> <Join_Type_maybe> <JOIN> <Table_Reference> <Join_Specification> rank => 0
<Natural_Join> ::= <Table_Reference> <NATURAL> <Join_Type_maybe> <JOIN> <Table_Primary> rank => 0
<Union_Join> ::= <Table_Reference> <UNION> <JOIN> <Table_Primary> rank => 0
<Join_Specification> ::= <Join_Condition> rank => 0
                       | <Named_Columns_Join> rank => -1
<Join_Condition> ::= <ON> <Search_Condition> rank => 0
<Named_Columns_Join> ::= <USING> <Left_Paren> <Join_Column_List> <Right_Paren> rank => 0
<OUTER_maybe> ::= <OUTER> rank => 0
<OUTER_maybe> ::= rank => -1
<Join_Type> ::= <INNER> rank => 0
              | <Outer_Join_Type> <OUTER_maybe> rank => -1
<Outer_Join_Type> ::= <LEFT> rank => 0
                    | <RIGHT> rank => -1
                    | <FULL> rank => -2
<Join_Column_List> ::= <Column_Name_List> rank => 0
<Where_Clause> ::= <WHERE> <Search_Condition> rank => 0
<Set_Quantifier_maybe> ::= <Set_Quantifier> rank => 0
<Set_Quantifier_maybe> ::= rank => -1
<Group_By_Clause> ::= <GROUP> <BY> <Set_Quantifier_maybe> <Grouping_Element_List> rank => 0
<Gen1637> ::= <Comma> <Grouping_Element> rank => 0
<Gen1637_any> ::= <Gen1637>* rank => 0
<Grouping_Element_List> ::= <Grouping_Element> <Gen1637_any> rank => 0
<Grouping_Element> ::= <Ordinary_Grouping_Set> rank => 0
                     | <Rollup_List> rank => -1
                     | <Cube_List> rank => -2
                     | <Grouping_Sets_Specification> rank => -3
                     | <Empty_Grouping_Set> rank => -4
<Ordinary_Grouping_Set> ::= <Grouping_Column_Reference> rank => 0
                          | <Left_Paren> <Grouping_Column_Reference_List> <Right_Paren> rank => -1
<Grouping_Column_Reference> ::= <Column_Reference> <Collate_Clause_maybe> rank => 0
<Gen1648> ::= <Comma> <Grouping_Column_Reference> rank => 0
<Gen1648_any> ::= <Gen1648>* rank => 0
<Grouping_Column_Reference_List> ::= <Grouping_Column_Reference> <Gen1648_any> rank => 0
<Rollup_List> ::= <ROLLUP> <Left_Paren> <Ordinary_Grouping_Set_List> <Right_Paren> rank => 0
<Gen1652> ::= <Comma> <Ordinary_Grouping_Set> rank => 0
<Gen1652_any> ::= <Gen1652>* rank => 0
<Ordinary_Grouping_Set_List> ::= <Ordinary_Grouping_Set> <Gen1652_any> rank => 0
<Cube_List> ::= <CUBE> <Left_Paren> <Ordinary_Grouping_Set_List> <Right_Paren> rank => 0
<Grouping_Sets_Specification> ::= <GROUPING> <SETS> <Left_Paren> <Grouping_Set_List> <Right_Paren> rank => 0
<Gen1657> ::= <Comma> <Grouping_Set> rank => 0
<Gen1657_any> ::= <Gen1657>* rank => 0
<Grouping_Set_List> ::= <Grouping_Set> <Gen1657_any> rank => 0
<Grouping_Set> ::= <Ordinary_Grouping_Set> rank => 0
                 | <Rollup_List> rank => -1
                 | <Cube_List> rank => -2
                 | <Grouping_Sets_Specification> rank => -3
                 | <Empty_Grouping_Set> rank => -4
<Empty_Grouping_Set> ::= <Left_Paren> <Right_Paren> rank => 0
<Having_Clause> ::= <HAVING> <Search_Condition> rank => 0
<Window_Clause> ::= <WINDOW> <Window_Definition_List> rank => 0
<Gen1668> ::= <Comma> <Window_Definition> rank => 0
<Gen1668_any> ::= <Gen1668>* rank => 0
<Window_Definition_List> ::= <Window_Definition> <Gen1668_any> rank => 0
<Window_Definition> ::= <New_Window_Name> <AS> <Window_Specification> rank => 0
<New_Window_Name> ::= <Window_Name> rank => 0
<Window_Specification> ::= <Left_Paren> <Window_Specification_Details> <Right_Paren> rank => 0
<Existing_Window_Name_maybe> ::= <Existing_Window_Name> rank => 0
<Existing_Window_Name_maybe> ::= rank => -1
<Window_Partition_Clause_maybe> ::= <Window_Partition_Clause> rank => 0
<Window_Partition_Clause_maybe> ::= rank => -1
<Window_Order_Clause_maybe> ::= <Window_Order_Clause> rank => 0
<Window_Order_Clause_maybe> ::= rank => -1
<Window_Frame_Clause_maybe> ::= <Window_Frame_Clause> rank => 0
<Window_Frame_Clause_maybe> ::= rank => -1
<Window_Specification_Details> ::= <Existing_Window_Name_maybe> <Window_Partition_Clause_maybe> <Window_Order_Clause_maybe> <Window_Frame_Clause_maybe> rank => 0
<Existing_Window_Name> ::= <Window_Name> rank => 0
<Window_Partition_Clause> ::= <PARTITION> <BY> <Window_Partition_Column_Reference_List> rank => 0
<Gen1685> ::= <Comma> <Window_Partition_Column_Reference> rank => 0
<Gen1685_any> ::= <Gen1685>* rank => 0
<Window_Partition_Column_Reference_List> ::= <Window_Partition_Column_Reference> <Gen1685_any> rank => 0
<Window_Partition_Column_Reference> ::= <Column_Reference> <Collate_Clause_maybe> rank => 0
<Window_Order_Clause> ::= <ORDER> <BY> <Sort_Specification_List> rank => 0
<Window_Frame_Exclusion_maybe> ::= <Window_Frame_Exclusion> rank => 0
<Window_Frame_Exclusion_maybe> ::= rank => -1
<Window_Frame_Clause> ::= <Window_Frame_Units> <Window_Frame_Extent> <Window_Frame_Exclusion_maybe> rank => 0
<Window_Frame_Units> ::= <ROWS> rank => 0
                       | <RANGE> rank => -1
<Window_Frame_Extent> ::= <Window_Frame_Start> rank => 0
                        | <Window_Frame_Between> rank => -1
<Window_Frame_Start> ::= <UNBOUNDED> <PRECEDING> rank => 0
                       | <Window_Frame_Preceding> rank => -1
                       | <CURRENT> <ROW> rank => -2
<Window_Frame_Preceding> ::= <Unsigned_Value_Specification> <PRECEDING> rank => 0
<Window_Frame_Between> ::= <BETWEEN> <Window_Frame_Bound_1> <AND> <Window_Frame_Bound_2> rank => 0
<Window_Frame_Bound_1> ::= <Window_Frame_Bound> rank => 0
<Window_Frame_Bound_2> ::= <Window_Frame_Bound> rank => 0
<Window_Frame_Bound> ::= <Window_Frame_Start> rank => 0
                       | <UNBOUNDED> <FOLLOWING> rank => -1
                       | <Window_Frame_Following> rank => -2
<Window_Frame_Following> ::= <Unsigned_Value_Specification> <FOLLOWING> rank => 0
<Window_Frame_Exclusion> ::= <EXCLUDE> <CURRENT> <ROW> rank => 0
                           | <EXCLUDE> <GROUP> rank => -1
                           | <EXCLUDE> <TIES> rank => -2
                           | <EXCLUDE> <NO> <OTHERS> rank => -3
<Query_Specification> ::= <SELECT> <Set_Quantifier_maybe> <Select_List> <Table_Expression> rank => 0
<Gen1713> ::= <Comma> <Select_Sublist> rank => 0
<Gen1713_any> ::= <Gen1713>* rank => 0
<Select_List> ::= <Asterisk> rank => 0
                | <Select_Sublist> <Gen1713_any> rank => -1
<Select_Sublist> ::= <Derived_Column> rank => 0
                   | <Qualified_Asterisk> rank => -1
<Qualified_Asterisk> ::= <Asterisked_Identifier_Chain> <Period> <Asterisk> rank => 0
                       | <All_Fields_Reference> rank => -1
<Gen1721> ::= <Period> <Asterisked_Identifier> rank => 0
<Gen1721_any> ::= <Gen1721>* rank => 0
<Asterisked_Identifier_Chain> ::= <Asterisked_Identifier> <Gen1721_any> rank => 0
<Asterisked_Identifier> ::= <Identifier> rank => 0
<As_Clause_maybe> ::= <As_Clause> rank => 0
<As_Clause_maybe> ::= rank => -1
<Derived_Column> ::= <Value_Expression> <As_Clause_maybe> rank => 0
<As_Clause> ::= <AS_maybe> <Column_Name> rank => 0
<Gen1729> ::= <AS> <Left_Paren> <All_Fields_Column_Name_List> <Right_Paren> rank => 0
<Gen1729_maybe> ::= <Gen1729> rank => 0
<Gen1729_maybe> ::= rank => -1
<All_Fields_Reference> ::= <Value_Expression_Primary> <Period> <Asterisk> <Gen1729_maybe> rank => 0
<All_Fields_Column_Name_List> ::= <Column_Name_List> rank => 0
<With_Clause_maybe> ::= <With_Clause> rank => 0
<With_Clause_maybe> ::= rank => -1
<Query_Expression> ::= <With_Clause_maybe> <Query_Expression_Body> rank => 0
<RECURSIVE_maybe> ::= <RECURSIVE> rank => 0
<RECURSIVE_maybe> ::= rank => -1
<With_Clause> ::= <WITH> <RECURSIVE_maybe> <With_List> rank => 0
<Gen1740> ::= <Comma> <With_List_Element> rank => 0
<Gen1740_any> ::= <Gen1740>* rank => 0
<With_List> ::= <With_List_Element> <Gen1740_any> rank => 0
<Gen1743> ::= <Left_Paren> <With_Column_List> <Right_Paren> rank => 0
<Gen1743_maybe> ::= <Gen1743> rank => 0
<Gen1743_maybe> ::= rank => -1
<Search_Or_Cycle_Clause_maybe> ::= <Search_Or_Cycle_Clause> rank => 0
<Search_Or_Cycle_Clause_maybe> ::= rank => -1
<With_List_Element> ::= <Query_Name> <Gen1743_maybe> <AS> <Left_Paren> <Query_Expression> <Right_Paren> <Search_Or_Cycle_Clause_maybe> rank => 0
<With_Column_List> ::= <Column_Name_List> rank => 0
<Query_Expression_Body> ::= <Non_Join_Query_Expression> rank => 0
                          | <Joined_Table> rank => -1
<Gen1752> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<Gen1752_maybe> ::= <Gen1752> rank => 0
<Gen1752_maybe> ::= rank => -1
<Corresponding_Spec_maybe> ::= <Corresponding_Spec> rank => 0
<Corresponding_Spec_maybe> ::= rank => -1
<Gen1758> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<Gen1758_maybe> ::= <Gen1758> rank => 0
<Gen1758_maybe> ::= rank => -1
<Non_Join_Query_Expression> ::= <Non_Join_Query_Term> rank => 0
                              | <Query_Expression_Body> <UNION> <Gen1752_maybe> <Corresponding_Spec_maybe> <Query_Term> rank => -1
                              | <Query_Expression_Body> <EXCEPT> <Gen1758_maybe> <Corresponding_Spec_maybe> <Query_Term> rank => -2
<Query_Term> ::= <Non_Join_Query_Term> rank => 0
               | <Joined_Table> rank => -1
<Gen1767> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<Gen1767_maybe> ::= <Gen1767> rank => 0
<Gen1767_maybe> ::= rank => -1
<Non_Join_Query_Term> ::= <Non_Join_Query_Primary> rank => 0
                        | <Query_Term> <INTERSECT> <Gen1767_maybe> <Corresponding_Spec_maybe> <Query_Primary> rank => -1
<Query_Primary> ::= <Non_Join_Query_Primary> rank => 0
                  | <Joined_Table> rank => -1
<Non_Join_Query_Primary> ::= <Simple_Table> rank => 0
                           | <Left_Paren> <Non_Join_Query_Expression> <Right_Paren> rank => -1
<Simple_Table> ::= <Query_Specification> rank => 0
                 | <Table_Value_Constructor> rank => -1
                 | <Explicit_Table> rank => -2
<Explicit_Table> ::= <TABLE> <Table_Or_Query_Name> rank => 0
<Gen1781> ::= <BY> <Left_Paren> <Corresponding_Column_List> <Right_Paren> rank => 0
<Gen1781_maybe> ::= <Gen1781> rank => 0
<Gen1781_maybe> ::= rank => -1
<Corresponding_Spec> ::= <CORRESPONDING> <Gen1781_maybe> rank => 0
<Corresponding_Column_List> ::= <Column_Name_List> rank => 0
<Search_Or_Cycle_Clause> ::= <Search_Clause> rank => 0
                           | <Cycle_Clause> rank => -1
                           | <Search_Clause> <Cycle_Clause> rank => -2
<Search_Clause> ::= <SEARCH> <Recursive_Search_Order> <SET> <Sequence_Column> rank => 0
<Recursive_Search_Order> ::= <DEPTH> <FIRST> <BY> <Sort_Specification_List> rank => 0
                           | <BREADTH> <FIRST> <BY> <Sort_Specification_List> rank => -1
<Sequence_Column> ::= <Column_Name> rank => 0
<Cycle_Clause> ::= <CYCLE> <Cycle_Column_List> <SET> <Cycle_Mark_Column> <TO> <Cycle_Mark_Value> <DEFAULT> <Non_Cycle_Mark_Value> <USING> <Path_Column> rank => 0
<Gen1794> ::= <Comma> <Cycle_Column> rank => 0
<Gen1794_any> ::= <Gen1794>* rank => 0
<Cycle_Column_List> ::= <Cycle_Column> <Gen1794_any> rank => 0
<Cycle_Column> ::= <Column_Name> rank => 0
<Cycle_Mark_Column> ::= <Column_Name> rank => 0
<Path_Column> ::= <Column_Name> rank => 0
<Cycle_Mark_Value> ::= <Value_Expression> rank => 0
<Non_Cycle_Mark_Value> ::= <Value_Expression> rank => 0
<Scalar_Subquery> ::= <Subquery> rank => 0
<Row_Subquery> ::= <Subquery> rank => 0
<Table_Subquery> ::= <Subquery> rank => 0
<Subquery> ::= <Left_Paren> <Query_Expression> <Right_Paren> rank => 0
<Predicate> ::= <Comparison_Predicate> rank => 0
              | <Between_Predicate> rank => -1
              | <In_Predicate> rank => -2
              | <Like_Predicate> rank => -3
              | <Similar_Predicate> rank => -4
              | <Null_Predicate> rank => -5
              | <Quantified_Comparison_Predicate> rank => -6
              | <Exists_Predicate> rank => -7
              | <Unique_Predicate> rank => -8
              | <Normalized_Predicate> rank => -9
              | <Match_Predicate> rank => -10
              | <Overlaps_Predicate> rank => -11
              | <Distinct_Predicate> rank => -12
              | <Member_Predicate> rank => -13
              | <Submultiset_Predicate> rank => -14
              | <Set_Predicate> rank => -15
              | <Type_Predicate> rank => -16
<Comparison_Predicate> ::= <Row_Value_Predicand> <Comparison_Predicate_Part_2> rank => 0
<Comparison_Predicate_Part_2> ::= <Comp_Op> <Row_Value_Predicand> rank => 0
<Comp_Op> ::= <Equals_Operator> rank => 0
            | <Not_Equals_Operator> rank => -1
            | <Less_Than_Operator> rank => -2
            | <Greater_Than_Operator> rank => -3
            | <Less_Than_Or_Equals_Operator> rank => -4
            | <Greater_Than_Or_Equals_Operator> rank => -5
<Between_Predicate> ::= <Row_Value_Predicand> <Between_Predicate_Part_2> rank => 0
<Gen1832> ::= <ASYMMETRIC> rank => 0
            | <SYMMETRIC> rank => -1
<Gen1832_maybe> ::= <Gen1832> rank => 0
<Gen1832_maybe> ::= rank => -1
<Between_Predicate_Part_2> ::= <NOT_maybe> <BETWEEN> <Gen1832_maybe> <Row_Value_Predicand> <AND> <Row_Value_Predicand> rank => 0
<In_Predicate> ::= <Row_Value_Predicand> <In_Predicate_Part_2> rank => 0
<In_Predicate_Part_2> ::= <NOT_maybe> <IN> <In_Predicate_Value> rank => 0
<In_Predicate_Value> ::= <Table_Subquery> rank => 0
                       | <Left_Paren> <In_Value_List> <Right_Paren> rank => -1
<Gen1841> ::= <Comma> <Row_Value_Expression> rank => 0
<Gen1841_any> ::= <Gen1841>* rank => 0
<In_Value_List> ::= <Row_Value_Expression> <Gen1841_any> rank => 0
<Like_Predicate> ::= <Character_Like_Predicate> rank => 0
                   | <Octet_Like_Predicate> rank => -1
<Character_Like_Predicate> ::= <Row_Value_Predicand> <Character_Like_Predicate_Part_2> rank => 0
<Gen1847> ::= <ESCAPE> <Escape_Character> rank => 0
<Gen1847_maybe> ::= <Gen1847> rank => 0
<Gen1847_maybe> ::= rank => -1
<Character_Like_Predicate_Part_2> ::= <NOT_maybe> <LIKE> <Character_Pattern> <Gen1847_maybe> rank => 0
<Character_Pattern> ::= <Character_Value_Expression> rank => 0
<Escape_Character> ::= <Character_Value_Expression> rank => 0
<Octet_Like_Predicate> ::= <Row_Value_Predicand> <Octet_Like_Predicate_Part_2> rank => 0
<Gen1854> ::= <ESCAPE> <Escape_Octet> rank => 0
<Gen1854_maybe> ::= <Gen1854> rank => 0
<Gen1854_maybe> ::= rank => -1
<Octet_Like_Predicate_Part_2> ::= <NOT_maybe> <LIKE> <Octet_Pattern> <Gen1854_maybe> rank => 0
<Octet_Pattern> ::= <Blob_Value_Expression> rank => 0
<Escape_Octet> ::= <Blob_Value_Expression> rank => 0
<Similar_Predicate> ::= <Row_Value_Predicand> <Similar_Predicate_Part_2> rank => 0
<Gen1861> ::= <ESCAPE> <Escape_Character> rank => 0
<Gen1861_maybe> ::= <Gen1861> rank => 0
<Gen1861_maybe> ::= rank => -1
<Similar_Predicate_Part_2> ::= <NOT_maybe> <SIMILAR> <TO> <Similar_Pattern> <Gen1861_maybe> rank => 0
<Similar_Pattern> ::= <Character_Value_Expression> rank => 0
<Regular_Expression> ::= <Regular_Term> rank => 0
                       | <Regular_Expression> <Vertical_Bar> <Regular_Term> rank => -1
<Regular_Term> ::= <Regular_Factor> rank => 0
                 | <Regular_Term> <Regular_Factor> rank => -1
<Regular_Factor> ::= <Regular_Primary> rank => 0
                   | <Regular_Primary> <Asterisk> rank => -1
                   | <Regular_Primary> <Plus_Sign> rank => -2
                   | <Regular_Primary> <Question_Mark> rank => -3
                   | <Regular_Primary> <Repeat_Factor> rank => -4
<Upper_Limit_maybe> ::= <Upper_Limit> rank => 0
<Upper_Limit_maybe> ::= rank => -1
<Repeat_Factor> ::= <Left_Brace> <Low_Value> <Upper_Limit_maybe> <Right_Brace> rank => 0
<High_Value_maybe> ::= <High_Value> rank => 0
<High_Value_maybe> ::= rank => -1
<Upper_Limit> ::= <Comma> <High_Value_maybe> rank => 0
<Low_Value> ::= <Unsigned_Integer> rank => 0
<High_Value> ::= <Unsigned_Integer> rank => 0
<Regular_Primary> ::= <Character_Specifier> rank => 0
                    | <Percent> rank => -1
                    | <Regular_Character_Set> rank => -2
                    | <Left_Paren> <Regular_Expression> <Right_Paren> rank => -3
<Character_Specifier> ::= <Non_Escaped_Character> rank => 0
                        | <Escaped_Character> rank => -1
<Non_Escaped_Character> ::= <Lex561> rank => 0
<Escaped_Character> ::= <Lex562> <Lex563> rank => 0
<Character_Enumeration_many> ::= <Character_Enumeration>+ rank => 0
<Character_Enumeration_Include_many> ::= <Character_Enumeration_Include>+ rank => 0
<Character_Enumeration_Exclude_many> ::= <Character_Enumeration_Exclude>+ rank => 0
<Regular_Character_Set> ::= <Underscore> rank => 0
                          | <Left_Bracket> <Character_Enumeration_many> <Right_Bracket> rank => -1
                          | <Left_Bracket> <Circumflex> <Character_Enumeration_many> <Right_Bracket> rank => -2
                          | <Left_Bracket> <Character_Enumeration_Include_many> <Circumflex> <Character_Enumeration_Exclude_many> <Right_Bracket> rank => -3
<Character_Enumeration_Include> ::= <Character_Enumeration> rank => 0
<Character_Enumeration_Exclude> ::= <Character_Enumeration> rank => 0
<Character_Enumeration> ::= <Character_Specifier> rank => 0
                          | <Character_Specifier> <Minus_Sign> <Character_Specifier> rank => -1
                          | <Left_Bracket> <Colon> <Regular_Character_Set_Identifier> <Colon> <Right_Bracket> rank => -2
<Regular_Character_Set_Identifier> ::= <Identifier> rank => 0
<Null_Predicate> ::= <Row_Value_Predicand> <Null_Predicate_Part_2> rank => 0
<Null_Predicate_Part_2> ::= <IS> <NOT_maybe> <NULL> rank => 0
<Quantified_Comparison_Predicate> ::= <Row_Value_Predicand> <Quantified_Comparison_Predicate_Part_2> rank => 0
<Quantified_Comparison_Predicate_Part_2> ::= <Comp_Op> <Quantifier> <Table_Subquery> rank => 0
<Quantifier> ::= <All> rank => 0
               | <Some> rank => -1
<All> ::= <ALL> rank => 0
<Some> ::= <SOME> rank => 0
         | <ANY> rank => -1
<Exists_Predicate> ::= <EXISTS> <Table_Subquery> rank => 0
<Unique_Predicate> ::= <UNIQUE> <Table_Subquery> rank => 0
<Normalized_Predicate> ::= <String_Value_Expression> <IS> <NOT_maybe> <NORMALIZED> rank => 0
<Match_Predicate> ::= <Row_Value_Predicand> <Match_Predicate_Part_2> rank => 0
<UNIQUE_maybe> ::= <UNIQUE> rank => 0
<UNIQUE_maybe> ::= rank => -1
<Gen1919> ::= <SIMPLE> rank => 0
            | <PARTIAL> rank => -1
            | <FULL> rank => -2
<Gen1919_maybe> ::= <Gen1919> rank => 0
<Gen1919_maybe> ::= rank => -1
<Match_Predicate_Part_2> ::= <MATCH> <UNIQUE_maybe> <Gen1919_maybe> <Table_Subquery> rank => 0
<Overlaps_Predicate> ::= <Overlaps_Predicate_Part_1> <Overlaps_Predicate_Part_2> rank => 0
<Overlaps_Predicate_Part_1> ::= <Row_Value_Predicand_1> rank => 0
<Overlaps_Predicate_Part_2> ::= <OVERLAPS> <Row_Value_Predicand_2> rank => 0
<Row_Value_Predicand_1> ::= <Row_Value_Predicand> rank => 0
<Row_Value_Predicand_2> ::= <Row_Value_Predicand> rank => 0
<Distinct_Predicate> ::= <Row_Value_Predicand_3> <Distinct_Predicate_Part_2> rank => 0
<Distinct_Predicate_Part_2> ::= <IS> <DISTINCT> <FROM> <Row_Value_Predicand_4> rank => 0
<Row_Value_Predicand_3> ::= <Row_Value_Predicand> rank => 0
<Row_Value_Predicand_4> ::= <Row_Value_Predicand> rank => 0
<Member_Predicate> ::= <Row_Value_Predicand> <Member_Predicate_Part_2> rank => 0
<OF_maybe> ::= <OF> rank => 0
<OF_maybe> ::= rank => -1
<Member_Predicate_Part_2> ::= <NOT_maybe> <MEMBER> <OF_maybe> <Multiset_Value_Expression> rank => 0
<Submultiset_Predicate> ::= <Row_Value_Predicand> <Submultiset_Predicate_Part_2> rank => 0
<Submultiset_Predicate_Part_2> ::= <NOT_maybe> <SUBMULTISET> <OF_maybe> <Multiset_Value_Expression> rank => 0
<Set_Predicate> ::= <Row_Value_Predicand> <Set_Predicate_Part_2> rank => 0
<Set_Predicate_Part_2> ::= <IS> <NOT_maybe> <A> <SET> rank => 0
<Type_Predicate> ::= <Row_Value_Predicand> <Type_Predicate_Part_2> rank => 0
<Type_Predicate_Part_2> ::= <IS> <NOT_maybe> <OF> <Left_Paren> <Type_List> <Right_Paren> rank => 0
<Gen1944> ::= <Comma> <User_Defined_Type_Specification> rank => 0
<Gen1944_any> ::= <Gen1944>* rank => 0
<Type_List> ::= <User_Defined_Type_Specification> <Gen1944_any> rank => 0
<User_Defined_Type_Specification> ::= <Inclusive_User_Defined_Type_Specification> rank => 0
                                    | <Exclusive_User_Defined_Type_Specification> rank => -1
<Inclusive_User_Defined_Type_Specification> ::= <Path_Resolved_User_Defined_Type_Name> rank => 0
<Exclusive_User_Defined_Type_Specification> ::= <ONLY> <Path_Resolved_User_Defined_Type_Name> rank => 0
<Search_Condition> ::= <Boolean_Value_Expression> rank => 0
<Interval_Qualifier> ::= <Start_Field> <TO> <End_Field> rank => 0
                       | <Single_Datetime_Field> rank => -1
<Gen1954> ::= <Left_Paren> <Interval_Leading_Field_Precision> <Right_Paren> rank => 0
<Gen1954_maybe> ::= <Gen1954> rank => 0
<Gen1954_maybe> ::= rank => -1
<Start_Field> ::= <Non_Second_Primary_Datetime_Field> <Gen1954_maybe> rank => 0
<Gen1958> ::= <Left_Paren> <Interval_Fractional_Seconds_Precision> <Right_Paren> rank => 0
<Gen1958_maybe> ::= <Gen1958> rank => 0
<Gen1958_maybe> ::= rank => -1
<End_Field> ::= <Non_Second_Primary_Datetime_Field> rank => 0
              | <SECOND> <Gen1958_maybe> rank => -1
<Gen1963> ::= <Left_Paren> <Interval_Leading_Field_Precision> <Right_Paren> rank => 0
<Gen1963_maybe> ::= <Gen1963> rank => 0
<Gen1963_maybe> ::= rank => -1
<Gen1966> ::= <Comma> <Interval_Fractional_Seconds_Precision> rank => 0
<Gen1966_maybe> ::= <Gen1966> rank => 0
<Gen1966_maybe> ::= rank => -1
<Gen1969> ::= <Left_Paren> <Interval_Leading_Field_Precision> <Gen1966_maybe> <Right_Paren> rank => 0
<Gen1969_maybe> ::= <Gen1969> rank => 0
<Gen1969_maybe> ::= rank => -1
<Single_Datetime_Field> ::= <Non_Second_Primary_Datetime_Field> <Gen1963_maybe> rank => 0
                          | <SECOND> <Gen1969_maybe> rank => -1
<Primary_Datetime_Field> ::= <Non_Second_Primary_Datetime_Field> rank => 0
                           | <SECOND> rank => -1
<Non_Second_Primary_Datetime_Field> ::= <YEAR> rank => 0
                                      | <MONTH> rank => -1
                                      | <DAY> rank => -2
                                      | <HOUR> rank => -3
                                      | <MINUTE> rank => -4
<Interval_Fractional_Seconds_Precision> ::= <Unsigned_Integer> rank => 0
<Interval_Leading_Field_Precision> ::= <Unsigned_Integer> rank => 0
<Language_Clause> ::= <LANGUAGE> <Language_Name> rank => 0
<Language_Name> ::= <ADA> rank => 0
                  | <C> rank => -1
                  | <COBOL> rank => -2
                  | <FORTRAN> rank => -3
                  | <MUMPS> rank => -4
                  | <PASCAL> rank => -5
                  | <PLI> rank => -6
                  | <SQL> rank => -7
<Path_Specification> ::= <PATH> <Schema_Name_List> rank => 0
<Gen1993> ::= <Comma> <Schema_Name> rank => 0
<Gen1993_any> ::= <Gen1993>* rank => 0
<Schema_Name_List> ::= <Schema_Name> <Gen1993_any> rank => 0
<Routine_Invocation> ::= <Routine_Name> <SQL_Argument_List> rank => 0
<Gen1997> ::= <Schema_Name> <Period> rank => 0
<Gen1997_maybe> ::= <Gen1997> rank => 0
<Gen1997_maybe> ::= rank => -1
<Routine_Name> ::= <Gen1997_maybe> <Qualified_Identifier> rank => 0
<Gen2001> ::= <Comma> <SQL_Argument> rank => 0
<Gen2001_any> ::= <Gen2001>* rank => 0
<Gen2003> ::= <SQL_Argument> <Gen2001_any> rank => 0
<Gen2003_maybe> ::= <Gen2003> rank => 0
<Gen2003_maybe> ::= rank => -1
<SQL_Argument_List> ::= <Left_Paren> <Gen2003_maybe> <Right_Paren> rank => 0
<SQL_Argument> ::= <Value_Expression> rank => 0
                 | <Generalized_Expression> rank => -1
                 | <Target_Specification> rank => -2
<Generalized_Expression> ::= <Value_Expression> <AS> <Path_Resolved_User_Defined_Type_Name> rank => 0
<Character_Set_Specification> ::= <Standard_Character_Set_Name> rank => 0
                                | <Implementation_Defined_Character_Set_Name> rank => -1
                                | <User_Defined_Character_Set_Name> rank => -2
<Standard_Character_Set_Name> ::= <Character_Set_Name> rank => 0
<Implementation_Defined_Character_Set_Name> ::= <Character_Set_Name> rank => 0
<User_Defined_Character_Set_Name> ::= <Character_Set_Name> rank => 0
<Gen2017> ::= <FOR> <Schema_Resolved_User_Defined_Type_Name> rank => 0
<Gen2017_maybe> ::= <Gen2017> rank => 0
<Gen2017_maybe> ::= rank => -1
<Specific_Routine_Designator> ::= <SPECIFIC> <Routine_Type> <Specific_Name> rank => 0
                                | <Routine_Type> <Member_Name> <Gen2017_maybe> rank => -1
<Gen2022> ::= <INSTANCE> rank => 0
            | <STATIC> rank => -1
            | <CONSTRUCTOR> rank => -2
<Gen2022_maybe> ::= <Gen2022> rank => 0
<Gen2022_maybe> ::= rank => -1
<Routine_Type> ::= <ROUTINE> rank => 0
                 | <FUNCTION> rank => -1
                 | <PROCEDURE> rank => -2
                 | <Gen2022_maybe> <METHOD> rank => -3
<Data_Type_List_maybe> ::= <Data_Type_List> rank => 0
<Data_Type_List_maybe> ::= rank => -1
<Member_Name> ::= <Member_Name_Alternatives> <Data_Type_List_maybe> rank => 0
<Member_Name_Alternatives> ::= <Schema_Qualified_Routine_Name> rank => 0
                             | <Method_Name> rank => -1
<Gen2036> ::= <Comma> <Data_Type> rank => 0
<Gen2036_any> ::= <Gen2036>* rank => 0
<Gen2038> ::= <Data_Type> <Gen2036_any> rank => 0
<Gen2038_maybe> ::= <Gen2038> rank => 0
<Gen2038_maybe> ::= rank => -1
<Data_Type_List> ::= <Left_Paren> <Gen2038_maybe> <Right_Paren> rank => 0
<Collate_Clause> ::= <COLLATE> <Collation_Name> rank => 0
<Constraint_Name_Definition> ::= <CONSTRAINT> <Constraint_Name> rank => 0
<Gen2044> ::= <NOT_maybe> <DEFERRABLE> rank => 0
<Gen2044_maybe> ::= <Gen2044> rank => 0
<Gen2044_maybe> ::= rank => -1
<Constraint_Check_Time_maybe> ::= <Constraint_Check_Time> rank => 0
<Constraint_Check_Time_maybe> ::= rank => -1
<Constraint_Characteristics> ::= <Constraint_Check_Time> <Gen2044_maybe> rank => 0
                               | <NOT_maybe> <DEFERRABLE> <Constraint_Check_Time_maybe> rank => -1
<Constraint_Check_Time> ::= <INITIALLY> <DEFERRED> rank => 0
                          | <INITIALLY> <IMMEDIATE> rank => -1
<Filter_Clause_maybe> ::= <Filter_Clause> rank => 0
<Filter_Clause_maybe> ::= rank => -1
<Aggregate_Function> ::= <COUNT> <Left_Paren> <Asterisk> <Right_Paren> <Filter_Clause_maybe> rank => 0
                       | <General_Set_Function> <Filter_Clause_maybe> rank => -1
                       | <Binary_Set_Function> <Filter_Clause_maybe> rank => -2
                       | <Ordered_Set_Function> <Filter_Clause_maybe> rank => -3
<General_Set_Function> ::= <Set_Function_Type> <Left_Paren> <Set_Quantifier_maybe> <Value_Expression> <Right_Paren> rank => 0
<Set_Function_Type> ::= <Computational_Operation> rank => 0
<Computational_Operation> ::= <AVG> rank => 0
                            | <MAX> rank => -1
                            | <MIN> rank => -2
                            | <SUM> rank => -3
                            | <EVERY> rank => -4
                            | <ANY> rank => -5
                            | <SOME> rank => -6
                            | <COUNT> rank => -7
                            | <Lex261> rank => -8
                            | <Lex262> rank => -9
                            | <Lex531> rank => -10
                            | <Lex530> rank => -11
                            | <COLLECT> rank => -12
                            | <FUSION> rank => -13
                            | <INTERSECTION> rank => -14
<Set_Quantifier> ::= <DISTINCT> rank => 0
                   | <ALL> rank => -1
<Filter_Clause> ::= <FILTER> <Left_Paren> <WHERE> <Search_Condition> <Right_Paren> rank => 0
<Binary_Set_Function> ::= <Binary_Set_Function_Type> <Left_Paren> <Dependent_Variable_Expression> <Comma> <Independent_Variable_Expression> <Right_Paren> rank => 0
<Binary_Set_Function_Type> ::= <Lex108> rank => 0
                             | <Lex109> rank => -1
                             | <CORR> rank => -2
                             | <Lex470> rank => -3
                             | <Lex468> rank => -4
                             | <Lex467> rank => -5
                             | <Lex469> rank => -6
                             | <Lex465> rank => -7
                             | <Lex466> rank => -8
                             | <Lex471> rank => -9
                             | <Lex473> rank => -10
                             | <Lex472> rank => -11
<Dependent_Variable_Expression> ::= <Numeric_Value_Expression> rank => 0
<Independent_Variable_Expression> ::= <Numeric_Value_Expression> rank => 0
<Ordered_Set_Function> ::= <Hypothetical_Set_Function> rank => 0
                         | <Inverse_Distribution_Function> rank => -1
<Hypothetical_Set_Function> ::= <Rank_Function_Type> <Left_Paren> <Hypothetical_Set_Function_Value_Expression_List> <Right_Paren> <Within_Group_Specification> rank => 0
<Within_Group_Specification> ::= <WITHIN> <GROUP> <Left_Paren> <ORDER> <BY> <Sort_Specification_List> <Right_Paren> rank => 0
<Gen2098> ::= <Comma> <Value_Expression> rank => 0
<Gen2098_any> ::= <Gen2098>* rank => 0
<Hypothetical_Set_Function_Value_Expression_List> ::= <Value_Expression> <Gen2098_any> rank => 0
<Inverse_Distribution_Function> ::= <Inverse_Distribution_Function_Type> <Left_Paren> <Inverse_Distribution_Function_Argument> <Right_Paren> <Within_Group_Specification> rank => 0
<Inverse_Distribution_Function_Argument> ::= <Numeric_Value_Expression> rank => 0
<Inverse_Distribution_Function_Type> ::= <Lex211> rank => 0
                                       | <Lex212> rank => -1
<Gen2105> ::= <Comma> <Sort_Specification> rank => 0
<Gen2105_any> ::= <Gen2105>* rank => 0
<Sort_Specification_List> ::= <Sort_Specification> <Gen2105_any> rank => 0
<Ordering_Specification_maybe> ::= <Ordering_Specification> rank => 0
<Ordering_Specification_maybe> ::= rank => -1
<Null_Ordering_maybe> ::= <Null_Ordering> rank => 0
<Null_Ordering_maybe> ::= rank => -1
<Sort_Specification> ::= <Sort_Key> <Ordering_Specification_maybe> <Null_Ordering_maybe> rank => 0
<Sort_Key> ::= <Value_Expression> rank => 0
<Ordering_Specification> ::= <ASC> rank => 0
                           | <DESC> rank => -1
<Null_Ordering> ::= <NULLS> <FIRST> rank => 0
                  | <NULLS> <LAST> rank => -1
<Schema_Character_Set_Or_Path_maybe> ::= <Schema_Character_Set_Or_Path> rank => 0
<Schema_Character_Set_Or_Path_maybe> ::= rank => -1
<Schema_Element_any> ::= <Schema_Element>* rank => 0
<Schema_Definition> ::= <CREATE> <SCHEMA> <Schema_Name_Clause> <Schema_Character_Set_Or_Path_maybe> <Schema_Element_any> rank => 0
<Schema_Character_Set_Or_Path> ::= <Schema_Character_Set_Specification> rank => 0
                                 | <Schema_Path_Specification> rank => -1
                                 | <Schema_Character_Set_Specification> <Schema_Path_Specification> rank => -2
                                 | <Schema_Path_Specification> <Schema_Character_Set_Specification> rank => -3
<Schema_Name_Clause> ::= <Schema_Name> rank => 0
                       | <AUTHORIZATION> <Schema_Authorization_Identifier> rank => -1
                       | <Schema_Name> <AUTHORIZATION> <Schema_Authorization_Identifier> rank => -2
<Schema_Authorization_Identifier> ::= <Authorization_Identifier> rank => 0
<Schema_Character_Set_Specification> ::= <DEFAULT> <CHARACTER> <SET> <Character_Set_Specification> rank => 0
<Schema_Path_Specification> ::= <Path_Specification> rank => 0
<Schema_Element> ::= <Table_Definition> rank => 0
                   | <View_Definition> rank => -1
                   | <Domain_Definition> rank => -2
                   | <Character_Set_Definition> rank => -3
                   | <Collation_Definition> rank => -4
                   | <Transliteration_Definition> rank => -5
                   | <Assertion_Definition> rank => -6
                   | <Trigger_Definition> rank => -7
                   | <User_Defined_Type_Definition> rank => -8
                   | <User_Defined_Cast_Definition> rank => -9
                   | <User_Defined_Ordering_Definition> rank => -10
                   | <Transform_Definition> rank => -11
                   | <Schema_Routine> rank => -12
                   | <Sequence_Generator_Definition> rank => -13
                   | <Grant_Statement> rank => -14
                   | <Role_Definition> rank => -15
<Drop_Schema_Statement> ::= <DROP> <SCHEMA> <Schema_Name> <Drop_Behavior> rank => 0
<Drop_Behavior> ::= <CASCADE> rank => 0
                  | <RESTRICT> rank => -1
<Table_Scope_maybe> ::= <Table_Scope> rank => 0
<Table_Scope_maybe> ::= rank => -1
<Gen2153> ::= <ON> <COMMIT> <Table_Commit_Action> <ROWS> rank => 0
<Gen2153_maybe> ::= <Gen2153> rank => 0
<Gen2153_maybe> ::= rank => -1
<Table_Definition> ::= <CREATE> <Table_Scope_maybe> <TABLE> <Table_Name> <Table_Contents_Source> <Gen2153_maybe> rank => 0
<Subtable_Clause_maybe> ::= <Subtable_Clause> rank => 0
<Subtable_Clause_maybe> ::= rank => -1
<Table_Element_List_maybe> ::= <Table_Element_List> rank => 0
<Table_Element_List_maybe> ::= rank => -1
<Table_Contents_Source> ::= <Table_Element_List> rank => 0
                          | <OF> <Path_Resolved_User_Defined_Type_Name> <Subtable_Clause_maybe> <Table_Element_List_maybe> rank => -1
                          | <As_Subquery_Clause> rank => -2
<Table_Scope> ::= <Global_Or_Local> <TEMPORARY> rank => 0
<Global_Or_Local> ::= <GLOBAL> rank => 0
                    | <LOCAL> rank => -1
<Table_Commit_Action> ::= <PRESERVE> rank => 0
                        | <DELETE> rank => -1
<Gen2169> ::= <Comma> <Table_Element> rank => 0
<Gen2169_any> ::= <Gen2169>* rank => 0
<Table_Element_List> ::= <Left_Paren> <Table_Element> <Gen2169_any> <Right_Paren> rank => 0
<Table_Element> ::= <Column_Definition> rank => 0
                  | <Table_Constraint_Definition> rank => -1
                  | <Like_Clause> rank => -2
                  | <Self_Referencing_Column_Specification> rank => -3
                  | <Column_Options> rank => -4
<Self_Referencing_Column_Specification> ::= <REF> <IS> <Self_Referencing_Column_Name> <Reference_Generation> rank => 0
<Reference_Generation> ::= <SYSTEM> <GENERATED> rank => 0
                         | <USER> <GENERATED> rank => -1
                         | <DERIVED> rank => -2
<Self_Referencing_Column_Name> ::= <Column_Name> rank => 0
<Column_Options> ::= <Column_Name> <WITH> <OPTIONS> <Column_Option_List> rank => 0
<Default_Clause_maybe> ::= <Default_Clause> rank => 0
<Default_Clause_maybe> ::= rank => -1
<Column_Constraint_Definition_any> ::= <Column_Constraint_Definition>* rank => 0
<Column_Option_List> ::= <Scope_Clause_maybe> <Default_Clause_maybe> <Column_Constraint_Definition_any> rank => 0
<Subtable_Clause> ::= <UNDER> <Supertable_Clause> rank => 0
<Supertable_Clause> ::= <Supertable_Name> rank => 0
<Supertable_Name> ::= <Table_Name> rank => 0
<Like_Options_maybe> ::= <Like_Options> rank => 0
<Like_Options_maybe> ::= rank => -1
<Like_Clause> ::= <LIKE> <Table_Name> <Like_Options_maybe> rank => 0
<Like_Options> ::= <Identity_Option> rank => 0
                 | <Column_Default_Option> rank => -1
<Identity_Option> ::= <INCLUDING> <IDENTITY> rank => 0
                    | <EXCLUDING> <IDENTITY> rank => -1
<Column_Default_Option> ::= <INCLUDING> <DEFAULTS> rank => 0
                          | <EXCLUDING> <DEFAULTS> rank => -1
<Gen2199> ::= <Left_Paren> <Column_Name_List> <Right_Paren> rank => 0
<Gen2199_maybe> ::= <Gen2199> rank => 0
<Gen2199_maybe> ::= rank => -1
<As_Subquery_Clause> ::= <Gen2199_maybe> <AS> <Subquery> <With_Or_Without_Data> rank => 0
<With_Or_Without_Data> ::= <WITH> <NO> <DATA> rank => 0
                         | <WITH> <DATA> rank => -1
<Gen2205> ::= <Data_Type> rank => 0
            | <Domain_Name> rank => -1
<Gen2205_maybe> ::= <Gen2205> rank => 0
<Gen2205_maybe> ::= rank => -1
<Gen2209> ::= <Default_Clause> rank => 0
            | <Identity_Column_Specification> rank => -1
            | <Generation_Clause> rank => -2
<Gen2209_maybe> ::= <Gen2209> rank => 0
<Gen2209_maybe> ::= rank => -1
<Column_Definition> ::= <Column_Name> <Gen2205_maybe> <Reference_Scope_Check_maybe> <Gen2209_maybe> <Column_Constraint_Definition_any> <Collate_Clause_maybe> rank => 0
<Constraint_Name_Definition_maybe> ::= <Constraint_Name_Definition> rank => 0
<Constraint_Name_Definition_maybe> ::= rank => -1
<Constraint_Characteristics_maybe> ::= <Constraint_Characteristics> rank => 0
<Constraint_Characteristics_maybe> ::= rank => -1
<Column_Constraint_Definition> ::= <Constraint_Name_Definition_maybe> <Column_Constraint> <Constraint_Characteristics_maybe> rank => 0
<Column_Constraint> ::= <NOT> <NULL> rank => 0
                      | <Unique_Specification> rank => -1
                      | <References_Specification> rank => -2
                      | <Check_Constraint_Definition> rank => -3
<Gen2224> ::= <ON> <DELETE> <Reference_Scope_Check_Action> rank => 0
<Gen2224_maybe> ::= <Gen2224> rank => 0
<Gen2224_maybe> ::= rank => -1
<Reference_Scope_Check> ::= <REFERENCES> <ARE> <NOT_maybe> <CHECKED> <Gen2224_maybe> rank => 0
<Reference_Scope_Check_Action> ::= <Referential_Action> rank => 0
<Gen2229> ::= <ALWAYS> rank => 0
            | <BY> <DEFAULT> rank => -1
<Gen2231> ::= <Left_Paren> <Common_Sequence_Generator_Options> <Right_Paren> rank => 0
<Gen2231_maybe> ::= <Gen2231> rank => 0
<Gen2231_maybe> ::= rank => -1
<Identity_Column_Specification> ::= <GENERATED> <Gen2229> <AS> <IDENTITY> <Gen2231_maybe> rank => 0
<Generation_Clause> ::= <Generation_Rule> <AS> <Generation_Expression> rank => 0
<Generation_Rule> ::= <GENERATED> <ALWAYS> rank => 0
<Generation_Expression> ::= <Left_Paren> <Value_Expression> <Right_Paren> rank => 0
<Default_Clause> ::= <DEFAULT> <Default_Option> rank => 0
<Default_Option> ::= <Literal> rank => 0
                   | <Datetime_Value_Function> rank => -1
                   | <USER> rank => -2
                   | <Lex348> rank => -3
                   | <Lex344> rank => -4
                   | <Lex490> rank => -5
                   | <Lex506> rank => -6
                   | <Lex343> rank => -7
                   | <Implicitly_Typed_Value_Specification> rank => -8
<Table_Constraint_Definition> ::= <Constraint_Name_Definition_maybe> <Table_Constraint> <Constraint_Characteristics_maybe> rank => 0
<Table_Constraint> ::= <Unique_Constraint_Definition> rank => 0
                     | <Referential_Constraint_Definition> rank => -1
                     | <Check_Constraint_Definition> rank => -2
<Gen2252> ::= <VALUE> rank => 0
<Unique_Constraint_Definition> ::= <Unique_Specification> <Left_Paren> <Unique_Column_List> <Right_Paren> rank => 0
                                 | <UNIQUE> <Gen2252> rank => -1
<Unique_Specification> ::= <UNIQUE> rank => 0
                         | <PRIMARY> <KEY> rank => -1
<Unique_Column_List> ::= <Column_Name_List> rank => 0
<Referential_Constraint_Definition> ::= <FOREIGN> <KEY> <Left_Paren> <Referencing_Columns> <Right_Paren> <References_Specification> rank => 0
<Gen2259> ::= <MATCH> <Match_Type> rank => 0
<Gen2259_maybe> ::= <Gen2259> rank => 0
<Gen2259_maybe> ::= rank => -1
<Referential_Triggered_Action_maybe> ::= <Referential_Triggered_Action> rank => 0
<Referential_Triggered_Action_maybe> ::= rank => -1
<References_Specification> ::= <REFERENCES> <Referenced_Table_And_Columns> <Gen2259_maybe> <Referential_Triggered_Action_maybe> rank => 0
<Match_Type> ::= <FULL> rank => 0
               | <PARTIAL> rank => -1
               | <SIMPLE> rank => -2
<Referencing_Columns> ::= <Reference_Column_List> rank => 0
<Gen2269> ::= <Left_Paren> <Reference_Column_List> <Right_Paren> rank => 0
<Gen2269_maybe> ::= <Gen2269> rank => 0
<Gen2269_maybe> ::= rank => -1
<Referenced_Table_And_Columns> ::= <Table_Name> <Gen2269_maybe> rank => 0
<Reference_Column_List> ::= <Column_Name_List> rank => 0
<Delete_Rule_maybe> ::= <Delete_Rule> rank => 0
<Delete_Rule_maybe> ::= rank => -1
<Update_Rule_maybe> ::= <Update_Rule> rank => 0
<Update_Rule_maybe> ::= rank => -1
<Referential_Triggered_Action> ::= <Update_Rule> <Delete_Rule_maybe> rank => 0
                                 | <Delete_Rule> <Update_Rule_maybe> rank => -1
<Update_Rule> ::= <ON> <UPDATE> <Referential_Action> rank => 0
<Delete_Rule> ::= <ON> <DELETE> <Referential_Action> rank => 0
<Referential_Action> ::= <CASCADE> rank => 0
                       | <SET> <NULL> rank => -1
                       | <SET> <DEFAULT> rank => -2
                       | <RESTRICT> rank => -3
                       | <NO> <ACTION> rank => -4
<Check_Constraint_Definition> ::= <CHECK> <Left_Paren> <Search_Condition> <Right_Paren> rank => 0
<Alter_Table_Statement> ::= <ALTER> <TABLE> <Table_Name> <Alter_Table_Action> rank => 0
<Alter_Table_Action> ::= <Add_Column_Definition> rank => 0
                       | <Alter_Column_Definition> rank => -1
                       | <Drop_Column_Definition> rank => -2
                       | <Add_Table_Constraint_Definition> rank => -3
                       | <Drop_Table_Constraint_Definition> rank => -4
<COLUMN_maybe> ::= <COLUMN> rank => 0
<COLUMN_maybe> ::= rank => -1
<Add_Column_Definition> ::= <ADD> <COLUMN_maybe> <Column_Definition> rank => 0
<Alter_Column_Definition> ::= <ALTER> <COLUMN_maybe> <Column_Name> <Alter_Column_Action> rank => 0
<Alter_Column_Action> ::= <Set_Column_Default_Clause> rank => 0
                        | <Drop_Column_Default_Clause> rank => -1
                        | <Add_Column_Scope_Clause> rank => -2
                        | <Drop_Column_Scope_Clause> rank => -3
                        | <Alter_Identity_Column_Specification> rank => -4
<Set_Column_Default_Clause> ::= <SET> <Default_Clause> rank => 0
<Drop_Column_Default_Clause> ::= <DROP> <DEFAULT> rank => 0
<Add_Column_Scope_Clause> ::= <ADD> <Scope_Clause> rank => 0
<Drop_Column_Scope_Clause> ::= <DROP> <SCOPE> <Drop_Behavior> rank => 0
<Alter_Identity_Column_Option_many> ::= <Alter_Identity_Column_Option>+ rank => 0
<Alter_Identity_Column_Specification> ::= <Alter_Identity_Column_Option_many> rank => 0
<Alter_Identity_Column_Option> ::= <Alter_Sequence_Generator_Restart_Option> rank => 0
                                 | <SET> <Basic_Sequence_Generator_Option> rank => -1
<Drop_Column_Definition> ::= <DROP> <COLUMN_maybe> <Column_Name> <Drop_Behavior> rank => 0
<Add_Table_Constraint_Definition> ::= <ADD> <Table_Constraint_Definition> rank => 0
<Drop_Table_Constraint_Definition> ::= <DROP> <CONSTRAINT> <Constraint_Name> <Drop_Behavior> rank => 0
<Drop_Table_Statement> ::= <DROP> <TABLE> <Table_Name> <Drop_Behavior> rank => 0
<Levels_Clause_maybe> ::= <Levels_Clause> rank => 0
<Levels_Clause_maybe> ::= rank => -1
<Gen2317> ::= <WITH> <Levels_Clause_maybe> <CHECK> <OPTION> rank => 0
<Gen2317_maybe> ::= <Gen2317> rank => 0
<Gen2317_maybe> ::= rank => -1
<View_Definition> ::= <CREATE> <RECURSIVE_maybe> <VIEW> <Table_Name> <View_Specification> <AS> <Query_Expression> <Gen2317_maybe> rank => 0
<View_Specification> ::= <Regular_View_Specification> rank => 0
                       | <Referenceable_View_Specification> rank => -1
<Gen2323> ::= <Left_Paren> <View_Column_List> <Right_Paren> rank => 0
<Gen2323_maybe> ::= <Gen2323> rank => 0
<Gen2323_maybe> ::= rank => -1
<Regular_View_Specification> ::= <Gen2323_maybe> rank => 0
<Subview_Clause_maybe> ::= <Subview_Clause> rank => 0
<Subview_Clause_maybe> ::= rank => -1
<View_Element_List_maybe> ::= <View_Element_List> rank => 0
<View_Element_List_maybe> ::= rank => -1
<Referenceable_View_Specification> ::= <OF> <Path_Resolved_User_Defined_Type_Name> <Subview_Clause_maybe> <View_Element_List_maybe> rank => 0
<Subview_Clause> ::= <UNDER> <Table_Name> rank => 0
<Gen2333> ::= <Comma> <View_Element> rank => 0
<Gen2333_any> ::= <Gen2333>* rank => 0
<View_Element_List> ::= <Left_Paren> <View_Element> <Gen2333_any> <Right_Paren> rank => 0
<View_Element> ::= <Self_Referencing_Column_Specification> rank => 0
                 | <View_Column_Option> rank => -1
<View_Column_Option> ::= <Column_Name> <WITH> <OPTIONS> <Scope_Clause> rank => 0
<Levels_Clause> ::= <CASCADED> rank => 0
                  | <LOCAL> rank => -1
<View_Column_List> ::= <Column_Name_List> rank => 0
<Drop_View_Statement> ::= <DROP> <VIEW> <Table_Name> <Drop_Behavior> rank => 0
<Domain_Constraint_any> ::= <Domain_Constraint>* rank => 0
<Domain_Definition> ::= <CREATE> <DOMAIN> <Domain_Name> <AS_maybe> <Data_Type> <Default_Clause_maybe> <Domain_Constraint_any> <Collate_Clause_maybe> rank => 0
<Domain_Constraint> ::= <Constraint_Name_Definition_maybe> <Check_Constraint_Definition> <Constraint_Characteristics_maybe> rank => 0
<Alter_Domain_Statement> ::= <ALTER> <DOMAIN> <Domain_Name> <Alter_Domain_Action> rank => 0
<Alter_Domain_Action> ::= <Set_Domain_Default_Clause> rank => 0
                        | <Drop_Domain_Default_Clause> rank => -1
                        | <Add_Domain_Constraint_Definition> rank => -2
                        | <Drop_Domain_Constraint_Definition> rank => -3
<Set_Domain_Default_Clause> ::= <SET> <Default_Clause> rank => 0
<Drop_Domain_Default_Clause> ::= <DROP> <DEFAULT> rank => 0
<Add_Domain_Constraint_Definition> ::= <ADD> <Domain_Constraint> rank => 0
<Drop_Domain_Constraint_Definition> ::= <DROP> <CONSTRAINT> <Constraint_Name> rank => 0
<Drop_Domain_Statement> ::= <DROP> <DOMAIN> <Domain_Name> <Drop_Behavior> rank => 0
<Character_Set_Definition> ::= <CREATE> <CHARACTER> <SET> <Character_Set_Name> <AS_maybe> <Character_Set_Source> <Collate_Clause_maybe> rank => 0
<Character_Set_Source> ::= <GET> <Character_Set_Specification> rank => 0
<Drop_Character_Set_Statement> ::= <DROP> <CHARACTER> <SET> <Character_Set_Name> rank => 0
<Pad_Characteristic_maybe> ::= <Pad_Characteristic> rank => 0
<Pad_Characteristic_maybe> ::= rank => -1
<Collation_Definition> ::= <CREATE> <COLLATION> <Collation_Name> <FOR> <Character_Set_Specification> <FROM> <Existing_Collation_Name> <Pad_Characteristic_maybe> rank => 0
<Existing_Collation_Name> ::= <Collation_Name> rank => 0
<Pad_Characteristic> ::= <NO> <PAD> rank => 0
                       | <PAD> <SPACE> rank => -1
<Drop_Collation_Statement> ::= <DROP> <COLLATION> <Collation_Name> <Drop_Behavior> rank => 0
<Transliteration_Definition> ::= <CREATE> <TRANSLATION> <Transliteration_Name> <FOR> <Source_Character_Set_Specification> <TO> <Target_Character_Set_Specification> <FROM> <Transliteration_Source> rank => 0
<Source_Character_Set_Specification> ::= <Character_Set_Specification> rank => 0
<Target_Character_Set_Specification> ::= <Character_Set_Specification> rank => 0
<Transliteration_Source> ::= <Existing_Transliteration_Name> rank => 0
                           | <Transliteration_Routine> rank => -1
<Existing_Transliteration_Name> ::= <Transliteration_Name> rank => 0
<Transliteration_Routine> ::= <Specific_Routine_Designator> rank => 0
<Drop_Transliteration_Statement> ::= <DROP> <TRANSLATION> <Transliteration_Name> rank => 0
<Assertion_Definition> ::= <CREATE> <ASSERTION> <Constraint_Name> <CHECK> <Left_Paren> <Search_Condition> <Right_Paren> <Constraint_Characteristics_maybe> rank => 0
<Drop_Assertion_Statement> ::= <DROP> <ASSERTION> <Constraint_Name> rank => 0
<Gen2376> ::= <REFERENCING> <Old_Or_New_Values_Alias_List> rank => 0
<Gen2376_maybe> ::= <Gen2376> rank => 0
<Gen2376_maybe> ::= rank => -1
<Trigger_Definition> ::= <CREATE> <TRIGGER> <Trigger_Name> <Trigger_Action_Time> <Trigger_Event> <ON> <Table_Name> <Gen2376_maybe> <Triggered_Action> rank => 0
<Trigger_Action_Time> ::= <BEFORE> rank => 0
                        | <AFTER> rank => -1
<Gen2382> ::= <OF> <Trigger_Column_List> rank => 0
<Gen2382_maybe> ::= <Gen2382> rank => 0
<Gen2382_maybe> ::= rank => -1
<Trigger_Event> ::= <INSERT> rank => 0
                  | <DELETE> rank => -1
                  | <UPDATE> <Gen2382_maybe> rank => -2
<Trigger_Column_List> ::= <Column_Name_List> rank => 0
<Gen2389> ::= <ROW> rank => 0
            | <STATEMENT> rank => -1
<Gen2391> ::= <FOR> <EACH> <Gen2389> rank => 0
<Gen2391_maybe> ::= <Gen2391> rank => 0
<Gen2391_maybe> ::= rank => -1
<Gen2394> ::= <WHEN> <Left_Paren> <Search_Condition> <Right_Paren> rank => 0
<Gen2394_maybe> ::= <Gen2394> rank => 0
<Gen2394_maybe> ::= rank => -1
<Triggered_Action> ::= <Gen2391_maybe> <Gen2394_maybe> <Triggered_SQL_Statement> rank => 0
<Gen2398> ::= <SQL_Procedure_Statement> <Semicolon> rank => 0
<Gen2398_many> ::= <Gen2398>+ rank => 0
<Triggered_SQL_Statement> ::= <SQL_Procedure_Statement> rank => 0
                            | <BEGIN> <ATOMIC> <Gen2398_many> <END> rank => -1
<Old_Or_New_Values_Alias_many> ::= <Old_Or_New_Values_Alias>+ rank => 0
<Old_Or_New_Values_Alias_List> ::= <Old_Or_New_Values_Alias_many> rank => 0
<ROW_maybe> ::= <ROW> rank => 0
<ROW_maybe> ::= rank => -1
<Old_Or_New_Values_Alias> ::= <OLD> <ROW_maybe> <AS_maybe> <Old_Values_Correlation_Name> rank => 0
                            | <NEW> <ROW_maybe> <AS_maybe> <New_Values_Correlation_Name> rank => -1
                            | <OLD> <TABLE> <AS_maybe> <Old_Values_Table_Alias> rank => -2
                            | <NEW> <TABLE> <AS_maybe> <New_Values_Table_Alias> rank => -3
<Old_Values_Table_Alias> ::= <Identifier> rank => 0
<New_Values_Table_Alias> ::= <Identifier> rank => 0
<Old_Values_Correlation_Name> ::= <Correlation_Name> rank => 0
<New_Values_Correlation_Name> ::= <Correlation_Name> rank => 0
<Drop_Trigger_Statement> ::= <DROP> <TRIGGER> <Trigger_Name> rank => 0
<User_Defined_Type_Definition> ::= <CREATE> <TYPE> <User_Defined_Type_Body> rank => 0
<Subtype_Clause_maybe> ::= <Subtype_Clause> rank => 0
<Subtype_Clause_maybe> ::= rank => -1
<Gen2418> ::= <AS> <Representation> rank => 0
<Gen2418_maybe> ::= <Gen2418> rank => 0
<Gen2418_maybe> ::= rank => -1
<User_Defined_Type_Option_List_maybe> ::= <User_Defined_Type_Option_List> rank => 0
<User_Defined_Type_Option_List_maybe> ::= rank => -1
<Method_Specification_List_maybe> ::= <Method_Specification_List> rank => 0
<Method_Specification_List_maybe> ::= rank => -1
<User_Defined_Type_Body> ::= <Schema_Resolved_User_Defined_Type_Name> <Subtype_Clause_maybe> <Gen2418_maybe> <User_Defined_Type_Option_List_maybe> <Method_Specification_List_maybe> rank => 0
<User_Defined_Type_Option_any> ::= <User_Defined_Type_Option>* rank => 0
<User_Defined_Type_Option_List> ::= <User_Defined_Type_Option> <User_Defined_Type_Option_any> rank => 0
<User_Defined_Type_Option> ::= <Instantiable_Clause> rank => 0
                             | <Finality> rank => -1
                             | <Reference_Type_Specification> rank => -2
                             | <Ref_Cast_Option> rank => -3
                             | <Cast_Option> rank => -4
<Subtype_Clause> ::= <UNDER> <Supertype_Name> rank => 0
<Supertype_Name> ::= <Path_Resolved_User_Defined_Type_Name> rank => 0
<Representation> ::= <Predefined_Type> rank => 0
                   | <Member_List> rank => -1
<Gen2437> ::= <Comma> <Member> rank => 0
<Gen2437_any> ::= <Gen2437>* rank => 0
<Member_List> ::= <Left_Paren> <Member> <Gen2437_any> <Right_Paren> rank => 0
<Member> ::= <Attribute_Definition> rank => 0
<Instantiable_Clause> ::= <INSTANTIABLE> rank => 0
                        | <NOT> <INSTANTIABLE> rank => -1
<Finality> ::= <FINAL> rank => 0
             | <NOT> <FINAL> rank => -1
<Reference_Type_Specification> ::= <User_Defined_Representation> rank => 0
                                 | <Derived_Representation> rank => -1
                                 | <System_Generated_Representation> rank => -2
<User_Defined_Representation> ::= <REF> <USING> <Predefined_Type> rank => 0
<Derived_Representation> ::= <REF> <FROM> <List_Of_Attributes> rank => 0
<System_Generated_Representation> ::= <REF> <IS> <SYSTEM> <GENERATED> rank => 0
<Cast_To_Type_maybe> ::= <Cast_To_Type> rank => 0
<Cast_To_Type_maybe> ::= rank => -1
<Ref_Cast_Option> ::= <Cast_To_Ref> <Cast_To_Type_maybe> rank => 0
                    | <Cast_To_Type> rank => -1
<Cast_To_Ref> ::= <CAST> <Left_Paren> <SOURCE> <AS> <REF> <Right_Paren> <WITH> <Cast_To_Ref_Identifier> rank => 0
<Cast_To_Ref_Identifier> ::= <Identifier> rank => 0
<Cast_To_Type> ::= <CAST> <Left_Paren> <REF> <AS> <SOURCE> <Right_Paren> <WITH> <Cast_To_Type_Identifier> rank => 0
<Cast_To_Type_Identifier> ::= <Identifier> rank => 0
<Gen2459> ::= <Comma> <Attribute_Name> rank => 0
<Gen2459_any> ::= <Gen2459>* rank => 0
<List_Of_Attributes> ::= <Left_Paren> <Attribute_Name> <Gen2459_any> <Right_Paren> rank => 0
<Cast_To_Distinct_maybe> ::= <Cast_To_Distinct> rank => 0
<Cast_To_Distinct_maybe> ::= rank => -1
<Cast_Option> ::= <Cast_To_Distinct_maybe> <Cast_To_Source> rank => 0
                | <Cast_To_Source> rank => -1
<Cast_To_Distinct> ::= <CAST> <Left_Paren> <SOURCE> <AS> <DISTINCT> <Right_Paren> <WITH> <Cast_To_Distinct_Identifier> rank => 0
<Cast_To_Distinct_Identifier> ::= <Identifier> rank => 0
<Cast_To_Source> ::= <CAST> <Left_Paren> <DISTINCT> <AS> <SOURCE> <Right_Paren> <WITH> <Cast_To_Source_Identifier> rank => 0
<Cast_To_Source_Identifier> ::= <Identifier> rank => 0
<Gen2470> ::= <Comma> <Method_Specification> rank => 0
<Gen2470_any> ::= <Gen2470>* rank => 0
<Method_Specification_List> ::= <Method_Specification> <Gen2470_any> rank => 0
<Method_Specification> ::= <Original_Method_Specification> rank => 0
                         | <Overriding_Method_Specification> rank => -1
<Gen2475> ::= <SELF> <AS> <RESULT> rank => 0
<Gen2475_maybe> ::= <Gen2475> rank => 0
<Gen2475_maybe> ::= rank => -1
<Gen2478> ::= <SELF> <AS> <LOCATOR> rank => 0
<Gen2478_maybe> ::= <Gen2478> rank => 0
<Gen2478_maybe> ::= rank => -1
<Method_Characteristics_maybe> ::= <Method_Characteristics> rank => 0
<Method_Characteristics_maybe> ::= rank => -1
<Original_Method_Specification> ::= <Partial_Method_Specification> <Gen2475_maybe> <Gen2478_maybe> <Method_Characteristics_maybe> rank => 0
<Overriding_Method_Specification> ::= <OVERRIDING> <Partial_Method_Specification> rank => 0
<Gen2485> ::= <INSTANCE> rank => 0
            | <STATIC> rank => -1
            | <CONSTRUCTOR> rank => -2
<Gen2485_maybe> ::= <Gen2485> rank => 0
<Gen2485_maybe> ::= rank => -1
<Gen2490> ::= <SPECIFIC> <Specific_Method_Name> rank => 0
<Gen2490_maybe> ::= <Gen2490> rank => 0
<Gen2490_maybe> ::= rank => -1
<Partial_Method_Specification> ::= <Gen2485_maybe> <METHOD> <Method_Name> <SQL_Parameter_Declaration_List> <Returns_Clause> <Gen2490_maybe> rank => 0
<Gen2494> ::= <Schema_Name> <Period> rank => 0
<Gen2494_maybe> ::= <Gen2494> rank => 0
<Gen2494_maybe> ::= rank => -1
<Specific_Method_Name> ::= <Gen2494_maybe> <Qualified_Identifier> rank => 0
<Method_Characteristic_many> ::= <Method_Characteristic>+ rank => 0
<Method_Characteristics> ::= <Method_Characteristic_many> rank => 0
<Method_Characteristic> ::= <Language_Clause> rank => 0
                          | <Parameter_Style_Clause> rank => -1
                          | <Deterministic_Characteristic> rank => -2
                          | <SQL_Data_Access_Indication> rank => -3
                          | <Null_Call_Clause> rank => -4
<Attribute_Default_maybe> ::= <Attribute_Default> rank => 0
<Attribute_Default_maybe> ::= rank => -1
<Attribute_Definition> ::= <Attribute_Name> <Data_Type> <Reference_Scope_Check_maybe> <Attribute_Default_maybe> <Collate_Clause_maybe> rank => 0
<Attribute_Default> ::= <Default_Clause> rank => 0
<Alter_Type_Statement> ::= <ALTER> <TYPE> <Schema_Resolved_User_Defined_Type_Name> <Alter_Type_Action> rank => 0
<Alter_Type_Action> ::= <Add_Attribute_Definition> rank => 0
                      | <Drop_Attribute_Definition> rank => -1
                      | <Add_Original_Method_Specification> rank => -2
                      | <Add_Overriding_Method_Specification> rank => -3
                      | <Drop_Method_Specification> rank => -4
<Add_Attribute_Definition> ::= <ADD> <ATTRIBUTE> <Attribute_Definition> rank => 0
<Drop_Attribute_Definition> ::= <DROP> <ATTRIBUTE> <Attribute_Name> <RESTRICT> rank => 0
<Add_Original_Method_Specification> ::= <ADD> <Original_Method_Specification> rank => 0
<Add_Overriding_Method_Specification> ::= <ADD> <Overriding_Method_Specification> rank => 0
<Drop_Method_Specification> ::= <DROP> <Specific_Method_Specification_Designator> <RESTRICT> rank => 0
<Gen2520> ::= <INSTANCE> rank => 0
            | <STATIC> rank => -1
            | <CONSTRUCTOR> rank => -2
<Gen2520_maybe> ::= <Gen2520> rank => 0
<Gen2520_maybe> ::= rank => -1
<Specific_Method_Specification_Designator> ::= <Gen2520_maybe> <METHOD> <Method_Name> <Data_Type_List> rank => 0
<Drop_Data_Type_Statement> ::= <DROP> <TYPE> <Schema_Resolved_User_Defined_Type_Name> <Drop_Behavior> rank => 0
<SQL_Invoked_Routine> ::= <Schema_Routine> rank => 0
<Schema_Routine> ::= <Schema_Procedure> rank => 0
                   | <Schema_Function> rank => -1
<Schema_Procedure> ::= <CREATE> <SQL_Invoked_Procedure> rank => 0
<Schema_Function> ::= <CREATE> <SQL_Invoked_Function> rank => 0
<SQL_Invoked_Procedure> ::= <PROCEDURE> <Schema_Qualified_Routine_Name> <SQL_Parameter_Declaration_List> <Routine_Characteristics> <Routine_Body> rank => 0
<Gen2533> ::= <Function_Specification> rank => 0
            | <Method_Specification_Designator> rank => -1
<SQL_Invoked_Function> ::= <Gen2533> <Routine_Body> rank => 0
<Gen2536> ::= <Comma> <SQL_Parameter_Declaration> rank => 0
<Gen2536_any> ::= <Gen2536>* rank => 0
<Gen2538> ::= <SQL_Parameter_Declaration> <Gen2536_any> rank => 0
<Gen2538_maybe> ::= <Gen2538> rank => 0
<Gen2538_maybe> ::= rank => -1
<SQL_Parameter_Declaration_List> ::= <Left_Paren> <Gen2538_maybe> <Right_Paren> rank => 0
<Parameter_Mode_maybe> ::= <Parameter_Mode> rank => 0
<Parameter_Mode_maybe> ::= rank => -1
<SQL_Parameter_Name_maybe> ::= <SQL_Parameter_Name> rank => 0
<SQL_Parameter_Name_maybe> ::= rank => -1
<RESULT_maybe> ::= <RESULT> rank => 0
<RESULT_maybe> ::= rank => -1
<SQL_Parameter_Declaration> ::= <Parameter_Mode_maybe> <SQL_Parameter_Name_maybe> <Parameter_Type> <RESULT_maybe> rank => 0
<Parameter_Mode> ::= <IN> rank => 0
                   | <OUT> rank => -1
                   | <INOUT> rank => -2
<Locator_Indication_maybe> ::= <Locator_Indication> rank => 0
<Locator_Indication_maybe> ::= rank => -1
<Parameter_Type> ::= <Data_Type> <Locator_Indication_maybe> rank => 0
<Locator_Indication> ::= <AS> <LOCATOR> rank => 0
<Dispatch_Clause_maybe> ::= <Dispatch_Clause> rank => 0
<Dispatch_Clause_maybe> ::= rank => -1
<Function_Specification> ::= <FUNCTION> <Schema_Qualified_Routine_Name> <SQL_Parameter_Declaration_List> <Returns_Clause> <Routine_Characteristics> <Dispatch_Clause_maybe> rank => 0
<Gen2559> ::= <INSTANCE> rank => 0
            | <STATIC> rank => -1
            | <CONSTRUCTOR> rank => -2
<Gen2559_maybe> ::= <Gen2559> rank => 0
<Gen2559_maybe> ::= rank => -1
<Returns_Clause_maybe> ::= <Returns_Clause> rank => 0
<Returns_Clause_maybe> ::= rank => -1
<Method_Specification_Designator> ::= <SPECIFIC> <METHOD> <Specific_Method_Name> rank => 0
                                    | <Gen2559_maybe> <METHOD> <Method_Name> <SQL_Parameter_Declaration_List> <Returns_Clause_maybe> <FOR> <Schema_Resolved_User_Defined_Type_Name> rank => -1
<Routine_Characteristic_any> ::= <Routine_Characteristic>* rank => 0
<Routine_Characteristics> ::= <Routine_Characteristic_any> rank => 0
<Routine_Characteristic> ::= <Language_Clause> rank => 0
                           | <Parameter_Style_Clause> rank => -1
                           | <SPECIFIC> <Specific_Name> rank => -2
                           | <Deterministic_Characteristic> rank => -3
                           | <SQL_Data_Access_Indication> rank => -4
                           | <Null_Call_Clause> rank => -5
                           | <Dynamic_Result_Sets_Characteristic> rank => -6
                           | <Savepoint_Level_Indication> rank => -7
<Savepoint_Level_Indication> ::= <NEW> <SAVEPOINT> <LEVEL> rank => 0
                               | <OLD> <SAVEPOINT> <LEVEL> rank => -1
<Dynamic_Result_Sets_Characteristic> ::= <DYNAMIC> <RESULT> <SETS> <Maximum_Dynamic_Result_Sets> rank => 0
<Parameter_Style_Clause> ::= <PARAMETER> <STYLE> <Parameter_Style> rank => 0
<Dispatch_Clause> ::= <STATIC> <DISPATCH> rank => 0
<Returns_Clause> ::= <RETURNS> <Returns_Type> rank => 0
<Result_Cast_maybe> ::= <Result_Cast> rank => 0
<Result_Cast_maybe> ::= rank => -1
<Returns_Type> ::= <Returns_Data_Type> <Result_Cast_maybe> rank => 0
                 | <Returns_Table_Type> rank => -1
<Returns_Table_Type> ::= <TABLE> <Table_Function_Column_List> rank => 0
<Gen2589> ::= <Comma> <Table_Function_Column_List_Element> rank => 0
<Gen2589_any> ::= <Gen2589>* rank => 0
<Table_Function_Column_List> ::= <Left_Paren> <Table_Function_Column_List_Element> <Gen2589_any> <Right_Paren> rank => 0
<Table_Function_Column_List_Element> ::= <Column_Name> <Data_Type> rank => 0
<Result_Cast> ::= <CAST> <FROM> <Result_Cast_From_Type> rank => 0
<Result_Cast_From_Type> ::= <Data_Type> <Locator_Indication_maybe> rank => 0
<Returns_Data_Type> ::= <Data_Type> <Locator_Indication_maybe> rank => 0
<Routine_Body> ::= <SQL_Routine_Spec> rank => 0
                 | <External_Body_Reference> rank => -1
<Rights_Clause_maybe> ::= <Rights_Clause> rank => 0
<Rights_Clause_maybe> ::= rank => -1
<SQL_Routine_Spec> ::= <Rights_Clause_maybe> <SQL_Routine_Body> rank => 0
<Rights_Clause> ::= <SQL> <SECURITY> <INVOKER> rank => 0
                  | <SQL> <SECURITY> <DEFINER> rank => -1
<SQL_Routine_Body> ::= <SQL_Procedure_Statement> rank => 0
<Gen2604> ::= <NAME> <External_Routine_Name> rank => 0
<Gen2604_maybe> ::= <Gen2604> rank => 0
<Gen2604_maybe> ::= rank => -1
<Parameter_Style_Clause_maybe> ::= <Parameter_Style_Clause> rank => 0
<Parameter_Style_Clause_maybe> ::= rank => -1
<Transform_Group_Specification_maybe> ::= <Transform_Group_Specification> rank => 0
<Transform_Group_Specification_maybe> ::= rank => -1
<External_Security_Clause_maybe> ::= <External_Security_Clause> rank => 0
<External_Security_Clause_maybe> ::= rank => -1
<External_Body_Reference> ::= <EXTERNAL> <Gen2604_maybe> <Parameter_Style_Clause_maybe> <Transform_Group_Specification_maybe> <External_Security_Clause_maybe> rank => 0
<External_Security_Clause> ::= <EXTERNAL> <SECURITY> <DEFINER> rank => 0
                             | <EXTERNAL> <SECURITY> <INVOKER> rank => -1
                             | <EXTERNAL> <SECURITY> <IMPLEMENTATION> <DEFINED> rank => -2
<Parameter_Style> ::= <SQL> rank => 0
                    | <GENERAL> rank => -1
<Deterministic_Characteristic> ::= <DETERMINISTIC> rank => 0
                                 | <NOT> <DETERMINISTIC> rank => -1
<SQL_Data_Access_Indication> ::= <NO> <SQL> rank => 0
                               | <CONTAINS> <SQL> rank => -1
                               | <READS> <SQL> <DATA> rank => -2
                               | <MODIFIES> <SQL> <DATA> rank => -3
<Null_Call_Clause> ::= <RETURNS> <NULL> <ON> <NULL> <INPUT> rank => 0
                     | <CALLED> <ON> <NULL> <INPUT> rank => -1
<Maximum_Dynamic_Result_Sets> ::= <Unsigned_Integer> rank => 0
<Gen2628> ::= <Single_Group_Specification> rank => 0
            | <Multiple_Group_Specification> rank => -1
<Transform_Group_Specification> ::= <TRANSFORM> <GROUP> <Gen2628> rank => 0
<Single_Group_Specification> ::= <Group_Name> rank => 0
<Gen2632> ::= <Comma> <Group_Specification> rank => 0
<Gen2632_any> ::= <Gen2632>* rank => 0
<Multiple_Group_Specification> ::= <Group_Specification> <Gen2632_any> rank => 0
<Group_Specification> ::= <Group_Name> <FOR> <TYPE> <Path_Resolved_User_Defined_Type_Name> rank => 0
<Alter_Routine_Statement> ::= <ALTER> <Specific_Routine_Designator> <Alter_Routine_Characteristics> <Alter_Routine_Behavior> rank => 0
<Alter_Routine_Characteristic_many> ::= <Alter_Routine_Characteristic>+ rank => 0
<Alter_Routine_Characteristics> ::= <Alter_Routine_Characteristic_many> rank => 0
<Alter_Routine_Characteristic> ::= <Language_Clause> rank => 0
                                 | <Parameter_Style_Clause> rank => -1
                                 | <SQL_Data_Access_Indication> rank => -2
                                 | <Null_Call_Clause> rank => -3
                                 | <Dynamic_Result_Sets_Characteristic> rank => -4
                                 | <NAME> <External_Routine_Name> rank => -5
<Alter_Routine_Behavior> ::= <RESTRICT> rank => 0
<Drop_Routine_Statement> ::= <DROP> <Specific_Routine_Designator> <Drop_Behavior> rank => 0
<Gen2647> ::= <AS> <ASSIGNMENT> rank => 0
<Gen2647_maybe> ::= <Gen2647> rank => 0
<Gen2647_maybe> ::= rank => -1
<User_Defined_Cast_Definition> ::= <CREATE> <CAST> <Left_Paren> <Source_Data_Type> <AS> <Target_Data_Type> <Right_Paren> <WITH> <Cast_Function> <Gen2647_maybe> rank => 0
<Cast_Function> ::= <Specific_Routine_Designator> rank => 0
<Source_Data_Type> ::= <Data_Type> rank => 0
<Target_Data_Type> ::= <Data_Type> rank => 0
<Drop_User_Defined_Cast_Statement> ::= <DROP> <CAST> <Left_Paren> <Source_Data_Type> <AS> <Target_Data_Type> <Right_Paren> <Drop_Behavior> rank => 0
<User_Defined_Ordering_Definition> ::= <CREATE> <ORDERING> <FOR> <Schema_Resolved_User_Defined_Type_Name> <Ordering_Form> rank => 0
<Ordering_Form> ::= <Equals_Ordering_Form> rank => 0
                  | <Full_Ordering_Form> rank => -1
<Equals_Ordering_Form> ::= <EQUALS> <ONLY> <BY> <Ordering_Category> rank => 0
<Full_Ordering_Form> ::= <ORDER> <FULL> <BY> <Ordering_Category> rank => 0
<Ordering_Category> ::= <Relative_Category> rank => 0
                      | <Map_Category> rank => -1
                      | <State_Category> rank => -2
<Relative_Category> ::= <RELATIVE> <WITH> <Relative_Function_Specification> rank => 0
<Map_Category> ::= <MAP> <WITH> <Map_Function_Specification> rank => 0
<Specific_Name_maybe> ::= <Specific_Name> rank => 0
<Specific_Name_maybe> ::= rank => -1
<State_Category> ::= <STATE> <Specific_Name_maybe> rank => 0
<Relative_Function_Specification> ::= <Specific_Routine_Designator> rank => 0
<Map_Function_Specification> ::= <Specific_Routine_Designator> rank => 0
<Drop_User_Defined_Ordering_Statement> ::= <DROP> <ORDERING> <FOR> <Schema_Resolved_User_Defined_Type_Name> <Drop_Behavior> rank => 0
<Gen2671> ::= <TRANSFORM> rank => 0
            | <TRANSFORMS> rank => -1
<Transform_Group_many> ::= <Transform_Group>+ rank => 0
<Transform_Definition> ::= <CREATE> <Gen2671> <FOR> <Schema_Resolved_User_Defined_Type_Name> <Transform_Group_many> rank => 0
<Transform_Group> ::= <Group_Name> <Left_Paren> <Transform_Element_List> <Right_Paren> rank => 0
<Group_Name> ::= <Identifier> rank => 0
<Gen2677> ::= <Comma> <Transform_Element> rank => 0
<Gen2677_maybe> ::= <Gen2677> rank => 0
<Gen2677_maybe> ::= rank => -1
<Transform_Element_List> ::= <Transform_Element> <Gen2677_maybe> rank => 0
<Transform_Element> ::= <To_Sql> rank => 0
                      | <From_Sql> rank => -1
<To_Sql> ::= <TO> <SQL> <WITH> <To_Sql_Function> rank => 0
<From_Sql> ::= <FROM> <SQL> <WITH> <From_Sql_Function> rank => 0
<To_Sql_Function> ::= <Specific_Routine_Designator> rank => 0
<From_Sql_Function> ::= <Specific_Routine_Designator> rank => 0
<Gen2687> ::= <TRANSFORM> rank => 0
            | <TRANSFORMS> rank => -1
<Alter_Group_many> ::= <Alter_Group>+ rank => 0
<Alter_Transform_Statement> ::= <ALTER> <Gen2687> <FOR> <Schema_Resolved_User_Defined_Type_Name> <Alter_Group_many> rank => 0
<Alter_Group> ::= <Group_Name> <Left_Paren> <Alter_Transform_Action_List> <Right_Paren> rank => 0
<Gen2692> ::= <Comma> <Alter_Transform_Action> rank => 0
<Gen2692_any> ::= <Gen2692>* rank => 0
<Alter_Transform_Action_List> ::= <Alter_Transform_Action> <Gen2692_any> rank => 0
<Alter_Transform_Action> ::= <Add_Transform_Element_List> rank => 0
                           | <Drop_Transform_Element_List> rank => -1
<Add_Transform_Element_List> ::= <ADD> <Left_Paren> <Transform_Element_List> <Right_Paren> rank => 0
<Gen2698> ::= <Comma> <Transform_Kind> rank => 0
<Gen2698_maybe> ::= <Gen2698> rank => 0
<Gen2698_maybe> ::= rank => -1
<Drop_Transform_Element_List> ::= <DROP> <Left_Paren> <Transform_Kind> <Gen2698_maybe> <Drop_Behavior> <Right_Paren> rank => 0
<Transform_Kind> ::= <TO> <SQL> rank => 0
                   | <FROM> <SQL> rank => -1
<Gen2704> ::= <TRANSFORM> rank => 0
            | <TRANSFORMS> rank => -1
<Drop_Transform_Statement> ::= <DROP> <Gen2704> <Transforms_To_Be_Dropped> <FOR> <Schema_Resolved_User_Defined_Type_Name> <Drop_Behavior> rank => 0
<Transforms_To_Be_Dropped> ::= <ALL> rank => 0
                             | <Transform_Group_Element> rank => -1
<Transform_Group_Element> ::= <Group_Name> rank => 0
<Sequence_Generator_Options_maybe> ::= <Sequence_Generator_Options> rank => 0
<Sequence_Generator_Options_maybe> ::= rank => -1
<Sequence_Generator_Definition> ::= <CREATE> <SEQUENCE> <Sequence_Generator_Name> <Sequence_Generator_Options_maybe> rank => 0
<Sequence_Generator_Option_many> ::= <Sequence_Generator_Option>+ rank => 0
<Sequence_Generator_Options> ::= <Sequence_Generator_Option_many> rank => 0
<Sequence_Generator_Option> ::= <Sequence_Generator_Data_Type_Option> rank => 0
                              | <Common_Sequence_Generator_Options> rank => -1
<Common_Sequence_Generator_Option_many> ::= <Common_Sequence_Generator_Option>+ rank => 0
<Common_Sequence_Generator_Options> ::= <Common_Sequence_Generator_Option_many> rank => 0
<Common_Sequence_Generator_Option> ::= <Sequence_Generator_Start_With_Option> rank => 0
                                     | <Basic_Sequence_Generator_Option> rank => -1
<Basic_Sequence_Generator_Option> ::= <Sequence_Generator_Increment_By_Option> rank => 0
                                    | <Sequence_Generator_Maxvalue_Option> rank => -1
                                    | <Sequence_Generator_Minvalue_Option> rank => -2
                                    | <Sequence_Generator_Cycle_Option> rank => -3
<Sequence_Generator_Data_Type_Option> ::= <AS> <Data_Type> rank => 0
<Sequence_Generator_Start_With_Option> ::= <START> <WITH> <Sequence_Generator_Start_Value> rank => 0
<Sequence_Generator_Start_Value> ::= <Signed_Numeric_Literal> rank => 0
<Sequence_Generator_Increment_By_Option> ::= <INCREMENT> <BY> <Sequence_Generator_Increment> rank => 0
<Sequence_Generator_Increment> ::= <Signed_Numeric_Literal> rank => 0
<Sequence_Generator_Maxvalue_Option> ::= <MAXVALUE> <Sequence_Generator_Max_Value> rank => 0
                                       | <NO> <MAXVALUE> rank => -1
<Sequence_Generator_Max_Value> ::= <Signed_Numeric_Literal> rank => 0
<Sequence_Generator_Minvalue_Option> ::= <MINVALUE> <Sequence_Generator_Min_Value> rank => 0
                                       | <NO> <MINVALUE> rank => -1
<Sequence_Generator_Min_Value> ::= <Signed_Numeric_Literal> rank => 0
<Sequence_Generator_Cycle_Option> ::= <CYCLE> rank => 0
                                    | <NO> <CYCLE> rank => -1
<Alter_Sequence_Generator_Statement> ::= <ALTER> <SEQUENCE> <Sequence_Generator_Name> <Alter_Sequence_Generator_Options> rank => 0
<Alter_Sequence_Generator_Option_many> ::= <Alter_Sequence_Generator_Option>+ rank => 0
<Alter_Sequence_Generator_Options> ::= <Alter_Sequence_Generator_Option_many> rank => 0
<Alter_Sequence_Generator_Option> ::= <Alter_Sequence_Generator_Restart_Option> rank => 0
                                    | <Basic_Sequence_Generator_Option> rank => -1
<Alter_Sequence_Generator_Restart_Option> ::= <RESTART> <WITH> <Sequence_Generator_Restart_Value> rank => 0
<Sequence_Generator_Restart_Value> ::= <Signed_Numeric_Literal> rank => 0
<Drop_Sequence_Generator_Statement> ::= <DROP> <SEQUENCE> <Sequence_Generator_Name> <Drop_Behavior> rank => 0
<Grant_Statement> ::= <Grant_Privilege_Statement> rank => 0
                    | <Grant_Role_Statement> rank => -1
<Gen2748> ::= <Comma> <Grantee> rank => 0
<Gen2748_any> ::= <Gen2748>* rank => 0
<Gen2750> ::= <WITH> <HIERARCHY> <OPTION> rank => 0
<Gen2750_maybe> ::= <Gen2750> rank => 0
<Gen2750_maybe> ::= rank => -1
<Gen2753> ::= <WITH> <GRANT> <OPTION> rank => 0
<Gen2753_maybe> ::= <Gen2753> rank => 0
<Gen2753_maybe> ::= rank => -1
<Gen2756> ::= <GRANTED> <BY> <Grantor> rank => 0
<Gen2756_maybe> ::= <Gen2756> rank => 0
<Gen2756_maybe> ::= rank => -1
<Grant_Privilege_Statement> ::= <GRANT> <Privileges> <TO> <Grantee> <Gen2748_any> <Gen2750_maybe> <Gen2753_maybe> <Gen2756_maybe> rank => 0
<Privileges> ::= <Object_Privileges> <ON> <Object_Name> rank => 0
<TABLE_maybe> ::= <TABLE> rank => 0
<TABLE_maybe> ::= rank => -1
<Object_Name> ::= <TABLE_maybe> <Table_Name> rank => 0
                | <DOMAIN> <Domain_Name> rank => -1
                | <COLLATION> <Collation_Name> rank => -2
                | <CHARACTER> <SET> <Character_Set_Name> rank => -3
                | <TRANSLATION> <Transliteration_Name> rank => -4
                | <TYPE> <Schema_Resolved_User_Defined_Type_Name> rank => -5
                | <SEQUENCE> <Sequence_Generator_Name> rank => -6
                | <Specific_Routine_Designator> rank => -7
<Gen2771> ::= <Comma> <Action> rank => 0
<Gen2771_any> ::= <Gen2771>* rank => 0
<Object_Privileges> ::= <ALL> <PRIVILEGES> rank => 0
                      | <Action> <Gen2771_any> rank => -1
<Gen2775> ::= <Left_Paren> <Privilege_Column_List> <Right_Paren> rank => 0
<Gen2775_maybe> ::= <Gen2775> rank => 0
<Gen2775_maybe> ::= rank => -1
<Gen2778> ::= <Left_Paren> <Privilege_Column_List> <Right_Paren> rank => 0
<Gen2778_maybe> ::= <Gen2778> rank => 0
<Gen2778_maybe> ::= rank => -1
<Gen2781> ::= <Left_Paren> <Privilege_Column_List> <Right_Paren> rank => 0
<Gen2781_maybe> ::= <Gen2781> rank => 0
<Gen2781_maybe> ::= rank => -1
<Action> ::= <SELECT> rank => 0
           | <SELECT> <Left_Paren> <Privilege_Column_List> <Right_Paren> rank => -1
           | <SELECT> <Left_Paren> <Privilege_Method_List> <Right_Paren> rank => -2
           | <DELETE> rank => -3
           | <INSERT> <Gen2775_maybe> rank => -4
           | <UPDATE> <Gen2778_maybe> rank => -5
           | <REFERENCES> <Gen2781_maybe> rank => -6
           | <USAGE> rank => -7
           | <TRIGGER> rank => -8
           | <UNDER> rank => -9
           | <EXECUTE> rank => -10
<Gen2795> ::= <Comma> <Specific_Routine_Designator> rank => 0
<Gen2795_any> ::= <Gen2795>* rank => 0
<Privilege_Method_List> ::= <Specific_Routine_Designator> <Gen2795_any> rank => 0
<Privilege_Column_List> ::= <Column_Name_List> rank => 0
<Grantee> ::= <PUBLIC> rank => 0
            | <Authorization_Identifier> rank => -1
<Grantor> ::= <Lex348> rank => 0
            | <Lex344> rank => -1
<Gen2803> ::= <WITH> <ADMIN> <Grantor> rank => 0
<Gen2803_maybe> ::= <Gen2803> rank => 0
<Gen2803_maybe> ::= rank => -1
<Role_Definition> ::= <CREATE> <ROLE> <Role_Name> <Gen2803_maybe> rank => 0
<Gen2807> ::= <Comma> <Role_Granted> rank => 0
<Gen2807_any> ::= <Gen2807>* rank => 0
<Gen2809> ::= <Comma> <Grantee> rank => 0
<Gen2809_any> ::= <Gen2809>* rank => 0
<Gen2811> ::= <WITH> <ADMIN> <OPTION> rank => 0
<Gen2811_maybe> ::= <Gen2811> rank => 0
<Gen2811_maybe> ::= rank => -1
<Gen2814> ::= <GRANTED> <BY> <Grantor> rank => 0
<Gen2814_maybe> ::= <Gen2814> rank => 0
<Gen2814_maybe> ::= rank => -1
<Grant_Role_Statement> ::= <GRANT> <Role_Granted> <Gen2807_any> <TO> <Grantee> <Gen2809_any> <Gen2811_maybe> <Gen2814_maybe> rank => 0
<Role_Granted> ::= <Role_Name> rank => 0
<Drop_Role_Statement> ::= <DROP> <ROLE> <Role_Name> rank => 0
<Revoke_Statement> ::= <Revoke_Privilege_Statement> rank => 0
                     | <Revoke_Role_Statement> rank => -1
<Revoke_Option_Extension_maybe> ::= <Revoke_Option_Extension> rank => 0
<Revoke_Option_Extension_maybe> ::= rank => -1
<Gen2824> ::= <Comma> <Grantee> rank => 0
<Gen2824_any> ::= <Gen2824>* rank => 0
<Gen2826> ::= <GRANTED> <BY> <Grantor> rank => 0
<Gen2826_maybe> ::= <Gen2826> rank => 0
<Gen2826_maybe> ::= rank => -1
<Revoke_Privilege_Statement> ::= <REVOKE> <Revoke_Option_Extension_maybe> <Privileges> <FROM> <Grantee> <Gen2824_any> <Gen2826_maybe> <Drop_Behavior> rank => 0
<Revoke_Option_Extension> ::= <GRANT> <OPTION> <FOR> rank => 0
                            | <HIERARCHY> <OPTION> <FOR> rank => -1
<Gen2832> ::= <ADMIN> <OPTION> <FOR> rank => 0
<Gen2832_maybe> ::= <Gen2832> rank => 0
<Gen2832_maybe> ::= rank => -1
<Gen2835> ::= <Comma> <Role_Revoked> rank => 0
<Gen2835_any> ::= <Gen2835>* rank => 0
<Gen2837> ::= <Comma> <Grantee> rank => 0
<Gen2837_any> ::= <Gen2837>* rank => 0
<Gen2839> ::= <GRANTED> <BY> <Grantor> rank => 0
<Gen2839_maybe> ::= <Gen2839> rank => 0
<Gen2839_maybe> ::= rank => -1
<Revoke_Role_Statement> ::= <REVOKE> <Gen2832_maybe> <Role_Revoked> <Gen2835_any> <FROM> <Grantee> <Gen2837_any> <Gen2839_maybe> <Drop_Behavior> rank => 0
<Role_Revoked> ::= <Role_Name> rank => 0
<Module_Path_Specification_maybe> ::= <Module_Path_Specification> rank => 0
<Module_Path_Specification_maybe> ::= rank => -1
<Module_Transform_Group_Specification_maybe> ::= <Module_Transform_Group_Specification> rank => 0
<Module_Transform_Group_Specification_maybe> ::= rank => -1
<Module_Collations_maybe> ::= <Module_Collations> rank => 0
<Module_Collations_maybe> ::= rank => -1
<Temporary_Table_Declaration_any> ::= <Temporary_Table_Declaration>* rank => 0
<Module_Contents_many> ::= <Module_Contents>+ rank => 0
<SQL_Client_Module_Definition> ::= <Module_Name_Clause> <Language_Clause> <Module_Authorization_Clause> <Module_Path_Specification_maybe> <Module_Transform_Group_Specification_maybe> <Module_Collations_maybe> <Temporary_Table_Declaration_any> <Module_Contents_many> rank => 0
<Gen2853> ::= <ONLY> rank => 0
            | <AND> <DYNAMIC> rank => -1
<Gen2855> ::= <FOR> <STATIC> <Gen2853> rank => 0
<Gen2855_maybe> ::= <Gen2855> rank => 0
<Gen2855_maybe> ::= rank => -1
<Gen2858> ::= <ONLY> rank => 0
            | <AND> <DYNAMIC> rank => -1
<Gen2860> ::= <FOR> <STATIC> <Gen2858> rank => 0
<Gen2860_maybe> ::= <Gen2860> rank => 0
<Gen2860_maybe> ::= rank => -1
<Module_Authorization_Clause> ::= <SCHEMA> <Schema_Name> rank => 0
                                | <AUTHORIZATION> <Module_Authorization_Identifier> <Gen2855_maybe> rank => -1
                                | <SCHEMA> <Schema_Name> <AUTHORIZATION> <Module_Authorization_Identifier> <Gen2860_maybe> rank => -2
<Module_Authorization_Identifier> ::= <Authorization_Identifier> rank => 0
<Module_Path_Specification> ::= <Path_Specification> rank => 0
<Module_Transform_Group_Specification> ::= <Transform_Group_Specification> rank => 0
<Module_Collation_Specification_many> ::= <Module_Collation_Specification>+ rank => 0
<Module_Collations> ::= <Module_Collation_Specification_many> rank => 0
<Gen2871> ::= <FOR> <Character_Set_Specification_List> rank => 0
<Gen2871_maybe> ::= <Gen2871> rank => 0
<Gen2871_maybe> ::= rank => -1
<Module_Collation_Specification> ::= <COLLATION> <Collation_Name> <Gen2871_maybe> rank => 0
<Gen2875> ::= <Comma> <Character_Set_Specification> rank => 0
<Gen2875_any> ::= <Gen2875>* rank => 0
<Character_Set_Specification_List> ::= <Character_Set_Specification> <Gen2875_any> rank => 0
<Module_Contents> ::= <Declare_Cursor> rank => 0
                    | <Dynamic_Declare_Cursor> rank => -1
                    | <Externally_Invoked_Procedure> rank => -2
<SQL_Client_Module_Name_maybe> ::= <SQL_Client_Module_Name> rank => 0
<SQL_Client_Module_Name_maybe> ::= rank => -1
<Module_Character_Set_Specification_maybe> ::= <Module_Character_Set_Specification> rank => 0
<Module_Character_Set_Specification_maybe> ::= rank => -1
<Module_Name_Clause> ::= <MODULE> <SQL_Client_Module_Name_maybe> <Module_Character_Set_Specification_maybe> rank => 0
<Module_Character_Set_Specification> ::= <NAMES> <ARE> <Character_Set_Specification> rank => 0
<Externally_Invoked_Procedure> ::= <PROCEDURE> <Procedure_Name> <Host_Parameter_Declaration_List> <Semicolon> <SQL_Procedure_Statement> <Semicolon> rank => 0
<Gen2888> ::= <Comma> <Host_Parameter_Declaration> rank => 0
<Gen2888_any> ::= <Gen2888>* rank => 0
<Host_Parameter_Declaration_List> ::= <Left_Paren> <Host_Parameter_Declaration> <Gen2888_any> <Right_Paren> rank => 0
<Host_Parameter_Declaration> ::= <Host_Parameter_Name> <Host_Parameter_Data_Type> rank => 0
                               | <Status_Parameter> rank => -1
<Host_Parameter_Data_Type> ::= <Data_Type> <Locator_Indication_maybe> rank => 0
<Status_Parameter> ::= <SQLSTATE> rank => 0
<SQL_Procedure_Statement> ::= <SQL_Executable_Statement> rank => 0
<SQL_Executable_Statement> ::= <SQL_Schema_Statement> rank => 0
                             | <SQL_Data_Statement> rank => -1
                             | <SQL_Control_Statement> rank => -2
                             | <SQL_Transaction_Statement> rank => -3
                             | <SQL_Connection_Statement> rank => -4
                             | <SQL_Session_Statement> rank => -5
                             | <SQL_Diagnostics_Statement> rank => -6
                             | <SQL_Dynamic_Statement> rank => -7
<SQL_Schema_Statement> ::= <SQL_Schema_Definition_Statement> rank => 0
                         | <SQL_Schema_Manipulation_Statement> rank => -1
<SQL_Schema_Definition_Statement> ::= <Schema_Definition> rank => 0
                                    | <Table_Definition> rank => -1
                                    | <View_Definition> rank => -2
                                    | <SQL_Invoked_Routine> rank => -3
                                    | <Grant_Statement> rank => -4
                                    | <Role_Definition> rank => -5
                                    | <Domain_Definition> rank => -6
                                    | <Character_Set_Definition> rank => -7
                                    | <Collation_Definition> rank => -8
                                    | <Transliteration_Definition> rank => -9
                                    | <Assertion_Definition> rank => -10
                                    | <Trigger_Definition> rank => -11
                                    | <User_Defined_Type_Definition> rank => -12
                                    | <User_Defined_Cast_Definition> rank => -13
                                    | <User_Defined_Ordering_Definition> rank => -14
                                    | <Transform_Definition> rank => -15
                                    | <Sequence_Generator_Definition> rank => -16
<SQL_Schema_Manipulation_Statement> ::= <Drop_Schema_Statement> rank => 0
                                      | <Alter_Table_Statement> rank => -1
                                      | <Drop_Table_Statement> rank => -2
                                      | <Drop_View_Statement> rank => -3
                                      | <Alter_Routine_Statement> rank => -4
                                      | <Drop_Routine_Statement> rank => -5
                                      | <Drop_User_Defined_Cast_Statement> rank => -6
                                      | <Revoke_Statement> rank => -7
                                      | <Drop_Role_Statement> rank => -8
                                      | <Alter_Domain_Statement> rank => -9
                                      | <Drop_Domain_Statement> rank => -10
                                      | <Drop_Character_Set_Statement> rank => -11
                                      | <Drop_Collation_Statement> rank => -12
                                      | <Drop_Transliteration_Statement> rank => -13
                                      | <Drop_Assertion_Statement> rank => -14
                                      | <Drop_Trigger_Statement> rank => -15
                                      | <Alter_Type_Statement> rank => -16
                                      | <Drop_Data_Type_Statement> rank => -17
                                      | <Drop_User_Defined_Ordering_Statement> rank => -18
                                      | <Alter_Transform_Statement> rank => -19
                                      | <Drop_Transform_Statement> rank => -20
                                      | <Alter_Sequence_Generator_Statement> rank => -21
                                      | <Drop_Sequence_Generator_Statement> rank => -22
<SQL_Data_Statement> ::= <Open_Statement> rank => 0
                       | <Fetch_Statement> rank => -1
                       | <Close_Statement> rank => -2
                       | <Select_Statement_Single_Row> rank => -3
                       | <Free_Locator_Statement> rank => -4
                       | <Hold_Locator_Statement> rank => -5
                       | <SQL_Data_Change_Statement> rank => -6
<SQL_Data_Change_Statement> ::= <Delete_Statement_Positioned> rank => 0
                              | <Delete_Statement_Searched> rank => -1
                              | <Insert_Statement> rank => -2
                              | <Update_Statement_Positioned> rank => -3
                              | <Update_Statement_Searched> rank => -4
                              | <Merge_Statement> rank => -5
<SQL_Control_Statement> ::= <Call_Statement> rank => 0
                          | <Return_Statement> rank => -1
<SQL_Transaction_Statement> ::= <Start_Transaction_Statement> rank => 0
                              | <Set_Transaction_Statement> rank => -1
                              | <Set_Constraints_Mode_Statement> rank => -2
                              | <Savepoint_Statement> rank => -3
                              | <Release_Savepoint_Statement> rank => -4
                              | <Commit_Statement> rank => -5
                              | <Rollback_Statement> rank => -6
<SQL_Connection_Statement> ::= <Connect_Statement> rank => 0
                             | <Set_Connection_Statement> rank => -1
                             | <Disconnect_Statement> rank => -2
<SQL_Session_Statement> ::= <Set_Session_User_Identifier_Statement> rank => 0
                          | <Set_Role_Statement> rank => -1
                          | <Set_Local_Time_Zone_Statement> rank => -2
                          | <Set_Session_Characteristics_Statement> rank => -3
                          | <Set_Catalog_Statement> rank => -4
                          | <Set_Schema_Statement> rank => -5
                          | <Set_Names_Statement> rank => -6
                          | <Set_Path_Statement> rank => -7
                          | <Set_Transform_Group_Statement> rank => -8
                          | <Set_Session_Collation_Statement> rank => -9
<SQL_Diagnostics_Statement> ::= <Get_Diagnostics_Statement> rank => 0
<SQL_Dynamic_Statement> ::= <System_Descriptor_Statement> rank => 0
                          | <Prepare_Statement> rank => -1
                          | <Deallocate_Prepared_Statement> rank => -2
                          | <Describe_Statement> rank => -3
                          | <Execute_Statement> rank => -4
                          | <Execute_Immediate_Statement> rank => -5
                          | <SQL_Dynamic_Data_Statement> rank => -6
<SQL_Dynamic_Data_Statement> ::= <Allocate_Cursor_Statement> rank => 0
                               | <Dynamic_Open_Statement> rank => -1
                               | <Dynamic_Fetch_Statement> rank => -2
                               | <Dynamic_Close_Statement> rank => -3
                               | <Dynamic_Delete_Statement_Positioned> rank => -4
                               | <Dynamic_Update_Statement_Positioned> rank => -5
<System_Descriptor_Statement> ::= <Allocate_Descriptor_Statement> rank => 0
                                | <Deallocate_Descriptor_Statement> rank => -1
                                | <Set_Descriptor_Statement> rank => -2
                                | <Get_Descriptor_Statement> rank => -3
<Cursor_Sensitivity_maybe> ::= <Cursor_Sensitivity> rank => 0
<Cursor_Sensitivity_maybe> ::= rank => -1
<Cursor_Scrollability_maybe> ::= <Cursor_Scrollability> rank => 0
<Cursor_Scrollability_maybe> ::= rank => -1
<Cursor_Holdability_maybe> ::= <Cursor_Holdability> rank => 0
<Cursor_Holdability_maybe> ::= rank => -1
<Cursor_Returnability_maybe> ::= <Cursor_Returnability> rank => 0
<Cursor_Returnability_maybe> ::= rank => -1
<Declare_Cursor> ::= <DECLARE> <Cursor_Name> <Cursor_Sensitivity_maybe> <Cursor_Scrollability_maybe> <CURSOR> <Cursor_Holdability_maybe> <Cursor_Returnability_maybe> <FOR> <Cursor_Specification> rank => 0
<Cursor_Sensitivity> ::= <SENSITIVE> rank => 0
                       | <INSENSITIVE> rank => -1
                       | <ASENSITIVE> rank => -2
<Cursor_Scrollability> ::= <SCROLL> rank => 0
                         | <NO> <SCROLL> rank => -1
<Cursor_Holdability> ::= <WITH> <HOLD> rank => 0
                       | <WITHOUT> <HOLD> rank => -1
<Cursor_Returnability> ::= <WITH> <RETURN> rank => 0
                         | <WITHOUT> <RETURN> rank => -1
<Updatability_Clause_maybe> ::= <Updatability_Clause> rank => 0
<Updatability_Clause_maybe> ::= rank => -1
<Cursor_Specification> ::= <Query_Expression> <Order_By_Clause_maybe> <Updatability_Clause_maybe> rank => 0
<Gen3020> ::= <OF> <Column_Name_List> rank => 0
<Gen3020_maybe> ::= <Gen3020> rank => 0
<Gen3020_maybe> ::= rank => -1
<Gen3023> ::= <READ> <ONLY> rank => 0
            | <UPDATE> <Gen3020_maybe> rank => -1
<Updatability_Clause> ::= <FOR> <Gen3023> rank => 0
<Order_By_Clause> ::= <ORDER> <BY> <Sort_Specification_List> rank => 0
<Open_Statement> ::= <OPEN> <Cursor_Name> rank => 0
<Fetch_Orientation_maybe> ::= <Fetch_Orientation> rank => 0
<Fetch_Orientation_maybe> ::= rank => -1
<Gen3030> ::= <Fetch_Orientation_maybe> <FROM> rank => 0
<Gen3030_maybe> ::= <Gen3030> rank => 0
<Gen3030_maybe> ::= rank => -1
<Fetch_Statement> ::= <FETCH> <Gen3030_maybe> <Cursor_Name> <INTO> <Fetch_Target_List> rank => 0
<Gen3034> ::= <ABSOLUTE> rank => 0
            | <RELATIVE> rank => -1
<Fetch_Orientation> ::= <NEXT> rank => 0
                      | <PRIOR> rank => -1
                      | <FIRST> rank => -2
                      | <LAST> rank => -3
                      | <Gen3034> <Simple_Value_Specification> rank => -4
<Gen3041> ::= <Comma> <Target_Specification> rank => 0
<Gen3041_any> ::= <Gen3041>* rank => 0
<Fetch_Target_List> ::= <Target_Specification> <Gen3041_any> rank => 0
<Close_Statement> ::= <CLOSE> <Cursor_Name> rank => 0
<Select_Statement_Single_Row> ::= <SELECT> <Set_Quantifier_maybe> <Select_List> <INTO> <Select_Target_List> <Table_Expression> rank => 0
<Gen3046> ::= <Comma> <Target_Specification> rank => 0
<Gen3046_any> ::= <Gen3046>* rank => 0
<Select_Target_List> ::= <Target_Specification> <Gen3046_any> rank => 0
<Delete_Statement_Positioned> ::= <DELETE> <FROM> <Target_Table> <WHERE> <CURRENT> <OF> <Cursor_Name> rank => 0
<Target_Table> ::= <Table_Name> rank => 0
                 | <ONLY> <Left_Paren> <Table_Name> <Right_Paren> rank => -1
<Gen3052> ::= <WHERE> <Search_Condition> rank => 0
<Gen3052_maybe> ::= <Gen3052> rank => 0
<Gen3052_maybe> ::= rank => -1
<Delete_Statement_Searched> ::= <DELETE> <FROM> <Target_Table> <Gen3052_maybe> rank => 0
<Insert_Statement> ::= <INSERT> <INTO> <Insertion_Target> <Insert_Columns_And_Source> rank => 0
<Insertion_Target> ::= <Table_Name> rank => 0
<Insert_Columns_And_Source> ::= <From_Subquery> rank => 0
                              | <From_Constructor> rank => -1
                              | <From_Default> rank => -2
<Gen3061> ::= <Left_Paren> <Insert_Column_List> <Right_Paren> rank => 0
<Gen3061_maybe> ::= <Gen3061> rank => 0
<Gen3061_maybe> ::= rank => -1
<Override_Clause_maybe> ::= <Override_Clause> rank => 0
<Override_Clause_maybe> ::= rank => -1
<From_Subquery> ::= <Gen3061_maybe> <Override_Clause_maybe> <Query_Expression> rank => 0
<Gen3067> ::= <Left_Paren> <Insert_Column_List> <Right_Paren> rank => 0
<Gen3067_maybe> ::= <Gen3067> rank => 0
<Gen3067_maybe> ::= rank => -1
<From_Constructor> ::= <Gen3067_maybe> <Override_Clause_maybe> <Contextually_Typed_Table_Value_Constructor> rank => 0
<Override_Clause> ::= <OVERRIDING> <USER> <VALUE> rank => 0
                    | <OVERRIDING> <SYSTEM> <VALUE> rank => -1
<From_Default> ::= <DEFAULT> <VALUES> rank => 0
<Insert_Column_List> ::= <Column_Name_List> rank => 0
<Gen3075> ::= <AS_maybe> <Merge_Correlation_Name> rank => 0
<Gen3075_maybe> ::= <Gen3075> rank => 0
<Gen3075_maybe> ::= rank => -1
<Merge_Statement> ::= <MERGE> <INTO> <Target_Table> <Gen3075_maybe> <USING> <Table_Reference> <ON> <Search_Condition> <Merge_Operation_Specification> rank => 0
<Merge_Correlation_Name> ::= <Correlation_Name> rank => 0
<Merge_When_Clause_many> ::= <Merge_When_Clause>+ rank => 0
<Merge_Operation_Specification> ::= <Merge_When_Clause_many> rank => 0
<Merge_When_Clause> ::= <Merge_When_Matched_Clause> rank => 0
                      | <Merge_When_Not_Matched_Clause> rank => -1
<Merge_When_Matched_Clause> ::= <WHEN> <MATCHED> <THEN> <Merge_Update_Specification> rank => 0
<Merge_When_Not_Matched_Clause> ::= <WHEN> <NOT> <MATCHED> <THEN> <Merge_Insert_Specification> rank => 0
<Merge_Update_Specification> ::= <UPDATE> <SET> <Set_Clause_List> rank => 0
<Gen3087> ::= <Left_Paren> <Insert_Column_List> <Right_Paren> rank => 0
<Gen3087_maybe> ::= <Gen3087> rank => 0
<Gen3087_maybe> ::= rank => -1
<Merge_Insert_Specification> ::= <INSERT> <Gen3087_maybe> <Override_Clause_maybe> <VALUES> <Merge_Insert_Value_List> rank => 0
<Gen3091> ::= <Comma> <Merge_Insert_Value_Element> rank => 0
<Gen3091_any> ::= <Gen3091>* rank => 0
<Merge_Insert_Value_List> ::= <Left_Paren> <Merge_Insert_Value_Element> <Gen3091_any> <Right_Paren> rank => 0
<Merge_Insert_Value_Element> ::= <Value_Expression> rank => 0
                               | <Contextually_Typed_Value_Specification> rank => -1
<Update_Statement_Positioned> ::= <UPDATE> <Target_Table> <SET> <Set_Clause_List> <WHERE> <CURRENT> <OF> <Cursor_Name> rank => 0
<Gen3097> ::= <WHERE> <Search_Condition> rank => 0
<Gen3097_maybe> ::= <Gen3097> rank => 0
<Gen3097_maybe> ::= rank => -1
<Update_Statement_Searched> ::= <UPDATE> <Target_Table> <SET> <Set_Clause_List> <Gen3097_maybe> rank => 0
<Gen3101> ::= <Comma> <Set_Clause> rank => 0
<Gen3101_any> ::= <Gen3101>* rank => 0
<Set_Clause_List> ::= <Set_Clause> <Gen3101_any> rank => 0
<Set_Clause> ::= <Multiple_Column_Assignment> rank => 0
               | <Set_Target> <Equals_Operator> <Update_Source> rank => -1
<Set_Target> ::= <Update_Target> rank => 0
               | <Mutated_Set_Clause> rank => -1
<Multiple_Column_Assignment> ::= <Set_Target_List> <Equals_Operator> <Assigned_Row> rank => 0
<Gen3109> ::= <Comma> <Set_Target> rank => 0
<Gen3109_any> ::= <Gen3109>* rank => 0
<Set_Target_List> ::= <Left_Paren> <Set_Target> <Gen3109_any> <Right_Paren> rank => 0
<Assigned_Row> ::= <Contextually_Typed_Row_Value_Expression> rank => 0
<Update_Target> ::= <Object_Column> rank => 0
                  | <Object_Column> <Left_Bracket_Or_Trigraph> <Simple_Value_Specification> <Right_Bracket_Or_Trigraph> rank => -1
<Object_Column> ::= <Column_Name> rank => 0
<Mutated_Set_Clause> ::= <Mutated_Target> <Period> <Method_Name> rank => 0
<Mutated_Target> ::= <Object_Column> rank => 0
                   | <Mutated_Set_Clause> rank => -1
<Update_Source> ::= <Value_Expression> rank => 0
                  | <Contextually_Typed_Value_Specification> rank => -1
<Gen3121> ::= <ON> <COMMIT> <Table_Commit_Action> <ROWS> rank => 0
<Gen3121_maybe> ::= <Gen3121> rank => 0
<Gen3121_maybe> ::= rank => -1
<Temporary_Table_Declaration> ::= <DECLARE> <LOCAL> <TEMPORARY> <TABLE> <Table_Name> <Table_Element_List> <Gen3121_maybe> rank => 0
<Gen3125> ::= <Comma> <Locator_Reference> rank => 0
<Gen3125_any> ::= <Gen3125>* rank => 0
<Free_Locator_Statement> ::= <FREE> <LOCATOR> <Locator_Reference> <Gen3125_any> rank => 0
<Locator_Reference> ::= <Host_Parameter_Name> rank => 0
                      | <Embedded_Variable_Name> rank => -1
<Gen3130> ::= <Comma> <Locator_Reference> rank => 0
<Gen3130_any> ::= <Gen3130>* rank => 0
<Hold_Locator_Statement> ::= <HOLD> <LOCATOR> <Locator_Reference> <Gen3130_any> rank => 0
<Call_Statement> ::= <CALL> <Routine_Invocation> rank => 0
<Return_Statement> ::= <RETURN> <Return_Value> rank => 0
<Return_Value> ::= <Value_Expression> rank => 0
                 | <NULL> rank => -1
<Gen3137> ::= <Comma> <Transaction_Mode> rank => 0
<Gen3137_any> ::= <Gen3137>* rank => 0
<Gen3139> ::= <Transaction_Mode> <Gen3137_any> rank => 0
<Gen3139_maybe> ::= <Gen3139> rank => 0
<Gen3139_maybe> ::= rank => -1
<Start_Transaction_Statement> ::= <START> <TRANSACTION> <Gen3139_maybe> rank => 0
<Transaction_Mode> ::= <Isolation_Level> rank => 0
                     | <Transaction_Access_Mode> rank => -1
                     | <Diagnostics_Size> rank => -2
<Transaction_Access_Mode> ::= <READ> <ONLY> rank => 0
                            | <READ> <WRITE> rank => -1
<Isolation_Level> ::= <ISOLATION> <LEVEL> <Level_Of_Isolation> rank => 0
<Level_Of_Isolation> ::= <READ> <UNCOMMITTED> rank => 0
                       | <READ> <COMMITTED> rank => -1
                       | <REPEATABLE> <READ> rank => -2
                       | <SERIALIZABLE> rank => -3
<Diagnostics_Size> ::= <DIAGNOSTICS> <SIZE> <Number_Of_Conditions> rank => 0
<Number_Of_Conditions> ::= <Simple_Value_Specification> rank => 0
<LOCAL_maybe> ::= <LOCAL> rank => 0
<LOCAL_maybe> ::= rank => -1
<Set_Transaction_Statement> ::= <SET> <LOCAL_maybe> <Transaction_Characteristics> rank => 0
<Gen3158> ::= <Comma> <Transaction_Mode> rank => 0
<Gen3158_any> ::= <Gen3158>* rank => 0
<Transaction_Characteristics> ::= <TRANSACTION> <Transaction_Mode> <Gen3158_any> rank => 0
<Gen3161> ::= <DEFERRED> rank => 0
            | <IMMEDIATE> rank => -1
<Set_Constraints_Mode_Statement> ::= <SET> <CONSTRAINTS> <Constraint_Name_List> <Gen3161> rank => 0
<Gen3164> ::= <Comma> <Constraint_Name> rank => 0
<Gen3164_any> ::= <Gen3164>* rank => 0
<Constraint_Name_List> ::= <ALL> rank => 0
                         | <Constraint_Name> <Gen3164_any> rank => -1
<Savepoint_Statement> ::= <SAVEPOINT> <Savepoint_Specifier> rank => 0
<Savepoint_Specifier> ::= <Savepoint_Name> rank => 0
<Release_Savepoint_Statement> ::= <RELEASE> <SAVEPOINT> <Savepoint_Specifier> rank => 0
<WORK_maybe> ::= <WORK> rank => 0
<WORK_maybe> ::= rank => -1
<NO_maybe> ::= <NO> rank => 0
<NO_maybe> ::= rank => -1
<Gen3175> ::= <AND> <NO_maybe> <CHAIN> rank => 0
<Gen3175_maybe> ::= <Gen3175> rank => 0
<Gen3175_maybe> ::= rank => -1
<Commit_Statement> ::= <COMMIT> <WORK_maybe> <Gen3175_maybe> rank => 0
<Gen3179> ::= <AND> <NO_maybe> <CHAIN> rank => 0
<Gen3179_maybe> ::= <Gen3179> rank => 0
<Gen3179_maybe> ::= rank => -1
<Savepoint_Clause_maybe> ::= <Savepoint_Clause> rank => 0
<Savepoint_Clause_maybe> ::= rank => -1
<Rollback_Statement> ::= <ROLLBACK> <WORK_maybe> <Gen3179_maybe> <Savepoint_Clause_maybe> rank => 0
<Savepoint_Clause> ::= <TO> <SAVEPOINT> <Savepoint_Specifier> rank => 0
<Connect_Statement> ::= <CONNECT> <TO> <Connection_Target> rank => 0
<Gen3187> ::= <AS> <Connection_Name> rank => 0
<Gen3187_maybe> ::= <Gen3187> rank => 0
<Gen3187_maybe> ::= rank => -1
<Gen3190> ::= <USER> <Connection_User_Name> rank => 0
<Gen3190_maybe> ::= <Gen3190> rank => 0
<Gen3190_maybe> ::= rank => -1
<Connection_Target> ::= <Sql_Server_Name> <Gen3187_maybe> <Gen3190_maybe> rank => 0
                      | <DEFAULT> rank => -1
<Set_Connection_Statement> ::= <SET> <CONNECTION> <Connection_Object> rank => 0
<Connection_Object> ::= <DEFAULT> rank => 0
                      | <Connection_Name> rank => -1
<Disconnect_Statement> ::= <DISCONNECT> <Disconnect_Object> rank => 0
<Disconnect_Object> ::= <Connection_Object> rank => 0
                      | <ALL> rank => -1
                      | <CURRENT> rank => -2
<Set_Session_Characteristics_Statement> ::= <SET> <SESSION> <CHARACTERISTICS> <AS> <Session_Characteristic_List> rank => 0
<Gen3203> ::= <Comma> <Session_Characteristic> rank => 0
<Gen3203_any> ::= <Gen3203>* rank => 0
<Session_Characteristic_List> ::= <Session_Characteristic> <Gen3203_any> rank => 0
<Session_Characteristic> ::= <Transaction_Characteristics> rank => 0
<Set_Session_User_Identifier_Statement> ::= <SET> <SESSION> <AUTHORIZATION> <Value_Specification> rank => 0
<Set_Role_Statement> ::= <SET> <ROLE> <Role_Specification> rank => 0
<Role_Specification> ::= <Value_Specification> rank => 0
                       | <NONE> rank => -1
<Set_Local_Time_Zone_Statement> ::= <SET> <TIME> <ZONE> <Set_Time_Zone_Value> rank => 0
<Set_Time_Zone_Value> ::= <Interval_Value_Expression> rank => 0
                        | <LOCAL> rank => -1
<Set_Catalog_Statement> ::= <SET> <Catalog_Name_Characteristic> rank => 0
<Catalog_Name_Characteristic> ::= <CATALOG> <Value_Specification> rank => 0
<Set_Schema_Statement> ::= <SET> <Schema_Name_Characteristic> rank => 0
<Schema_Name_Characteristic> ::= <SCHEMA> <Value_Specification> rank => 0
<Set_Names_Statement> ::= <SET> <Character_Set_Name_Characteristic> rank => 0
<Character_Set_Name_Characteristic> ::= <NAMES> <Value_Specification> rank => 0
<Set_Path_Statement> ::= <SET> <SQL_Path_Characteristic> rank => 0
<SQL_Path_Characteristic> ::= <PATH> <Value_Specification> rank => 0
<Set_Transform_Group_Statement> ::= <SET> <Transform_Group_Characteristic> rank => 0
<Transform_Group_Characteristic> ::= <DEFAULT> <TRANSFORM> <GROUP> <Value_Specification> rank => 0
                                   | <TRANSFORM> <GROUP> <FOR> <TYPE> <Path_Resolved_User_Defined_Type_Name> <Value_Specification> rank => -1
<Gen3225> ::= <FOR> <Character_Set_Specification_List> rank => 0
<Gen3225_maybe> ::= <Gen3225> rank => 0
<Gen3225_maybe> ::= rank => -1
<Gen3228> ::= <FOR> <Character_Set_Specification_List> rank => 0
<Gen3228_maybe> ::= <Gen3228> rank => 0
<Gen3228_maybe> ::= rank => -1
<Set_Session_Collation_Statement> ::= <SET> <COLLATION> <Collation_Specification> <Gen3225_maybe> rank => 0
                                    | <SET> <NO> <COLLATION> <Gen3228_maybe> rank => -1
<Gen3233> ::= <Lex013> <Character_Set_Specification> rank => 0
<Gen3233_any> ::= <Gen3233>* rank => 0
<Character_Set_Specification_List> ::= <Character_Set_Specification> <Gen3233_any> rank => -1
<Collation_Specification> ::= <Value_Specification> rank => 0
<SQL_maybe> ::= <SQL> rank => 0
<SQL_maybe> ::= rank => -1
<Gen3239> ::= <WITH> <MAX> <Occurrences> rank => 0
<Gen3239_maybe> ::= <Gen3239> rank => 0
<Gen3239_maybe> ::= rank => -1
<Allocate_Descriptor_Statement> ::= <ALLOCATE> <SQL_maybe> <DESCRIPTOR> <Descriptor_Name> <Gen3239_maybe> rank => 0
<Occurrences> ::= <Simple_Value_Specification> rank => 0
<Deallocate_Descriptor_Statement> ::= <DEALLOCATE> <SQL_maybe> <DESCRIPTOR> <Descriptor_Name> rank => 0
<Get_Descriptor_Statement> ::= <GET> <SQL_maybe> <DESCRIPTOR> <Descriptor_Name> <Get_Descriptor_Information> rank => 0
<Gen3246> ::= <Comma> <Get_Header_Information> rank => 0
<Gen3246_any> ::= <Gen3246>* rank => 0
<Gen3248> ::= <Comma> <Get_Item_Information> rank => 0
<Gen3248_any> ::= <Gen3248>* rank => 0
<Get_Descriptor_Information> ::= <Get_Header_Information> <Gen3246_any> rank => 0
                               | <VALUE> <Item_Number> <Get_Item_Information> <Gen3248_any> rank => -1
<Get_Header_Information> ::= <Simple_Target_Specification_1> <Equals_Operator> <Header_Item_Name> rank => 0
<Header_Item_Name> ::= <COUNT> rank => 0
                     | <Lex162> rank => -1
                     | <Lex130> rank => -2
                     | <Lex131> rank => -3
                     | <Lex272> rank => -4
<Get_Item_Information> ::= <Simple_Target_Specification_2> <Equals_Operator> <Descriptor_Item_Name> rank => 0
<Item_Number> ::= <Simple_Value_Specification> rank => 0
<Simple_Target_Specification_1> ::= <Simple_Target_Specification> rank => 0
<Simple_Target_Specification_2> ::= <Simple_Target_Specification> rank => 0
<Descriptor_Item_Name> ::= <CARDINALITY> rank => 0
                         | <Lex078> rank => -1
                         | <Lex079> rank => -2
                         | <Lex080> rank => -3
                         | <Lex088> rank => -4
                         | <Lex089> rank => -5
                         | <Lex090> rank => -6
                         | <DATA> rank => -7
                         | <Lex114> rank => -8
                         | <Lex115> rank => -9
                         | <DEGREE> rank => -10
                         | <INDICATOR> rank => -11
                         | <Lex161> rank => -12
                         | <LENGTH> rank => -13
                         | <LEVEL> rank => -14
                         | <NAME> rank => -15
                         | <NULLABLE> rank => -16
                         | <Lex193> rank => -17
                         | <Lex202> rank => -18
                         | <Lex204> rank => -19
                         | <Lex205> rank => -20
                         | <Lex206> rank => -21
                         | <Lex207> rank => -22
                         | <PRECISION> rank => -23
                         | <Lex228> rank => -24
                         | <Lex229> rank => -25
                         | <Lex230> rank => -26
                         | <SCALE> rank => -27
                         | <Lex242> rank => -28
                         | <Lex243> rank => -29
                         | <Lex244> rank => -30
                         | <TYPE> rank => -31
                         | <UNNAMED> rank => -32
                         | <Lex290> rank => -33
                         | <Lex292> rank => -34
                         | <Lex293> rank => -35
                         | <Lex291> rank => -36
<Set_Descriptor_Statement> ::= <SET> <SQL_maybe> <DESCRIPTOR> <Descriptor_Name> <Set_Descriptor_Information> rank => 0
<Gen3300> ::= <Comma> <Set_Header_Information> rank => 0
<Gen3300_any> ::= <Gen3300>* rank => 0
<Gen3302> ::= <Comma> <Set_Item_Information> rank => 0
<Gen3302_any> ::= <Gen3302>* rank => 0
<Set_Descriptor_Information> ::= <Set_Header_Information> <Gen3300_any> rank => 0
                               | <VALUE> <Item_Number> <Set_Item_Information> <Gen3302_any> rank => -1
<Set_Header_Information> ::= <Header_Item_Name> <Equals_Operator> <Simple_Value_Specification_1> rank => 0
<Set_Item_Information> ::= <Descriptor_Item_Name> <Equals_Operator> <Simple_Value_Specification_2> rank => 0
<Simple_Value_Specification_1> ::= <Simple_Value_Specification> rank => 0
<Simple_Value_Specification_2> ::= <Simple_Value_Specification> rank => 0
<Attributes_Specification_maybe> ::= <Attributes_Specification> rank => 0
<Attributes_Specification_maybe> ::= rank => -1
<Prepare_Statement> ::= <PREPARE> <SQL_Statement_Name> <Attributes_Specification_maybe> <FROM> <SQL_Statement_Variable> rank => 0
<Attributes_Specification> ::= <ATTRIBUTES> <Attributes_Variable> rank => 0
<Attributes_Variable> ::= <Simple_Value_Specification> rank => 0
<SQL_Statement_Variable> ::= <Simple_Value_Specification> rank => 0
<Preparable_Statement> ::= <Preparable_SQL_Data_Statement> rank => 0
                         | <Preparable_SQL_Schema_Statement> rank => -1
                         | <Preparable_SQL_Transaction_Statement> rank => -2
                         | <Preparable_SQL_Control_Statement> rank => -3
                         | <Preparable_SQL_Session_Statement> rank => -4
<Preparable_SQL_Data_Statement> ::= <Delete_Statement_Searched> rank => 0
                                  | <Dynamic_Single_Row_Select_Statement> rank => -1
                                  | <Insert_Statement> rank => -2
                                  | <Dynamic_Select_Statement> rank => -3
                                  | <Update_Statement_Searched> rank => -4
                                  | <Merge_Statement> rank => -5
                                  | <Preparable_Dynamic_Delete_Statement_Positioned> rank => -6
                                  | <Preparable_Dynamic_Update_Statement_Positioned> rank => -7
<Preparable_SQL_Schema_Statement> ::= <SQL_Schema_Statement> rank => 0
<Preparable_SQL_Transaction_Statement> ::= <SQL_Transaction_Statement> rank => 0
<Preparable_SQL_Control_Statement> ::= <SQL_Control_Statement> rank => 0
<Preparable_SQL_Session_Statement> ::= <SQL_Session_Statement> rank => 0
<Dynamic_Select_Statement> ::= <Cursor_Specification> rank => 0
<Cursor_Attribute_many> ::= <Cursor_Attribute>+ rank => 0
<Cursor_Attributes> ::= <Cursor_Attribute_many> rank => 0
<Cursor_Attribute> ::= <Cursor_Sensitivity> rank => 0
                     | <Cursor_Scrollability> rank => -1
                     | <Cursor_Holdability> rank => -2
                     | <Cursor_Returnability> rank => -3
<Deallocate_Prepared_Statement> ::= <DEALLOCATE> <PREPARE> <SQL_Statement_Name> rank => 0
<Describe_Statement> ::= <Describe_Input_Statement> rank => 0
                       | <Describe_Output_Statement> rank => -1
<Nesting_Option_maybe> ::= <Nesting_Option> rank => 0
<Nesting_Option_maybe> ::= rank => -1
<Describe_Input_Statement> ::= <DESCRIBE> <INPUT> <SQL_Statement_Name> <Using_Descriptor> <Nesting_Option_maybe> rank => 0
<OUTPUT_maybe> ::= <OUTPUT> rank => 0
<OUTPUT_maybe> ::= rank => -1
<Describe_Output_Statement> ::= <DESCRIBE> <OUTPUT_maybe> <Described_Object> <Using_Descriptor> <Nesting_Option_maybe> rank => 0
<Nesting_Option> ::= <WITH> <NESTING> rank => 0
                   | <WITHOUT> <NESTING> rank => -1
<Using_Descriptor> ::= <USING> <SQL_maybe> <DESCRIPTOR> <Descriptor_Name> rank => 0
<Described_Object> ::= <SQL_Statement_Name> rank => 0
                     | <CURSOR> <Extended_Cursor_Name> <STRUCTURE> rank => -1
<Input_Using_Clause> ::= <Using_Arguments> rank => 0
                       | <Using_Input_Descriptor> rank => -1
<Gen3356> ::= <Comma> <Using_Argument> rank => 0
<Gen3356_any> ::= <Gen3356>* rank => 0
<Using_Arguments> ::= <USING> <Using_Argument> <Gen3356_any> rank => 0
<Using_Argument> ::= <General_Value_Specification> rank => 0
<Using_Input_Descriptor> ::= <Using_Descriptor> rank => 0
<Output_Using_Clause> ::= <Into_Arguments> rank => 0
                        | <Into_Descriptor> rank => -1
<Gen3363> ::= <Comma> <Into_Argument> rank => 0
<Gen3363_any> ::= <Gen3363>* rank => 0
<Into_Arguments> ::= <INTO> <Into_Argument> <Gen3363_any> rank => 0
<Into_Argument> ::= <Target_Specification> rank => 0
<Into_Descriptor> ::= <INTO> <SQL_maybe> <DESCRIPTOR> <Descriptor_Name> rank => 0
<Result_Using_Clause_maybe> ::= <Result_Using_Clause> rank => 0
<Result_Using_Clause_maybe> ::= rank => -1
<Parameter_Using_Clause_maybe> ::= <Parameter_Using_Clause> rank => 0
<Parameter_Using_Clause_maybe> ::= rank => -1
<Execute_Statement> ::= <EXECUTE> <SQL_Statement_Name> <Result_Using_Clause_maybe> <Parameter_Using_Clause_maybe> rank => 0
<Result_Using_Clause> ::= <Output_Using_Clause> rank => 0
<Parameter_Using_Clause> ::= <Input_Using_Clause> rank => 0
<Execute_Immediate_Statement> ::= <EXECUTE> <IMMEDIATE> <SQL_Statement_Variable> rank => 0
<Dynamic_Declare_Cursor> ::= <DECLARE> <Cursor_Name> <Cursor_Sensitivity_maybe> <Cursor_Scrollability_maybe> <CURSOR> <Cursor_Holdability_maybe> <Cursor_Returnability_maybe> <FOR> <Statement_Name> rank => 0
<Allocate_Cursor_Statement> ::= <ALLOCATE> <Extended_Cursor_Name> <Cursor_Intent> rank => 0
<Cursor_Intent> ::= <Statement_Cursor> rank => 0
                  | <Result_Set_Cursor> rank => -1
<Statement_Cursor> ::= <Cursor_Sensitivity_maybe> <Cursor_Scrollability_maybe> <CURSOR> <Cursor_Holdability_maybe> <Cursor_Returnability_maybe> <FOR> <Extended_Statement_Name> rank => 0
<Result_Set_Cursor> ::= <FOR> <PROCEDURE> <Specific_Routine_Designator> rank => 0
<Input_Using_Clause_maybe> ::= <Input_Using_Clause> rank => 0
<Input_Using_Clause_maybe> ::= rank => -1
<Dynamic_Open_Statement> ::= <OPEN> <Dynamic_Cursor_Name> <Input_Using_Clause_maybe> rank => 0
<Gen3385> ::= <Fetch_Orientation_maybe> <FROM> rank => 0
<Gen3385_maybe> ::= <Gen3385> rank => 0
<Gen3385_maybe> ::= rank => -1
<Dynamic_Fetch_Statement> ::= <FETCH> <Gen3385_maybe> <Dynamic_Cursor_Name> <Output_Using_Clause> rank => 0
<Dynamic_Single_Row_Select_Statement> ::= <Query_Specification> rank => 0
<Dynamic_Close_Statement> ::= <CLOSE> <Dynamic_Cursor_Name> rank => 0
<Dynamic_Delete_Statement_Positioned> ::= <DELETE> <FROM> <Target_Table> <WHERE> <CURRENT> <OF> <Dynamic_Cursor_Name> rank => 0
<Dynamic_Update_Statement_Positioned> ::= <UPDATE> <Target_Table> <SET> <Set_Clause_List> <WHERE> <CURRENT> <OF> <Dynamic_Cursor_Name> rank => 0
<Gen3393> ::= <FROM> <Target_Table> rank => 0
<Gen3393_maybe> ::= <Gen3393> rank => 0
<Gen3393_maybe> ::= rank => -1
<Preparable_Dynamic_Delete_Statement_Positioned> ::= <DELETE> <Gen3393_maybe> <WHERE> <CURRENT> <OF> <Scope_Option_maybe> <Cursor_Name> rank => 0
<Target_Table_maybe> ::= <Target_Table> rank => 0
<Target_Table_maybe> ::= rank => -1
<Preparable_Dynamic_Update_Statement_Positioned> ::= <UPDATE> <Target_Table_maybe> <SET> <Set_Clause_List> <WHERE> <CURRENT> <OF> <Scope_Option_maybe> <Cursor_Name> rank => 0
<Embedded_SQL_Host_Program> ::= <Embedded_SQL_Ada_Program> rank => 0
                              | <Embedded_SQL_C_Program> rank => -1
                              | <Embedded_SQL_Cobol_Program> rank => -2
                              | <Embedded_SQL_Fortran_Program> rank => -3
                              | <Embedded_SQL_Mumps_Program> rank => -4
                              | <Embedded_SQL_Pascal_Program> rank => -5
                              | <Embedded_SQL_Pl_I_Program> rank => -6
<SQL_Terminator_maybe> ::= <SQL_Terminator> rank => 0
<SQL_Terminator_maybe> ::= rank => -1
<Embedded_SQL_Statement> ::= <SQL_Prefix> <Statement_Or_Declaration> <SQL_Terminator_maybe> rank => 0
<Statement_Or_Declaration> ::= <Declare_Cursor> rank => 0
                             | <Dynamic_Declare_Cursor> rank => -1
                             | <Temporary_Table_Declaration> rank => -2
                             | <Embedded_Authorization_Declaration> rank => -3
                             | <Embedded_Path_Specification> rank => -4
                             | <Embedded_Transform_Group_Specification> rank => -5
                             | <Embedded_Collation_Specification> rank => -6
                             | <Embedded_Exception_Declaration> rank => -7
                             | <SQL_Procedure_Statement> rank => -8
<SQL_Prefix> ::= <EXEC> <SQL> rank => 0
               | <Ampersand> <SQL> <Left_Paren> rank => -1
<SQL_Terminator> ::= <Lex371> rank => 0
                   | <Semicolon> rank => -1
                   | <Right_Paren> rank => -2
<Embedded_Authorization_Declaration> ::= <DECLARE> <Embedded_Authorization_Clause> rank => 0
<Gen3425> ::= <ONLY> rank => 0
            | <AND> <DYNAMIC> rank => -1
<Gen3427> ::= <FOR> <STATIC> <Gen3425> rank => 0
<Gen3427_maybe> ::= <Gen3427> rank => 0
<Gen3427_maybe> ::= rank => -1
<Gen3430> ::= <ONLY> rank => 0
            | <AND> <DYNAMIC> rank => -1
<Gen3432> ::= <FOR> <STATIC> <Gen3430> rank => 0
<Gen3432_maybe> ::= <Gen3432> rank => 0
<Gen3432_maybe> ::= rank => -1
<Embedded_Authorization_Clause> ::= <SCHEMA> <Schema_Name> rank => 0
                                  | <AUTHORIZATION> <Embedded_Authorization_Identifier> <Gen3427_maybe> rank => -1
                                  | <SCHEMA> <Schema_Name> <AUTHORIZATION> <Embedded_Authorization_Identifier> <Gen3432_maybe> rank => -2
<Embedded_Authorization_Identifier> ::= <Module_Authorization_Identifier> rank => 0
<Embedded_Path_Specification> ::= <Path_Specification> rank => 0
<Embedded_Transform_Group_Specification> ::= <Transform_Group_Specification> rank => 0
<Embedded_Collation_Specification> ::= <Module_Collations> rank => 0
<Embedded_Character_Set_Declaration_maybe> ::= <Embedded_Character_Set_Declaration> rank => 0
<Embedded_Character_Set_Declaration_maybe> ::= rank => -1
<Host_Variable_Definition_any> ::= <Host_Variable_Definition>* rank => 0
<Embedded_SQL_Declare_Section> ::= <Embedded_SQL_Begin_Declare> <Embedded_Character_Set_Declaration_maybe> <Host_Variable_Definition_any> <Embedded_SQL_End_Declare> rank => 0
                                 | <Embedded_SQL_Mumps_Declare> rank => -1
<Embedded_Character_Set_Declaration> ::= <SQL> <NAMES> <ARE> <Character_Set_Specification> rank => 0
<Embedded_SQL_Begin_Declare> ::= <SQL_Prefix> <BEGIN> <DECLARE> <SECTION> <SQL_Terminator_maybe> rank => 0
<Embedded_SQL_End_Declare> ::= <SQL_Prefix> <END> <DECLARE> <SECTION> <SQL_Terminator_maybe> rank => 0
<Embedded_SQL_Mumps_Declare> ::= <SQL_Prefix> <BEGIN> <DECLARE> <SECTION> <Embedded_Character_Set_Declaration_maybe> <Host_Variable_Definition_any> <END> <DECLARE> <SECTION> <SQL_Terminator> rank => 0
<Host_Variable_Definition> ::= <Ada_Variable_Definition> rank => 0
                             | <C_Variable_Definition> rank => -1
                             | <Cobol_Variable_Definition> rank => -2
                             | <Fortran_Variable_Definition> rank => -3
                             | <Mumps_Variable_Definition> rank => -4
                             | <Pascal_Variable_Definition> rank => -5
                             | <Pl_I_Variable_Definition> rank => -6
<Embedded_Variable_Name> ::= <Colon> <Host_Identifier> rank => 0
<Host_Identifier> ::= <Ada_Host_Identifier> rank => 0
                    | <C_Host_Identifier> rank => -1
                    | <Cobol_Host_Identifier> rank => -2
                    | <Fortran_Host_Identifier> rank => -3
                    | <Mumps_Host_Identifier> rank => -4
                    | <Pascal_Host_Identifier> rank => -5
                    | <Pl_I_Host_Identifier> rank => -6
<Embedded_Exception_Declaration> ::= <WHENEVER> <Condition> <Condition_Action> rank => 0
<Condition> ::= <SQL_Condition> rank => 0
<Gen3468> ::= <Lex013> <Sqlstate_Subclass_Value> rank => 0
<Gen3468_maybe> ::= <Gen3468> rank => 0
<Gen3468_maybe> ::= rank => -1
<Gen3471> ::= <Sqlstate_Class_Value> <Gen3468_maybe> rank => 0
<SQL_Condition> ::= <Major_Category> rank => 0
                  | <SQLSTATE> <Gen3471> rank => -1
                  | <CONSTRAINT> <Constraint_Name> rank => -2
<Major_Category> ::= <SQLEXCEPTION> rank => 0
                   | <SQLWARNING> rank => -1
                   | <NOT> <FOUND> rank => -2
<Sqlstate_Class_Value> ::= <Sqlstate_Char> <Sqlstate_Char> rank => 0
<Sqlstate_Subclass_Value> ::= <Sqlstate_Char> <Sqlstate_Char> <Sqlstate_Char> rank => 0
<Sqlstate_Char> ::= <Simple_Latin_Upper_Case_Letter> rank => 0
                  | <Digit> rank => -1
<Condition_Action> ::= <CONTINUE> rank => 0
                     | <Go_To> rank => -1
<Gen3484> ::= <GOTO> rank => 0
            | <GO> <TO> rank => -1
<Go_To> ::= <Gen3484> <Goto_Target> rank => 0
<Goto_Target> ::= <Unsigned_Integer> rank => 0
<Embedded_SQL_Ada_Program> ::= <EXEC> <SQL> rank => 0
<Gen3489> ::= <Comma> <Ada_Host_Identifier> rank => 0
<Gen3489_any> ::= <Gen3489>* rank => 0
<Ada_Initial_Value_maybe> ::= <Ada_Initial_Value> rank => 0
<Ada_Initial_Value_maybe> ::= rank => -1
<Ada_Variable_Definition> ::= <Ada_Host_Identifier> <Gen3489_any> <Colon> <Ada_Type_Specification> <Ada_Initial_Value_maybe> rank => 0
<Character_Representation_many> ::= <Character_Representation>+ rank => 0
<Ada_Initial_Value> ::= <Ada_Assignment_Operator> <Character_Representation_many> rank => 0
<Ada_Assignment_Operator> ::= <Colon> <Equals_Operator> rank => 0
<Ada_Host_Identifier> ::= <Lex568_many> rank => 0
<Ada_Type_Specification> ::= <Ada_Qualified_Type_Specification> rank => 0
                           | <Ada_Unqualified_Type_Specification> rank => -1
                           | <Ada_Derived_Type_Specification> rank => -2
<IS_maybe> ::= <IS> rank => 0
<IS_maybe> ::= rank => -1
<Gen3503> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3503_maybe> ::= <Gen3503> rank => 0
<Gen3503_maybe> ::= rank => -1
<Ada_Qualified_Type_Specification> ::= <Lex569> <Period> <CHAR> <Gen3503_maybe> <Left_Paren> <Lex570> <Double_Period> <Length> <Right_Paren> rank => 0
                                     | <Lex569> <Period> <SMALLINT> rank => -1
                                     | <Lex569> <Period> <INT> rank => -2
                                     | <Lex569> <Period> <BIGINT> rank => -3
                                     | <Lex569> <Period> <REAL> rank => -4
                                     | <Lex569> <Period> <Lex571> rank => -5
                                     | <Lex569> <Period> <BOOLEAN> rank => -6
                                     | <Lex569> <Period> <Lex572> rank => -7
                                     | <Lex569> <Period> <Lex573> rank => -8
<Ada_Unqualified_Type_Specification> ::= <CHAR> <Left_Paren> <Lex570> <Double_Period> <Length> <Right_Paren> rank => 0
                                       | <SMALLINT> rank => -1
                                       | <INT> rank => -2
                                       | <BIGINT> rank => -3
                                       | <REAL> rank => -4
                                       | <Lex571> rank => -5
                                       | <BOOLEAN> rank => -6
                                       | <Lex572> rank => -7
                                       | <Lex573> rank => -8
<Ada_Derived_Type_Specification> ::= <Ada_Clob_Variable> rank => 0
                                   | <Ada_Clob_Locator_Variable> rank => -1
                                   | <Ada_Blob_Variable> rank => -2
                                   | <Ada_Blob_Locator_Variable> rank => -3
                                   | <Ada_User_Defined_Type_Variable> rank => -4
                                   | <Ada_User_Defined_Type_Locator_Variable> rank => -5
                                   | <Ada_Ref_Variable> rank => -6
                                   | <Ada_Array_Locator_Variable> rank => -7
                                   | <Ada_Multiset_Locator_Variable> rank => -8
<Gen3533> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3533_maybe> ::= <Gen3533> rank => 0
<Gen3533_maybe> ::= rank => -1
<Ada_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <Gen3533_maybe> rank => 0
<Ada_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<Ada_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Ada_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<Ada_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <Predefined_Type> rank => 0
<Ada_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<Ada_Ref_Variable> ::= <SQL> <TYPE> <IS> <Reference_Type> rank => 0
<Ada_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <Array_Type> <AS> <LOCATOR> rank => 0
<Ada_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <Multiset_Type> <AS> <LOCATOR> rank => 0
<Embedded_SQL_C_Program> ::= <EXEC> <SQL> rank => 0
<C_Storage_Class_maybe> ::= <C_Storage_Class> rank => 0
<C_Storage_Class_maybe> ::= rank => -1
<C_Class_Modifier_maybe> ::= <C_Class_Modifier> rank => 0
<C_Class_Modifier_maybe> ::= rank => -1
<C_Variable_Definition> ::= <C_Storage_Class_maybe> <C_Class_Modifier_maybe> <C_Variable_Specification> <Semicolon> rank => 0
<C_Variable_Specification> ::= <C_Numeric_Variable> rank => 0
                             | <C_Character_Variable> rank => -1
                             | <C_Derived_Variable> rank => -2
<C_Storage_Class> ::= <auto> rank => 0
                    | <extern> rank => -1
                    | <static> rank => -2
<C_Class_Modifier> ::= <const> rank => 0
                     | <volatile> rank => -1
<Gen3559> ::= <long> <long> rank => 0
            | <long> rank => -1
            | <short> rank => -2
            | <float> rank => -3
            | <double> rank => -4
<C_Initial_Value_maybe> ::= <C_Initial_Value> rank => 0
<C_Initial_Value_maybe> ::= rank => -1
<Gen3566> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3566_any> ::= <Gen3566>* rank => 0
<C_Numeric_Variable> ::= <Gen3559> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3566_any> rank => 0
<Gen3569> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3569_maybe> ::= <Gen3569> rank => 0
<Gen3569_maybe> ::= rank => -1
<Gen3572> ::= <Comma> <C_Host_Identifier> <C_Array_Specification> <C_Initial_Value_maybe> rank => 0
<Gen3572_any> ::= <Gen3572>* rank => 0
<C_Character_Variable> ::= <C_Character_Type> <Gen3569_maybe> <C_Host_Identifier> <C_Array_Specification> <C_Initial_Value_maybe> <Gen3572_any> rank => 0
<C_Character_Type> ::= <char> rank => 0
                     | <unsigned> <char> rank => -1
                     | <unsigned> <short> rank => -2
<C_Array_Specification> ::= <Left_Bracket> <Length> <Right_Bracket> rank => 0
<C_Host_Identifier> ::= <Lex585_many> rank => 0
<C_Derived_Variable> ::= <C_Varchar_Variable> rank => 0
                       | <C_Nchar_Variable> rank => -1
                       | <C_Nchar_Varying_Variable> rank => -2
                       | <C_Clob_Variable> rank => -3
                       | <C_Nclob_Variable> rank => -4
                       | <C_Blob_Variable> rank => -5
                       | <C_User_Defined_Type_Variable> rank => -6
                       | <C_Clob_Locator_Variable> rank => -7
                       | <C_Blob_Locator_Variable> rank => -8
                       | <C_Array_Locator_Variable> rank => -9
                       | <C_Multiset_Locator_Variable> rank => -10
                       | <C_User_Defined_Type_Locator_Variable> rank => -11
                       | <C_Ref_Variable> rank => -12
<Gen3593> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3593_maybe> ::= <Gen3593> rank => 0
<Gen3593_maybe> ::= rank => -1
<Gen3596> ::= <Comma> <C_Host_Identifier> <C_Array_Specification> <C_Initial_Value_maybe> rank => 0
<Gen3596_any> ::= <Gen3596>* rank => 0
<C_Varchar_Variable> ::= <VARCHAR> <Gen3593_maybe> <C_Host_Identifier> <C_Array_Specification> <C_Initial_Value_maybe> <Gen3596_any> rank => 0
<Gen3599> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3599_maybe> ::= <Gen3599> rank => 0
<Gen3599_maybe> ::= rank => -1
<Gen3602> ::= <Comma> <C_Host_Identifier> <C_Array_Specification> <C_Initial_Value_maybe> rank => 0
<Gen3602_any> ::= <Gen3602>* rank => 0
<C_Nchar_Variable> ::= <NCHAR> <Gen3599_maybe> <C_Host_Identifier> <C_Array_Specification> <C_Initial_Value_maybe> <Gen3602_any> rank => 0
<Gen3605> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3605_maybe> ::= <Gen3605> rank => 0
<Gen3605_maybe> ::= rank => -1
<Gen3608> ::= <Comma> <C_Host_Identifier> <C_Array_Specification> <C_Initial_Value_maybe> rank => 0
<Gen3608_any> ::= <Gen3608>* rank => 0
<C_Nchar_Varying_Variable> ::= <NCHAR> <VARYING> <Gen3605_maybe> <C_Host_Identifier> <C_Array_Specification> <C_Initial_Value_maybe> <Gen3608_any> rank => 0
<Gen3611> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3611_maybe> ::= <Gen3611> rank => 0
<Gen3611_maybe> ::= rank => -1
<Gen3614> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3614_any> ::= <Gen3614>* rank => 0
<C_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <Gen3611_maybe> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3614_any> rank => 0
<Gen3617> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3617_maybe> ::= <Gen3617> rank => 0
<Gen3617_maybe> ::= rank => -1
<Gen3620> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3620_any> ::= <Gen3620>* rank => 0
<C_Nclob_Variable> ::= <SQL> <TYPE> <IS> <NCLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <Gen3617_maybe> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3620_any> rank => 0
<Gen3623> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3623_any> ::= <Gen3623>* rank => 0
<C_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <Predefined_Type> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3623_any> rank => 0
<Gen3626> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3626_any> ::= <Gen3626>* rank => 0
<C_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3626_any> rank => 0
<Gen3629> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3629_any> ::= <Gen3629>* rank => 0
<C_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3629_any> rank => 0
<Gen3632> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3632_any> ::= <Gen3632>* rank => 0
<C_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3632_any> rank => 0
<Gen3635> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3635_any> ::= <Gen3635>* rank => 0
<C_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <Array_Type> <AS> <LOCATOR> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3635_any> rank => 0
<Gen3638> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3638_any> ::= <Gen3638>* rank => 0
<C_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <Multiset_Type> <AS> <LOCATOR> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3638_any> rank => 0
<Gen3641> ::= <Comma> <C_Host_Identifier> <C_Initial_Value_maybe> rank => 0
<Gen3641_any> ::= <Gen3641>* rank => 0
<C_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> <C_Host_Identifier> <C_Initial_Value_maybe> <Gen3641_any> rank => 0
<C_Ref_Variable> ::= <SQL> <TYPE> <IS> <Reference_Type> rank => 0
<C_Initial_Value> ::= <Equals_Operator> <Character_Representation_many> rank => 0
<Embedded_SQL_Cobol_Program> ::= <EXEC> <SQL> rank => 0
<Cobol_Host_Identifier> ::= <Lex586_many> rank => 0
<Gen3648> ::= <Lex587> rank => 0
            | <Lex588> rank => -1
<Cobol_Variable_Definition> ::= <Gen3648> <Cobol_Host_Identifier> <Cobol_Type_Specification> <Character_Representation_any> <Period> rank => 0
<Cobol_Type_Specification> ::= <Cobol_Character_Type> rank => 0
                             | <Cobol_National_Character_Type> rank => -1
                             | <Cobol_Numeric_Type> rank => -2
                             | <Cobol_Integer_Type> rank => -3
                             | <Cobol_Derived_Type_Specification> rank => -4
<Cobol_Derived_Type_Specification> ::= <Cobol_Clob_Variable> rank => 0
                                     | <Cobol_Nclob_Variable> rank => -1
                                     | <Cobol_Blob_Variable> rank => -2
                                     | <Cobol_User_Defined_Type_Variable> rank => -3
                                     | <Cobol_Clob_Locator_Variable> rank => -4
                                     | <Cobol_Blob_Locator_Variable> rank => -5
                                     | <Cobol_Array_Locator_Variable> rank => -6
                                     | <Cobol_Multiset_Locator_Variable> rank => -7
                                     | <Cobol_User_Defined_Type_Locator_Variable> rank => -8
                                     | <Cobol_Ref_Variable> rank => -9
<Gen3666> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3666_maybe> ::= <Gen3666> rank => 0
<Gen3666_maybe> ::= rank => -1
<Gen3669> ::= <PIC> rank => 0
            | <PICTURE> rank => -1
<Gen3671> ::= <Left_Paren> <Length> <Right_Paren> rank => 0
<Gen3671_maybe> ::= <Gen3671> rank => 0
<Gen3671_maybe> ::= rank => -1
<Gen3674> ::= <X> <Gen3671_maybe> rank => 0
<Gen3674_many> ::= <Gen3674>+ rank => 0
<Cobol_Character_Type> ::= <Gen3666_maybe> <Gen3669> <IS_maybe> <Gen3674_many> rank => 0
<Gen3677> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3677_maybe> ::= <Gen3677> rank => 0
<Gen3677_maybe> ::= rank => -1
<Gen3680> ::= <PIC> rank => 0
            | <PICTURE> rank => -1
<Gen3682> ::= <Left_Paren> <Length> <Right_Paren> rank => 0
<Gen3682_maybe> ::= <Gen3682> rank => 0
<Gen3682_maybe> ::= rank => -1
<Gen3685> ::= <N> <Gen3682_maybe> rank => 0
<Gen3685_many> ::= <Gen3685>+ rank => 0
<Cobol_National_Character_Type> ::= <Gen3677_maybe> <Gen3680> <IS_maybe> <Gen3685_many> rank => 0
<Gen3688> ::= <USAGE> <IS_maybe> rank => 0
<Gen3688_maybe> ::= <Gen3688> rank => 0
<Gen3688_maybe> ::= rank => -1
<Gen3691> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3691_maybe> ::= <Gen3691> rank => 0
<Gen3691_maybe> ::= rank => -1
<Cobol_Clob_Variable> ::= <Gen3688_maybe> <SQL> <TYPE> <IS> <CLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <Gen3691_maybe> rank => 0
<Gen3695> ::= <USAGE> <IS_maybe> rank => 0
<Gen3695_maybe> ::= <Gen3695> rank => 0
<Gen3695_maybe> ::= rank => -1
<Gen3698> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3698_maybe> ::= <Gen3698> rank => 0
<Gen3698_maybe> ::= rank => -1
<Cobol_Nclob_Variable> ::= <Gen3695_maybe> <SQL> <TYPE> <IS> <NCLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <Gen3698_maybe> rank => 0
<Gen3702> ::= <USAGE> <IS_maybe> rank => 0
<Gen3702_maybe> ::= <Gen3702> rank => 0
<Gen3702_maybe> ::= rank => -1
<Cobol_Blob_Variable> ::= <Gen3702_maybe> <SQL> <TYPE> <IS> <BLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Gen3706> ::= <USAGE> <IS_maybe> rank => 0
<Gen3706_maybe> ::= <Gen3706> rank => 0
<Gen3706_maybe> ::= rank => -1
<Cobol_User_Defined_Type_Variable> ::= <Gen3706_maybe> <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <Predefined_Type> rank => 0
<Gen3710> ::= <USAGE> <IS_maybe> rank => 0
<Gen3710_maybe> ::= <Gen3710> rank => 0
<Gen3710_maybe> ::= rank => -1
<Cobol_Clob_Locator_Variable> ::= <Gen3710_maybe> <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<Gen3714> ::= <USAGE> <IS_maybe> rank => 0
<Gen3714_maybe> ::= <Gen3714> rank => 0
<Gen3714_maybe> ::= rank => -1
<Cobol_Blob_Locator_Variable> ::= <Gen3714_maybe> <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<Gen3718> ::= <USAGE> <IS_maybe> rank => 0
<Gen3718_maybe> ::= <Gen3718> rank => 0
<Gen3718_maybe> ::= rank => -1
<Cobol_Array_Locator_Variable> ::= <Gen3718_maybe> <SQL> <TYPE> <IS> <Array_Type> <AS> <LOCATOR> rank => 0
<Gen3722> ::= <USAGE> <IS_maybe> rank => 0
<Gen3722_maybe> ::= <Gen3722> rank => 0
<Gen3722_maybe> ::= rank => -1
<Cobol_Multiset_Locator_Variable> ::= <Gen3722_maybe> <SQL> <TYPE> <IS> <Multiset_Type> <AS> <LOCATOR> rank => 0
<Gen3726> ::= <USAGE> <IS_maybe> rank => 0
<Gen3726_maybe> ::= <Gen3726> rank => 0
<Gen3726_maybe> ::= rank => -1
<Cobol_User_Defined_Type_Locator_Variable> ::= <Gen3726_maybe> <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<Gen3730> ::= <USAGE> <IS_maybe> rank => 0
<Gen3730_maybe> ::= <Gen3730> rank => 0
<Gen3730_maybe> ::= rank => -1
<Cobol_Ref_Variable> ::= <Gen3730_maybe> <SQL> <TYPE> <IS> <Reference_Type> rank => 0
<Gen3734> ::= <PIC> rank => 0
            | <PICTURE> rank => -1
<Gen3736> ::= <USAGE> <IS_maybe> rank => 0
<Gen3736_maybe> ::= <Gen3736> rank => 0
<Gen3736_maybe> ::= rank => -1
<Cobol_Numeric_Type> ::= <Gen3734> <IS_maybe> <S> <Cobol_Nines_Specification> <Gen3736_maybe> <DISPLAY> <SIGN> <LEADING> <SEPARATE> rank => 0
<Cobol_Nines_maybe> ::= <Cobol_Nines> rank => 0
<Cobol_Nines_maybe> ::= rank => -1
<Gen3742> ::= <V> <Cobol_Nines_maybe> rank => 0
<Gen3742_maybe> ::= <Gen3742> rank => 0
<Gen3742_maybe> ::= rank => -1
<Cobol_Nines_Specification> ::= <Cobol_Nines> <Gen3742_maybe> rank => 0
                              | <V> <Cobol_Nines> rank => -1
<Cobol_Integer_Type> ::= <Cobol_Binary_Integer> rank => 0
<Gen3748> ::= <PIC> rank => 0
            | <PICTURE> rank => -1
<Gen3750> ::= <USAGE> <IS_maybe> rank => 0
<Gen3750_maybe> ::= <Gen3750> rank => 0
<Gen3750_maybe> ::= rank => -1
<Cobol_Binary_Integer> ::= <Gen3748> <IS_maybe> <S> <Cobol_Nines> <Gen3750_maybe> <BINARY> rank => 0
<Gen3754> ::= <Left_Paren> <Length> <Right_Paren> rank => 0
<Gen3754_maybe> ::= <Gen3754> rank => 0
<Gen3754_maybe> ::= rank => -1
<Gen3757> ::= <Lex596> <Gen3754_maybe> rank => 0
<Gen3757_many> ::= <Gen3757>+ rank => 0
<Cobol_Nines> ::= <Gen3757_many> rank => 0
<Embedded_SQL_Fortran_Program> ::= <EXEC> <SQL> rank => 0
<Fortran_Host_Identifier> ::= <Lex597_many> rank => 0
<Gen3762> ::= <Comma> <Fortran_Host_Identifier> rank => 0
<Gen3762_any> ::= <Gen3762>* rank => 0
<Fortran_Variable_Definition> ::= <Fortran_Type_Specification> <Fortran_Host_Identifier> <Gen3762_any> rank => 0
<Gen3765> ::= <Asterisk> <Length> rank => 0
<Gen3765_maybe> ::= <Gen3765> rank => 0
<Gen3765_maybe> ::= rank => -1
<Gen3768> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3768_maybe> ::= <Gen3768> rank => 0
<Gen3768_maybe> ::= rank => -1
<Gen3771> ::= <Lex003_many> rank => 0
<Gen3771> ::= rank => -1
<Gen3773> ::= <Asterisk> <Length> rank => 0
<Gen3773_maybe> ::= <Gen3773> rank => 0
<Gen3773_maybe> ::= rank => -1
<Gen3776> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3776_maybe> ::= <Gen3776> rank => 0
<Gen3776_maybe> ::= rank => -1
<Fortran_Type_Specification> ::= <CHARACTER> <Gen3765_maybe> <Gen3768_maybe> rank => 0
                               | <CHARACTER> <KIND> <Lex020> <Lex003> <Gen3771> <Gen3773_maybe> <Gen3776_maybe> rank => -1
                               | <INTEGER> rank => -2
                               | <REAL> rank => -3
                               | <DOUBLE> <PRECISION> rank => -4
                               | <LOGICAL> rank => -5
                               | <Fortran_Derived_Type_Specification> rank => -6
<Fortran_Derived_Type_Specification> ::= <Fortran_Clob_Variable> rank => 0
                                       | <Fortran_Blob_Variable> rank => -1
                                       | <Fortran_User_Defined_Type_Variable> rank => -2
                                       | <Fortran_Clob_Locator_Variable> rank => -3
                                       | <Fortran_Blob_Locator_Variable> rank => -4
                                       | <Fortran_User_Defined_Type_Locator_Variable> rank => -5
                                       | <Fortran_Array_Locator_Variable> rank => -6
                                       | <Fortran_Multiset_Locator_Variable> rank => -7
                                       | <Fortran_Ref_Variable> rank => -8
<Gen3795> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3795_maybe> ::= <Gen3795> rank => 0
<Gen3795_maybe> ::= rank => -1
<Fortran_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <Gen3795_maybe> rank => 0
<Fortran_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Fortran_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <Predefined_Type> rank => 0
<Fortran_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<Fortran_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<Fortran_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<Fortran_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <Array_Type> <AS> <LOCATOR> rank => 0
<Fortran_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <Multiset_Type> <AS> <LOCATOR> rank => 0
<Fortran_Ref_Variable> ::= <SQL> <TYPE> <IS> <Reference_Type> rank => 0
<Embedded_SQL_Mumps_Program> ::= <EXEC> <SQL> rank => 0
<Mumps_Variable_Definition> ::= <Mumps_Numeric_Variable> <Semicolon> rank => 0
                              | <Mumps_Character_Variable> <Semicolon> rank => -1
                              | <Mumps_Derived_Type_Specification> <Semicolon> rank => -2
<Mumps_Host_Identifier> ::= <Lex601_many> rank => 0
<Gen3812> ::= <Comma> <Mumps_Host_Identifier> <Mumps_Length_Specification> rank => 0
<Gen3812_any> ::= <Gen3812>* rank => 0
<Mumps_Character_Variable> ::= <VARCHAR> <Mumps_Host_Identifier> <Mumps_Length_Specification> <Gen3812_any> rank => 0
<Mumps_Length_Specification> ::= <Left_Paren> <Length> <Right_Paren> rank => 0
<Gen3816> ::= <Comma> <Mumps_Host_Identifier> rank => 0
<Gen3816_any> ::= <Gen3816>* rank => 0
<Mumps_Numeric_Variable> ::= <Mumps_Type_Specification> <Mumps_Host_Identifier> <Gen3816_any> rank => 0
<Gen3819> ::= <Comma> <Scale> rank => 0
<Gen3819_maybe> ::= <Gen3819> rank => 0
<Gen3819_maybe> ::= rank => -1
<Gen3822> ::= <Left_Paren> <Precision> <Gen3819_maybe> <Right_Paren> rank => 0
<Gen3822_maybe> ::= <Gen3822> rank => 0
<Gen3822_maybe> ::= rank => -1
<Mumps_Type_Specification> ::= <INT> rank => 0
                             | <DEC> <Gen3822_maybe> rank => -1
                             | <REAL> rank => -2
<Mumps_Derived_Type_Specification> ::= <Mumps_Clob_Variable> rank => 0
                                     | <Mumps_Blob_Variable> rank => -1
                                     | <Mumps_User_Defined_Type_Variable> rank => -2
                                     | <Mumps_Clob_Locator_Variable> rank => -3
                                     | <Mumps_Blob_Locator_Variable> rank => -4
                                     | <Mumps_User_Defined_Type_Locator_Variable> rank => -5
                                     | <Mumps_Array_Locator_Variable> rank => -6
                                     | <Mumps_Multiset_Locator_Variable> rank => -7
                                     | <Mumps_Ref_Variable> rank => -8
<Gen3837> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3837_maybe> ::= <Gen3837> rank => 0
<Gen3837_maybe> ::= rank => -1
<Mumps_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <Gen3837_maybe> rank => 0
<Mumps_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Mumps_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <Predefined_Type> rank => 0
<Mumps_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<Mumps_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<Mumps_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<Mumps_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <Array_Type> <AS> <LOCATOR> rank => 0
<Mumps_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <Multiset_Type> <AS> <LOCATOR> rank => 0
<Mumps_Ref_Variable> ::= <SQL> <TYPE> <IS> <Reference_Type> rank => 0
<Embedded_SQL_Pascal_Program> ::= <EXEC> <SQL> rank => 0
<Pascal_Host_Identifier> ::= <Lex602_many> rank => 0
<Gen3851> ::= <Comma> <Pascal_Host_Identifier> rank => 0
<Gen3851_any> ::= <Gen3851>* rank => 0
<Pascal_Variable_Definition> ::= <Pascal_Host_Identifier> <Gen3851_any> <Colon> <Pascal_Type_Specification> <Semicolon> rank => 0
<Gen3854> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3854_maybe> ::= <Gen3854> rank => 0
<Gen3854_maybe> ::= rank => -1
<Gen3857> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3857_maybe> ::= <Gen3857> rank => 0
<Gen3857_maybe> ::= rank => -1
<Pascal_Type_Specification> ::= <PACKED> <ARRAY> <Left_Bracket> <Lex570> <Double_Period> <Length> <Right_Bracket> <OF> <CHAR> <Gen3854_maybe> rank => 0
                              | <INTEGER> rank => -1
                              | <REAL> rank => -2
                              | <CHAR> <Gen3857_maybe> rank => -3
                              | <BOOLEAN> rank => -4
                              | <Pascal_Derived_Type_Specification> rank => -5
<Pascal_Derived_Type_Specification> ::= <Pascal_Clob_Variable> rank => 0
                                      | <Pascal_Blob_Variable> rank => -1
                                      | <Pascal_User_Defined_Type_Variable> rank => -2
                                      | <Pascal_Clob_Locator_Variable> rank => -3
                                      | <Pascal_Blob_Locator_Variable> rank => -4
                                      | <Pascal_User_Defined_Type_Locator_Variable> rank => -5
                                      | <Pascal_Array_Locator_Variable> rank => -6
                                      | <Pascal_Multiset_Locator_Variable> rank => -7
                                      | <Pascal_Ref_Variable> rank => -8
<Gen3875> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3875_maybe> ::= <Gen3875> rank => 0
<Gen3875_maybe> ::= rank => -1
<Pascal_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <Gen3875_maybe> rank => 0
<Pascal_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Pascal_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<Pascal_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <Predefined_Type> rank => 0
<Pascal_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<Pascal_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<Pascal_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <Array_Type> <AS> <LOCATOR> rank => 0
<Pascal_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <Multiset_Type> <AS> <LOCATOR> rank => 0
<Pascal_Ref_Variable> ::= <SQL> <TYPE> <IS> <Reference_Type> rank => 0
<Embedded_SQL_Pl_I_Program> ::= <EXEC> <SQL> rank => 0
<Pl_I_Host_Identifier> ::= <Lex604_many> rank => 0
<Gen3889> ::= <DCL> rank => 0
            | <DECLARE> rank => -1
<Gen3891> ::= <Comma> <Pl_I_Host_Identifier> rank => 0
<Gen3891_any> ::= <Gen3891>* rank => 0
<Pl_I_Variable_Definition> ::= <Gen3889> <Pl_I_Host_Identifier> <Left_Paren> <Pl_I_Host_Identifier> <Gen3891_any> <Right_Paren> <Pl_I_Type_Specification> <Character_Representation_any> <Semicolon> rank => 0
<Gen3894> ::= <CHAR> rank => 0
            | <CHARACTER> rank => -1
<VARYING_maybe> ::= <VARYING> rank => 0
<VARYING_maybe> ::= rank => -1
<Gen3898> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3898_maybe> ::= <Gen3898> rank => 0
<Gen3898_maybe> ::= rank => -1
<Gen3901> ::= <Comma> <Scale> rank => 0
<Gen3901_maybe> ::= <Gen3901> rank => 0
<Gen3901_maybe> ::= rank => -1
<Gen3904> ::= <Left_Paren> <Precision> <Right_Paren> rank => 0
<Gen3904_maybe> ::= <Gen3904> rank => 0
<Gen3904_maybe> ::= rank => -1
<Pl_I_Type_Specification> ::= <Gen3894> <VARYING_maybe> <Left_Paren> <Length> <Right_Paren> <Gen3898_maybe> rank => 0
                            | <Pl_I_Type_Fixed_Decimal> <Left_Paren> <Precision> <Gen3901_maybe> <Right_Paren> rank => -1
                            | <Pl_I_Type_Fixed_Binary> <Gen3904_maybe> rank => -2
                            | <Pl_I_Type_Float_Binary> <Left_Paren> <Precision> <Right_Paren> rank => -3
                            | <Pl_I_Derived_Type_Specification> rank => -4
<Pl_I_Derived_Type_Specification> ::= <Pl_I_Clob_Variable> rank => 0
                                    | <Pl_I_Blob_Variable> rank => -1
                                    | <Pl_I_User_Defined_Type_Variable> rank => -2
                                    | <Pl_I_Clob_Locator_Variable> rank => -3
                                    | <Pl_I_Blob_Locator_Variable> rank => -4
                                    | <Pl_I_User_Defined_Type_Locator_Variable> rank => -5
                                    | <Pl_I_Array_Locator_Variable> rank => -6
                                    | <Pl_I_Multiset_Locator_Variable> rank => -7
                                    | <Pl_I_Ref_Variable> rank => -8
<Gen3921> ::= <CHARACTER> <SET> <IS_maybe> <Character_Set_Specification> rank => 0
<Gen3921_maybe> ::= <Gen3921> rank => 0
<Gen3921_maybe> ::= rank => -1
<Pl_I_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> <Gen3921_maybe> rank => 0
<Pl_I_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <Left_Paren> <Large_Object_Length> <Right_Paren> rank => 0
<Pl_I_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <Predefined_Type> rank => 0
<Pl_I_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<Pl_I_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<Pl_I_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <Path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<Pl_I_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <Array_Type> <AS> <LOCATOR> rank => 0
<Pl_I_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <Multiset_Type> <AS> <LOCATOR> rank => 0
<Pl_I_Ref_Variable> ::= <SQL> <TYPE> <IS> <Reference_Type> rank => 0
<Gen3933> ::= <DEC> rank => 0
            | <DECIMAL> rank => -1
<Gen3935> ::= <DEC> rank => 0
            | <DECIMAL> rank => -1
<Pl_I_Type_Fixed_Decimal> ::= <Gen3933> <FIXED> rank => 0
                            | <FIXED> <Gen3935> rank => -1
<Gen3939> ::= <BIN> rank => 0
            | <BINARY> rank => -1
<Gen3941> ::= <BIN> rank => 0
            | <BINARY> rank => -1
<Pl_I_Type_Fixed_Binary> ::= <Gen3939> <FIXED> rank => 0
                           | <FIXED> <Gen3941> rank => -1
<Gen3945> ::= <BIN> rank => 0
            | <BINARY> rank => -1
<Gen3947> ::= <BIN> rank => 0
            | <BINARY> rank => -1
<Pl_I_Type_Float_Binary> ::= <Gen3945> <FLOAT> rank => 0
                           | <FLOAT> <Gen3947> rank => -1
<Direct_SQL_Statement> ::= <Directly_Executable_Statement> <Semicolon> rank => 0
<Directly_Executable_Statement> ::= <Direct_SQL_Data_Statement> rank => 0
                                  | <SQL_Schema_Statement> rank => -1
                                  | <SQL_Transaction_Statement> rank => -2
                                  | <SQL_Connection_Statement> rank => -3
                                  | <SQL_Session_Statement> rank => -4
<Direct_SQL_Data_Statement> ::= <Delete_Statement_Searched> rank => 0
                              | <Direct_Select_Statement_Multiple_Rows> rank => -1
                              | <Insert_Statement> rank => -2
                              | <Update_Statement_Searched> rank => -3
                              | <Merge_Statement> rank => -4
                              | <Temporary_Table_Declaration> rank => -5
<Direct_Select_Statement_Multiple_Rows> ::= <Cursor_Specification> rank => 0
<Get_Diagnostics_Statement> ::= <GET> <DIAGNOSTICS> <SQL_Diagnostics_Information> rank => 0
<SQL_Diagnostics_Information> ::= <Statement_Information> rank => 0
                                | <Condition_Information> rank => -1
<Gen3967> ::= <Comma> <Statement_Information_Item> rank => 0
<Gen3967_any> ::= <Gen3967>* rank => 0
<Statement_Information> ::= <Statement_Information_Item> <Gen3967_any> rank => 0
<Statement_Information_Item> ::= <Simple_Target_Specification> <Equals_Operator> <Statement_Information_Item_Name> rank => 0
<Statement_Information_Item_Name> ::= <NUMBER> rank => 0
                                    | <MORE> rank => -1
                                    | <Lex093> rank => -2
                                    | <Lex094> rank => -3
                                    | <Lex130> rank => -4
                                    | <Lex131> rank => -5
                                    | <Lex237> rank => -6
                                    | <Lex274> rank => -7
                                    | <Lex275> rank => -8
                                    | <Lex276> rank => -9
<Gen3981> ::= <EXCEPTION> rank => 0
            | <CONDITION> rank => -1
<Gen3983> ::= <Comma> <Condition_Information_Item> rank => 0
<Gen3983_any> ::= <Gen3983>* rank => 0
<Condition_Information> ::= <Gen3981> <Condition_Number> <Condition_Information_Item> <Gen3983_any> rank => 0
<Condition_Information_Item> ::= <Simple_Target_Specification> <Equals_Operator> <Condition_Information_Item_Name> rank => 0
<Condition_Information_Item_Name> ::= <Lex071> rank => 0
                                    | <Lex083> rank => -1
                                    | <Lex092> rank => -2
                                    | <Lex097> rank => -3
                                    | <Lex098> rank => -4
                                    | <Lex100> rank => -5
                                    | <Lex101> rank => -6
                                    | <Lex102> rank => -7
                                    | <Lex112> rank => -8
                                    | <Lex173> rank => -9
                                    | <Lex174> rank => -10
                                    | <Lex175> rank => -11
                                    | <Lex202> rank => -12
                                    | <Lex203> rank => -13
                                    | <Lex204> rank => -14
                                    | <Lex231> rank => -15
                                    | <Lex234> rank => -16
                                    | <Lex235> rank => -17
                                    | <Lex236> rank => -18
                                    | <Lex241> rank => -19
                                    | <Lex250> rank => -20
                                    | <Lex257> rank => -21
                                    | <Lex265> rank => -22
                                    | <Lex269> rank => -23
                                    | <Lex280> rank => -24
                                    | <Lex281> rank => -25
                                    | <Lex282> rank => -26
<Condition_Number> ::= <Simple_Value_Specification> rank => 0
<A> ~ 'A':i
<ABS> ~ 'ABS':i
<ABSOLUTE> ~ 'ABSOLUTE':i
<ACTION> ~ 'ACTION':i
<ADA> ~ 'ADA':i
:lexeme ~ <ADD>  priority => 1
<ADD> ~ 'ADD':i
<ADMIN> ~ 'ADMIN':i
<AFTER> ~ 'AFTER':i
:lexeme ~ <ALL>  priority => 1
<ALL> ~ 'ALL':i
:lexeme ~ <ALLOCATE>  priority => 1
<ALLOCATE> ~ 'ALLOCATE':i
:lexeme ~ <ALTER>  priority => 1
<ALTER> ~ 'ALTER':i
<ALWAYS> ~ 'ALWAYS':i
:lexeme ~ <AND>  priority => 1
<AND> ~ 'AND':i
:lexeme ~ <ANY>  priority => 1
<ANY> ~ 'ANY':i
:lexeme ~ <ARE>  priority => 1
<ARE> ~ 'ARE':i
:lexeme ~ <ARRAY>  priority => 1
<ARRAY> ~ 'ARRAY':i
:lexeme ~ <AS>  priority => 1
<AS> ~ 'AS':i
<ASC> ~ 'ASC':i
:lexeme ~ <ASENSITIVE>  priority => 1
<ASENSITIVE> ~ 'ASENSITIVE':i
<ASSERTION> ~ 'ASSERTION':i
<ASSIGNMENT> ~ 'ASSIGNMENT':i
:lexeme ~ <ASYMMETRIC>  priority => 1
<ASYMMETRIC> ~ 'ASYMMETRIC':i
:lexeme ~ <AT>  priority => 1
<AT> ~ 'AT':i
:lexeme ~ <ATOMIC>  priority => 1
<ATOMIC> ~ 'ATOMIC':i
<ATTRIBUTE> ~ 'ATTRIBUTE':i
<ATTRIBUTES> ~ 'ATTRIBUTES':i
:lexeme ~ <AUTHORIZATION>  priority => 1
<AUTHORIZATION> ~ 'AUTHORIZATION':i
<AVG> ~ 'AVG':i
<B> ~ 'B':i
<BEFORE> ~ 'BEFORE':i
:lexeme ~ <BEGIN>  priority => 1
<BEGIN> ~ 'BEGIN':i
<BERNOULLI> ~ 'BERNOULLI':i
:lexeme ~ <BETWEEN>  priority => 1
<BETWEEN> ~ 'BETWEEN':i
:lexeme ~ <BIGINT>  priority => 1
<BIGINT> ~ 'BIGINT':i
<BIN> ~ 'BIN':i
:lexeme ~ <BINARY>  priority => 1
<BINARY> ~ 'BINARY':i
:lexeme ~ <BLOB>  priority => 1
<BLOB> ~ 'BLOB':i
:lexeme ~ <BOOLEAN>  priority => 1
<BOOLEAN> ~ 'BOOLEAN':i
:lexeme ~ <BOTH>  priority => 1
<BOTH> ~ 'BOTH':i
<BREADTH> ~ 'BREADTH':i
:lexeme ~ <BY>  priority => 1
<BY> ~ 'BY':i
<C> ~ 'C':i
:lexeme ~ <CALL>  priority => 1
<CALL> ~ 'CALL':i
:lexeme ~ <CALLED>  priority => 1
<CALLED> ~ 'CALLED':i
<CARDINALITY> ~ 'CARDINALITY':i
<CASCADE> ~ 'CASCADE':i
:lexeme ~ <CASCADED>  priority => 1
<CASCADED> ~ 'CASCADED':i
:lexeme ~ <CASE>  priority => 1
<CASE> ~ 'CASE':i
:lexeme ~ <CAST>  priority => 1
<CAST> ~ 'CAST':i
<CATALOG> ~ 'CATALOG':i
<CEIL> ~ 'CEIL':i
<CEILING> ~ 'CEILING':i
<CHAIN> ~ 'CHAIN':i
:lexeme ~ <CHAR>  priority => 1
<CHAR> ~ 'CHAR':i
:lexeme ~ <CHARACTER>  priority => 1
<CHARACTER> ~ 'CHARACTER':i
<CHARACTERISTICS> ~ 'CHARACTERISTICS':i
<CHARACTERS> ~ 'CHARACTERS':i
:lexeme ~ <CHECK>  priority => 1
<CHECK> ~ 'CHECK':i
<CHECKED> ~ 'CHECKED':i
:lexeme ~ <CLOB>  priority => 1
<CLOB> ~ 'CLOB':i
:lexeme ~ <CLOSE>  priority => 1
<CLOSE> ~ 'CLOSE':i
<COALESCE> ~ 'COALESCE':i
<COBOL> ~ 'COBOL':i
:lexeme ~ <COLLATE>  priority => 1
<COLLATE> ~ 'COLLATE':i
<COLLATION> ~ 'COLLATION':i
<COLLECT> ~ 'COLLECT':i
:lexeme ~ <COLUMN>  priority => 1
<COLUMN> ~ 'COLUMN':i
:lexeme ~ <COMMIT>  priority => 1
<COMMIT> ~ 'COMMIT':i
<COMMITTED> ~ 'COMMITTED':i
<CONDITION> ~ 'CONDITION':i
:lexeme ~ <CONNECT>  priority => 1
<CONNECT> ~ 'CONNECT':i
<CONNECTION> ~ 'CONNECTION':i
:lexeme ~ <CONSTRAINT>  priority => 1
<CONSTRAINT> ~ 'CONSTRAINT':i
<CONSTRAINTS> ~ 'CONSTRAINTS':i
<CONSTRUCTOR> ~ 'CONSTRUCTOR':i
<CONSTRUCTORS> ~ 'CONSTRUCTORS':i
<CONTAINS> ~ 'CONTAINS':i
:lexeme ~ <CONTINUE>  priority => 1
<CONTINUE> ~ 'CONTINUE':i
<CONVERT> ~ 'CONVERT':i
<CORR> ~ 'CORR':i
:lexeme ~ <CORRESPONDING>  priority => 1
<CORRESPONDING> ~ 'CORRESPONDING':i
<COUNT> ~ 'COUNT':i
:lexeme ~ <CREATE>  priority => 1
<CREATE> ~ 'CREATE':i
:lexeme ~ <CROSS>  priority => 1
<CROSS> ~ 'CROSS':i
:lexeme ~ <CUBE>  priority => 1
<CUBE> ~ 'CUBE':i
:lexeme ~ <CURRENT>  priority => 1
<CURRENT> ~ 'CURRENT':i
:lexeme ~ <CURSOR>  priority => 1
<CURSOR> ~ 'CURSOR':i
:lexeme ~ <CYCLE>  priority => 1
<CYCLE> ~ 'CYCLE':i
<D> ~ 'D':i
<DATA> ~ 'DATA':i
:lexeme ~ <DATE>  priority => 1
<DATE> ~ 'DATE':i
:lexeme ~ <DAY>  priority => 1
<DAY> ~ 'DAY':i
<DCL> ~ 'DCL':i
:lexeme ~ <DEALLOCATE>  priority => 1
<DEALLOCATE> ~ 'DEALLOCATE':i
:lexeme ~ <DEC>  priority => 1
<DEC> ~ 'DEC':i
:lexeme ~ <DECIMAL>  priority => 1
<DECIMAL> ~ 'DECIMAL':i
:lexeme ~ <DECLARE>  priority => 1
<DECLARE> ~ 'DECLARE':i
:lexeme ~ <DEFAULT>  priority => 1
<DEFAULT> ~ 'DEFAULT':i
<DEFAULTS> ~ 'DEFAULTS':i
<DEFERRABLE> ~ 'DEFERRABLE':i
<DEFERRED> ~ 'DEFERRED':i
<DEFINED> ~ 'DEFINED':i
<DEFINER> ~ 'DEFINER':i
<DEGREE> ~ 'DEGREE':i
:lexeme ~ <DELETE>  priority => 1
<DELETE> ~ 'DELETE':i
<DEPTH> ~ 'DEPTH':i
:lexeme ~ <DEREF>  priority => 1
<DEREF> ~ 'DEREF':i
<DERIVED> ~ 'DERIVED':i
<DESC> ~ 'DESC':i
:lexeme ~ <DESCRIBE>  priority => 1
<DESCRIBE> ~ 'DESCRIBE':i
<DESCRIPTOR> ~ 'DESCRIPTOR':i
:lexeme ~ <DETERMINISTIC>  priority => 1
<DETERMINISTIC> ~ 'DETERMINISTIC':i
<DIAGNOSTICS> ~ 'DIAGNOSTICS':i
:lexeme ~ <DISCONNECT>  priority => 1
<DISCONNECT> ~ 'DISCONNECT':i
<DISPATCH> ~ 'DISPATCH':i
<DISPLAY> ~ 'DISPLAY':i
:lexeme ~ <DISTINCT>  priority => 1
<DISTINCT> ~ 'DISTINCT':i
<DOMAIN> ~ 'DOMAIN':i
:lexeme ~ <DOUBLE>  priority => 1
<DOUBLE> ~ 'DOUBLE':i
:lexeme ~ <DROP>  priority => 1
<DROP> ~ 'DROP':i
:lexeme ~ <DYNAMIC>  priority => 1
<DYNAMIC> ~ 'DYNAMIC':i
<E> ~ 'E':i
:lexeme ~ <EACH>  priority => 1
<EACH> ~ 'EACH':i
:lexeme ~ <ELEMENT>  priority => 1
<ELEMENT> ~ 'ELEMENT':i
:lexeme ~ <ELSE>  priority => 1
<ELSE> ~ 'ELSE':i
:lexeme ~ <END>  priority => 1
<END> ~ 'END':i
<EQUALS> ~ 'EQUALS':i
:lexeme ~ <ESCAPE>  priority => 1
<ESCAPE> ~ 'ESCAPE':i
<EVERY> ~ 'EVERY':i
:lexeme ~ <EXCEPT>  priority => 1
<EXCEPT> ~ 'EXCEPT':i
<EXCEPTION> ~ 'EXCEPTION':i
<EXCLUDE> ~ 'EXCLUDE':i
<EXCLUDING> ~ 'EXCLUDING':i
:lexeme ~ <EXEC>  priority => 1
<EXEC> ~ 'EXEC':i
:lexeme ~ <EXECUTE>  priority => 1
<EXECUTE> ~ 'EXECUTE':i
:lexeme ~ <EXISTS>  priority => 1
<EXISTS> ~ 'EXISTS':i
<EXP> ~ 'EXP':i
:lexeme ~ <EXTERNAL>  priority => 1
<EXTERNAL> ~ 'EXTERNAL':i
<EXTRACT> ~ 'EXTRACT':i
<F> ~ 'F':i
:lexeme ~ <FALSE>  priority => 1
<FALSE> ~ 'FALSE':i
:lexeme ~ <FETCH>  priority => 1
<FETCH> ~ 'FETCH':i
:lexeme ~ <FILTER>  priority => 1
<FILTER> ~ 'FILTER':i
<FINAL> ~ 'FINAL':i
<FIRST> ~ 'FIRST':i
<FIXED> ~ 'FIXED':i
:lexeme ~ <FLOAT>  priority => 1
<FLOAT> ~ 'FLOAT':i
<FLOOR> ~ 'FLOOR':i
<FOLLOWING> ~ 'FOLLOWING':i
:lexeme ~ <FOR>  priority => 1
<FOR> ~ 'FOR':i
:lexeme ~ <FOREIGN>  priority => 1
<FOREIGN> ~ 'FOREIGN':i
<FORTRAN> ~ 'FORTRAN':i
<FOUND> ~ 'FOUND':i
:lexeme ~ <FREE>  priority => 1
<FREE> ~ 'FREE':i
:lexeme ~ <FROM>  priority => 1
<FROM> ~ 'FROM':i
:lexeme ~ <FULL>  priority => 1
<FULL> ~ 'FULL':i
:lexeme ~ <FUNCTION>  priority => 1
<FUNCTION> ~ 'FUNCTION':i
<FUSION> ~ 'FUSION':i
<G> ~ 'G':i
<GENERAL> ~ 'GENERAL':i
<GENERATED> ~ 'GENERATED':i
:lexeme ~ <GET>  priority => 1
<GET> ~ 'GET':i
:lexeme ~ <GLOBAL>  priority => 1
<GLOBAL> ~ 'GLOBAL':i
<GO> ~ 'GO':i
<GOTO> ~ 'GOTO':i
:lexeme ~ <GRANT>  priority => 1
<GRANT> ~ 'GRANT':i
<GRANTED> ~ 'GRANTED':i
:lexeme ~ <GROUP>  priority => 1
<GROUP> ~ 'GROUP':i
:lexeme ~ <GROUPING>  priority => 1
<GROUPING> ~ 'GROUPING':i
:lexeme ~ <HAVING>  priority => 1
<HAVING> ~ 'HAVING':i
<HIERARCHY> ~ 'HIERARCHY':i
:lexeme ~ <HOLD>  priority => 1
<HOLD> ~ 'HOLD':i
:lexeme ~ <HOUR>  priority => 1
<HOUR> ~ 'HOUR':i
:lexeme ~ <IDENTITY>  priority => 1
<IDENTITY> ~ 'IDENTITY':i
:lexeme ~ <IMMEDIATE>  priority => 1
<IMMEDIATE> ~ 'IMMEDIATE':i
<IMPLEMENTATION> ~ 'IMPLEMENTATION':i
:lexeme ~ <IN>  priority => 1
<IN> ~ 'IN':i
<INCLUDING> ~ 'INCLUDING':i
<INCREMENT> ~ 'INCREMENT':i
:lexeme ~ <INDICATOR>  priority => 1
<INDICATOR> ~ 'INDICATOR':i
<INITIALLY> ~ 'INITIALLY':i
:lexeme ~ <INNER>  priority => 1
<INNER> ~ 'INNER':i
:lexeme ~ <INOUT>  priority => 1
<INOUT> ~ 'INOUT':i
:lexeme ~ <INPUT>  priority => 1
<INPUT> ~ 'INPUT':i
:lexeme ~ <INSENSITIVE>  priority => 1
<INSENSITIVE> ~ 'INSENSITIVE':i
:lexeme ~ <INSERT>  priority => 1
<INSERT> ~ 'INSERT':i
<INSTANCE> ~ 'INSTANCE':i
<INSTANTIABLE> ~ 'INSTANTIABLE':i
:lexeme ~ <INT>  priority => 1
<INT> ~ 'INT':i
:lexeme ~ <INTEGER>  priority => 1
<INTEGER> ~ 'INTEGER':i
:lexeme ~ <INTERSECT>  priority => 1
<INTERSECT> ~ 'INTERSECT':i
<INTERSECTION> ~ 'INTERSECTION':i
:lexeme ~ <INTERVAL>  priority => 1
<INTERVAL> ~ 'INTERVAL':i
:lexeme ~ <INTO>  priority => 1
<INTO> ~ 'INTO':i
<INVOKER> ~ 'INVOKER':i
:lexeme ~ <IS>  priority => 1
<IS> ~ 'IS':i
:lexeme ~ <ISOLATION>  priority => 1
<ISOLATION> ~ 'ISOLATION':i
:lexeme ~ <JOIN>  priority => 1
<JOIN> ~ 'JOIN':i
<K> ~ 'K':i
<KEY> ~ 'KEY':i
<KIND> ~ 'KIND':i
:lexeme ~ <LANGUAGE>  priority => 1
<LANGUAGE> ~ 'LANGUAGE':i
:lexeme ~ <LARGE>  priority => 1
<LARGE> ~ 'LARGE':i
<LAST> ~ 'LAST':i
:lexeme ~ <LATERAL>  priority => 1
<LATERAL> ~ 'LATERAL':i
:lexeme ~ <LEADING>  priority => 1
<LEADING> ~ 'LEADING':i
:lexeme ~ <LEFT>  priority => 1
<LEFT> ~ 'LEFT':i
<LENGTH> ~ 'LENGTH':i
<LEVEL> ~ 'LEVEL':i
:lexeme ~ <LIKE>  priority => 1
<LIKE> ~ 'LIKE':i
<LN> ~ 'LN':i
:lexeme ~ <LOCAL>  priority => 1
<LOCAL> ~ 'LOCAL':i
:lexeme ~ <LOCALTIME>  priority => 1
<LOCALTIME> ~ 'LOCALTIME':i
:lexeme ~ <LOCALTIMESTAMP>  priority => 1
<LOCALTIMESTAMP> ~ 'LOCALTIMESTAMP':i
<LOCATOR> ~ 'LOCATOR':i
<LOGICAL> ~ 'LOGICAL':i
<LOWER> ~ 'LOWER':i
<Lex001> ~ [A-Z]
<Lex002> ~ [a-z]
<Lex003> ~ [0-9]
<Lex003_many> ~ [0-9]*
<Lex004> ~ [\s]
<Lex005> ~ '"'
<Lex006> ~ '%'
<Lex007> ~ '&'
<Lex008> ~ [']
<Lex009> ~ '('
<Lex010> ~ ')'
<Lex011> ~ '*'
<Lex012> ~ '+'
<Lex013> ~ ','
<Lex014> ~ '-'
<Lex015> ~ '.'
<Lex016> ~ '/'
<Lex017> ~ ':'
<Lex018> ~ ';'
<Lex019> ~ '<'
<Lex020> ~ '='
<Lex021> ~ '>'
<Lex022> ~ '?'
<Lex023> ~ '['
<Lex024> ~ '??('
<Lex025> ~ ']'
<Lex026> ~ '??)'
<Lex027> ~ '^'
<Lex028> ~ '_':i
<Lex029> ~ '|'
<Lex030> ~ '{'
<Lex031> ~ '}'
<Lex035> ~ '"'
<Lex036> ~ '"'
<Lex037> ~ 'U':i
<Lex038> ~ '&'
<Lex039> ~ '"'
<Lex040> ~ '"'
<Lex041> ~ 'UESCAPE':i
<Lex042> ~ [']
<Lex043> ~ [']
<Lex044> ~ [a-fA-f0-9]
<Lex045> ~ '+'
<Lex046> ~ [\x{1b}]
<Lex047> ~ [^"]
<Lex048> ~ '""'
<Lex049> ~ [\n]
<Lex071> ~ 'CATALOG_NAME':i
<Lex077> ~ 'CHARACTER_LENGTH':i
<Lex078> ~ 'CHARACTER_SET_CATALOG':i
<Lex079> ~ 'CHARACTER_SET_NAME':i
<Lex080> ~ 'CHARACTER_SET_SCHEMA':i
<Lex081> ~ 'CHAR_LENGTH':i
<Lex083> ~ 'CLASS_ORIGIN':i
<Lex086> ~ 'CODE_UNITS':i
<Lex088> ~ 'COLLATION_CATALOG':i
<Lex089> ~ 'COLLATION_NAME':i
<Lex090> ~ 'COLLATION_SCHEMA':i
<Lex092> ~ 'COLUMN_NAME':i
<Lex093> ~ 'COMMAND_FUNCTION':i
<Lex094> ~ 'COMMAND_FUNCTION_CODE':i
<Lex097> ~ 'CONDITION_NUMBER':i
<Lex098> ~ 'CONNECTION_NAME':i
<Lex100> ~ 'CONSTRAINT_CATALOG':i
<Lex101> ~ 'CONSTRAINT_NAME':i
<Lex102> ~ 'CONSTRAINT_SCHEMA':i
<Lex108> ~ 'COVAR_POP':i
<Lex109> ~ 'COVAR_SAMP':i
<Lex110> ~ 'CUME_DIST':i
<Lex111> ~ 'CURRENT_COLLATION':i
<Lex112> ~ 'CURSOR_NAME':i
<Lex114> ~ 'DATETIME_INTERVAL_CODE':i
<Lex115> ~ 'DATETIME_INTERVAL_PRECISION':i
<Lex122> ~ 'DENSE_RANK':i
<Lex130> ~ 'DYNAMIC_FUNCTION':i
<Lex131> ~ 'DYNAMIC_FUNCTION_CODE':i
<Lex161> ~ 'KEY_MEMBER':i
<Lex162> ~ 'KEY_TYPE':i
<Lex173> ~ 'MESSAGE_LENGTH':i
<Lex174> ~ 'MESSAGE_OCTET_LENGTH':i
<Lex175> ~ 'MESSAGE_TEXT':i
<Lex193> ~ 'OCTET_LENGTH':i
<Lex202> ~ 'PARAMETER_MODE':i
<Lex203> ~ 'PARAMETER_NAME':i
<Lex204> ~ 'PARAMETER_ORDINAL_POSITION':i
<Lex205> ~ 'PARAMETER_SPECIFIC_CATALOG':i
<Lex206> ~ 'PARAMETER_SPECIFIC_NAME':i
<Lex207> ~ 'PARAMETER_SPECIFIC_SCHEMA':i
<Lex211> ~ 'PERCENTILE_CONT':i
<Lex212> ~ 'PERCENTILE_DISC':i
<Lex213> ~ 'PERCENT_RANK':i
<Lex228> ~ 'RETURNED_CARDINALITY':i
<Lex229> ~ 'RETURNED_LENGTH':i
<Lex230> ~ 'RETURNED_OCTET_LENGTH':i
<Lex231> ~ 'RETURNED_SQLSTATE':i
<Lex234> ~ 'ROUTINE_CATALOG':i
<Lex235> ~ 'ROUTINE_NAME':i
<Lex236> ~ 'ROUTINE_SCHEMA':i
<Lex237> ~ 'ROW_COUNT':i
<Lex238> ~ 'ROW_NUMBER':i
<Lex241> ~ 'SCHEMA_NAME':i
<Lex242> ~ 'SCOPE_CATALOG':i
<Lex243> ~ 'SCOPE_NAME':i
<Lex244> ~ 'SCOPE_SCHEMA':i
<Lex250> ~ 'SERVER_NAME':i
<Lex257> ~ 'SPECIFIC_NAME':i
<Lex261> ~ 'STDDEV_POP':i
<Lex262> ~ 'STDDEV_SAMP':i
<Lex265> ~ 'SUBCLASS_ORIGIN':i
<Lex269> ~ 'TABLE_NAME':i
<Lex272> ~ 'TOP_LEVEL_COUNT':i
<Lex274> ~ 'TRANSACTIONS_COMMITTED':i
<Lex275> ~ 'TRANSACTIONS_ROLLED_BACK':i
<Lex276> ~ 'TRANSACTION_ACTIVE':i
<Lex280> ~ 'TRIGGER_CATALOG':i
<Lex281> ~ 'TRIGGER_NAME':i
<Lex282> ~ 'TRIGGER_SCHEMA':i
<Lex290> ~ 'USER_DEFINED_TYPE_CATALOG':i
<Lex291> ~ 'USER_DEFINED_TYPE_CODE':i
<Lex292> ~ 'USER_DEFINED_TYPE_NAME':i
<Lex293> ~ 'USER_DEFINED_TYPE_SCHEMA':i
:lexeme ~ <Lex341>  priority => 1
<Lex341> ~ 'CURRENT_DATE':i
:lexeme ~ <Lex342>  priority => 1
<Lex342> ~ 'CURRENT_DEFAULT_TRANSFORM_GROUP':i
:lexeme ~ <Lex343>  priority => 1
<Lex343> ~ 'CURRENT_PATH':i
:lexeme ~ <Lex344>  priority => 1
<Lex344> ~ 'CURRENT_ROLE':i
:lexeme ~ <Lex345>  priority => 1
<Lex345> ~ 'CURRENT_TIME':i
:lexeme ~ <Lex346>  priority => 1
<Lex346> ~ 'CURRENT_TIMESTAMP':i
:lexeme ~ <Lex347>  priority => 1
<Lex347> ~ 'CURRENT_TRANSFORM_GROUP_FOR_TYPE':i
:lexeme ~ <Lex348>  priority => 1
<Lex348> ~ 'CURRENT_USER':i
:lexeme ~ <Lex371>  priority => 1
<Lex371> ~ 'END-EXEC'
:lexeme ~ <Lex465>  priority => 1
<Lex465> ~ 'REGR_AVGX':i
:lexeme ~ <Lex466>  priority => 1
<Lex466> ~ 'REGR_AVGY':i
:lexeme ~ <Lex467>  priority => 1
<Lex467> ~ 'REGR_COUNT':i
:lexeme ~ <Lex468>  priority => 1
<Lex468> ~ 'REGR_INTERCEPT':i
:lexeme ~ <Lex469>  priority => 1
<Lex469> ~ 'REGR_R2'
:lexeme ~ <Lex470>  priority => 1
<Lex470> ~ 'REGR_SLOPE':i
:lexeme ~ <Lex471>  priority => 1
<Lex471> ~ 'REGR_SXX':i
:lexeme ~ <Lex472>  priority => 1
<Lex472> ~ 'REGR_SXY':i
:lexeme ~ <Lex473>  priority => 1
<Lex473> ~ 'REGR_SYY':i
:lexeme ~ <Lex490>  priority => 1
<Lex490> ~ 'SESSION_USER':i
:lexeme ~ <Lex506>  priority => 1
<Lex506> ~ 'SYSTEM_USER':i
:lexeme ~ <Lex511>  priority => 1
<Lex511> ~ 'TIMEZONE_HOUR':i
:lexeme ~ <Lex512>  priority => 1
<Lex512> ~ 'TIMEZONE_MINUTE':i
:lexeme ~ <Lex530>  priority => 1
<Lex530> ~ 'VAR_POP':i
:lexeme ~ <Lex531>  priority => 1
<Lex531> ~ 'VAR_SAMP':i
:lexeme ~ <Lex537>  priority => 1
<Lex537> ~ 'WIDTH_BUCKET':i
<Lex543> ~ [^']
<Lex557_many> ~ [\d]+
<Lex558> ~ [a-zA-Z]
<Lex559> ~ [a-zA-Z0-9_]
<Lex561> ~ [^\[\]()|\^\-+*_%?{\\]
<Lex562> ~ [\x{5c}]
<Lex563> ~ [\[\]()|\^\-+*_%?{\\]
<Lex568_many> ~ [^\s]+
<Lex569> ~ 'Interfaces.SQL'
<Lex570> ~ '1'
<Lex571> ~ 'DOUBLE_PRECISION':i
<Lex572> ~ 'SQLSTATE_TYPE':i
<Lex573> ~ 'INDICATOR_TYPE':i
<Lex585_many> ~ [^\s]+
<Lex586_many> ~ [^\s]+
<Lex587> ~ '01'
<Lex588> ~ '77'
<Lex596> ~ '9'
<Lex597_many> ~ [^\s]+
<Lex601_many> ~ [^\s]+
<Lex602_many> ~ [^\s]+
<Lex604_many> ~ [^\s]+
<M> ~ 'M':i
<MAP> ~ 'MAP':i
:lexeme ~ <MATCH>  priority => 1
<MATCH> ~ 'MATCH':i
<MATCHED> ~ 'MATCHED':i
<MAX> ~ 'MAX':i
<MAXVALUE> ~ 'MAXVALUE':i
:lexeme ~ <MEMBER>  priority => 1
<MEMBER> ~ 'MEMBER':i
:lexeme ~ <MERGE>  priority => 1
<MERGE> ~ 'MERGE':i
:lexeme ~ <METHOD>  priority => 1
<METHOD> ~ 'METHOD':i
<MIN> ~ 'MIN':i
:lexeme ~ <MINUTE>  priority => 1
<MINUTE> ~ 'MINUTE':i
<MINVALUE> ~ 'MINVALUE':i
<MOD> ~ 'MOD':i
:lexeme ~ <MODIFIES>  priority => 1
<MODIFIES> ~ 'MODIFIES':i
:lexeme ~ <MODULE>  priority => 1
<MODULE> ~ 'MODULE':i
:lexeme ~ <MONTH>  priority => 1
<MONTH> ~ 'MONTH':i
<MORE> ~ 'MORE':i
:lexeme ~ <MULTISET>  priority => 1
<MULTISET> ~ 'MULTISET':i
<MUMPS> ~ 'MUMPS':i
<N> ~ 'N':i
<NAME> ~ 'NAME':i
<NAMES> ~ 'NAMES':i
:lexeme ~ <NATIONAL>  priority => 1
<NATIONAL> ~ 'NATIONAL':i
:lexeme ~ <NATURAL>  priority => 1
<NATURAL> ~ 'NATURAL':i
:lexeme ~ <NCHAR>  priority => 1
<NCHAR> ~ 'NCHAR':i
:lexeme ~ <NCLOB>  priority => 1
<NCLOB> ~ 'NCLOB':i
<NESTING> ~ 'NESTING':i
:lexeme ~ <NEW>  priority => 1
<NEW> ~ 'NEW':i
<NEXT> ~ 'NEXT':i
:lexeme ~ <NO>  priority => 1
<NO> ~ 'NO':i
:lexeme ~ <NONE>  priority => 1
<NONE> ~ 'NONE':i
<NORMALIZE> ~ 'NORMALIZE':i
<NORMALIZED> ~ 'NORMALIZED':i
:lexeme ~ <NOT>  priority => 1
<NOT> ~ 'NOT':i
:lexeme ~ <NULL>  priority => 1
<NULL> ~ 'NULL':i
<NULLABLE> ~ 'NULLABLE':i
<NULLIF> ~ 'NULLIF':i
<NULLS> ~ 'NULLS':i
<NUMBER> ~ 'NUMBER':i
:lexeme ~ <NUMERIC>  priority => 1
<NUMERIC> ~ 'NUMERIC':i
<OBJECT> ~ 'OBJECT':i
<OCTETS> ~ 'OCTETS':i
:lexeme ~ <OF>  priority => 1
<OF> ~ 'OF':i
:lexeme ~ <OLD>  priority => 1
<OLD> ~ 'OLD':i
:lexeme ~ <ON>  priority => 1
<ON> ~ 'ON':i
:lexeme ~ <ONLY>  priority => 1
<ONLY> ~ 'ONLY':i
:lexeme ~ <OPEN>  priority => 1
<OPEN> ~ 'OPEN':i
<OPTION> ~ 'OPTION':i
<OPTIONS> ~ 'OPTIONS':i
:lexeme ~ <OR>  priority => 1
<OR> ~ 'OR':i
:lexeme ~ <ORDER>  priority => 1
<ORDER> ~ 'ORDER':i
<ORDERING> ~ 'ORDERING':i
<ORDINALITY> ~ 'ORDINALITY':i
<OTHERS> ~ 'OTHERS':i
:lexeme ~ <OUT>  priority => 1
<OUT> ~ 'OUT':i
:lexeme ~ <OUTER>  priority => 1
<OUTER> ~ 'OUTER':i
:lexeme ~ <OUTPUT>  priority => 1
<OUTPUT> ~ 'OUTPUT':i
:lexeme ~ <OVER>  priority => 1
<OVER> ~ 'OVER':i
:lexeme ~ <OVERLAPS>  priority => 1
<OVERLAPS> ~ 'OVERLAPS':i
<OVERLAY> ~ 'OVERLAY':i
<OVERRIDING> ~ 'OVERRIDING':i
<PACKED> ~ 'PACKED':i
<PAD> ~ 'PAD':i
:lexeme ~ <PARAMETER>  priority => 1
<PARAMETER> ~ 'PARAMETER':i
<PARTIAL> ~ 'PARTIAL':i
:lexeme ~ <PARTITION>  priority => 1
<PARTITION> ~ 'PARTITION':i
<PASCAL> ~ 'PASCAL':i
<PATH> ~ 'PATH':i
<PIC> ~ 'PIC':i
<PICTURE> ~ 'PICTURE':i
<PLACING> ~ 'PLACING':i
<PLI> ~ 'PLI':i
<POSITION> ~ 'POSITION':i
<POWER> ~ 'POWER':i
<PRECEDING> ~ 'PRECEDING':i
:lexeme ~ <PRECISION>  priority => 1
<PRECISION> ~ 'PRECISION':i
:lexeme ~ <PREPARE>  priority => 1
<PREPARE> ~ 'PREPARE':i
<PRESERVE> ~ 'PRESERVE':i
:lexeme ~ <PRIMARY>  priority => 1
<PRIMARY> ~ 'PRIMARY':i
<PRIOR> ~ 'PRIOR':i
<PRIVILEGES> ~ 'PRIVILEGES':i
:lexeme ~ <PROCEDURE>  priority => 1
<PROCEDURE> ~ 'PROCEDURE':i
<PUBLIC> ~ 'PUBLIC':i
:lexeme ~ <RANGE>  priority => 1
<RANGE> ~ 'RANGE':i
<RANK> ~ 'RANK':i
<READ> ~ 'READ':i
:lexeme ~ <READS>  priority => 1
<READS> ~ 'READS':i
:lexeme ~ <REAL>  priority => 1
<REAL> ~ 'REAL':i
:lexeme ~ <RECURSIVE>  priority => 1
<RECURSIVE> ~ 'RECURSIVE':i
:lexeme ~ <REF>  priority => 1
<REF> ~ 'REF':i
:lexeme ~ <REFERENCES>  priority => 1
<REFERENCES> ~ 'REFERENCES':i
:lexeme ~ <REFERENCING>  priority => 1
<REFERENCING> ~ 'REFERENCING':i
<RELATIVE> ~ 'RELATIVE':i
:lexeme ~ <RELEASE>  priority => 1
<RELEASE> ~ 'RELEASE':i
<REPEATABLE> ~ 'REPEATABLE':i
<RESTART> ~ 'RESTART':i
<RESTRICT> ~ 'RESTRICT':i
:lexeme ~ <RESULT>  priority => 1
<RESULT> ~ 'RESULT':i
:lexeme ~ <RETURN>  priority => 1
<RETURN> ~ 'RETURN':i
:lexeme ~ <RETURNS>  priority => 1
<RETURNS> ~ 'RETURNS':i
:lexeme ~ <REVOKE>  priority => 1
<REVOKE> ~ 'REVOKE':i
:lexeme ~ <RIGHT>  priority => 1
<RIGHT> ~ 'RIGHT':i
<ROLE> ~ 'ROLE':i
:lexeme ~ <ROLLBACK>  priority => 1
<ROLLBACK> ~ 'ROLLBACK':i
:lexeme ~ <ROLLUP>  priority => 1
<ROLLUP> ~ 'ROLLUP':i
<ROUTINE> ~ 'ROUTINE':i
:lexeme ~ <ROW>  priority => 1
<ROW> ~ 'ROW':i
:lexeme ~ <ROWS>  priority => 1
<ROWS> ~ 'ROWS':i
<S> ~ 'S':i
:lexeme ~ <SAVEPOINT>  priority => 1
<SAVEPOINT> ~ 'SAVEPOINT':i
<SCALE> ~ 'SCALE':i
<SCHEMA> ~ 'SCHEMA':i
<SCOPE> ~ 'SCOPE':i
:lexeme ~ <SCROLL>  priority => 1
<SCROLL> ~ 'SCROLL':i
:lexeme ~ <SEARCH>  priority => 1
<SEARCH> ~ 'SEARCH':i
:lexeme ~ <SECOND>  priority => 1
<SECOND> ~ 'SECOND':i
<SECTION> ~ 'SECTION':i
<SECURITY> ~ 'SECURITY':i
:lexeme ~ <SELECT>  priority => 1
<SELECT> ~ 'SELECT':i
<SELF> ~ 'SELF':i
:lexeme ~ <SENSITIVE>  priority => 1
<SENSITIVE> ~ 'SENSITIVE':i
<SEPARATE> ~ 'SEPARATE':i
<SEQUENCE> ~ 'SEQUENCE':i
<SERIALIZABLE> ~ 'SERIALIZABLE':i
<SESSION> ~ 'SESSION':i
:lexeme ~ <SET>  priority => 1
<SET> ~ 'SET':i
<SETS> ~ 'SETS':i
<SIGN> ~ 'SIGN':i
:lexeme ~ <SIMILAR>  priority => 1
<SIMILAR> ~ 'SIMILAR':i
<SIMPLE> ~ 'SIMPLE':i
<SIZE> ~ 'SIZE':i
:lexeme ~ <SMALLINT>  priority => 1
<SMALLINT> ~ 'SMALLINT':i
:lexeme ~ <SOME>  priority => 1
<SOME> ~ 'SOME':i
<SOURCE> ~ 'SOURCE':i
<SPACE> ~ 'SPACE':i
:lexeme ~ <SPECIFIC>  priority => 1
<SPECIFIC> ~ 'SPECIFIC':i
:lexeme ~ <SPECIFICTYPE>  priority => 1
<SPECIFICTYPE> ~ 'SPECIFICTYPE':i
:lexeme ~ <SQL>  priority => 1
<SQL> ~ 'SQL':i
:lexeme ~ <SQLEXCEPTION>  priority => 1
<SQLEXCEPTION> ~ 'SQLEXCEPTION':i
:lexeme ~ <SQLSTATE>  priority => 1
<SQLSTATE> ~ 'SQLSTATE':i
:lexeme ~ <SQLWARNING>  priority => 1
<SQLWARNING> ~ 'SQLWARNING':i
<SQRT> ~ 'SQRT':i
:lexeme ~ <START>  priority => 1
<START> ~ 'START':i
<STATE> ~ 'STATE':i
<STATEMENT> ~ 'STATEMENT':i
:lexeme ~ <STATIC>  priority => 1
<STATIC> ~ 'STATIC':i
<STRUCTURE> ~ 'STRUCTURE':i
<STYLE> ~ 'STYLE':i
:lexeme ~ <SUBMULTISET>  priority => 1
<SUBMULTISET> ~ 'SUBMULTISET':i
<SUBSTRING> ~ 'SUBSTRING':i
<SUM> ~ 'SUM':i
:lexeme ~ <SYMMETRIC>  priority => 1
<SYMMETRIC> ~ 'SYMMETRIC':i
:lexeme ~ <SYSTEM>  priority => 1
<SYSTEM> ~ 'SYSTEM':i
:lexeme ~ <TABLE>  priority => 1
<TABLE> ~ 'TABLE':i
<TABLESAMPLE> ~ 'TABLESAMPLE':i
<TEMPORARY> ~ 'TEMPORARY':i
:lexeme ~ <THEN>  priority => 1
<THEN> ~ 'THEN':i
<TIES> ~ 'TIES':i
:lexeme ~ <TIME>  priority => 1
<TIME> ~ 'TIME':i
:lexeme ~ <TIMESTAMP>  priority => 1
<TIMESTAMP> ~ 'TIMESTAMP':i
:lexeme ~ <TO>  priority => 1
<TO> ~ 'TO':i
:lexeme ~ <TRAILING>  priority => 1
<TRAILING> ~ 'TRAILING':i
<TRANSACTION> ~ 'TRANSACTION':i
<TRANSFORM> ~ 'TRANSFORM':i
<TRANSFORMS> ~ 'TRANSFORMS':i
<TRANSLATE> ~ 'TRANSLATE':i
:lexeme ~ <TRANSLATION>  priority => 1
<TRANSLATION> ~ 'TRANSLATION':i
:lexeme ~ <TREAT>  priority => 1
<TREAT> ~ 'TREAT':i
:lexeme ~ <TRIGGER>  priority => 1
<TRIGGER> ~ 'TRIGGER':i
<TRIM> ~ 'TRIM':i
:lexeme ~ <TRUE>  priority => 1
<TRUE> ~ 'TRUE':i
<TYPE> ~ 'TYPE':i
<U> ~ 'U':i
:lexeme ~ <UESCAPE>  priority => 1
<UESCAPE> ~ 'UESCAPE':i
<UNBOUNDED> ~ 'UNBOUNDED':i
<UNCOMMITTED> ~ 'UNCOMMITTED':i
<UNDER> ~ 'UNDER':i
:lexeme ~ <UNION>  priority => 1
<UNION> ~ 'UNION':i
:lexeme ~ <UNIQUE>  priority => 1
<UNIQUE> ~ 'UNIQUE':i
:lexeme ~ <UNKNOWN>  priority => 1
<UNKNOWN> ~ 'UNKNOWN':i
<UNNAMED> ~ 'UNNAMED':i
:lexeme ~ <UNNEST>  priority => 1
<UNNEST> ~ 'UNNEST':i
:lexeme ~ <UPDATE>  priority => 1
<UPDATE> ~ 'UPDATE':i
:lexeme ~ <UPPER>  priority => 1
<UPPER> ~ 'UPPER':i
<USAGE> ~ 'USAGE':i
:lexeme ~ <USER>  priority => 1
<USER> ~ 'USER':i
:lexeme ~ <USING>  priority => 1
<USING> ~ 'USING':i
<V> ~ 'V':i
:lexeme ~ <VALUE>  priority => 1
<VALUE> ~ 'VALUE':i
:lexeme ~ <VALUES>  priority => 1
<VALUES> ~ 'VALUES':i
:lexeme ~ <VARCHAR>  priority => 1
<VARCHAR> ~ 'VARCHAR':i
:lexeme ~ <VARYING>  priority => 1
<VARYING> ~ 'VARYING':i
<VIEW> ~ 'VIEW':i
:lexeme ~ <WHEN>  priority => 1
<WHEN> ~ 'WHEN':i
:lexeme ~ <WHENEVER>  priority => 1
<WHENEVER> ~ 'WHENEVER':i
:lexeme ~ <WHERE>  priority => 1
<WHERE> ~ 'WHERE':i
:lexeme ~ <WINDOW>  priority => 1
<WINDOW> ~ 'WINDOW':i
:lexeme ~ <WITH>  priority => 1
<WITH> ~ 'WITH':i
:lexeme ~ <WITHIN>  priority => 1
<WITHIN> ~ 'WITHIN':i
:lexeme ~ <WITHOUT>  priority => 1
<WITHOUT> ~ 'WITHOUT':i
<WORK> ~ 'WORK':i
<WRITE> ~ 'WRITE':i
<X> ~ 'X':i
:lexeme ~ <YEAR>  priority => 1
<YEAR> ~ 'YEAR':i
<ZONE> ~ 'ZONE':i
<a> ~ 'a'
<auto> ~ 'auto'
<b> ~ 'b'
<c> ~ 'c'
<char> ~ 'char'
<const> ~ 'const'
<d> ~ 'd'
<double> ~ 'double'
<e> ~ 'e'
<extern> ~ 'extern'
<f> ~ 'f'
<float> ~ 'float'
<long> ~ 'long'
<short> ~ 'short'
<static> ~ 'static'
<unsigned> ~ 'unsigned'
<volatile> ~ 'volatile'

_WS ~ [\s]+
:discard ~ _WS

_COMMENT_EVERYYHERE_START ~ '--'
_COMMENT_EVERYYHERE_END ~ [^\n]*
_COMMENT ~ _COMMENT_EVERYYHERE_START _COMMENT_EVERYYHERE_END
:discard ~ _COMMENT

############################################################################
# Discard of a C comment, c.f. https://gist.github.com/jeffreykegler/5015057
############################################################################
<C style comment> ~ '/*' <comment interior> '*/'
<comment interior> ~
    <optional non stars>
    <optional star prefixed segments>
    <optional pre final stars>
<optional non stars> ~ [^*]*
<optional star prefixed segments> ~ <star prefixed segment>*
<star prefixed segment> ~ <stars> [^/*] <optional star free text>
<stars> ~ [*]+
<optional star free text> ~ [^*]*
<optional pre final stars> ~ [*]*
:discard ~ <C style comment>

