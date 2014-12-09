use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::SQL2003::AST;
use MarpaX::Languages::SQL2003::AST::Actions::XML;
use MarpaX::Languages::SQL2003::AST::Actions::Blessed;

# ABSTRACT: Translate SQL-2003 source to an AST

use Marpa::R2 2.100000;

# VERSION

our $DATA = do {local $/; <DATA>};
our $G = Marpa::R2::Scanless::G->new({source => \$DATA});

=head1 DESCRIPTION

This module translates SQL-2003 to an AST.

=head1 SYNOPSIS

    use strict;
    use warnings FATAL => 'all';
    use MarpaX::Languages::SQL2003::AST;
    #
    # Parse SQL
    #
    my $input = 'select * from myTable;';
    my $obj = MarpaX::Languages::SQL2003::AST->new();
    my $ast = $obj->parse($input);
    my $xml = $obj->parse($input, xml => 1);

=head1 SUBROUTINES/METHODS

=head2 new($class)

Instantiate a new object.

=back

=cut

# ----------------------------------------------------------------------------------------

sub new {
  my ($class) = @_;

  my $self  = {};

  bless($self, $class);

  return $self;
}

# ----------------------------------------------------------------------------------------

=head2 parse($self, $input, %opts)

Parse $input and return $self. Accept an optional %opts hash that can be:

=over

=item xml

If true, produces the AST as an XML::LibXML::Document object. Default is a false value, meaning that the AST is a composite structure of blessed hash references and array references. Any LHS or RHS of the SQL grammar is a blessed hash. Any token is an array reference containing three items:

=over

=item start

Start position in the input stream.

=item lengh

Lengh of the token in the input stream.

=item text

Token value.

=back

=cut

sub parse {
  my ($self, $input, %opts) = @_;

  my $xml = (exists($opts{xml}) && $opts{xml}) ? 1 : 0;

  my $basenameSemanticsPackage = $xml ? 'XML' : 'Blessed';

  my $value = $G->parse(\$input,
                        join('::',__PACKAGE__, 'Actions', $basenameSemanticsPackage),
                        {ranking_method => 'high_rule_only'});

  return defined($value) ? ${$value} : undef;
}

# ----------------------------------------------------------------------------------------

=head2 asXML($self, $input)

Alias to $self->parse($input, xml => 1).

=cut

sub asXML {
  my ($self, $input) = @_;

  return $self->parse($input, xml => 1);
}

# ----------------------------------------------------------------------------------------

=head2 asBlessed($self, $input)

Alias to $self->parse($input, xml => 0).

=cut

sub asBlessed {
  my ($self, $input) = @_;

  return $self->parse($input, xml => 0);
}

=head1 SEE ALSO

L<Marpa::R2>, L<XML::LibXML>

=cut

1;

__DATA__
#
# This is a generated grammar
#
inaccessible is ok by default
:default ::= action => _nonTerminalSemantic
lexeme default = action => [start,length,value] latm => 1

:start ::= <SQL_Start_Sequence>
<SQL_Start_Many> ::= <SQL_Start>+ rank => 0
<SQL_Start_Sequence> ::= <SQL_Start_Many> rank => 0
<SQL_Start> ::= <preparable_Statement> rank => 0
              | <direct_SQL_Statement> rank => -1
              | <embedded_SQL_Declare_Section> rank => -2
              | <embedded_SQL_Host_Program> rank => -3
              | <embedded_SQL_Statement> rank => -4
              | <SQL_Client_Module_Definition> rank => -5
<SQL_Terminal_Character> ::= <SQL_Language_Character> rank => 0
<SQL_Language_Character> ::= <simple_Latin_Letter> rank => 0
                           | <digit> rank => -1
                           | <SQL_Special_Character> rank => -2
<simple_Latin_Letter> ::= <simple_Latin_Upper_Case_Letter> rank => 0
                        | <simple_Latin_Lower_Case_Letter> rank => -1
<simple_Latin_Upper_Case_Letter> ::= <Lex001> rank => 0
<simple_Latin_Lower_Case_Letter> ::= <Lex002> rank => 0
<digit> ::= <Lex003> rank => 0
<SQL_Special_Character> ::= <space> rank => 0
                          | <double_Quote> rank => -1
                          | <percent> rank => -2
                          | <ampersand> rank => -3
                          | <quote> rank => -4
                          | <left_Paren> rank => -5
                          | <right_Paren> rank => -6
                          | <asterisk> rank => -7
                          | <plus_Sign> rank => -8
                          | <comma> rank => -9
                          | <minus_Sign> rank => -10
                          | <period> rank => -11
                          | <solidus> rank => -12
                          | <colon> rank => -13
                          | <semicolon> rank => -14
                          | <less_Than_Operator> rank => -15
                          | <equals_Operator> rank => -16
                          | <greater_Than_Operator> rank => -17
                          | <question_Mark> rank => -18
                          | <left_Bracket> rank => -19
                          | <right_Bracket> rank => -20
                          | <circumflex> rank => -21
                          | <underscore> rank => -22
                          | <vertical_Bar> rank => -23
                          | <left_Brace> rank => -24
                          | <right_Brace> rank => -25
<space> ~ <Lex004>
<double_Quote> ~ <Lex005>
<percent> ~ <Lex006>
<ampersand> ~ <Lex007>
<quote> ~ <Lex008>
<left_Paren> ~ <Lex009>
<right_Paren> ~ <Lex010>
<asterisk> ~ <Lex011>
<plus_Sign> ~ <Lex012>
<comma> ~ <Lex013>
<minus_Sign> ~ <Lex014>
<period> ~ <Lex015>
<solidus> ~ <Lex016>
<colon> ~ <Lex017>
<semicolon> ~ <Lex018>
<less_Than_Operator> ~ <Lex019>
<equals_Operator> ~ <Lex020>
<greater_Than_Operator> ~ <Lex021>
<question_Mark> ~ <Lex022>
<left_Bracket_Or_Trigraph> ::= <left_Bracket> rank => 0
                             | <left_Bracket_Trigraph> rank => -1
<right_Bracket_Or_Trigraph> ::= <right_Bracket> rank => 0
                              | <right_Bracket_Trigraph> rank => -1
<left_Bracket> ~ <Lex023>
<left_Bracket_Trigraph> ~ <Lex024>
<right_Bracket> ~ <Lex025>
<right_Bracket_Trigraph> ~ <Lex026>
<circumflex> ~ <Lex027>
<underscore> ~ <_>
<vertical_Bar> ~ <Lex029>
<left_Brace> ~ <Lex030>
<right_Brace> ~ <Lex031>
<token> ::= <nondelimiter_Token> rank => 0
          | <delimiter_Token> rank => -1
<nondelimiter_Token> ::= <regular_Identifier> rank => 0
                       | <key_Word> rank => -1
                       | <unsigned_Numeric_Literal> rank => -2
                       | <national_Character_String_Literal> rank => -3
                       | <large_Object_Length_Token> rank => -4
                       | <multiplier> rank => -5
<regular_Identifier> ::= <SQL_Language_Identifier> rank => 0
<digit_Many> ::= <digit>+ rank => 0
<large_Object_Length_Token> ::= <digit_Many> <multiplier> rank => 0
<multiplier> ::= <K> rank => 0
               | <M> rank => -1
               | <G> rank => -2
<delimited_Identifier> ~ <Lex035> <delimited_Identifier_Body> <Lex036>
<GenLex092> ~ <delimited_Identifier_Part>
<genlex092_Many> ~ <GenLex092>+
<delimited_Identifier_Body> ~ <genlex092_Many>
<delimited_Identifier_Part> ~ <nondoublequote_Character>
                              | <doublequote_Symbol>
<unicode_Delimited_Identifier> ~ <Lex037> <Lex038> <Lex039> <unicode_Delimiter_Body> <Lex040> <unicode_Escape_Specifier>
<GenLex098> ~ <Lex041> <Lex042> <unicode_Escape_Character> <Lex043>
<genlex098_Maybe> ~ <GenLex098>
<genlex098_Maybe> ~
<unicode_Escape_Specifier> ~ <genlex098_Maybe>
<GenLex102> ~ <unicode_Identifier_Part>
<genlex102_Many> ~ <GenLex102>+
<unicode_Delimiter_Body> ~ <genlex102_Many>
<unicode_Identifier_Part> ~ <unicode_Delimited_Identifier_Part>
                            | <unicode_Escape_Value_Internal>
<unicode_Delimited_Identifier_Part> ~ <nondoublequote_Character>
                                      | <doublequote_Symbol>
<unicode_Escape_Value_Internal> ~ <unicode_4_Digit_Escape_Value>
                                  | <unicode_6_Digit_Escape_Value>
                                  | <unicode_Character_Escape_Value>
<unicode_Escape_Value> ~ <unicode_Escape_Value_Internal>
<unicode_Hexit> ~ <Lex044>
<unicode_4_Digit_Escape_Value> ~ <unicode_Escape_Character> <unicode_Hexit> <unicode_Hexit> <unicode_Hexit> <unicode_Hexit>
<unicode_6_Digit_Escape_Value> ~ <unicode_Escape_Character> <Lex045> <unicode_Hexit> <unicode_Hexit> <unicode_Hexit> <unicode_Hexit> <unicode_Hexit> <unicode_Hexit>
<unicode_Character_Escape_Value> ~ <unicode_Escape_Character> <unicode_Escape_Character>
<unicode_Escape_Character> ~ <Lex046>
<nondoublequote_Character> ~ <Lex047>
<doublequote_Symbol> ~ <Lex048>
<delimiter_Token> ::= <character_String_Literal> rank => 0
                    | <date_String> rank => -1
                    | <time_String> rank => -2
                    | <timestamp_String> rank => -3
                    | <interval_String> rank => -4
                    | <delimited_Identifier> rank => -5
                    | <unicode_Delimited_Identifier> rank => -6
                    | <SQL_Special_Character> rank => -7
                    | <not_Equals_Operator> rank => -8
                    | <greater_Than_Or_Equals_Operator> rank => -9
                    | <less_Than_Or_Equals_Operator> rank => -10
                    | <concatenation_Operator> rank => -11
                    | <right_Arrow> rank => -12
                    | <left_Bracket_Trigraph> rank => -13
                    | <right_Bracket_Trigraph> rank => -14
                    | <double_Colon> rank => -15
                    | <double_Period> rank => -16
<not_Equals_Operator> ::= <less_Than_Operator> <greater_Than_Operator> rank => 0
<greater_Than_Or_Equals_Operator> ::= <greater_Than_Operator> <equals_Operator> rank => 0
<less_Than_Or_Equals_Operator> ::= <less_Than_Operator> <equals_Operator> rank => 0
<concatenation_Operator> ::= <vertical_Bar> <vertical_Bar> rank => 0
<right_Arrow> ::= <minus_Sign> <greater_Than_Operator> rank => 0
<double_Colon> ::= <colon> <colon> rank => 0
<double_Period> ::= <period> <period> rank => 0
<Gen144> ::= <comment> rank => 0
           | <space> rank => -1
<gen144_Many> ::= <Gen144>+ rank => 0
<separator> ::= <gen144_Many> rank => 0
<comment> ::= <simple_Comment> rank => 0
            | <bracketed_Comment> rank => -1
<comment_Character_Any> ::= <comment_Character>* rank => 0
<simple_Comment> ::= <simple_Comment_Introducer> <comment_Character_Any> <newline> rank => 0
<minus_Sign_Any> ::= <minus_Sign>* rank => 0
<simple_Comment_Introducer> ::= <minus_Sign> <minus_Sign> <minus_Sign_Any> rank => 0
<bracketed_Comment> ::= <bracketed_Comment_Introducer> <bracketed_Comment_Contents> <bracketed_Comment_Terminator> rank => 0
<bracketed_Comment_Introducer> ::= <solidus> <asterisk> rank => 0
<bracketed_Comment_Terminator> ::= <asterisk> <solidus> rank => 0
<Gen157> ::= <comment_Character> rank => 0
           | <separator> rank => -1
<gen157_Any> ::= <Gen157>* rank => 0
<bracketed_Comment_Contents> ::= <gen157_Any> rank => 0
<comment_Character> ::= <nonquote_Character> rank => 0
                      | <quote> rank => -1
<newline> ::= <Lex049> rank => 0
<key_Word> ::= <reserved_Word> rank => 0
             | <non_Reserved_Word> rank => -1
<non_Reserved_Word> ::= <A> rank => 0
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
                      | <CATALOG_NAME> rank => -21
                      | <CEIL> rank => -22
                      | <CEILING> rank => -23
                      | <CHAIN> rank => -24
                      | <CHARACTERISTICS> rank => -25
                      | <CHARACTERS> rank => -26
                      | <CHARACTER_LENGTH> rank => -27
                      | <CHARACTER_SET_CATALOG> rank => -28
                      | <CHARACTER_SET_NAME> rank => -29
                      | <CHARACTER_SET_SCHEMA> rank => -30
                      | <CHAR_LENGTH> rank => -31
                      | <CHECKED> rank => -32
                      | <CLASS_ORIGIN> rank => -33
                      | <COALESCE> rank => -34
                      | <COBOL> rank => -35
                      | <CODE_UNITS> rank => -36
                      | <COLLATION> rank => -37
                      | <COLLATION_CATALOG> rank => -38
                      | <COLLATION_NAME> rank => -39
                      | <COLLATION_SCHEMA> rank => -40
                      | <COLLECT> rank => -41
                      | <COLUMN_NAME> rank => -42
                      | <COMMAND_FUNCTION> rank => -43
                      | <COMMAND_FUNCTION_CODE> rank => -44
                      | <COMMITTED> rank => -45
                      | <CONDITION> rank => -46
                      | <CONDITION_NUMBER> rank => -47
                      | <CONNECTION_NAME> rank => -48
                      | <CONSTRAINTS> rank => -49
                      | <CONSTRAINT_CATALOG> rank => -50
                      | <CONSTRAINT_NAME> rank => -51
                      | <CONSTRAINT_SCHEMA> rank => -52
                      | <CONSTRUCTORS> rank => -53
                      | <CONTAINS> rank => -54
                      | <CONVERT> rank => -55
                      | <CORR> rank => -56
                      | <COUNT> rank => -57
                      | <COVAR_POP> rank => -58
                      | <COVAR_SAMP> rank => -59
                      | <CUME_DIST> rank => -60
                      | <CURRENT_COLLATION> rank => -61
                      | <CURSOR_NAME> rank => -62
                      | <DATA> rank => -63
                      | <DATETIME_INTERVAL_CODE> rank => -64
                      | <DATETIME_INTERVAL_PRECISION> rank => -65
                      | <DEFAULTS> rank => -66
                      | <DEFERRABLE> rank => -67
                      | <DEFERRED> rank => -68
                      | <DEFINED> rank => -69
                      | <DEFINER> rank => -70
                      | <DEGREE> rank => -71
                      | <DENSE_RANK> rank => -72
                      | <DEPTH> rank => -73
                      | <DERIVED> rank => -74
                      | <DESC> rank => -75
                      | <DESCRIPTOR> rank => -76
                      | <DIAGNOSTICS> rank => -77
                      | <DISPATCH> rank => -78
                      | <DOMAIN> rank => -79
                      | <DYNAMIC_FUNCTION> rank => -80
                      | <DYNAMIC_FUNCTION_CODE> rank => -81
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
                      | <KEY_MEMBER> rank => -113
                      | <KEY_TYPE> rank => -114
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
                      | <MESSAGE_LENGTH> rank => -126
                      | <MESSAGE_OCTET_LENGTH> rank => -127
                      | <MESSAGE_TEXT> rank => -128
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
                      | <OCTET_LENGTH> rank => -146
                      | <OPTION> rank => -147
                      | <OPTIONS> rank => -148
                      | <ORDERING> rank => -149
                      | <ORDINALITY> rank => -150
                      | <OTHERS> rank => -151
                      | <OVERLAY> rank => -152
                      | <OVERRIDING> rank => -153
                      | <PAD> rank => -154
                      | <PARAMETER_MODE> rank => -155
                      | <PARAMETER_NAME> rank => -156
                      | <PARAMETER_ORDINAL_POSITION> rank => -157
                      | <PARAMETER_SPECIFIC_CATALOG> rank => -158
                      | <PARAMETER_SPECIFIC_NAME> rank => -159
                      | <PARAMETER_SPECIFIC_SCHEMA> rank => -160
                      | <PARTIAL> rank => -161
                      | <PASCAL> rank => -162
                      | <PATH> rank => -163
                      | <PERCENTILE_CONT> rank => -164
                      | <PERCENTILE_DISC> rank => -165
                      | <PERCENT_RANK> rank => -166
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
                      | <RETURNED_CARDINALITY> rank => -181
                      | <RETURNED_LENGTH> rank => -182
                      | <RETURNED_OCTET_LENGTH> rank => -183
                      | <RETURNED_SQLSTATE> rank => -184
                      | <ROLE> rank => -185
                      | <ROUTINE> rank => -186
                      | <ROUTINE_CATALOG> rank => -187
                      | <ROUTINE_NAME> rank => -188
                      | <ROUTINE_SCHEMA> rank => -189
                      | <ROW_COUNT> rank => -190
                      | <ROW_NUMBER> rank => -191
                      | <SCALE> rank => -192
                      | <SCHEMA> rank => -193
                      | <SCHEMA_NAME> rank => -194
                      | <SCOPE_CATALOG> rank => -195
                      | <SCOPE_NAME> rank => -196
                      | <SCOPE_SCHEMA> rank => -197
                      | <SECTION> rank => -198
                      | <SECURITY> rank => -199
                      | <SELF> rank => -200
                      | <SEQUENCE> rank => -201
                      | <SERIALIZABLE> rank => -202
                      | <SERVER_NAME> rank => -203
                      | <SESSION> rank => -204
                      | <SETS> rank => -205
                      | <SIMPLE> rank => -206
                      | <SIZE> rank => -207
                      | <SOURCE> rank => -208
                      | <SPACE> rank => -209
                      | <SPECIFIC_NAME> rank => -210
                      | <SQRT> rank => -211
                      | <STATE> rank => -212
                      | <STATEMENT> rank => -213
                      | <STDDEV_POP> rank => -214
                      | <STDDEV_SAMP> rank => -215
                      | <STRUCTURE> rank => -216
                      | <STYLE> rank => -217
                      | <SUBCLASS_ORIGIN> rank => -218
                      | <SUBSTRING> rank => -219
                      | <SUM> rank => -220
                      | <TABLESAMPLE> rank => -221
                      | <TABLE_NAME> rank => -222
                      | <TEMPORARY> rank => -223
                      | <TIES> rank => -224
                      | <TOP_LEVEL_COUNT> rank => -225
                      | <TRANSACTION> rank => -226
                      | <TRANSACTIONS_COMMITTED> rank => -227
                      | <TRANSACTIONS_ROLLED_BACK> rank => -228
                      | <TRANSACTION_ACTIVE> rank => -229
                      | <TRANSFORM> rank => -230
                      | <TRANSFORMS> rank => -231
                      | <TRANSLATE> rank => -232
                      | <TRIGGER_CATALOG> rank => -233
                      | <TRIGGER_NAME> rank => -234
                      | <TRIGGER_SCHEMA> rank => -235
                      | <TRIM> rank => -236
                      | <TYPE> rank => -237
                      | <UNBOUNDED> rank => -238
                      | <UNCOMMITTED> rank => -239
                      | <UNDER> rank => -240
                      | <UNNAMED> rank => -241
                      | <USAGE> rank => -242
                      | <USER_DEFINED_TYPE_CATALOG> rank => -243
                      | <USER_DEFINED_TYPE_CODE> rank => -244
                      | <USER_DEFINED_TYPE_NAME> rank => -245
                      | <USER_DEFINED_TYPE_SCHEMA> rank => -246
                      | <VIEW> rank => -247
                      | <WORK> rank => -248
                      | <WRITE> rank => -249
                      | <ZONE> rank => -250
<reserved_Word> ::= <ADD> rank => 0
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
                  | <CURRENT_DATE> rank => -43
                  | <CURRENT_DEFAULT_TRANSFORM_GROUP> rank => -44
                  | <CURRENT_PATH> rank => -45
                  | <CURRENT_ROLE> rank => -46
                  | <CURRENT_TIME> rank => -47
                  | <CURRENT_TIMESTAMP> rank => -48
                  | <CURRENT_TRANSFORM_GROUP_FOR_TYPE> rank => -49
                  | <CURRENT_USER> rank => -50
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
                  | <REGR_AVGX> rank => -168
                  | <REGR_AVGY> rank => -169
                  | <REGR_COUNT> rank => -170
                  | <REGR_INTERCEPT> rank => -171
                  | <Lex469> rank => -172
                  | <REGR_SLOPE> rank => -173
                  | <REGR_SXX> rank => -174
                  | <REGR_SXY> rank => -175
                  | <REGR_SYY> rank => -176
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
                  | <SESSION_USER> rank => -193
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
                  | <SYSTEM_USER> rank => -209
                  | <TABLE> rank => -210
                  | <THEN> rank => -211
                  | <TIME> rank => -212
                  | <TIMESTAMP> rank => -213
                  | <TIMEZONE_HOUR> rank => -214
                  | <TIMEZONE_MINUTE> rank => -215
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
                  | <VAR_POP> rank => -233
                  | <VAR_SAMP> rank => -234
                  | <VARCHAR> rank => -235
                  | <VARYING> rank => -236
                  | <WHEN> rank => -237
                  | <WHENEVER> rank => -238
                  | <WHERE> rank => -239
                  | <WIDTH_BUCKET> rank => -240
                  | <WINDOW> rank => -241
                  | <WITH> rank => -242
                  | <WITHIN> rank => -243
                  | <WITHOUT> rank => -244
                  | <YEAR> rank => -245
<literal> ::= <signed_Numeric_Literal> rank => 0
            | <general_Literal> rank => -1
<unsigned_Literal> ::= <unsigned_Numeric_Literal> rank => 0
                     | <general_Literal> rank => -1
<general_Literal> ::= <character_String_Literal> rank => 0
                    | <national_Character_String_Literal> rank => -1
                    | <unicode_Character_String_Literal> rank => -2
                    | <binary_String_Literal> rank => -3
                    | <datetime_Literal> rank => -4
                    | <interval_Literal> rank => -5
                    | <boolean_Literal> rank => -6
<Gen674> ::= <introducer> <character_Set_Specification> rank => 0
<gen674_Maybe> ::= <Gen674> rank => 0
<gen674_Maybe> ::= rank => -1
<character_Representation_Any> ::= <character_Representation>* rank => 0
<Gen678> ::= <separator> <quote> <character_Representation_Any> <quote> rank => 0
<gen678_Any> ::= <Gen678>* rank => 0
<character_String_Literal> ::= <gen674_Maybe> <quote> <character_Representation_Any> <quote> <gen678_Any> rank => 0
<introducer> ::= <underscore> rank => 0
<character_Representation> ::= <nonquote_Character> rank => 0
                             | <quote_Symbol> rank => -1
<nonquote_Character> ::= <Lex543> rank => 0
<quote_Symbol> ::= <quote> <quote> rank => 0
<Gen686> ::= <separator> <quote> <character_Representation_Any> <quote> rank => 0
<gen686_Any> ::= <Gen686>* rank => 0
<national_Character_String_Literal> ::= <N> <quote> <character_Representation_Any> <quote> <gen686_Any> rank => 0
<Gen689> ::= <introducer> <character_Set_Specification> rank => 0
<gen689_Maybe> ::= <Gen689> rank => 0
<gen689_Maybe> ::= rank => -1
<unicode_Representation_Any> ::= <unicode_Representation>* rank => 0
<Gen693> ::= <separator> <quote> <unicode_Representation_Any> <quote> rank => 0
<gen693_Any> ::= <Gen693>* rank => 0
<Gen695> ::= <ESCAPE> <escape_Character> rank => 0
<gen695_Maybe> ::= <Gen695> rank => 0
<gen695_Maybe> ::= rank => -1
<unicode_Character_String_Literal> ::= <gen689_Maybe> <U> <ampersand> <quote> <unicode_Representation_Any> <quote> <gen693_Any> <gen695_Maybe> rank => 0
<unicode_Representation> ::= <character_Representation> rank => 0
                           | <unicode_Escape_Value> rank => -1
<Gen701> ::= <hexit> <hexit> rank => 0
<gen701_Any> ::= <Gen701>* rank => 0
<Gen703> ::= <hexit> <hexit> rank => 0
<gen703_Any> ::= <Gen703>* rank => 0
<Gen705> ::= <separator> <quote> <gen703_Any> <quote> rank => 0
<gen705_Any> ::= <Gen705>* rank => 0
<Gen707> ::= <ESCAPE> <escape_Character> rank => 0
<gen707_Maybe> ::= <Gen707> rank => 0
<gen707_Maybe> ::= rank => -1
<binary_String_Literal> ::= <X> <quote> <gen701_Any> <quote> <gen705_Any> <gen707_Maybe> rank => 0
<hexit> ::= <digit> rank => 0
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
<sign_Maybe> ::= <sign> rank => 0
<sign_Maybe> ::= rank => -1
<signed_Numeric_Literal> ::= <sign_Maybe> <unsigned_Numeric_Literal> rank => 0
<unsigned_Numeric_Literal> ::= <exact_Numeric_Literal> rank => 0
                             | <approximate_Numeric_Literal> rank => -1
<unsigned_Integer> ::= <lex557_Many> rank => 0
<unsigned_Integer_Maybe> ::= <unsigned_Integer> rank => 0
<unsigned_Integer_Maybe> ::= rank => -1
<Gen732> ::= <period> <unsigned_Integer_Maybe> rank => 0
<gen732_Maybe> ::= <Gen732> rank => 0
<gen732_Maybe> ::= rank => -1
<exact_Numeric_Literal> ::= <unsigned_Integer> <gen732_Maybe> rank => 0
                          | <period> <unsigned_Integer> rank => -1
<sign> ::= <plus_Sign> rank => 0
         | <minus_Sign> rank => -1
<approximate_Numeric_Literal> ::= <mantissa> <E> <exponent> rank => 0
<mantissa> ::= <exact_Numeric_Literal> rank => 0
<exponent> ::= <signed_Integer> rank => 0
<signed_Integer> ::= <sign_Maybe> <unsigned_Integer> rank => 0
<datetime_Literal> ::= <date_Literal> rank => 0
                     | <time_Literal> rank => -1
                     | <timestamp_Literal> rank => -2
<date_Literal> ::= <DATE> <date_String> rank => 0
<time_Literal> ::= <TIME> <time_String> rank => 0
<timestamp_Literal> ::= <TIMESTAMP> <timestamp_String> rank => 0
<date_String> ::= <quote> <unquoted_Date_String> <quote> rank => 0
<time_String> ::= <quote> <unquoted_Time_String> <quote> rank => 0
<timestamp_String> ::= <quote> <unquoted_Timestamp_String> <quote> rank => 0
<time_Zone_Interval> ::= <sign> <hours_Value> <colon> <minutes_Value> rank => 0
<date_Value> ::= <years_Value> <minus_Sign> <months_Value> <minus_Sign> <days_Value> rank => 0
<time_Value> ::= <hours_Value> <colon> <minutes_Value> <colon> <seconds_Value> rank => 0
<interval_Literal> ::= <INTERVAL> <sign_Maybe> <interval_String> <interval_Qualifier> rank => 0
<interval_String> ::= <quote> <unquoted_Interval_String> <quote> rank => 0
<unquoted_Date_String> ::= <date_Value> rank => 0
<time_Zone_Interval_Maybe> ::= <time_Zone_Interval> rank => 0
<time_Zone_Interval_Maybe> ::= rank => -1
<unquoted_Time_String> ::= <time_Value> <time_Zone_Interval_Maybe> rank => 0
<unquoted_Timestamp_String> ::= <unquoted_Date_String> <space> <unquoted_Time_String> rank => 0
<Gen762> ::= <year_Month_Literal> rank => 0
           | <day_Time_Literal> rank => -1
<unquoted_Interval_String> ::= <sign_Maybe> <Gen762> rank => 0
<Gen765> ::= <years_Value> <minus_Sign> rank => 0
<gen765_Maybe> ::= <Gen765> rank => 0
<gen765_Maybe> ::= rank => -1
<year_Month_Literal> ::= <years_Value> rank => 0
                       | <gen765_Maybe> <months_Value> rank => -1
<day_Time_Literal> ::= <day_Time_Interval> rank => 0
                     | <time_Interval> rank => -1
<Gen772> ::= <colon> <seconds_Value> rank => 0
<gen772_Maybe> ::= <Gen772> rank => 0
<gen772_Maybe> ::= rank => -1
<Gen775> ::= <colon> <minutes_Value> <gen772_Maybe> rank => 0
<gen775_Maybe> ::= <Gen775> rank => 0
<gen775_Maybe> ::= rank => -1
<Gen778> ::= <space> <hours_Value> <gen775_Maybe> rank => 0
<gen778_Maybe> ::= <Gen778> rank => 0
<gen778_Maybe> ::= rank => -1
<day_Time_Interval> ::= <days_Value> <gen778_Maybe> rank => 0
<Gen782> ::= <colon> <seconds_Value> rank => 0
<gen782_Maybe> ::= <Gen782> rank => 0
<gen782_Maybe> ::= rank => -1
<Gen785> ::= <colon> <minutes_Value> <gen782_Maybe> rank => 0
<gen785_Maybe> ::= <Gen785> rank => 0
<gen785_Maybe> ::= rank => -1
<Gen788> ::= <colon> <seconds_Value> rank => 0
<gen788_Maybe> ::= <Gen788> rank => 0
<gen788_Maybe> ::= rank => -1
<time_Interval> ::= <hours_Value> <gen785_Maybe> rank => 0
                  | <minutes_Value> <gen788_Maybe> rank => -1
                  | <seconds_Value> rank => -2
<years_Value> ::= <datetime_Value> rank => 0
<months_Value> ::= <datetime_Value> rank => 0
<days_Value> ::= <datetime_Value> rank => 0
<hours_Value> ::= <datetime_Value> rank => 0
<minutes_Value> ::= <datetime_Value> rank => 0
<seconds_Fraction_Maybe> ::= <seconds_Fraction> rank => 0
<seconds_Fraction_Maybe> ::= rank => -1
<Gen801> ::= <period> <seconds_Fraction_Maybe> rank => 0
<gen801_Maybe> ::= <Gen801> rank => 0
<gen801_Maybe> ::= rank => -1
<seconds_Value> ::= <seconds_Integer_Value> <gen801_Maybe> rank => 0
<seconds_Integer_Value> ::= <unsigned_Integer> rank => 0
<seconds_Fraction> ::= <unsigned_Integer> rank => 0
<datetime_Value> ::= <unsigned_Integer> rank => 0
<boolean_Literal> ::= <TRUE> rank => 0
                    | <FALSE> rank => -1
                    | <UNKNOWN> rank => -2
<identifier> ::= <actual_Identifier> rank => 0
<actual_Identifier> ::= <regular_Identifier> rank => 0
                      | <delimited_Identifier> rank => -1
<GenLex814> ~ <Lex559>
<genlex814_Any> ~ <GenLex814>*
<SQL_Language_Identifier> ~ <Lex558> <genlex814_Any>
<authorization_Identifier> ::= <role_Name> rank => 0
                             | <user_Identifier> rank => -1
<table_Name> ::= <local_Or_Schema_Qualified_Name> rank => 0
<domain_Name> ::= <schema_Qualified_Name> rank => 0
<unqualified_Schema_Name> ::= <identifier> rank => 0
<Gen822> ::= <catalog_Name> <period> rank => 0
<gen822_Maybe> ::= <Gen822> rank => 0
<gen822_Maybe> ::= rank => -1
<schema_Name> ::= <gen822_Maybe> <unqualified_Schema_Name> rank => 0
<catalog_Name> ::= <identifier> rank => 0
<Gen827> ::= <schema_Name> <period> rank => 0
<gen827_Maybe> ::= <Gen827> rank => 0
<gen827_Maybe> ::= rank => -1
<schema_Qualified_Name> ::= <gen827_Maybe> <qualified_Identifier> rank => 0
<Gen831> ::= <local_Or_Schema_Qualifier> <period> rank => 0
<gen831_Maybe> ::= <Gen831> rank => 0
<gen831_Maybe> ::= rank => -1
<local_Or_Schema_Qualified_Name> ::= <gen831_Maybe> <qualified_Identifier> rank => 0
<local_Or_Schema_Qualifier> ::= <schema_Name> rank => 0
                              | <MODULE> rank => -1
<qualified_Identifier> ::= <identifier> rank => 0
<column_Name> ::= <identifier> rank => 0
<correlation_Name> ::= <identifier> rank => 0
<query_Name> ::= <identifier> rank => 0
<SQL_Client_Module_Name> ::= <identifier> rank => 0
<procedure_Name> ::= <identifier> rank => 0
<schema_Qualified_Routine_Name> ::= <schema_Qualified_Name> rank => 0
<method_Name> ::= <identifier> rank => 0
<specific_Name> ::= <schema_Qualified_Name> rank => 0
<cursor_Name> ::= <local_Qualified_Name> rank => 0
<Gen847> ::= <local_Qualifier> <period> rank => 0
<gen847_Maybe> ::= <Gen847> rank => 0
<gen847_Maybe> ::= rank => -1
<local_Qualified_Name> ::= <gen847_Maybe> <qualified_Identifier> rank => 0
<local_Qualifier> ::= <MODULE> rank => 0
<host_Parameter_Name> ::= <colon> <identifier> rank => 0
<SQL_Parameter_Name> ::= <identifier> rank => 0
<constraint_Name> ::= <schema_Qualified_Name> rank => 0
<external_Routine_Name> ::= <identifier> rank => 0
                          | <character_String_Literal> rank => -1
<trigger_Name> ::= <schema_Qualified_Name> rank => 0
<collation_Name> ::= <schema_Qualified_Name> rank => 0
<Gen859> ::= <schema_Name> <period> rank => 0
<gen859_Maybe> ::= <Gen859> rank => 0
<gen859_Maybe> ::= rank => -1
<character_Set_Name> ::= <gen859_Maybe> <SQL_Language_Identifier> rank => 0
<transliteration_Name> ::= <schema_Qualified_Name> rank => 0
<transcoding_Name> ::= <schema_Qualified_Name> rank => 0
<user_Defined_Type_Name> ::= <schema_Qualified_Type_Name> rank => 0
<schema_Resolved_User_Defined_Type_Name> ::= <user_Defined_Type_Name> rank => 0
<Gen867> ::= <schema_Name> <period> rank => 0
<gen867_Maybe> ::= <Gen867> rank => 0
<gen867_Maybe> ::= rank => -1
<schema_Qualified_Type_Name> ::= <gen867_Maybe> <qualified_Identifier> rank => 0
<attribute_Name> ::= <identifier> rank => 0
<field_Name> ::= <identifier> rank => 0
<savepoint_Name> ::= <identifier> rank => 0
<sequence_Generator_Name> ::= <schema_Qualified_Name> rank => 0
<role_Name> ::= <identifier> rank => 0
<user_Identifier> ::= <identifier> rank => 0
<connection_Name> ::= <simple_Value_Specification> rank => 0
<sql_Server_Name> ::= <simple_Value_Specification> rank => 0
<connection_User_Name> ::= <simple_Value_Specification> rank => 0
<SQL_Statement_Name> ::= <statement_Name> rank => 0
                       | <extended_Statement_Name> rank => -1
<statement_Name> ::= <identifier> rank => 0
<scope_Option_Maybe> ::= <scope_Option> rank => 0
<scope_Option_Maybe> ::= rank => -1
<extended_Statement_Name> ::= <scope_Option_Maybe> <simple_Value_Specification> rank => 0
<dynamic_Cursor_Name> ::= <cursor_Name> rank => 0
                        | <extended_Cursor_Name> rank => -1
<extended_Cursor_Name> ::= <scope_Option_Maybe> <simple_Value_Specification> rank => 0
<descriptor_Name> ::= <scope_Option_Maybe> <simple_Value_Specification> rank => 0
<scope_Option> ::= <GLOBAL> rank => 0
                 | <LOCAL> rank => -1
<window_Name> ::= <identifier> rank => 0
<data_Type> ::= <predefined_Type> rank => 0
              | <row_Type> rank => -1
              | <path_Resolved_User_Defined_Type_Name> rank => -2
              | <reference_Type> rank => -3
              | <collection_Type> rank => -4
<Gen898> ::= <CHARACTER> <SET> <character_Set_Specification> rank => 0
<gen898_Maybe> ::= <Gen898> rank => 0
<gen898_Maybe> ::= rank => -1
<collate_Clause_Maybe> ::= <collate_Clause> rank => 0
<collate_Clause_Maybe> ::= rank => -1
<predefined_Type> ::= <character_String_Type> <gen898_Maybe> <collate_Clause_Maybe> rank => 0
                    | <national_Character_String_Type> <collate_Clause_Maybe> rank => -1
                    | <binary_Large_Object_String_Type> rank => -2
                    | <numeric_Type> rank => -3
                    | <boolean_Type> rank => -4
                    | <datetime_Type> rank => -5
                    | <interval_Type> rank => -6
<Gen910> ::= <left_Paren> <length> <right_Paren> rank => 0
<gen910_Maybe> ::= <Gen910> rank => 0
<gen910_Maybe> ::= rank => -1
<Gen913> ::= <left_Paren> <length> <right_Paren> rank => 0
<gen913_Maybe> ::= <Gen913> rank => 0
<gen913_Maybe> ::= rank => -1
<Gen916> ::= <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<gen916_Maybe> ::= <Gen916> rank => 0
<gen916_Maybe> ::= rank => -1
<Gen919> ::= <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<gen919_Maybe> ::= <Gen919> rank => 0
<gen919_Maybe> ::= rank => -1
<Gen922> ::= <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<gen922_Maybe> ::= <Gen922> rank => 0
<gen922_Maybe> ::= rank => -1
<character_String_Type> ::= <CHARACTER> <gen910_Maybe> rank => 0
                          | <CHAR> <gen913_Maybe> rank => -1
                          | <CHARACTER> <VARYING> <left_Paren> <length> <right_Paren> rank => -2
                          | <CHAR> <VARYING> <left_Paren> <length> <right_Paren> rank => -3
                          | <VARCHAR> <left_Paren> <length> <right_Paren> rank => -4
                          | <CHARACTER> <LARGE> <OBJECT> <gen916_Maybe> rank => -5
                          | <CHAR> <LARGE> <OBJECT> <gen919_Maybe> rank => -6
                          | <CLOB> <gen922_Maybe> rank => -7
<Gen933> ::= <left_Paren> <length> <right_Paren> rank => 0
<gen933_Maybe> ::= <Gen933> rank => 0
<gen933_Maybe> ::= rank => -1
<Gen936> ::= <left_Paren> <length> <right_Paren> rank => 0
<gen936_Maybe> ::= <Gen936> rank => 0
<gen936_Maybe> ::= rank => -1
<Gen939> ::= <left_Paren> <length> <right_Paren> rank => 0
<gen939_Maybe> ::= <Gen939> rank => 0
<gen939_Maybe> ::= rank => -1
<Gen942> ::= <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<gen942_Maybe> ::= <Gen942> rank => 0
<gen942_Maybe> ::= rank => -1
<Gen945> ::= <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<gen945_Maybe> ::= <Gen945> rank => 0
<gen945_Maybe> ::= rank => -1
<Gen948> ::= <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<gen948_Maybe> ::= <Gen948> rank => 0
<gen948_Maybe> ::= rank => -1
<national_Character_String_Type> ::= <NATIONAL> <CHARACTER> <gen933_Maybe> rank => 0
                                   | <NATIONAL> <CHAR> <gen936_Maybe> rank => -1
                                   | <NCHAR> <gen939_Maybe> rank => -2
                                   | <NATIONAL> <CHARACTER> <VARYING> <left_Paren> <length> <right_Paren> rank => -3
                                   | <NATIONAL> <CHAR> <VARYING> <left_Paren> <length> <right_Paren> rank => -4
                                   | <NCHAR> <VARYING> <left_Paren> <length> <right_Paren> rank => -5
                                   | <NATIONAL> <CHARACTER> <LARGE> <OBJECT> <gen942_Maybe> rank => -6
                                   | <NCHAR> <LARGE> <OBJECT> <gen945_Maybe> rank => -7
                                   | <NCLOB> <gen948_Maybe> rank => -8
<Gen960> ::= <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<gen960_Maybe> ::= <Gen960> rank => 0
<gen960_Maybe> ::= rank => -1
<Gen963> ::= <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<gen963_Maybe> ::= <Gen963> rank => 0
<gen963_Maybe> ::= rank => -1
<binary_Large_Object_String_Type> ::= <BINARY> <LARGE> <OBJECT> <gen960_Maybe> rank => 0
                                    | <BLOB> <gen963_Maybe> rank => -1
<numeric_Type> ::= <exact_Numeric_Type> rank => 0
                 | <approximate_Numeric_Type> rank => -1
<Gen970> ::= <comma> <scale> rank => 0
<gen970_Maybe> ::= <Gen970> rank => 0
<gen970_Maybe> ::= rank => -1
<Gen973> ::= <left_Paren> <precision> <gen970_Maybe> <right_Paren> rank => 0
<gen973_Maybe> ::= <Gen973> rank => 0
<gen973_Maybe> ::= rank => -1
<Gen976> ::= <comma> <scale> rank => 0
<gen976_Maybe> ::= <Gen976> rank => 0
<gen976_Maybe> ::= rank => -1
<Gen979> ::= <left_Paren> <precision> <gen976_Maybe> <right_Paren> rank => 0
<gen979_Maybe> ::= <Gen979> rank => 0
<gen979_Maybe> ::= rank => -1
<Gen982> ::= <comma> <scale> rank => 0
<gen982_Maybe> ::= <Gen982> rank => 0
<gen982_Maybe> ::= rank => -1
<Gen985> ::= <left_Paren> <precision> <gen982_Maybe> <right_Paren> rank => 0
<gen985_Maybe> ::= <Gen985> rank => 0
<gen985_Maybe> ::= rank => -1
<exact_Numeric_Type> ::= <NUMERIC> <gen973_Maybe> rank => 0
                       | <DECIMAL> <gen979_Maybe> rank => -1
                       | <DEC> <gen985_Maybe> rank => -2
                       | <SMALLINT> rank => -3
                       | <INTEGER> rank => -4
                       | <INT> rank => -5
                       | <BIGINT> rank => -6
<Gen995> ::= <left_Paren> <precision> <right_Paren> rank => 0
<gen995_Maybe> ::= <Gen995> rank => 0
<gen995_Maybe> ::= rank => -1
<approximate_Numeric_Type> ::= <FLOAT> <gen995_Maybe> rank => 0
                             | <REAL> rank => -1
                             | <DOUBLE> <PRECISION> rank => -2
<length> ::= <unsigned_Integer> rank => 0
<multiplier_Maybe> ::= <multiplier> rank => 0
<multiplier_Maybe> ::= rank => -1
<char_Length_Units_Maybe> ::= <char_Length_Units> rank => 0
<char_Length_Units_Maybe> ::= rank => -1
<large_Object_Length> ::= <unsigned_Integer> <multiplier_Maybe> <char_Length_Units_Maybe> rank => 0
                        | <large_Object_Length_Token> <char_Length_Units_Maybe> rank => -1
<char_Length_Units> ::= <CHARACTERS> rank => 0
                      | <CODE_UNITS> rank => -1
                      | <OCTETS> rank => -2
<precision> ::= <unsigned_Integer> rank => 0
<scale> ::= <unsigned_Integer> rank => 0
<boolean_Type> ::= <BOOLEAN> rank => 0
<Gen1014> ::= <left_Paren> <time_Precision> <right_Paren> rank => 0
<gen1014_Maybe> ::= <Gen1014> rank => 0
<gen1014_Maybe> ::= rank => -1
<Gen1017> ::= <with_Or_Without_Time_Zone> rank => 0
<gen1017_Maybe> ::= <Gen1017> rank => 0
<gen1017_Maybe> ::= rank => -1
<Gen1020> ::= <left_Paren> <timestamp_Precision> <right_Paren> rank => 0
<gen1020_Maybe> ::= <Gen1020> rank => 0
<gen1020_Maybe> ::= rank => -1
<Gen1023> ::= <with_Or_Without_Time_Zone> rank => 0
<gen1023_Maybe> ::= <Gen1023> rank => 0
<gen1023_Maybe> ::= rank => -1
<datetime_Type> ::= <DATE> rank => 0
                  | <TIME> <gen1014_Maybe> <gen1017_Maybe> rank => -1
                  | <TIMESTAMP> <gen1020_Maybe> <gen1023_Maybe> rank => -2
<with_Or_Without_Time_Zone> ::= <WITH> <TIME> <ZONE> rank => 0
                              | <WITHOUT> <TIME> <ZONE> rank => -1
<time_Precision> ::= <time_Fractional_Seconds_Precision> rank => 0
<timestamp_Precision> ::= <time_Fractional_Seconds_Precision> rank => 0
<time_Fractional_Seconds_Precision> ::= <unsigned_Integer> rank => 0
<interval_Type> ::= <INTERVAL> <interval_Qualifier> rank => 0
<row_Type> ::= <ROW> <row_Type_Body> rank => 0
<Gen1036> ::= <comma> <field_Definition> rank => 0
<gen1036_Any> ::= <Gen1036>* rank => 0
<row_Type_Body> ::= <left_Paren> <field_Definition> <gen1036_Any> <right_Paren> rank => 0
<scope_Clause_Maybe> ::= <scope_Clause> rank => 0
<scope_Clause_Maybe> ::= rank => -1
<reference_Type> ::= <REF> <left_Paren> <referenced_Type> <right_Paren> <scope_Clause_Maybe> rank => 0
<scope_Clause> ::= <SCOPE> <table_Name> rank => 0
<referenced_Type> ::= <path_Resolved_User_Defined_Type_Name> rank => 0
<path_Resolved_User_Defined_Type_Name> ::= <user_Defined_Type_Name> rank => 0
<collection_Type> ::= <array_Type> rank => 0
                    | <multiset_Type> rank => -1
<Gen1047> ::= <left_Bracket_Or_Trigraph> <unsigned_Integer> <right_Bracket_Or_Trigraph> rank => 0
<gen1047_Maybe> ::= <Gen1047> rank => 0
<gen1047_Maybe> ::= rank => -1
<array_Type> ::= <data_Type> <ARRAY> <gen1047_Maybe> rank => 0
<multiset_Type> ::= <data_Type> <MULTISET> rank => 0
<reference_Scope_Check_Maybe> ::= <reference_Scope_Check> rank => 0
<reference_Scope_Check_Maybe> ::= rank => -1
<field_Definition> ::= <field_Name> <data_Type> <reference_Scope_Check_Maybe> rank => 0
<value_Expression_Primary> ::= <parenthesized_Value_Expression> rank => 0
                             | <nonparenthesized_Value_Expression_Primary> rank => -1
<parenthesized_Value_Expression> ::= <left_Paren> <value_Expression> <right_Paren> rank => 0
<nonparenthesized_Value_Expression_Primary> ::= <unsigned_Value_Specification> rank => 0
                                              | <column_Reference> rank => -1
                                              | <set_Function_Specification> rank => -2
                                              | <window_Function> rank => -3
                                              | <scalar_Subquery> rank => -4
                                              | <case_Expression> rank => -5
                                              | <cast_Specification> rank => -6
                                              | <field_Reference> rank => -7
                                              | <subtype_Treatment> rank => -8
                                              | <method_Invocation> rank => -9
                                              | <static_Method_Invocation> rank => -10
                                              | <new_Specification> rank => -11
                                              | <attribute_Or_Method_Reference> rank => -12
                                              | <reference_Resolution> rank => -13
                                              | <collection_Value_Constructor> rank => -14
                                              | <array_Element_Reference> rank => -15
                                              | <multiset_Element_Reference> rank => -16
                                              | <routine_Invocation> rank => -17
                                              | <next_Value_Expression> rank => -18
<value_Specification> ::= <literal> rank => 0
                        | <general_Value_Specification> rank => -1
<unsigned_Value_Specification> ::= <unsigned_Literal> rank => 0
                                 | <general_Value_Specification> rank => -1
<general_Value_Specification> ::= <host_Parameter_Specification> rank => 0
                                | <SQL_Parameter_Reference> rank => -1
                                | <dynamic_Parameter_Specification> rank => -2
                                | <embedded_Variable_Specification> rank => -3
                                | <current_Collation_Specification> rank => -4
                                | <CURRENT_DEFAULT_TRANSFORM_GROUP> rank => -5
                                | <CURRENT_PATH> rank => -6
                                | <CURRENT_ROLE> rank => -7
                                | <CURRENT_TRANSFORM_GROUP_FOR_TYPE> <path_Resolved_User_Defined_Type_Name> rank => -8
                                | <CURRENT_USER> rank => -9
                                | <SESSION_USER> rank => -10
                                | <SYSTEM_USER> rank => -11
                                | <USER> rank => -12
                                | <VALUE> rank => -13
<simple_Value_Specification> ::= <literal> rank => 0
                               | <host_Parameter_Name> rank => -1
                               | <SQL_Parameter_Reference> rank => -2
                               | <embedded_Variable_Name> rank => -3
<target_Specification> ::= <host_Parameter_Specification> rank => 0
                         | <SQL_Parameter_Reference> rank => -1
                         | <column_Reference> rank => -2
                         | <target_Array_Element_Specification> rank => -3
                         | <dynamic_Parameter_Specification> rank => -4
                         | <embedded_Variable_Specification> rank => -5
<simple_Target_Specification> ::= <host_Parameter_Specification> rank => 0
                                | <SQL_Parameter_Reference> rank => -1
                                | <column_Reference> rank => -2
                                | <embedded_Variable_Name> rank => -3
<indicator_Parameter_Maybe> ::= <indicator_Parameter> rank => 0
<indicator_Parameter_Maybe> ::= rank => -1
<host_Parameter_Specification> ::= <host_Parameter_Name> <indicator_Parameter_Maybe> rank => 0
<dynamic_Parameter_Specification> ::= <question_Mark> rank => 0
<indicator_Variable_Maybe> ::= <indicator_Variable> rank => 0
<indicator_Variable_Maybe> ::= rank => -1
<embedded_Variable_Specification> ::= <embedded_Variable_Name> <indicator_Variable_Maybe> rank => 0
<indicator_Maybe> ::= <INDICATOR> rank => 0
<indicator_Maybe> ::= rank => -1
<indicator_Variable> ::= <indicator_Maybe> <embedded_Variable_Name> rank => 0
<indicator_Parameter> ::= <indicator_Maybe> <host_Parameter_Name> rank => 0
<target_Array_Element_Specification> ::= <target_Array_Reference> <left_Bracket_Or_Trigraph> <simple_Value_Specification> <right_Bracket_Or_Trigraph> rank => 0
<target_Array_Reference> ::= <SQL_Parameter_Reference> rank => 0
                           | <column_Reference> rank => -1
<current_Collation_Specification> ::= <CURRENT_COLLATION> <left_Paren> <string_Value_Expression> <right_Paren> rank => 0
<contextually_Typed_Value_Specification> ::= <implicitly_Typed_Value_Specification> rank => 0
                                           | <default_Specification> rank => -1
<implicitly_Typed_Value_Specification> ::= <null_Specification> rank => 0
                                         | <empty_Specification> rank => -1
<null_Specification> ::= <NULL> rank => 0
<empty_Specification> ::= <ARRAY> <left_Bracket_Or_Trigraph> <right_Bracket_Or_Trigraph> rank => 0
                        | <MULTISET> <left_Bracket_Or_Trigraph> <right_Bracket_Or_Trigraph> rank => -1
<default_Specification> ::= <DEFAULT> rank => 0
<Gen1132> ::= <period> <identifier> rank => 0
<gen1132_Any> ::= <Gen1132>* rank => 0
<identifier_Chain> ::= <identifier> <gen1132_Any> rank => 0
<basic_Identifier_Chain> ::= <identifier_Chain> rank => 0
<column_Reference> ::= <basic_Identifier_Chain> rank => 0
                     | <MODULE> <period> <qualified_Identifier> <period> <column_Name> rank => -1
<SQL_Parameter_Reference> ::= <basic_Identifier_Chain> rank => 0
<set_Function_Specification> ::= <aggregate_Function> rank => 0
                               | <grouping_Operation> rank => -1
<Gen1141> ::= <comma> <column_Reference> rank => 0
<gen1141_Any> ::= <Gen1141>* rank => 0
<grouping_Operation> ::= <GROUPING> <left_Paren> <column_Reference> <gen1141_Any> <right_Paren> rank => 0
<window_Function> ::= <window_Function_Type> <OVER> <window_Name_Or_Specification> rank => 0
<window_Function_Type> ::= <rank_Function_Type> <left_Paren> <right_Paren> rank => 0
                         | <ROW_NUMBER> <left_Paren> <right_Paren> rank => -1
                         | <aggregate_Function> rank => -2
<rank_Function_Type> ::= <RANK> rank => 0
                       | <DENSE_RANK> rank => -1
                       | <PERCENT_RANK> rank => -2
                       | <CUME_DIST> rank => -3
<window_Name_Or_Specification> ::= <window_Name> rank => 0
                                 | <in_Line_Window_Specification> rank => -1
<in_Line_Window_Specification> ::= <window_Specification> rank => 0
<case_Expression> ::= <case_Abbreviation> rank => 0
                    | <case_Specification> rank => -1
<Gen1157> ::= <comma> <value_Expression> rank => 0
<gen1157_Many> ::= <Gen1157>+ rank => 0
<case_Abbreviation> ::= <NULLIF> <left_Paren> <value_Expression> <comma> <value_Expression> <right_Paren> rank => 0
                      | <COALESCE> <left_Paren> <value_Expression> <gen1157_Many> <right_Paren> rank => -1
<case_Specification> ::= <simple_Case> rank => 0
                       | <searched_Case> rank => -1
<simple_When_Clause_Many> ::= <simple_When_Clause>+ rank => 0
<else_Clause_Maybe> ::= <else_Clause> rank => 0
<else_Clause_Maybe> ::= rank => -1
<simple_Case> ::= <CASE> <case_Operand> <simple_When_Clause_Many> <else_Clause_Maybe> <END> rank => 0
<searched_When_Clause_Many> ::= <searched_When_Clause>+ rank => 0
<searched_Case> ::= <CASE> <searched_When_Clause_Many> <else_Clause_Maybe> <END> rank => 0
<simple_When_Clause> ::= <WHEN> <when_Operand> <THEN> <result> rank => 0
<searched_When_Clause> ::= <WHEN> <search_Condition> <THEN> <result> rank => 0
<else_Clause> ::= <ELSE> <result> rank => 0
<case_Operand> ::= <row_Value_Predicand> rank => 0
                 | <overlaps_Predicate> rank => -1
<when_Operand> ::= <row_Value_Predicand> rank => 0
                 | <comparison_Predicate_Part_2> rank => -1
                 | <between_Predicate_Part_2> rank => -2
                 | <in_Predicate_Part_2> rank => -3
                 | <character_Like_Predicate_Part_2> rank => -4
                 | <octet_Like_Predicate_Part_2> rank => -5
                 | <similar_Predicate_Part_2> rank => -6
                 | <null_Predicate_Part_2> rank => -7
                 | <quantified_Comparison_Predicate_Part_2> rank => -8
                 | <match_Predicate_Part_2> rank => -9
                 | <overlaps_Predicate_Part_2> rank => -10
                 | <distinct_Predicate_Part_2> rank => -11
                 | <member_Predicate_Part_2> rank => -12
                 | <submultiset_Predicate_Part_2> rank => -13
                 | <set_Predicate_Part_2> rank => -14
                 | <type_Predicate_Part_2> rank => -15
<result> ::= <result_Expression> rank => 0
           | <NULL> rank => -1
<result_Expression> ::= <value_Expression> rank => 0
<cast_Specification> ::= <CAST> <left_Paren> <cast_Operand> <AS> <cast_Target> <right_Paren> rank => 0
<cast_Operand> ::= <value_Expression> rank => 0
                 | <implicitly_Typed_Value_Specification> rank => -1
<cast_Target> ::= <domain_Name> rank => 0
                | <data_Type> rank => -1
<next_Value_Expression> ::= <NEXT> <VALUE> <FOR> <sequence_Generator_Name> rank => 0
<field_Reference> ::= <value_Expression_Primary> <period> <field_Name> rank => 0
<subtype_Treatment> ::= <TREAT> <left_Paren> <subtype_Operand> <AS> <target_Subtype> <right_Paren> rank => 0
<subtype_Operand> ::= <value_Expression> rank => 0
<target_Subtype> ::= <path_Resolved_User_Defined_Type_Name> rank => 0
                   | <reference_Type> rank => -1
<method_Invocation> ::= <direct_Invocation> rank => 0
                      | <generalized_Invocation> rank => -1
<SQL_Argument_List_Maybe> ::= <SQL_Argument_List> rank => 0
<SQL_Argument_List_Maybe> ::= rank => -1
<direct_Invocation> ::= <value_Expression_Primary> <period> <method_Name> <SQL_Argument_List_Maybe> rank => 0
<generalized_Invocation> ::= <left_Paren> <value_Expression_Primary> <AS> <data_Type> <right_Paren> <period> <method_Name> <SQL_Argument_List_Maybe> rank => 0
<method_Selection> ::= <routine_Invocation> rank => 0
<constructor_Method_Selection> ::= <routine_Invocation> rank => 0
<static_Method_Invocation> ::= <path_Resolved_User_Defined_Type_Name> <double_Colon> <method_Name> <SQL_Argument_List_Maybe> rank => 0
<static_Method_Selection> ::= <routine_Invocation> rank => 0
<new_Specification> ::= <NEW> <routine_Invocation> rank => 0
<new_Invocation> ::= <method_Invocation> rank => 0
                   | <routine_Invocation> rank => -1
<attribute_Or_Method_Reference> ::= <value_Expression_Primary> <dereference_Operator> <qualified_Identifier> <SQL_Argument_List_Maybe> rank => 0
<dereference_Operator> ::= <right_Arrow> rank => 0
<dereference_Operation> ::= <reference_Value_Expression> <dereference_Operator> <attribute_Name> rank => 0
<method_Reference> ::= <value_Expression_Primary> <dereference_Operator> <method_Name> <SQL_Argument_List> rank => 0
<reference_Resolution> ::= <DEREF> <left_Paren> <reference_Value_Expression> <right_Paren> rank => 0
<array_Element_Reference> ::= <array_Value_Expression> <left_Bracket_Or_Trigraph> <numeric_Value_Expression> <right_Bracket_Or_Trigraph> rank => 0
<multiset_Element_Reference> ::= <ELEMENT> <left_Paren> <multiset_Value_Expression> <right_Paren> rank => 0
<value_Expression> ::= <common_Value_Expression> rank => 0
                     | <boolean_Value_Expression> rank => -1
                     | <row_Value_Expression> rank => -2
<common_Value_Expression> ::= <numeric_Value_Expression> rank => 0
                            | <string_Value_Expression> rank => -1
                            | <datetime_Value_Expression> rank => -2
                            | <interval_Value_Expression> rank => -3
                            | <user_Defined_Type_Value_Expression> rank => -4
                            | <reference_Value_Expression> rank => -5
                            | <collection_Value_Expression> rank => -6
<user_Defined_Type_Value_Expression> ::= <value_Expression_Primary> rank => 0
<reference_Value_Expression> ::= <value_Expression_Primary> rank => 0
<collection_Value_Expression> ::= <array_Value_Expression> rank => 0
                                | <multiset_Value_Expression> rank => -1
<collection_Value_Constructor> ::= <array_Value_Constructor> rank => 0
                                 | <multiset_Value_Constructor> rank => -1
<numeric_Value_Expression> ::= <term> rank => 0
                             | <numeric_Value_Expression> <plus_Sign> <term> rank => -1
                             | <numeric_Value_Expression> <minus_Sign> <term> rank => -2
<term> ::= <factor> rank => 0
         | <term> <asterisk> <factor> rank => -1
         | <term> <solidus> <factor> rank => -2
<factor> ::= <sign_Maybe> <numeric_Primary> rank => 0
<numeric_Primary> ::= <value_Expression_Primary> rank => 0
                    | <numeric_Value_Function> rank => -1
<numeric_Value_Function> ::= <position_Expression> rank => 0
                           | <extract_Expression> rank => -1
                           | <length_Expression> rank => -2
                           | <cardinality_Expression> rank => -3
                           | <absolute_Value_Expression> rank => -4
                           | <modulus_Expression> rank => -5
                           | <natural_Logarithm> rank => -6
                           | <exponential_Function> rank => -7
                           | <power_Function> rank => -8
                           | <square_Root> rank => -9
                           | <floor_Function> rank => -10
                           | <ceiling_Function> rank => -11
                           | <width_Bucket_Function> rank => -12
<position_Expression> ::= <string_Position_Expression> rank => 0
                        | <blob_Position_Expression> rank => -1
<Gen1264> ::= <USING> <char_Length_Units> rank => 0
<gen1264_Maybe> ::= <Gen1264> rank => 0
<gen1264_Maybe> ::= rank => -1
<string_Position_Expression> ::= <POSITION> <left_Paren> <string_Value_Expression> <IN> <string_Value_Expression> <gen1264_Maybe> <right_Paren> rank => 0
<blob_Position_Expression> ::= <POSITION> <left_Paren> <blob_Value_Expression> <IN> <blob_Value_Expression> <right_Paren> rank => 0
<length_Expression> ::= <char_Length_Expression> rank => 0
                      | <octet_Length_Expression> rank => -1
<Gen1271> ::= <CHAR_LENGTH> rank => 0
            | <CHARACTER_LENGTH> rank => -1
<Gen1273> ::= <USING> <char_Length_Units> rank => 0
<gen1273_Maybe> ::= <Gen1273> rank => 0
<gen1273_Maybe> ::= rank => -1
<char_Length_Expression> ::= <Gen1271> <left_Paren> <string_Value_Expression> <gen1273_Maybe> <right_Paren> rank => 0
<octet_Length_Expression> ::= <OCTET_LENGTH> <left_Paren> <string_Value_Expression> <right_Paren> rank => 0
<extract_Expression> ::= <EXTRACT> <left_Paren> <extract_Field> <FROM> <extract_Source> <right_Paren> rank => 0
<extract_Field> ::= <primary_Datetime_Field> rank => 0
                  | <time_Zone_Field> rank => -1
<time_Zone_Field> ::= <TIMEZONE_HOUR> rank => 0
                    | <TIMEZONE_MINUTE> rank => -1
<extract_Source> ::= <datetime_Value_Expression> rank => 0
                   | <interval_Value_Expression> rank => -1
<cardinality_Expression> ::= <CARDINALITY> <left_Paren> <collection_Value_Expression> <right_Paren> rank => 0
<absolute_Value_Expression> ::= <ABS> <left_Paren> <numeric_Value_Expression> <right_Paren> rank => 0
<modulus_Expression> ::= <MOD> <left_Paren> <numeric_Value_Expression> <comma> <numeric_Value_Expression> <right_Paren> rank => 0
<natural_Logarithm> ::= <LN> <left_Paren> <numeric_Value_Expression> <right_Paren> rank => 0
<exponential_Function> ::= <EXP> <left_Paren> <numeric_Value_Expression> <right_Paren> rank => 0
<power_Function> ::= <POWER> <left_Paren> <numeric_Value_Expression_Base> <comma> <numeric_Value_Expression_Exponent> <right_Paren> rank => 0
<numeric_Value_Expression_Base> ::= <numeric_Value_Expression> rank => 0
<numeric_Value_Expression_Exponent> ::= <numeric_Value_Expression> rank => 0
<square_Root> ::= <SQRT> <left_Paren> <numeric_Value_Expression> <right_Paren> rank => 0
<floor_Function> ::= <FLOOR> <left_Paren> <numeric_Value_Expression> <right_Paren> rank => 0
<Gen1295> ::= <CEIL> rank => 0
            | <CEILING> rank => -1
<ceiling_Function> ::= <Gen1295> <left_Paren> <numeric_Value_Expression> <right_Paren> rank => 0
<width_Bucket_Function> ::= <WIDTH_BUCKET> <left_Paren> <width_Bucket_Operand> <comma> <width_Bucket_Bound_1> <comma> <width_Bucket_Bound_2> <comma> <width_Bucket_Count> <right_Paren> rank => 0
<width_Bucket_Operand> ::= <numeric_Value_Expression> rank => 0
<width_Bucket_Bound_1> ::= <numeric_Value_Expression> rank => 0
<width_Bucket_Bound_2> ::= <numeric_Value_Expression> rank => 0
<width_Bucket_Count> ::= <numeric_Value_Expression> rank => 0
<string_Value_Expression> ::= <character_Value_Expression> rank => 0
                            | <blob_Value_Expression> rank => -1
<character_Value_Expression> ::= <concatenation> rank => 0
                               | <character_Factor> rank => -1
<concatenation> ::= <character_Value_Expression> <concatenation_Operator> <character_Factor> rank => 0
<character_Factor> ::= <character_Primary> <collate_Clause_Maybe> rank => 0
<character_Primary> ::= <value_Expression_Primary> rank => 0
                      | <string_Value_Function> rank => -1
<blob_Value_Expression> ::= <blob_Concatenation> rank => 0
                          | <blob_Factor> rank => -1
<blob_Factor> ::= <blob_Primary> rank => 0
<blob_Primary> ::= <value_Expression_Primary> rank => 0
                 | <string_Value_Function> rank => -1
<blob_Concatenation> ::= <blob_Value_Expression> <concatenation_Operator> <blob_Factor> rank => 0
<string_Value_Function> ::= <character_Value_Function> rank => 0
                          | <blob_Value_Function> rank => -1
<character_Value_Function> ::= <character_Substring_Function> rank => 0
                             | <regular_Expression_Substring_Function> rank => -1
                             | <fold> rank => -2
                             | <transcoding> rank => -3
                             | <character_Transliteration> rank => -4
                             | <trim_Function> rank => -5
                             | <character_Overlay_Function> rank => -6
                             | <normalize_Function> rank => -7
                             | <specific_Type_Method> rank => -8
<Gen1328> ::= <FOR> <string_Length> rank => 0
<gen1328_Maybe> ::= <Gen1328> rank => 0
<gen1328_Maybe> ::= rank => -1
<Gen1331> ::= <USING> <char_Length_Units> rank => 0
<gen1331_Maybe> ::= <Gen1331> rank => 0
<gen1331_Maybe> ::= rank => -1
<character_Substring_Function> ::= <SUBSTRING> <left_Paren> <character_Value_Expression> <FROM> <start_Position> <gen1328_Maybe> <gen1331_Maybe> <right_Paren> rank => 0
<regular_Expression_Substring_Function> ::= <SUBSTRING> <left_Paren> <character_Value_Expression> <SIMILAR> <character_Value_Expression> <ESCAPE> <escape_Character> <right_Paren> rank => 0
<Gen1336> ::= <UPPER> rank => 0
            | <LOWER> rank => -1
<fold> ::= <Gen1336> <left_Paren> <character_Value_Expression> <right_Paren> rank => 0
<transcoding> ::= <CONVERT> <left_Paren> <character_Value_Expression> <USING> <transcoding_Name> <right_Paren> rank => 0
<character_Transliteration> ::= <TRANSLATE> <left_Paren> <character_Value_Expression> <USING> <transliteration_Name> <right_Paren> rank => 0
<trim_Function> ::= <TRIM> <left_Paren> <trim_Operands> <right_Paren> rank => 0
<trim_Specification_Maybe> ::= <trim_Specification> rank => 0
<trim_Specification_Maybe> ::= rank => -1
<trim_Character_Maybe> ::= <trim_Character> rank => 0
<trim_Character_Maybe> ::= rank => -1
<Gen1346> ::= <trim_Specification_Maybe> <trim_Character_Maybe> <FROM> rank => 0
<gen1346_Maybe> ::= <Gen1346> rank => 0
<gen1346_Maybe> ::= rank => -1
<trim_Operands> ::= <gen1346_Maybe> <trim_Source> rank => 0
<trim_Source> ::= <character_Value_Expression> rank => 0
<trim_Specification> ::= <LEADING> rank => 0
                       | <TRAILING> rank => -1
                       | <BOTH> rank => -2
<trim_Character> ::= <character_Value_Expression> rank => 0
<Gen1355> ::= <FOR> <string_Length> rank => 0
<gen1355_Maybe> ::= <Gen1355> rank => 0
<gen1355_Maybe> ::= rank => -1
<Gen1358> ::= <USING> <char_Length_Units> rank => 0
<gen1358_Maybe> ::= <Gen1358> rank => 0
<gen1358_Maybe> ::= rank => -1
<character_Overlay_Function> ::= <OVERLAY> <left_Paren> <character_Value_Expression> <PLACING> <character_Value_Expression> <FROM> <start_Position> <gen1355_Maybe> <gen1358_Maybe> <right_Paren> rank => 0
<normalize_Function> ::= <NORMALIZE> <left_Paren> <character_Value_Expression> <right_Paren> rank => 0
<specific_Type_Method> ::= <user_Defined_Type_Value_Expression> <period> <SPECIFICTYPE> rank => 0
<blob_Value_Function> ::= <blob_Substring_Function> rank => 0
                        | <blob_Trim_Function> rank => -1
                        | <blob_Overlay_Function> rank => -2
<Gen1367> ::= <FOR> <string_Length> rank => 0
<gen1367_Maybe> ::= <Gen1367> rank => 0
<gen1367_Maybe> ::= rank => -1
<blob_Substring_Function> ::= <SUBSTRING> <left_Paren> <blob_Value_Expression> <FROM> <start_Position> <gen1367_Maybe> <right_Paren> rank => 0
<blob_Trim_Function> ::= <TRIM> <left_Paren> <blob_Trim_Operands> <right_Paren> rank => 0
<trim_Octet_Maybe> ::= <trim_Octet> rank => 0
<trim_Octet_Maybe> ::= rank => -1
<Gen1374> ::= <trim_Specification_Maybe> <trim_Octet_Maybe> <FROM> rank => 0
<gen1374_Maybe> ::= <Gen1374> rank => 0
<gen1374_Maybe> ::= rank => -1
<blob_Trim_Operands> ::= <gen1374_Maybe> <blob_Trim_Source> rank => 0
<blob_Trim_Source> ::= <blob_Value_Expression> rank => 0
<trim_Octet> ::= <blob_Value_Expression> rank => 0
<Gen1380> ::= <FOR> <string_Length> rank => 0
<gen1380_Maybe> ::= <Gen1380> rank => 0
<gen1380_Maybe> ::= rank => -1
<blob_Overlay_Function> ::= <OVERLAY> <left_Paren> <blob_Value_Expression> <PLACING> <blob_Value_Expression> <FROM> <start_Position> <gen1380_Maybe> <right_Paren> rank => 0
<start_Position> ::= <numeric_Value_Expression> rank => 0
<string_Length> ::= <numeric_Value_Expression> rank => 0
<datetime_Value_Expression> ::= <datetime_Term> rank => 0
                              | <interval_Value_Expression> <plus_Sign> <datetime_Term> rank => -1
                              | <datetime_Value_Expression> <plus_Sign> <interval_Term> rank => -2
                              | <datetime_Value_Expression> <minus_Sign> <interval_Term> rank => -3
<datetime_Term> ::= <datetime_Factor> rank => 0
<time_Zone_Maybe> ::= <time_Zone> rank => 0
<time_Zone_Maybe> ::= rank => -1
<datetime_Factor> ::= <datetime_Primary> <time_Zone_Maybe> rank => 0
<datetime_Primary> ::= <value_Expression_Primary> rank => 0
                     | <datetime_Value_Function> rank => -1
<time_Zone> ::= <AT> <time_Zone_Specifier> rank => 0
<time_Zone_Specifier> ::= <LOCAL> rank => 0
                        | <TIME> <ZONE> <interval_Primary> rank => -1
<datetime_Value_Function> ::= <current_Date_Value_Function> rank => 0
                            | <current_Time_Value_Function> rank => -1
                            | <current_Timestamp_Value_Function> rank => -2
                            | <current_Local_Time_Value_Function> rank => -3
                            | <current_Local_Timestamp_Value_Function> rank => -4
<current_Date_Value_Function> ::= <CURRENT_DATE> rank => 0
<Gen1405> ::= <left_Paren> <time_Precision> <right_Paren> rank => 0
<gen1405_Maybe> ::= <Gen1405> rank => 0
<gen1405_Maybe> ::= rank => -1
<current_Time_Value_Function> ::= <CURRENT_TIME> <gen1405_Maybe> rank => 0
<Gen1409> ::= <left_Paren> <time_Precision> <right_Paren> rank => 0
<gen1409_Maybe> ::= <Gen1409> rank => 0
<gen1409_Maybe> ::= rank => -1
<current_Local_Time_Value_Function> ::= <LOCALTIME> <gen1409_Maybe> rank => 0
<Gen1413> ::= <left_Paren> <timestamp_Precision> <right_Paren> rank => 0
<gen1413_Maybe> ::= <Gen1413> rank => 0
<gen1413_Maybe> ::= rank => -1
<current_Timestamp_Value_Function> ::= <CURRENT_TIMESTAMP> <gen1413_Maybe> rank => 0
<Gen1417> ::= <left_Paren> <timestamp_Precision> <right_Paren> rank => 0
<gen1417_Maybe> ::= <Gen1417> rank => 0
<gen1417_Maybe> ::= rank => -1
<current_Local_Timestamp_Value_Function> ::= <LOCALTIMESTAMP> <gen1417_Maybe> rank => 0
<interval_Value_Expression> ::= <interval_Term> rank => 0
                              | <interval_Value_Expression_1> <plus_Sign> <interval_Term_1> rank => -1
                              | <interval_Value_Expression_1> <minus_Sign> <interval_Term_1> rank => -2
                              | <left_Paren> <datetime_Value_Expression> <minus_Sign> <datetime_Term> <right_Paren> <interval_Qualifier> rank => -3
<interval_Term> ::= <interval_Factor> rank => 0
                  | <interval_Term_2> <asterisk> <factor> rank => -1
                  | <interval_Term_2> <solidus> <factor> rank => -2
                  | <term> <asterisk> <interval_Factor> rank => -3
<interval_Factor> ::= <sign_Maybe> <interval_Primary> rank => 0
<interval_Qualifier_Maybe> ::= <interval_Qualifier> rank => 0
<interval_Qualifier_Maybe> ::= rank => -1
<interval_Primary> ::= <value_Expression_Primary> <interval_Qualifier_Maybe> rank => 0
                     | <interval_Value_Function> rank => -1
<interval_Value_Expression_1> ::= <interval_Value_Expression> rank => 0
<interval_Term_1> ::= <interval_Term> rank => 0
<interval_Term_2> ::= <interval_Term> rank => 0
<interval_Value_Function> ::= <interval_Absolute_Value_Function> rank => 0
<interval_Absolute_Value_Function> ::= <ABS> <left_Paren> <interval_Value_Expression> <right_Paren> rank => 0
<boolean_Value_Expression> ::= <boolean_Term> rank => 0
                             | <boolean_Value_Expression> <OR> <boolean_Term> rank => -1
<boolean_Term> ::= <boolean_Factor> rank => 0
                 | <boolean_Term> <AND> <boolean_Factor> rank => -1
<not_Maybe> ::= <NOT> rank => 0
<not_Maybe> ::= rank => -1
<boolean_Factor> ::= <not_Maybe> <boolean_Test> rank => 0
<Gen1446> ::= <IS> <not_Maybe> <truth_Value> rank => 0
<gen1446_Maybe> ::= <Gen1446> rank => 0
<gen1446_Maybe> ::= rank => -1
<boolean_Test> ::= <boolean_Primary> <gen1446_Maybe> rank => 0
<truth_Value> ::= <TRUE> rank => 0
                | <FALSE> rank => -1
                | <UNKNOWN> rank => -2
<boolean_Primary> ::= <predicate> rank => 0
                    | <boolean_Predicand> rank => -1
<boolean_Predicand> ::= <parenthesized_Boolean_Value_Expression> rank => 0
                      | <nonparenthesized_Value_Expression_Primary> rank => -1
<parenthesized_Boolean_Value_Expression> ::= <left_Paren> <boolean_Value_Expression> <right_Paren> rank => 0
<array_Value_Expression> ::= <array_Concatenation> rank => 0
                           | <array_Factor> rank => -1
<array_Concatenation> ::= <array_Value_Expression_1> <concatenation_Operator> <array_Factor> rank => 0
<array_Value_Expression_1> ::= <array_Value_Expression> rank => 0
<array_Factor> ::= <value_Expression_Primary> rank => 0
<array_Value_Constructor> ::= <array_Value_Constructor_By_Enumeration> rank => 0
                            | <array_Value_Constructor_By_Query> rank => -1
<array_Value_Constructor_By_Enumeration> ::= <ARRAY> <left_Bracket_Or_Trigraph> <array_Element_List> <right_Bracket_Or_Trigraph> rank => 0
<Gen1466> ::= <comma> <array_Element> rank => 0
<gen1466_Any> ::= <Gen1466>* rank => 0
<array_Element_List> ::= <array_Element> <gen1466_Any> rank => 0
<array_Element> ::= <value_Expression> rank => 0
<order_By_Clause_Maybe> ::= <order_By_Clause> rank => 0
<order_By_Clause_Maybe> ::= rank => -1
<array_Value_Constructor_By_Query> ::= <ARRAY> <left_Paren> <query_Expression> <order_By_Clause_Maybe> <right_Paren> rank => 0
<Gen1473> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<Gen1475> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<multiset_Value_Expression> ::= <multiset_Term> rank => 0
                              | <multiset_Value_Expression> <MULTISET> <UNION> <Gen1473> <multiset_Term> rank => -1
                              | <multiset_Value_Expression> <MULTISET> <EXCEPT> <Gen1475> <multiset_Term> rank => -2
<Gen1480> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<multiset_Term> ::= <multiset_Primary> rank => 0
                  | <multiset_Term> <MULTISET> <INTERSECT> <Gen1480> <multiset_Primary> rank => -1
<multiset_Primary> ::= <multiset_Value_Function> rank => 0
                     | <value_Expression_Primary> rank => -1
<multiset_Value_Function> ::= <multiset_Set_Function> rank => 0
<multiset_Set_Function> ::= <SET> <left_Paren> <multiset_Value_Expression> <right_Paren> rank => 0
<multiset_Value_Constructor> ::= <multiset_Value_Constructor_By_Enumeration> rank => 0
                               | <multiset_Value_Constructor_By_Query> rank => -1
                               | <table_Value_Constructor_By_Query> rank => -2
<multiset_Value_Constructor_By_Enumeration> ::= <MULTISET> <left_Bracket_Or_Trigraph> <multiset_Element_List> <right_Bracket_Or_Trigraph> rank => 0
<Gen1492> ::= <comma> <multiset_Element> rank => 0
<gen1492_Any> ::= <Gen1492>* rank => 0
<multiset_Element_List> ::= <multiset_Element> <gen1492_Any> rank => 0
<multiset_Element> ::= <value_Expression> rank => 0
<multiset_Value_Constructor_By_Query> ::= <MULTISET> <left_Paren> <query_Expression> <right_Paren> rank => 0
<table_Value_Constructor_By_Query> ::= <TABLE> <left_Paren> <query_Expression> <right_Paren> rank => 0
<row_Value_Constructor> ::= <common_Value_Expression> rank => 0
                          | <boolean_Value_Expression> rank => -1
                          | <explicit_Row_Value_Constructor> rank => -2
<explicit_Row_Value_Constructor> ::= <left_Paren> <row_Value_Constructor_Element> <comma> <row_Value_Constructor_Element_List> <right_Paren> rank => 0
                                   | <ROW> <left_Paren> <row_Value_Constructor_Element_List> <right_Paren> rank => -1
                                   | <row_Subquery> rank => -2
<Gen1504> ::= <comma> <row_Value_Constructor_Element> rank => 0
<gen1504_Any> ::= <Gen1504>* rank => 0
<row_Value_Constructor_Element_List> ::= <row_Value_Constructor_Element> <gen1504_Any> rank => 0
<row_Value_Constructor_Element> ::= <value_Expression> rank => 0
<contextually_Typed_Row_Value_Constructor> ::= <common_Value_Expression> rank => 0
                                             | <boolean_Value_Expression> rank => -1
                                             | <contextually_Typed_Value_Specification> rank => -2
                                             | <left_Paren> <contextually_Typed_Row_Value_Constructor_Element> <comma> <contextually_Typed_Row_Value_Constructor_Element_List> <right_Paren> rank => -3
                                             | <ROW> <left_Paren> <contextually_Typed_Row_Value_Constructor_Element_List> <right_Paren> rank => -4
<Gen1513> ::= <comma> <contextually_Typed_Row_Value_Constructor_Element> rank => 0
<gen1513_Any> ::= <Gen1513>* rank => 0
<contextually_Typed_Row_Value_Constructor_Element_List> ::= <contextually_Typed_Row_Value_Constructor_Element> <gen1513_Any> rank => 0
<contextually_Typed_Row_Value_Constructor_Element> ::= <value_Expression> rank => 0
                                                     | <contextually_Typed_Value_Specification> rank => -1
<row_Value_Constructor_Predicand> ::= <common_Value_Expression> rank => 0
                                    | <boolean_Predicand> rank => -1
                                    | <explicit_Row_Value_Constructor> rank => -2
<row_Value_Expression> ::= <row_Value_Special_Case> rank => 0
                         | <explicit_Row_Value_Constructor> rank => -1
<table_Row_Value_Expression> ::= <row_Value_Special_Case> rank => 0
                               | <row_Value_Constructor> rank => -1
<contextually_Typed_Row_Value_Expression> ::= <row_Value_Special_Case> rank => 0
                                            | <contextually_Typed_Row_Value_Constructor> rank => -1
<row_Value_Predicand> ::= <row_Value_Special_Case> rank => 0
                        | <row_Value_Constructor_Predicand> rank => -1
<row_Value_Special_Case> ::= <nonparenthesized_Value_Expression_Primary> rank => 0
<table_Value_Constructor> ::= <VALUES> <row_Value_Expression_List> rank => 0
<Gen1531> ::= <comma> <table_Row_Value_Expression> rank => 0
<gen1531_Any> ::= <Gen1531>* rank => 0
<row_Value_Expression_List> ::= <table_Row_Value_Expression> <gen1531_Any> rank => 0
<contextually_Typed_Table_Value_Constructor> ::= <VALUES> <contextually_Typed_Row_Value_Expression_List> rank => 0
<Gen1535> ::= <comma> <contextually_Typed_Row_Value_Expression> rank => 0
<gen1535_Any> ::= <Gen1535>* rank => 0
<contextually_Typed_Row_Value_Expression_List> ::= <contextually_Typed_Row_Value_Expression> <gen1535_Any> rank => 0
<where_Clause_Maybe> ::= <where_Clause> rank => 0
<where_Clause_Maybe> ::= rank => -1
<group_By_Clause_Maybe> ::= <group_By_Clause> rank => 0
<group_By_Clause_Maybe> ::= rank => -1
<having_Clause_Maybe> ::= <having_Clause> rank => 0
<having_Clause_Maybe> ::= rank => -1
<window_Clause_Maybe> ::= <window_Clause> rank => 0
<window_Clause_Maybe> ::= rank => -1
<table_Expression> ::= <from_Clause> <where_Clause_Maybe> <group_By_Clause_Maybe> <having_Clause_Maybe> <window_Clause_Maybe> rank => 0
<from_Clause> ::= <FROM> <table_Reference_List> rank => 0
<Gen1548> ::= <comma> <table_Reference> rank => 0
<gen1548_Any> ::= <Gen1548>* rank => 0
<table_Reference_List> ::= <table_Reference> <gen1548_Any> rank => 0
<sample_Clause_Maybe> ::= <sample_Clause> rank => 0
<sample_Clause_Maybe> ::= rank => -1
<table_Reference> ::= <table_Primary_Or_Joined_Table> <sample_Clause_Maybe> rank => 0
<table_Primary_Or_Joined_Table> ::= <table_Primary> rank => 0
                                  | <joined_Table> rank => -1
<repeatable_Clause_Maybe> ::= <repeatable_Clause> rank => 0
<repeatable_Clause_Maybe> ::= rank => -1
<sample_Clause> ::= <TABLESAMPLE> <sample_Method> <left_Paren> <sample_Percentage> <right_Paren> <repeatable_Clause_Maybe> rank => 0
<sample_Method> ::= <BERNOULLI> rank => 0
                  | <SYSTEM> rank => -1
<repeatable_Clause> ::= <REPEATABLE> <left_Paren> <repeat_Argument> <right_Paren> rank => 0
<sample_Percentage> ::= <numeric_Value_Expression> rank => 0
<repeat_Argument> ::= <numeric_Value_Expression> rank => 0
<as_Maybe> ::= <AS> rank => 0
<as_Maybe> ::= rank => -1
<Gen1566> ::= <left_Paren> <derived_Column_List> <right_Paren> rank => 0
<gen1566_Maybe> ::= <Gen1566> rank => 0
<gen1566_Maybe> ::= rank => -1
<Gen1569> ::= <as_Maybe> <correlation_Name> <gen1566_Maybe> rank => 0
<gen1569_Maybe> ::= <Gen1569> rank => 0
<gen1569_Maybe> ::= rank => -1
<Gen1572> ::= <left_Paren> <derived_Column_List> <right_Paren> rank => 0
<gen1572_Maybe> ::= <Gen1572> rank => 0
<gen1572_Maybe> ::= rank => -1
<Gen1575> ::= <left_Paren> <derived_Column_List> <right_Paren> rank => 0
<gen1575_Maybe> ::= <Gen1575> rank => 0
<gen1575_Maybe> ::= rank => -1
<Gen1578> ::= <left_Paren> <derived_Column_List> <right_Paren> rank => 0
<gen1578_Maybe> ::= <Gen1578> rank => 0
<gen1578_Maybe> ::= rank => -1
<Gen1581> ::= <left_Paren> <derived_Column_List> <right_Paren> rank => 0
<gen1581_Maybe> ::= <Gen1581> rank => 0
<gen1581_Maybe> ::= rank => -1
<Gen1584> ::= <left_Paren> <derived_Column_List> <right_Paren> rank => 0
<gen1584_Maybe> ::= <Gen1584> rank => 0
<gen1584_Maybe> ::= rank => -1
<Gen1587> ::= <as_Maybe> <correlation_Name> <gen1584_Maybe> rank => 0
<gen1587_Maybe> ::= <Gen1587> rank => 0
<gen1587_Maybe> ::= rank => -1
<table_Primary> ::= <table_Or_Query_Name> <gen1569_Maybe> rank => 0
                  | <derived_Table> <as_Maybe> <correlation_Name> <gen1572_Maybe> rank => -1
                  | <lateral_Derived_Table> <as_Maybe> <correlation_Name> <gen1575_Maybe> rank => -2
                  | <collection_Derived_Table> <as_Maybe> <correlation_Name> <gen1578_Maybe> rank => -3
                  | <table_Function_Derived_Table> <as_Maybe> <correlation_Name> <gen1581_Maybe> rank => -4
                  | <only_Spec> <gen1587_Maybe> rank => -5
                  | <left_Paren> <joined_Table> <right_Paren> rank => -6
<only_Spec> ::= <ONLY> <left_Paren> <table_Or_Query_Name> <right_Paren> rank => 0
<lateral_Derived_Table> ::= <LATERAL> <table_Subquery> rank => 0
<Gen1599> ::= <WITH> <ORDINALITY> rank => 0
<gen1599_Maybe> ::= <Gen1599> rank => 0
<gen1599_Maybe> ::= rank => -1
<collection_Derived_Table> ::= <UNNEST> <left_Paren> <collection_Value_Expression> <right_Paren> <gen1599_Maybe> rank => 0
<table_Function_Derived_Table> ::= <TABLE> <left_Paren> <collection_Value_Expression> <right_Paren> rank => 0
<derived_Table> ::= <table_Subquery> rank => 0
<table_Or_Query_Name> ::= <table_Name> rank => 0
                        | <query_Name> rank => -1
<derived_Column_List> ::= <column_Name_List> rank => 0
<Gen1608> ::= <comma> <column_Name> rank => 0
<gen1608_Any> ::= <Gen1608>* rank => 0
<column_Name_List> ::= <column_Name> <gen1608_Any> rank => 0
<joined_Table> ::= <cross_Join> rank => 0
                 | <qualified_Join> rank => -1
                 | <natural_Join> rank => -2
                 | <union_Join> rank => -3
<cross_Join> ::= <table_Reference> <CROSS> <JOIN> <table_Primary> rank => 0
<join_Type_Maybe> ::= <join_Type> rank => 0
<join_Type_Maybe> ::= rank => -1
<qualified_Join> ::= <table_Reference> <join_Type_Maybe> <JOIN> <table_Reference> <join_Specification> rank => 0
<natural_Join> ::= <table_Reference> <NATURAL> <join_Type_Maybe> <JOIN> <table_Primary> rank => 0
<union_Join> ::= <table_Reference> <UNION> <JOIN> <table_Primary> rank => 0
<join_Specification> ::= <join_Condition> rank => 0
                       | <named_Columns_Join> rank => -1
<join_Condition> ::= <ON> <search_Condition> rank => 0
<named_Columns_Join> ::= <USING> <left_Paren> <join_Column_List> <right_Paren> rank => 0
<outer_Maybe> ::= <OUTER> rank => 0
<outer_Maybe> ::= rank => -1
<join_Type> ::= <INNER> rank => 0
              | <outer_Join_Type> <outer_Maybe> rank => -1
<outer_Join_Type> ::= <LEFT> rank => 0
                    | <RIGHT> rank => -1
                    | <FULL> rank => -2
<join_Column_List> ::= <column_Name_List> rank => 0
<where_Clause> ::= <WHERE> <search_Condition> rank => 0
<set_Quantifier_Maybe> ::= <set_Quantifier> rank => 0
<set_Quantifier_Maybe> ::= rank => -1
<group_By_Clause> ::= <GROUP> <BY> <set_Quantifier_Maybe> <grouping_Element_List> rank => 0
<Gen1637> ::= <comma> <grouping_Element> rank => 0
<gen1637_Any> ::= <Gen1637>* rank => 0
<grouping_Element_List> ::= <grouping_Element> <gen1637_Any> rank => 0
<grouping_Element> ::= <ordinary_Grouping_Set> rank => 0
                     | <rollup_List> rank => -1
                     | <cube_List> rank => -2
                     | <grouping_Sets_Specification> rank => -3
                     | <empty_Grouping_Set> rank => -4
<ordinary_Grouping_Set> ::= <grouping_Column_Reference> rank => 0
                          | <left_Paren> <grouping_Column_Reference_List> <right_Paren> rank => -1
<grouping_Column_Reference> ::= <column_Reference> <collate_Clause_Maybe> rank => 0
<Gen1648> ::= <comma> <grouping_Column_Reference> rank => 0
<gen1648_Any> ::= <Gen1648>* rank => 0
<grouping_Column_Reference_List> ::= <grouping_Column_Reference> <gen1648_Any> rank => 0
<rollup_List> ::= <ROLLUP> <left_Paren> <ordinary_Grouping_Set_List> <right_Paren> rank => 0
<Gen1652> ::= <comma> <ordinary_Grouping_Set> rank => 0
<gen1652_Any> ::= <Gen1652>* rank => 0
<ordinary_Grouping_Set_List> ::= <ordinary_Grouping_Set> <gen1652_Any> rank => 0
<cube_List> ::= <CUBE> <left_Paren> <ordinary_Grouping_Set_List> <right_Paren> rank => 0
<grouping_Sets_Specification> ::= <GROUPING> <SETS> <left_Paren> <grouping_Set_List> <right_Paren> rank => 0
<Gen1657> ::= <comma> <grouping_Set> rank => 0
<gen1657_Any> ::= <Gen1657>* rank => 0
<grouping_Set_List> ::= <grouping_Set> <gen1657_Any> rank => 0
<grouping_Set> ::= <ordinary_Grouping_Set> rank => 0
                 | <rollup_List> rank => -1
                 | <cube_List> rank => -2
                 | <grouping_Sets_Specification> rank => -3
                 | <empty_Grouping_Set> rank => -4
<empty_Grouping_Set> ::= <left_Paren> <right_Paren> rank => 0
<having_Clause> ::= <HAVING> <search_Condition> rank => 0
<window_Clause> ::= <WINDOW> <window_Definition_List> rank => 0
<Gen1668> ::= <comma> <window_Definition> rank => 0
<gen1668_Any> ::= <Gen1668>* rank => 0
<window_Definition_List> ::= <window_Definition> <gen1668_Any> rank => 0
<window_Definition> ::= <new_Window_Name> <AS> <window_Specification> rank => 0
<new_Window_Name> ::= <window_Name> rank => 0
<window_Specification> ::= <left_Paren> <window_Specification_Details> <right_Paren> rank => 0
<existing_Window_Name_Maybe> ::= <existing_Window_Name> rank => 0
<existing_Window_Name_Maybe> ::= rank => -1
<window_Partition_Clause_Maybe> ::= <window_Partition_Clause> rank => 0
<window_Partition_Clause_Maybe> ::= rank => -1
<window_Order_Clause_Maybe> ::= <window_Order_Clause> rank => 0
<window_Order_Clause_Maybe> ::= rank => -1
<window_Frame_Clause_Maybe> ::= <window_Frame_Clause> rank => 0
<window_Frame_Clause_Maybe> ::= rank => -1
<window_Specification_Details> ::= <existing_Window_Name_Maybe> <window_Partition_Clause_Maybe> <window_Order_Clause_Maybe> <window_Frame_Clause_Maybe> rank => 0
<existing_Window_Name> ::= <window_Name> rank => 0
<window_Partition_Clause> ::= <PARTITION> <BY> <window_Partition_Column_Reference_List> rank => 0
<Gen1685> ::= <comma> <window_Partition_Column_Reference> rank => 0
<gen1685_Any> ::= <Gen1685>* rank => 0
<window_Partition_Column_Reference_List> ::= <window_Partition_Column_Reference> <gen1685_Any> rank => 0
<window_Partition_Column_Reference> ::= <column_Reference> <collate_Clause_Maybe> rank => 0
<window_Order_Clause> ::= <ORDER> <BY> <sort_Specification_List> rank => 0
<window_Frame_Exclusion_Maybe> ::= <window_Frame_Exclusion> rank => 0
<window_Frame_Exclusion_Maybe> ::= rank => -1
<window_Frame_Clause> ::= <window_Frame_Units> <window_Frame_Extent> <window_Frame_Exclusion_Maybe> rank => 0
<window_Frame_Units> ::= <ROWS> rank => 0
                       | <RANGE> rank => -1
<window_Frame_Extent> ::= <window_Frame_Start> rank => 0
                        | <window_Frame_Between> rank => -1
<window_Frame_Start> ::= <UNBOUNDED> <PRECEDING> rank => 0
                       | <window_Frame_Preceding> rank => -1
                       | <CURRENT> <ROW> rank => -2
<window_Frame_Preceding> ::= <unsigned_Value_Specification> <PRECEDING> rank => 0
<window_Frame_Between> ::= <BETWEEN> <window_Frame_Bound_1> <AND> <window_Frame_Bound_2> rank => 0
<window_Frame_Bound_1> ::= <window_Frame_Bound> rank => 0
<window_Frame_Bound_2> ::= <window_Frame_Bound> rank => 0
<window_Frame_Bound> ::= <window_Frame_Start> rank => 0
                       | <UNBOUNDED> <FOLLOWING> rank => -1
                       | <window_Frame_Following> rank => -2
<window_Frame_Following> ::= <unsigned_Value_Specification> <FOLLOWING> rank => 0
<window_Frame_Exclusion> ::= <EXCLUDE> <CURRENT> <ROW> rank => 0
                           | <EXCLUDE> <GROUP> rank => -1
                           | <EXCLUDE> <TIES> rank => -2
                           | <EXCLUDE> <NO> <OTHERS> rank => -3
<query_Specification> ::= <SELECT> <set_Quantifier_Maybe> <select_List> <table_Expression> rank => 0
<Gen1713> ::= <comma> <select_Sublist> rank => 0
<gen1713_Any> ::= <Gen1713>* rank => 0
<select_List> ::= <asterisk> rank => 0
                | <select_Sublist> <gen1713_Any> rank => -1
<select_Sublist> ::= <derived_Column> rank => 0
                   | <qualified_Asterisk> rank => -1
<qualified_Asterisk> ::= <asterisked_Identifier_Chain> <period> <asterisk> rank => 0
                       | <all_Fields_Reference> rank => -1
<Gen1721> ::= <period> <asterisked_Identifier> rank => 0
<gen1721_Any> ::= <Gen1721>* rank => 0
<asterisked_Identifier_Chain> ::= <asterisked_Identifier> <gen1721_Any> rank => 0
<asterisked_Identifier> ::= <identifier> rank => 0
<as_Clause_Maybe> ::= <as_Clause> rank => 0
<as_Clause_Maybe> ::= rank => -1
<derived_Column> ::= <value_Expression> <as_Clause_Maybe> rank => 0
<as_Clause> ::= <as_Maybe> <column_Name> rank => 0
<Gen1729> ::= <AS> <left_Paren> <all_Fields_Column_Name_List> <right_Paren> rank => 0
<gen1729_Maybe> ::= <Gen1729> rank => 0
<gen1729_Maybe> ::= rank => -1
<all_Fields_Reference> ::= <value_Expression_Primary> <period> <asterisk> <gen1729_Maybe> rank => 0
<all_Fields_Column_Name_List> ::= <column_Name_List> rank => 0
<with_Clause_Maybe> ::= <with_Clause> rank => 0
<with_Clause_Maybe> ::= rank => -1
<query_Expression> ::= <with_Clause_Maybe> <query_Expression_Body> rank => 0
<recursive_Maybe> ::= <RECURSIVE> rank => 0
<recursive_Maybe> ::= rank => -1
<with_Clause> ::= <WITH> <recursive_Maybe> <with_List> rank => 0
<Gen1740> ::= <comma> <with_List_Element> rank => 0
<gen1740_Any> ::= <Gen1740>* rank => 0
<with_List> ::= <with_List_Element> <gen1740_Any> rank => 0
<Gen1743> ::= <left_Paren> <with_Column_List> <right_Paren> rank => 0
<gen1743_Maybe> ::= <Gen1743> rank => 0
<gen1743_Maybe> ::= rank => -1
<search_Or_Cycle_Clause_Maybe> ::= <search_Or_Cycle_Clause> rank => 0
<search_Or_Cycle_Clause_Maybe> ::= rank => -1
<with_List_Element> ::= <query_Name> <gen1743_Maybe> <AS> <left_Paren> <query_Expression> <right_Paren> <search_Or_Cycle_Clause_Maybe> rank => 0
<with_Column_List> ::= <column_Name_List> rank => 0
<query_Expression_Body> ::= <non_Join_Query_Expression> rank => 0
                          | <joined_Table> rank => -1
<Gen1752> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<gen1752_Maybe> ::= <Gen1752> rank => 0
<gen1752_Maybe> ::= rank => -1
<corresponding_Spec_Maybe> ::= <corresponding_Spec> rank => 0
<corresponding_Spec_Maybe> ::= rank => -1
<Gen1758> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<gen1758_Maybe> ::= <Gen1758> rank => 0
<gen1758_Maybe> ::= rank => -1
<non_Join_Query_Expression> ::= <non_Join_Query_Term> rank => 0
                              | <query_Expression_Body> <UNION> <gen1752_Maybe> <corresponding_Spec_Maybe> <query_Term> rank => -1
                              | <query_Expression_Body> <EXCEPT> <gen1758_Maybe> <corresponding_Spec_Maybe> <query_Term> rank => -2
<query_Term> ::= <non_Join_Query_Term> rank => 0
               | <joined_Table> rank => -1
<Gen1767> ::= <ALL> rank => 0
            | <DISTINCT> rank => -1
<gen1767_Maybe> ::= <Gen1767> rank => 0
<gen1767_Maybe> ::= rank => -1
<non_Join_Query_Term> ::= <non_Join_Query_Primary> rank => 0
                        | <query_Term> <INTERSECT> <gen1767_Maybe> <corresponding_Spec_Maybe> <query_Primary> rank => -1
<query_Primary> ::= <non_Join_Query_Primary> rank => 0
                  | <joined_Table> rank => -1
<non_Join_Query_Primary> ::= <simple_Table> rank => 0
                           | <left_Paren> <non_Join_Query_Expression> <right_Paren> rank => -1
<simple_Table> ::= <query_Specification> rank => 0
                 | <table_Value_Constructor> rank => -1
                 | <explicit_Table> rank => -2
<explicit_Table> ::= <TABLE> <table_Or_Query_Name> rank => 0
<Gen1781> ::= <BY> <left_Paren> <corresponding_Column_List> <right_Paren> rank => 0
<gen1781_Maybe> ::= <Gen1781> rank => 0
<gen1781_Maybe> ::= rank => -1
<corresponding_Spec> ::= <CORRESPONDING> <gen1781_Maybe> rank => 0
<corresponding_Column_List> ::= <column_Name_List> rank => 0
<search_Or_Cycle_Clause> ::= <search_Clause> rank => 0
                           | <cycle_Clause> rank => -1
                           | <search_Clause> <cycle_Clause> rank => -2
<search_Clause> ::= <SEARCH> <recursive_Search_Order> <SET> <sequence_Column> rank => 0
<recursive_Search_Order> ::= <DEPTH> <FIRST> <BY> <sort_Specification_List> rank => 0
                           | <BREADTH> <FIRST> <BY> <sort_Specification_List> rank => -1
<sequence_Column> ::= <column_Name> rank => 0
<cycle_Clause> ::= <CYCLE> <cycle_Column_List> <SET> <cycle_Mark_Column> <TO> <cycle_Mark_Value> <DEFAULT> <non_Cycle_Mark_Value> <USING> <path_Column> rank => 0
<Gen1794> ::= <comma> <cycle_Column> rank => 0
<gen1794_Any> ::= <Gen1794>* rank => 0
<cycle_Column_List> ::= <cycle_Column> <gen1794_Any> rank => 0
<cycle_Column> ::= <column_Name> rank => 0
<cycle_Mark_Column> ::= <column_Name> rank => 0
<path_Column> ::= <column_Name> rank => 0
<cycle_Mark_Value> ::= <value_Expression> rank => 0
<non_Cycle_Mark_Value> ::= <value_Expression> rank => 0
<scalar_Subquery> ::= <subquery> rank => 0
<row_Subquery> ::= <subquery> rank => 0
<table_Subquery> ::= <subquery> rank => 0
<subquery> ::= <left_Paren> <query_Expression> <right_Paren> rank => 0
<predicate> ::= <comparison_Predicate> rank => 0
              | <between_Predicate> rank => -1
              | <in_Predicate> rank => -2
              | <like_Predicate> rank => -3
              | <similar_Predicate> rank => -4
              | <null_Predicate> rank => -5
              | <quantified_Comparison_Predicate> rank => -6
              | <exists_Predicate> rank => -7
              | <unique_Predicate> rank => -8
              | <normalized_Predicate> rank => -9
              | <match_Predicate> rank => -10
              | <overlaps_Predicate> rank => -11
              | <distinct_Predicate> rank => -12
              | <member_Predicate> rank => -13
              | <submultiset_Predicate> rank => -14
              | <set_Predicate> rank => -15
              | <type_Predicate> rank => -16
<comparison_Predicate> ::= <row_Value_Predicand> <comparison_Predicate_Part_2> rank => 0
<comparison_Predicate_Part_2> ::= <comp_Op> <row_Value_Predicand> rank => 0
<comp_Op> ::= <equals_Operator> rank => 0
            | <not_Equals_Operator> rank => -1
            | <less_Than_Operator> rank => -2
            | <greater_Than_Operator> rank => -3
            | <less_Than_Or_Equals_Operator> rank => -4
            | <greater_Than_Or_Equals_Operator> rank => -5
<between_Predicate> ::= <row_Value_Predicand> <between_Predicate_Part_2> rank => 0
<Gen1832> ::= <ASYMMETRIC> rank => 0
            | <SYMMETRIC> rank => -1
<gen1832_Maybe> ::= <Gen1832> rank => 0
<gen1832_Maybe> ::= rank => -1
<between_Predicate_Part_2> ::= <not_Maybe> <BETWEEN> <gen1832_Maybe> <row_Value_Predicand> <AND> <row_Value_Predicand> rank => 0
<in_Predicate> ::= <row_Value_Predicand> <in_Predicate_Part_2> rank => 0
<in_Predicate_Part_2> ::= <not_Maybe> <IN> <in_Predicate_Value> rank => 0
<in_Predicate_Value> ::= <table_Subquery> rank => 0
                       | <left_Paren> <in_Value_List> <right_Paren> rank => -1
<Gen1841> ::= <comma> <row_Value_Expression> rank => 0
<gen1841_Any> ::= <Gen1841>* rank => 0
<in_Value_List> ::= <row_Value_Expression> <gen1841_Any> rank => 0
<like_Predicate> ::= <character_Like_Predicate> rank => 0
                   | <octet_Like_Predicate> rank => -1
<character_Like_Predicate> ::= <row_Value_Predicand> <character_Like_Predicate_Part_2> rank => 0
<Gen1847> ::= <ESCAPE> <escape_Character> rank => 0
<gen1847_Maybe> ::= <Gen1847> rank => 0
<gen1847_Maybe> ::= rank => -1
<character_Like_Predicate_Part_2> ::= <not_Maybe> <LIKE> <character_Pattern> <gen1847_Maybe> rank => 0
<character_Pattern> ::= <character_Value_Expression> rank => 0
<escape_Character> ::= <character_Value_Expression> rank => 0
<octet_Like_Predicate> ::= <row_Value_Predicand> <octet_Like_Predicate_Part_2> rank => 0
<Gen1854> ::= <ESCAPE> <escape_Octet> rank => 0
<gen1854_Maybe> ::= <Gen1854> rank => 0
<gen1854_Maybe> ::= rank => -1
<octet_Like_Predicate_Part_2> ::= <not_Maybe> <LIKE> <octet_Pattern> <gen1854_Maybe> rank => 0
<octet_Pattern> ::= <blob_Value_Expression> rank => 0
<escape_Octet> ::= <blob_Value_Expression> rank => 0
<similar_Predicate> ::= <row_Value_Predicand> <similar_Predicate_Part_2> rank => 0
<Gen1861> ::= <ESCAPE> <escape_Character> rank => 0
<gen1861_Maybe> ::= <Gen1861> rank => 0
<gen1861_Maybe> ::= rank => -1
<similar_Predicate_Part_2> ::= <not_Maybe> <SIMILAR> <TO> <similar_Pattern> <gen1861_Maybe> rank => 0
<similar_Pattern> ::= <character_Value_Expression> rank => 0
<regular_Expression> ::= <regular_Term> rank => 0
                       | <regular_Expression> <vertical_Bar> <regular_Term> rank => -1
<regular_Term> ::= <regular_Factor> rank => 0
                 | <regular_Term> <regular_Factor> rank => -1
<regular_Factor> ::= <regular_Primary> rank => 0
                   | <regular_Primary> <asterisk> rank => -1
                   | <regular_Primary> <plus_Sign> rank => -2
                   | <regular_Primary> <question_Mark> rank => -3
                   | <regular_Primary> <repeat_Factor> rank => -4
<upper_Limit_Maybe> ::= <upper_Limit> rank => 0
<upper_Limit_Maybe> ::= rank => -1
<repeat_Factor> ::= <left_Brace> <low_Value> <upper_Limit_Maybe> <right_Brace> rank => 0
<high_Value_Maybe> ::= <high_Value> rank => 0
<high_Value_Maybe> ::= rank => -1
<upper_Limit> ::= <comma> <high_Value_Maybe> rank => 0
<low_Value> ::= <unsigned_Integer> rank => 0
<high_Value> ::= <unsigned_Integer> rank => 0
<regular_Primary> ::= <character_Specifier> rank => 0
                    | <percent> rank => -1
                    | <regular_Character_Set> rank => -2
                    | <left_Paren> <regular_Expression> <right_Paren> rank => -3
<character_Specifier> ::= <non_Escaped_Character> rank => 0
                        | <escaped_Character> rank => -1
<non_Escaped_Character> ::= <Lex561> rank => 0
<escaped_Character> ::= <Lex562> <Lex563> rank => 0
<character_Enumeration_Many> ::= <character_Enumeration>+ rank => 0
<character_Enumeration_Include_Many> ::= <character_Enumeration_Include>+ rank => 0
<character_Enumeration_Exclude_Many> ::= <character_Enumeration_Exclude>+ rank => 0
<regular_Character_Set> ::= <underscore> rank => 0
                          | <left_Bracket> <character_Enumeration_Many> <right_Bracket> rank => -1
                          | <left_Bracket> <circumflex> <character_Enumeration_Many> <right_Bracket> rank => -2
                          | <left_Bracket> <character_Enumeration_Include_Many> <circumflex> <character_Enumeration_Exclude_Many> <right_Bracket> rank => -3
<character_Enumeration_Include> ::= <character_Enumeration> rank => 0
<character_Enumeration_Exclude> ::= <character_Enumeration> rank => 0
<character_Enumeration> ::= <character_Specifier> rank => 0
                          | <character_Specifier> <minus_Sign> <character_Specifier> rank => -1
                          | <left_Bracket> <colon> <regular_Character_Set_Identifier> <colon> <right_Bracket> rank => -2
<regular_Character_Set_Identifier> ::= <identifier> rank => 0
<null_Predicate> ::= <row_Value_Predicand> <null_Predicate_Part_2> rank => 0
<null_Predicate_Part_2> ::= <IS> <not_Maybe> <NULL> rank => 0
<quantified_Comparison_Predicate> ::= <row_Value_Predicand> <quantified_Comparison_Predicate_Part_2> rank => 0
<quantified_Comparison_Predicate_Part_2> ::= <comp_Op> <quantifier> <table_Subquery> rank => 0
<quantifier> ::= <all> rank => 0
               | <some> rank => -1
<all> ::= <ALL> rank => 0
<some> ::= <SOME> rank => 0
         | <ANY> rank => -1
<exists_Predicate> ::= <EXISTS> <table_Subquery> rank => 0
<unique_Predicate> ::= <UNIQUE> <table_Subquery> rank => 0
<normalized_Predicate> ::= <string_Value_Expression> <IS> <not_Maybe> <NORMALIZED> rank => 0
<match_Predicate> ::= <row_Value_Predicand> <match_Predicate_Part_2> rank => 0
<unique_Maybe> ::= <UNIQUE> rank => 0
<unique_Maybe> ::= rank => -1
<Gen1919> ::= <SIMPLE> rank => 0
            | <PARTIAL> rank => -1
            | <FULL> rank => -2
<gen1919_Maybe> ::= <Gen1919> rank => 0
<gen1919_Maybe> ::= rank => -1
<match_Predicate_Part_2> ::= <MATCH> <unique_Maybe> <gen1919_Maybe> <table_Subquery> rank => 0
<overlaps_Predicate> ::= <overlaps_Predicate_Part_1> <overlaps_Predicate_Part_2> rank => 0
<overlaps_Predicate_Part_1> ::= <row_Value_Predicand_1> rank => 0
<overlaps_Predicate_Part_2> ::= <OVERLAPS> <row_Value_Predicand_2> rank => 0
<row_Value_Predicand_1> ::= <row_Value_Predicand> rank => 0
<row_Value_Predicand_2> ::= <row_Value_Predicand> rank => 0
<distinct_Predicate> ::= <row_Value_Predicand_3> <distinct_Predicate_Part_2> rank => 0
<distinct_Predicate_Part_2> ::= <IS> <DISTINCT> <FROM> <row_Value_Predicand_4> rank => 0
<row_Value_Predicand_3> ::= <row_Value_Predicand> rank => 0
<row_Value_Predicand_4> ::= <row_Value_Predicand> rank => 0
<member_Predicate> ::= <row_Value_Predicand> <member_Predicate_Part_2> rank => 0
<of_Maybe> ::= <OF> rank => 0
<of_Maybe> ::= rank => -1
<member_Predicate_Part_2> ::= <not_Maybe> <MEMBER> <of_Maybe> <multiset_Value_Expression> rank => 0
<submultiset_Predicate> ::= <row_Value_Predicand> <submultiset_Predicate_Part_2> rank => 0
<submultiset_Predicate_Part_2> ::= <not_Maybe> <SUBMULTISET> <of_Maybe> <multiset_Value_Expression> rank => 0
<set_Predicate> ::= <row_Value_Predicand> <set_Predicate_Part_2> rank => 0
<set_Predicate_Part_2> ::= <IS> <not_Maybe> <A> <SET> rank => 0
<type_Predicate> ::= <row_Value_Predicand> <type_Predicate_Part_2> rank => 0
<type_Predicate_Part_2> ::= <IS> <not_Maybe> <OF> <left_Paren> <type_List> <right_Paren> rank => 0
<Gen1944> ::= <comma> <user_Defined_Type_Specification> rank => 0
<gen1944_Any> ::= <Gen1944>* rank => 0
<type_List> ::= <user_Defined_Type_Specification> <gen1944_Any> rank => 0
<user_Defined_Type_Specification> ::= <inclusive_User_Defined_Type_Specification> rank => 0
                                    | <exclusive_User_Defined_Type_Specification> rank => -1
<inclusive_User_Defined_Type_Specification> ::= <path_Resolved_User_Defined_Type_Name> rank => 0
<exclusive_User_Defined_Type_Specification> ::= <ONLY> <path_Resolved_User_Defined_Type_Name> rank => 0
<search_Condition> ::= <boolean_Value_Expression> rank => 0
<interval_Qualifier> ::= <start_Field> <TO> <end_Field> rank => 0
                       | <single_Datetime_Field> rank => -1
<Gen1954> ::= <left_Paren> <interval_Leading_Field_Precision> <right_Paren> rank => 0
<gen1954_Maybe> ::= <Gen1954> rank => 0
<gen1954_Maybe> ::= rank => -1
<start_Field> ::= <non_Second_Primary_Datetime_Field> <gen1954_Maybe> rank => 0
<Gen1958> ::= <left_Paren> <interval_Fractional_Seconds_Precision> <right_Paren> rank => 0
<gen1958_Maybe> ::= <Gen1958> rank => 0
<gen1958_Maybe> ::= rank => -1
<end_Field> ::= <non_Second_Primary_Datetime_Field> rank => 0
              | <SECOND> <gen1958_Maybe> rank => -1
<Gen1963> ::= <left_Paren> <interval_Leading_Field_Precision> <right_Paren> rank => 0
<gen1963_Maybe> ::= <Gen1963> rank => 0
<gen1963_Maybe> ::= rank => -1
<Gen1966> ::= <comma> <interval_Fractional_Seconds_Precision> rank => 0
<gen1966_Maybe> ::= <Gen1966> rank => 0
<gen1966_Maybe> ::= rank => -1
<Gen1969> ::= <left_Paren> <interval_Leading_Field_Precision> <gen1966_Maybe> <right_Paren> rank => 0
<gen1969_Maybe> ::= <Gen1969> rank => 0
<gen1969_Maybe> ::= rank => -1
<single_Datetime_Field> ::= <non_Second_Primary_Datetime_Field> <gen1963_Maybe> rank => 0
                          | <SECOND> <gen1969_Maybe> rank => -1
<primary_Datetime_Field> ::= <non_Second_Primary_Datetime_Field> rank => 0
                           | <SECOND> rank => -1
<non_Second_Primary_Datetime_Field> ::= <YEAR> rank => 0
                                      | <MONTH> rank => -1
                                      | <DAY> rank => -2
                                      | <HOUR> rank => -3
                                      | <MINUTE> rank => -4
<interval_Fractional_Seconds_Precision> ::= <unsigned_Integer> rank => 0
<interval_Leading_Field_Precision> ::= <unsigned_Integer> rank => 0
<language_Clause> ::= <LANGUAGE> <language_Name> rank => 0
<language_Name> ::= <ADA> rank => 0
                  | <C> rank => -1
                  | <COBOL> rank => -2
                  | <FORTRAN> rank => -3
                  | <MUMPS> rank => -4
                  | <PASCAL> rank => -5
                  | <PLI> rank => -6
                  | <SQL> rank => -7
<path_Specification> ::= <PATH> <schema_Name_List> rank => 0
<Gen1993> ::= <comma> <schema_Name> rank => 0
<gen1993_Any> ::= <Gen1993>* rank => 0
<schema_Name_List> ::= <schema_Name> <gen1993_Any> rank => 0
<routine_Invocation> ::= <routine_Name> <SQL_Argument_List> rank => 0
<Gen1997> ::= <schema_Name> <period> rank => 0
<gen1997_Maybe> ::= <Gen1997> rank => 0
<gen1997_Maybe> ::= rank => -1
<routine_Name> ::= <gen1997_Maybe> <qualified_Identifier> rank => 0
<Gen2001> ::= <comma> <SQL_Argument> rank => 0
<gen2001_Any> ::= <Gen2001>* rank => 0
<Gen2003> ::= <SQL_Argument> <gen2001_Any> rank => 0
<gen2003_Maybe> ::= <Gen2003> rank => 0
<gen2003_Maybe> ::= rank => -1
<SQL_Argument_List> ::= <left_Paren> <gen2003_Maybe> <right_Paren> rank => 0
<SQL_Argument> ::= <value_Expression> rank => 0
                 | <generalized_Expression> rank => -1
                 | <target_Specification> rank => -2
<generalized_Expression> ::= <value_Expression> <AS> <path_Resolved_User_Defined_Type_Name> rank => 0
<character_Set_Specification> ::= <standard_Character_Set_Name> rank => 0
                                | <implementation_Defined_Character_Set_Name> rank => -1
                                | <user_Defined_Character_Set_Name> rank => -2
<standard_Character_Set_Name> ::= <character_Set_Name> rank => 0
<implementation_Defined_Character_Set_Name> ::= <character_Set_Name> rank => 0
<user_Defined_Character_Set_Name> ::= <character_Set_Name> rank => 0
<Gen2017> ::= <FOR> <schema_Resolved_User_Defined_Type_Name> rank => 0
<gen2017_Maybe> ::= <Gen2017> rank => 0
<gen2017_Maybe> ::= rank => -1
<specific_Routine_Designator> ::= <SPECIFIC> <routine_Type> <specific_Name> rank => 0
                                | <routine_Type> <member_Name> <gen2017_Maybe> rank => -1
<Gen2022> ::= <INSTANCE> rank => 0
            | <STATIC> rank => -1
            | <CONSTRUCTOR> rank => -2
<gen2022_Maybe> ::= <Gen2022> rank => 0
<gen2022_Maybe> ::= rank => -1
<routine_Type> ::= <ROUTINE> rank => 0
                 | <FUNCTION> rank => -1
                 | <PROCEDURE> rank => -2
                 | <gen2022_Maybe> <METHOD> rank => -3
<data_Type_List_Maybe> ::= <data_Type_List> rank => 0
<data_Type_List_Maybe> ::= rank => -1
<member_Name> ::= <member_Name_Alternatives> <data_Type_List_Maybe> rank => 0
<member_Name_Alternatives> ::= <schema_Qualified_Routine_Name> rank => 0
                             | <method_Name> rank => -1
<Gen2036> ::= <comma> <data_Type> rank => 0
<gen2036_Any> ::= <Gen2036>* rank => 0
<Gen2038> ::= <data_Type> <gen2036_Any> rank => 0
<gen2038_Maybe> ::= <Gen2038> rank => 0
<gen2038_Maybe> ::= rank => -1
<data_Type_List> ::= <left_Paren> <gen2038_Maybe> <right_Paren> rank => 0
<collate_Clause> ::= <COLLATE> <collation_Name> rank => 0
<constraint_Name_Definition> ::= <CONSTRAINT> <constraint_Name> rank => 0
<Gen2044> ::= <not_Maybe> <DEFERRABLE> rank => 0
<gen2044_Maybe> ::= <Gen2044> rank => 0
<gen2044_Maybe> ::= rank => -1
<constraint_Check_Time_Maybe> ::= <constraint_Check_Time> rank => 0
<constraint_Check_Time_Maybe> ::= rank => -1
<constraint_Characteristics> ::= <constraint_Check_Time> <gen2044_Maybe> rank => 0
                               | <not_Maybe> <DEFERRABLE> <constraint_Check_Time_Maybe> rank => -1
<constraint_Check_Time> ::= <INITIALLY> <DEFERRED> rank => 0
                          | <INITIALLY> <IMMEDIATE> rank => -1
<filter_Clause_Maybe> ::= <filter_Clause> rank => 0
<filter_Clause_Maybe> ::= rank => -1
<aggregate_Function> ::= <COUNT> <left_Paren> <asterisk> <right_Paren> <filter_Clause_Maybe> rank => 0
                       | <general_Set_Function> <filter_Clause_Maybe> rank => -1
                       | <binary_Set_Function> <filter_Clause_Maybe> rank => -2
                       | <ordered_Set_Function> <filter_Clause_Maybe> rank => -3
<general_Set_Function> ::= <set_Function_Type> <left_Paren> <set_Quantifier_Maybe> <value_Expression> <right_Paren> rank => 0
<set_Function_Type> ::= <computational_Operation> rank => 0
<computational_Operation> ::= <AVG> rank => 0
                            | <MAX> rank => -1
                            | <MIN> rank => -2
                            | <SUM> rank => -3
                            | <EVERY> rank => -4
                            | <ANY> rank => -5
                            | <SOME> rank => -6
                            | <COUNT> rank => -7
                            | <STDDEV_POP> rank => -8
                            | <STDDEV_SAMP> rank => -9
                            | <VAR_SAMP> rank => -10
                            | <VAR_POP> rank => -11
                            | <COLLECT> rank => -12
                            | <FUSION> rank => -13
                            | <INTERSECTION> rank => -14
<set_Quantifier> ::= <DISTINCT> rank => 0
                   | <ALL> rank => -1
<filter_Clause> ::= <FILTER> <left_Paren> <WHERE> <search_Condition> <right_Paren> rank => 0
<binary_Set_Function> ::= <binary_Set_Function_Type> <left_Paren> <dependent_Variable_Expression> <comma> <independent_Variable_Expression> <right_Paren> rank => 0
<binary_Set_Function_Type> ::= <COVAR_POP> rank => 0
                             | <COVAR_SAMP> rank => -1
                             | <CORR> rank => -2
                             | <REGR_SLOPE> rank => -3
                             | <REGR_INTERCEPT> rank => -4
                             | <REGR_COUNT> rank => -5
                             | <Lex469> rank => -6
                             | <REGR_AVGX> rank => -7
                             | <REGR_AVGY> rank => -8
                             | <REGR_SXX> rank => -9
                             | <REGR_SYY> rank => -10
                             | <REGR_SXY> rank => -11
<dependent_Variable_Expression> ::= <numeric_Value_Expression> rank => 0
<independent_Variable_Expression> ::= <numeric_Value_Expression> rank => 0
<ordered_Set_Function> ::= <hypothetical_Set_Function> rank => 0
                         | <inverse_Distribution_Function> rank => -1
<hypothetical_Set_Function> ::= <rank_Function_Type> <left_Paren> <hypothetical_Set_Function_Value_Expression_List> <right_Paren> <within_Group_Specification> rank => 0
<within_Group_Specification> ::= <WITHIN> <GROUP> <left_Paren> <ORDER> <BY> <sort_Specification_List> <right_Paren> rank => 0
<Gen2098> ::= <comma> <value_Expression> rank => 0
<gen2098_Any> ::= <Gen2098>* rank => 0
<hypothetical_Set_Function_Value_Expression_List> ::= <value_Expression> <gen2098_Any> rank => 0
<inverse_Distribution_Function> ::= <inverse_Distribution_Function_Type> <left_Paren> <inverse_Distribution_Function_Argument> <right_Paren> <within_Group_Specification> rank => 0
<inverse_Distribution_Function_Argument> ::= <numeric_Value_Expression> rank => 0
<inverse_Distribution_Function_Type> ::= <PERCENTILE_CONT> rank => 0
                                       | <PERCENTILE_DISC> rank => -1
<Gen2105> ::= <comma> <sort_Specification> rank => 0
<gen2105_Any> ::= <Gen2105>* rank => 0
<sort_Specification_List> ::= <sort_Specification> <gen2105_Any> rank => 0
<ordering_Specification_Maybe> ::= <ordering_Specification> rank => 0
<ordering_Specification_Maybe> ::= rank => -1
<null_Ordering_Maybe> ::= <null_Ordering> rank => 0
<null_Ordering_Maybe> ::= rank => -1
<sort_Specification> ::= <sort_Key> <ordering_Specification_Maybe> <null_Ordering_Maybe> rank => 0
<sort_Key> ::= <value_Expression> rank => 0
<ordering_Specification> ::= <ASC> rank => 0
                           | <DESC> rank => -1
<null_Ordering> ::= <NULLS> <FIRST> rank => 0
                  | <NULLS> <LAST> rank => -1
<schema_Character_Set_Or_Path_Maybe> ::= <schema_Character_Set_Or_Path> rank => 0
<schema_Character_Set_Or_Path_Maybe> ::= rank => -1
<schema_Element_Any> ::= <schema_Element>* rank => 0
<schema_Definition> ::= <CREATE> <SCHEMA> <schema_Name_Clause> <schema_Character_Set_Or_Path_Maybe> <schema_Element_Any> rank => 0
<schema_Character_Set_Or_Path> ::= <schema_Character_Set_Specification> rank => 0
                                 | <schema_Path_Specification> rank => -1
                                 | <schema_Character_Set_Specification> <schema_Path_Specification> rank => -2
                                 | <schema_Path_Specification> <schema_Character_Set_Specification> rank => -3
<schema_Name_Clause> ::= <schema_Name> rank => 0
                       | <AUTHORIZATION> <schema_Authorization_Identifier> rank => -1
                       | <schema_Name> <AUTHORIZATION> <schema_Authorization_Identifier> rank => -2
<schema_Authorization_Identifier> ::= <authorization_Identifier> rank => 0
<schema_Character_Set_Specification> ::= <DEFAULT> <CHARACTER> <SET> <character_Set_Specification> rank => 0
<schema_Path_Specification> ::= <path_Specification> rank => 0
<schema_Element> ::= <table_Definition> rank => 0
                   | <view_Definition> rank => -1
                   | <domain_Definition> rank => -2
                   | <character_Set_Definition> rank => -3
                   | <collation_Definition> rank => -4
                   | <transliteration_Definition> rank => -5
                   | <assertion_Definition> rank => -6
                   | <trigger_Definition> rank => -7
                   | <user_Defined_Type_Definition> rank => -8
                   | <user_Defined_Cast_Definition> rank => -9
                   | <user_Defined_Ordering_Definition> rank => -10
                   | <transform_Definition> rank => -11
                   | <schema_Routine> rank => -12
                   | <sequence_Generator_Definition> rank => -13
                   | <grant_Statement> rank => -14
                   | <role_Definition> rank => -15
<drop_Schema_Statement> ::= <DROP> <SCHEMA> <schema_Name> <drop_Behavior> rank => 0
<drop_Behavior> ::= <CASCADE> rank => 0
                  | <RESTRICT> rank => -1
<table_Scope_Maybe> ::= <table_Scope> rank => 0
<table_Scope_Maybe> ::= rank => -1
<Gen2153> ::= <ON> <COMMIT> <table_Commit_Action> <ROWS> rank => 0
<gen2153_Maybe> ::= <Gen2153> rank => 0
<gen2153_Maybe> ::= rank => -1
<table_Definition> ::= <CREATE> <table_Scope_Maybe> <TABLE> <table_Name> <table_Contents_Source> <gen2153_Maybe> rank => 0
<subtable_Clause_Maybe> ::= <subtable_Clause> rank => 0
<subtable_Clause_Maybe> ::= rank => -1
<table_Element_List_Maybe> ::= <table_Element_List> rank => 0
<table_Element_List_Maybe> ::= rank => -1
<table_Contents_Source> ::= <table_Element_List> rank => 0
                          | <OF> <path_Resolved_User_Defined_Type_Name> <subtable_Clause_Maybe> <table_Element_List_Maybe> rank => -1
                          | <as_Subquery_Clause> rank => -2
<table_Scope> ::= <global_Or_Local> <TEMPORARY> rank => 0
<global_Or_Local> ::= <GLOBAL> rank => 0
                    | <LOCAL> rank => -1
<table_Commit_Action> ::= <PRESERVE> rank => 0
                        | <DELETE> rank => -1
<Gen2169> ::= <comma> <table_Element> rank => 0
<gen2169_Any> ::= <Gen2169>* rank => 0
<table_Element_List> ::= <left_Paren> <table_Element> <gen2169_Any> <right_Paren> rank => 0
<table_Element> ::= <column_Definition> rank => 0
                  | <table_Constraint_Definition> rank => -1
                  | <like_Clause> rank => -2
                  | <self_Referencing_Column_Specification> rank => -3
                  | <column_Options> rank => -4
<self_Referencing_Column_Specification> ::= <REF> <IS> <self_Referencing_Column_Name> <reference_Generation> rank => 0
<reference_Generation> ::= <SYSTEM> <GENERATED> rank => 0
                         | <USER> <GENERATED> rank => -1
                         | <DERIVED> rank => -2
<self_Referencing_Column_Name> ::= <column_Name> rank => 0
<column_Options> ::= <column_Name> <WITH> <OPTIONS> <column_Option_List> rank => 0
<default_Clause_Maybe> ::= <default_Clause> rank => 0
<default_Clause_Maybe> ::= rank => -1
<column_Constraint_Definition_Any> ::= <column_Constraint_Definition>* rank => 0
<column_Option_List> ::= <scope_Clause_Maybe> <default_Clause_Maybe> <column_Constraint_Definition_Any> rank => 0
<subtable_Clause> ::= <UNDER> <supertable_Clause> rank => 0
<supertable_Clause> ::= <supertable_Name> rank => 0
<supertable_Name> ::= <table_Name> rank => 0
<like_Options_Maybe> ::= <like_Options> rank => 0
<like_Options_Maybe> ::= rank => -1
<like_Clause> ::= <LIKE> <table_Name> <like_Options_Maybe> rank => 0
<like_Options> ::= <identity_Option> rank => 0
                 | <column_Default_Option> rank => -1
<identity_Option> ::= <INCLUDING> <IDENTITY> rank => 0
                    | <EXCLUDING> <IDENTITY> rank => -1
<column_Default_Option> ::= <INCLUDING> <DEFAULTS> rank => 0
                          | <EXCLUDING> <DEFAULTS> rank => -1
<Gen2199> ::= <left_Paren> <column_Name_List> <right_Paren> rank => 0
<gen2199_Maybe> ::= <Gen2199> rank => 0
<gen2199_Maybe> ::= rank => -1
<as_Subquery_Clause> ::= <gen2199_Maybe> <AS> <subquery> <with_Or_Without_Data> rank => 0
<with_Or_Without_Data> ::= <WITH> <NO> <DATA> rank => 0
                         | <WITH> <DATA> rank => -1
<Gen2205> ::= <data_Type> rank => 0
            | <domain_Name> rank => -1
<gen2205_Maybe> ::= <Gen2205> rank => 0
<gen2205_Maybe> ::= rank => -1
<Gen2209> ::= <default_Clause> rank => 0
            | <identity_Column_Specification> rank => -1
            | <generation_Clause> rank => -2
<gen2209_Maybe> ::= <Gen2209> rank => 0
<gen2209_Maybe> ::= rank => -1
<column_Definition> ::= <column_Name> <gen2205_Maybe> <reference_Scope_Check_Maybe> <gen2209_Maybe> <column_Constraint_Definition_Any> <collate_Clause_Maybe> rank => 0
<constraint_Name_Definition_Maybe> ::= <constraint_Name_Definition> rank => 0
<constraint_Name_Definition_Maybe> ::= rank => -1
<constraint_Characteristics_Maybe> ::= <constraint_Characteristics> rank => 0
<constraint_Characteristics_Maybe> ::= rank => -1
<column_Constraint_Definition> ::= <constraint_Name_Definition_Maybe> <column_Constraint> <constraint_Characteristics_Maybe> rank => 0
<column_Constraint> ::= <NOT> <NULL> rank => 0
                      | <unique_Specification> rank => -1
                      | <references_Specification> rank => -2
                      | <check_Constraint_Definition> rank => -3
<Gen2224> ::= <ON> <DELETE> <reference_Scope_Check_Action> rank => 0
<gen2224_Maybe> ::= <Gen2224> rank => 0
<gen2224_Maybe> ::= rank => -1
<reference_Scope_Check> ::= <REFERENCES> <ARE> <not_Maybe> <CHECKED> <gen2224_Maybe> rank => 0
<reference_Scope_Check_Action> ::= <referential_Action> rank => 0
<Gen2229> ::= <ALWAYS> rank => 0
            | <BY> <DEFAULT> rank => -1
<Gen2231> ::= <left_Paren> <common_Sequence_Generator_Options> <right_Paren> rank => 0
<gen2231_Maybe> ::= <Gen2231> rank => 0
<gen2231_Maybe> ::= rank => -1
<identity_Column_Specification> ::= <GENERATED> <Gen2229> <AS> <IDENTITY> <gen2231_Maybe> rank => 0
<generation_Clause> ::= <generation_Rule> <AS> <generation_Expression> rank => 0
<generation_Rule> ::= <GENERATED> <ALWAYS> rank => 0
<generation_Expression> ::= <left_Paren> <value_Expression> <right_Paren> rank => 0
<default_Clause> ::= <DEFAULT> <default_Option> rank => 0
<default_Option> ::= <literal> rank => 0
                   | <datetime_Value_Function> rank => -1
                   | <USER> rank => -2
                   | <CURRENT_USER> rank => -3
                   | <CURRENT_ROLE> rank => -4
                   | <SESSION_USER> rank => -5
                   | <SYSTEM_USER> rank => -6
                   | <CURRENT_PATH> rank => -7
                   | <implicitly_Typed_Value_Specification> rank => -8
<table_Constraint_Definition> ::= <constraint_Name_Definition_Maybe> <table_Constraint> <constraint_Characteristics_Maybe> rank => 0
<table_Constraint> ::= <unique_Constraint_Definition> rank => 0
                     | <referential_Constraint_Definition> rank => -1
                     | <check_Constraint_Definition> rank => -2
<Gen2252> ::= <VALUE> rank => 0
<unique_Constraint_Definition> ::= <unique_Specification> <left_Paren> <unique_Column_List> <right_Paren> rank => 0
                                 | <UNIQUE> <Gen2252> rank => -1
<unique_Specification> ::= <UNIQUE> rank => 0
                         | <PRIMARY> <KEY> rank => -1
<unique_Column_List> ::= <column_Name_List> rank => 0
<referential_Constraint_Definition> ::= <FOREIGN> <KEY> <left_Paren> <referencing_Columns> <right_Paren> <references_Specification> rank => 0
<Gen2259> ::= <MATCH> <match_Type> rank => 0
<gen2259_Maybe> ::= <Gen2259> rank => 0
<gen2259_Maybe> ::= rank => -1
<referential_Triggered_Action_Maybe> ::= <referential_Triggered_Action> rank => 0
<referential_Triggered_Action_Maybe> ::= rank => -1
<references_Specification> ::= <REFERENCES> <referenced_Table_And_Columns> <gen2259_Maybe> <referential_Triggered_Action_Maybe> rank => 0
<match_Type> ::= <FULL> rank => 0
               | <PARTIAL> rank => -1
               | <SIMPLE> rank => -2
<referencing_Columns> ::= <reference_Column_List> rank => 0
<Gen2269> ::= <left_Paren> <reference_Column_List> <right_Paren> rank => 0
<gen2269_Maybe> ::= <Gen2269> rank => 0
<gen2269_Maybe> ::= rank => -1
<referenced_Table_And_Columns> ::= <table_Name> <gen2269_Maybe> rank => 0
<reference_Column_List> ::= <column_Name_List> rank => 0
<delete_Rule_Maybe> ::= <delete_Rule> rank => 0
<delete_Rule_Maybe> ::= rank => -1
<update_Rule_Maybe> ::= <update_Rule> rank => 0
<update_Rule_Maybe> ::= rank => -1
<referential_Triggered_Action> ::= <update_Rule> <delete_Rule_Maybe> rank => 0
                                 | <delete_Rule> <update_Rule_Maybe> rank => -1
<update_Rule> ::= <ON> <UPDATE> <referential_Action> rank => 0
<delete_Rule> ::= <ON> <DELETE> <referential_Action> rank => 0
<referential_Action> ::= <CASCADE> rank => 0
                       | <SET> <NULL> rank => -1
                       | <SET> <DEFAULT> rank => -2
                       | <RESTRICT> rank => -3
                       | <NO> <ACTION> rank => -4
<check_Constraint_Definition> ::= <CHECK> <left_Paren> <search_Condition> <right_Paren> rank => 0
<alter_Table_Statement> ::= <ALTER> <TABLE> <table_Name> <alter_Table_Action> rank => 0
<alter_Table_Action> ::= <add_Column_Definition> rank => 0
                       | <alter_Column_Definition> rank => -1
                       | <drop_Column_Definition> rank => -2
                       | <add_Table_Constraint_Definition> rank => -3
                       | <drop_Table_Constraint_Definition> rank => -4
<column_Maybe> ::= <COLUMN> rank => 0
<column_Maybe> ::= rank => -1
<add_Column_Definition> ::= <ADD> <column_Maybe> <column_Definition> rank => 0
<alter_Column_Definition> ::= <ALTER> <column_Maybe> <column_Name> <alter_Column_Action> rank => 0
<alter_Column_Action> ::= <set_Column_Default_Clause> rank => 0
                        | <drop_Column_Default_Clause> rank => -1
                        | <add_Column_Scope_Clause> rank => -2
                        | <drop_Column_Scope_Clause> rank => -3
                        | <alter_Identity_Column_Specification> rank => -4
<set_Column_Default_Clause> ::= <SET> <default_Clause> rank => 0
<drop_Column_Default_Clause> ::= <DROP> <DEFAULT> rank => 0
<add_Column_Scope_Clause> ::= <ADD> <scope_Clause> rank => 0
<drop_Column_Scope_Clause> ::= <DROP> <SCOPE> <drop_Behavior> rank => 0
<alter_Identity_Column_Option_Many> ::= <alter_Identity_Column_Option>+ rank => 0
<alter_Identity_Column_Specification> ::= <alter_Identity_Column_Option_Many> rank => 0
<alter_Identity_Column_Option> ::= <alter_Sequence_Generator_Restart_Option> rank => 0
                                 | <SET> <basic_Sequence_Generator_Option> rank => -1
<drop_Column_Definition> ::= <DROP> <column_Maybe> <column_Name> <drop_Behavior> rank => 0
<add_Table_Constraint_Definition> ::= <ADD> <table_Constraint_Definition> rank => 0
<drop_Table_Constraint_Definition> ::= <DROP> <CONSTRAINT> <constraint_Name> <drop_Behavior> rank => 0
<drop_Table_Statement> ::= <DROP> <TABLE> <table_Name> <drop_Behavior> rank => 0
<levels_Clause_Maybe> ::= <levels_Clause> rank => 0
<levels_Clause_Maybe> ::= rank => -1
<Gen2317> ::= <WITH> <levels_Clause_Maybe> <CHECK> <OPTION> rank => 0
<gen2317_Maybe> ::= <Gen2317> rank => 0
<gen2317_Maybe> ::= rank => -1
<view_Definition> ::= <CREATE> <recursive_Maybe> <VIEW> <table_Name> <view_Specification> <AS> <query_Expression> <gen2317_Maybe> rank => 0
<view_Specification> ::= <regular_View_Specification> rank => 0
                       | <referenceable_View_Specification> rank => -1
<Gen2323> ::= <left_Paren> <view_Column_List> <right_Paren> rank => 0
<gen2323_Maybe> ::= <Gen2323> rank => 0
<gen2323_Maybe> ::= rank => -1
<regular_View_Specification> ::= <gen2323_Maybe> rank => 0
<subview_Clause_Maybe> ::= <subview_Clause> rank => 0
<subview_Clause_Maybe> ::= rank => -1
<view_Element_List_Maybe> ::= <view_Element_List> rank => 0
<view_Element_List_Maybe> ::= rank => -1
<referenceable_View_Specification> ::= <OF> <path_Resolved_User_Defined_Type_Name> <subview_Clause_Maybe> <view_Element_List_Maybe> rank => 0
<subview_Clause> ::= <UNDER> <table_Name> rank => 0
<Gen2333> ::= <comma> <view_Element> rank => 0
<gen2333_Any> ::= <Gen2333>* rank => 0
<view_Element_List> ::= <left_Paren> <view_Element> <gen2333_Any> <right_Paren> rank => 0
<view_Element> ::= <self_Referencing_Column_Specification> rank => 0
                 | <view_Column_Option> rank => -1
<view_Column_Option> ::= <column_Name> <WITH> <OPTIONS> <scope_Clause> rank => 0
<levels_Clause> ::= <CASCADED> rank => 0
                  | <LOCAL> rank => -1
<view_Column_List> ::= <column_Name_List> rank => 0
<drop_View_Statement> ::= <DROP> <VIEW> <table_Name> <drop_Behavior> rank => 0
<domain_Constraint_Any> ::= <domain_Constraint>* rank => 0
<domain_Definition> ::= <CREATE> <DOMAIN> <domain_Name> <as_Maybe> <data_Type> <default_Clause_Maybe> <domain_Constraint_Any> <collate_Clause_Maybe> rank => 0
<domain_Constraint> ::= <constraint_Name_Definition_Maybe> <check_Constraint_Definition> <constraint_Characteristics_Maybe> rank => 0
<alter_Domain_Statement> ::= <ALTER> <DOMAIN> <domain_Name> <alter_Domain_Action> rank => 0
<alter_Domain_Action> ::= <set_Domain_Default_Clause> rank => 0
                        | <drop_Domain_Default_Clause> rank => -1
                        | <add_Domain_Constraint_Definition> rank => -2
                        | <drop_Domain_Constraint_Definition> rank => -3
<set_Domain_Default_Clause> ::= <SET> <default_Clause> rank => 0
<drop_Domain_Default_Clause> ::= <DROP> <DEFAULT> rank => 0
<add_Domain_Constraint_Definition> ::= <ADD> <domain_Constraint> rank => 0
<drop_Domain_Constraint_Definition> ::= <DROP> <CONSTRAINT> <constraint_Name> rank => 0
<drop_Domain_Statement> ::= <DROP> <DOMAIN> <domain_Name> <drop_Behavior> rank => 0
<character_Set_Definition> ::= <CREATE> <CHARACTER> <SET> <character_Set_Name> <as_Maybe> <character_Set_Source> <collate_Clause_Maybe> rank => 0
<character_Set_Source> ::= <GET> <character_Set_Specification> rank => 0
<drop_Character_Set_Statement> ::= <DROP> <CHARACTER> <SET> <character_Set_Name> rank => 0
<pad_Characteristic_Maybe> ::= <pad_Characteristic> rank => 0
<pad_Characteristic_Maybe> ::= rank => -1
<collation_Definition> ::= <CREATE> <COLLATION> <collation_Name> <FOR> <character_Set_Specification> <FROM> <existing_Collation_Name> <pad_Characteristic_Maybe> rank => 0
<existing_Collation_Name> ::= <collation_Name> rank => 0
<pad_Characteristic> ::= <NO> <PAD> rank => 0
                       | <PAD> <SPACE> rank => -1
<drop_Collation_Statement> ::= <DROP> <COLLATION> <collation_Name> <drop_Behavior> rank => 0
<transliteration_Definition> ::= <CREATE> <TRANSLATION> <transliteration_Name> <FOR> <source_Character_Set_Specification> <TO> <target_Character_Set_Specification> <FROM> <transliteration_Source> rank => 0
<source_Character_Set_Specification> ::= <character_Set_Specification> rank => 0
<target_Character_Set_Specification> ::= <character_Set_Specification> rank => 0
<transliteration_Source> ::= <existing_Transliteration_Name> rank => 0
                           | <transliteration_Routine> rank => -1
<existing_Transliteration_Name> ::= <transliteration_Name> rank => 0
<transliteration_Routine> ::= <specific_Routine_Designator> rank => 0
<drop_Transliteration_Statement> ::= <DROP> <TRANSLATION> <transliteration_Name> rank => 0
<assertion_Definition> ::= <CREATE> <ASSERTION> <constraint_Name> <CHECK> <left_Paren> <search_Condition> <right_Paren> <constraint_Characteristics_Maybe> rank => 0
<drop_Assertion_Statement> ::= <DROP> <ASSERTION> <constraint_Name> rank => 0
<Gen2376> ::= <REFERENCING> <old_Or_New_Values_Alias_List> rank => 0
<gen2376_Maybe> ::= <Gen2376> rank => 0
<gen2376_Maybe> ::= rank => -1
<trigger_Definition> ::= <CREATE> <TRIGGER> <trigger_Name> <trigger_Action_Time> <trigger_Event> <ON> <table_Name> <gen2376_Maybe> <triggered_Action> rank => 0
<trigger_Action_Time> ::= <BEFORE> rank => 0
                        | <AFTER> rank => -1
<Gen2382> ::= <OF> <trigger_Column_List> rank => 0
<gen2382_Maybe> ::= <Gen2382> rank => 0
<gen2382_Maybe> ::= rank => -1
<trigger_Event> ::= <INSERT> rank => 0
                  | <DELETE> rank => -1
                  | <UPDATE> <gen2382_Maybe> rank => -2
<trigger_Column_List> ::= <column_Name_List> rank => 0
<Gen2389> ::= <ROW> rank => 0
            | <STATEMENT> rank => -1
<Gen2391> ::= <FOR> <EACH> <Gen2389> rank => 0
<gen2391_Maybe> ::= <Gen2391> rank => 0
<gen2391_Maybe> ::= rank => -1
<Gen2394> ::= <WHEN> <left_Paren> <search_Condition> <right_Paren> rank => 0
<gen2394_Maybe> ::= <Gen2394> rank => 0
<gen2394_Maybe> ::= rank => -1
<triggered_Action> ::= <gen2391_Maybe> <gen2394_Maybe> <triggered_SQL_Statement> rank => 0
<Gen2398> ::= <SQL_Procedure_Statement> <semicolon> rank => 0
<gen2398_Many> ::= <Gen2398>+ rank => 0
<triggered_SQL_Statement> ::= <SQL_Procedure_Statement> rank => 0
                            | <BEGIN> <ATOMIC> <gen2398_Many> <END> rank => -1
<old_Or_New_Values_Alias_Many> ::= <old_Or_New_Values_Alias>+ rank => 0
<old_Or_New_Values_Alias_List> ::= <old_Or_New_Values_Alias_Many> rank => 0
<row_Maybe> ::= <ROW> rank => 0
<row_Maybe> ::= rank => -1
<old_Or_New_Values_Alias> ::= <OLD> <row_Maybe> <as_Maybe> <old_Values_Correlation_Name> rank => 0
                            | <NEW> <row_Maybe> <as_Maybe> <new_Values_Correlation_Name> rank => -1
                            | <OLD> <TABLE> <as_Maybe> <old_Values_Table_Alias> rank => -2
                            | <NEW> <TABLE> <as_Maybe> <new_Values_Table_Alias> rank => -3
<old_Values_Table_Alias> ::= <identifier> rank => 0
<new_Values_Table_Alias> ::= <identifier> rank => 0
<old_Values_Correlation_Name> ::= <correlation_Name> rank => 0
<new_Values_Correlation_Name> ::= <correlation_Name> rank => 0
<drop_Trigger_Statement> ::= <DROP> <TRIGGER> <trigger_Name> rank => 0
<user_Defined_Type_Definition> ::= <CREATE> <TYPE> <user_Defined_Type_Body> rank => 0
<subtype_Clause_Maybe> ::= <subtype_Clause> rank => 0
<subtype_Clause_Maybe> ::= rank => -1
<Gen2418> ::= <AS> <representation> rank => 0
<gen2418_Maybe> ::= <Gen2418> rank => 0
<gen2418_Maybe> ::= rank => -1
<user_Defined_Type_Option_List_Maybe> ::= <user_Defined_Type_Option_List> rank => 0
<user_Defined_Type_Option_List_Maybe> ::= rank => -1
<method_Specification_List_Maybe> ::= <method_Specification_List> rank => 0
<method_Specification_List_Maybe> ::= rank => -1
<user_Defined_Type_Body> ::= <schema_Resolved_User_Defined_Type_Name> <subtype_Clause_Maybe> <gen2418_Maybe> <user_Defined_Type_Option_List_Maybe> <method_Specification_List_Maybe> rank => 0
<user_Defined_Type_Option_Any> ::= <user_Defined_Type_Option>* rank => 0
<user_Defined_Type_Option_List> ::= <user_Defined_Type_Option> <user_Defined_Type_Option_Any> rank => 0
<user_Defined_Type_Option> ::= <instantiable_Clause> rank => 0
                             | <finality> rank => -1
                             | <reference_Type_Specification> rank => -2
                             | <ref_Cast_Option> rank => -3
                             | <cast_Option> rank => -4
<subtype_Clause> ::= <UNDER> <supertype_Name> rank => 0
<supertype_Name> ::= <path_Resolved_User_Defined_Type_Name> rank => 0
<representation> ::= <predefined_Type> rank => 0
                   | <member_List> rank => -1
<Gen2437> ::= <comma> <member> rank => 0
<gen2437_Any> ::= <Gen2437>* rank => 0
<member_List> ::= <left_Paren> <member> <gen2437_Any> <right_Paren> rank => 0
<member> ::= <attribute_Definition> rank => 0
<instantiable_Clause> ::= <INSTANTIABLE> rank => 0
                        | <NOT> <INSTANTIABLE> rank => -1
<finality> ::= <FINAL> rank => 0
             | <NOT> <FINAL> rank => -1
<reference_Type_Specification> ::= <user_Defined_Representation> rank => 0
                                 | <derived_Representation> rank => -1
                                 | <system_Generated_Representation> rank => -2
<user_Defined_Representation> ::= <REF> <USING> <predefined_Type> rank => 0
<derived_Representation> ::= <REF> <FROM> <list_Of_Attributes> rank => 0
<system_Generated_Representation> ::= <REF> <IS> <SYSTEM> <GENERATED> rank => 0
<cast_To_Type_Maybe> ::= <cast_To_Type> rank => 0
<cast_To_Type_Maybe> ::= rank => -1
<ref_Cast_Option> ::= <cast_To_Ref> <cast_To_Type_Maybe> rank => 0
                    | <cast_To_Type> rank => -1
<cast_To_Ref> ::= <CAST> <left_Paren> <SOURCE> <AS> <REF> <right_Paren> <WITH> <cast_To_Ref_Identifier> rank => 0
<cast_To_Ref_Identifier> ::= <identifier> rank => 0
<cast_To_Type> ::= <CAST> <left_Paren> <REF> <AS> <SOURCE> <right_Paren> <WITH> <cast_To_Type_Identifier> rank => 0
<cast_To_Type_Identifier> ::= <identifier> rank => 0
<Gen2459> ::= <comma> <attribute_Name> rank => 0
<gen2459_Any> ::= <Gen2459>* rank => 0
<list_Of_Attributes> ::= <left_Paren> <attribute_Name> <gen2459_Any> <right_Paren> rank => 0
<cast_To_Distinct_Maybe> ::= <cast_To_Distinct> rank => 0
<cast_To_Distinct_Maybe> ::= rank => -1
<cast_Option> ::= <cast_To_Distinct_Maybe> <cast_To_Source> rank => 0
                | <cast_To_Source> rank => -1
<cast_To_Distinct> ::= <CAST> <left_Paren> <SOURCE> <AS> <DISTINCT> <right_Paren> <WITH> <cast_To_Distinct_Identifier> rank => 0
<cast_To_Distinct_Identifier> ::= <identifier> rank => 0
<cast_To_Source> ::= <CAST> <left_Paren> <DISTINCT> <AS> <SOURCE> <right_Paren> <WITH> <cast_To_Source_Identifier> rank => 0
<cast_To_Source_Identifier> ::= <identifier> rank => 0
<Gen2470> ::= <comma> <method_Specification> rank => 0
<gen2470_Any> ::= <Gen2470>* rank => 0
<method_Specification_List> ::= <method_Specification> <gen2470_Any> rank => 0
<method_Specification> ::= <original_Method_Specification> rank => 0
                         | <overriding_Method_Specification> rank => -1
<Gen2475> ::= <SELF> <AS> <RESULT> rank => 0
<gen2475_Maybe> ::= <Gen2475> rank => 0
<gen2475_Maybe> ::= rank => -1
<Gen2478> ::= <SELF> <AS> <LOCATOR> rank => 0
<gen2478_Maybe> ::= <Gen2478> rank => 0
<gen2478_Maybe> ::= rank => -1
<method_Characteristics_Maybe> ::= <method_Characteristics> rank => 0
<method_Characteristics_Maybe> ::= rank => -1
<original_Method_Specification> ::= <partial_Method_Specification> <gen2475_Maybe> <gen2478_Maybe> <method_Characteristics_Maybe> rank => 0
<overriding_Method_Specification> ::= <OVERRIDING> <partial_Method_Specification> rank => 0
<Gen2485> ::= <INSTANCE> rank => 0
            | <STATIC> rank => -1
            | <CONSTRUCTOR> rank => -2
<gen2485_Maybe> ::= <Gen2485> rank => 0
<gen2485_Maybe> ::= rank => -1
<Gen2490> ::= <SPECIFIC> <specific_Method_Name> rank => 0
<gen2490_Maybe> ::= <Gen2490> rank => 0
<gen2490_Maybe> ::= rank => -1
<partial_Method_Specification> ::= <gen2485_Maybe> <METHOD> <method_Name> <SQL_Parameter_Declaration_List> <returns_Clause> <gen2490_Maybe> rank => 0
<Gen2494> ::= <schema_Name> <period> rank => 0
<gen2494_Maybe> ::= <Gen2494> rank => 0
<gen2494_Maybe> ::= rank => -1
<specific_Method_Name> ::= <gen2494_Maybe> <qualified_Identifier> rank => 0
<method_Characteristic_Many> ::= <method_Characteristic>+ rank => 0
<method_Characteristics> ::= <method_Characteristic_Many> rank => 0
<method_Characteristic> ::= <language_Clause> rank => 0
                          | <parameter_Style_Clause> rank => -1
                          | <deterministic_Characteristic> rank => -2
                          | <SQL_Data_Access_Indication> rank => -3
                          | <null_Call_Clause> rank => -4
<attribute_Default_Maybe> ::= <attribute_Default> rank => 0
<attribute_Default_Maybe> ::= rank => -1
<attribute_Definition> ::= <attribute_Name> <data_Type> <reference_Scope_Check_Maybe> <attribute_Default_Maybe> <collate_Clause_Maybe> rank => 0
<attribute_Default> ::= <default_Clause> rank => 0
<alter_Type_Statement> ::= <ALTER> <TYPE> <schema_Resolved_User_Defined_Type_Name> <alter_Type_Action> rank => 0
<alter_Type_Action> ::= <add_Attribute_Definition> rank => 0
                      | <drop_Attribute_Definition> rank => -1
                      | <add_Original_Method_Specification> rank => -2
                      | <add_Overriding_Method_Specification> rank => -3
                      | <drop_Method_Specification> rank => -4
<add_Attribute_Definition> ::= <ADD> <ATTRIBUTE> <attribute_Definition> rank => 0
<drop_Attribute_Definition> ::= <DROP> <ATTRIBUTE> <attribute_Name> <RESTRICT> rank => 0
<add_Original_Method_Specification> ::= <ADD> <original_Method_Specification> rank => 0
<add_Overriding_Method_Specification> ::= <ADD> <overriding_Method_Specification> rank => 0
<drop_Method_Specification> ::= <DROP> <specific_Method_Specification_Designator> <RESTRICT> rank => 0
<Gen2520> ::= <INSTANCE> rank => 0
            | <STATIC> rank => -1
            | <CONSTRUCTOR> rank => -2
<gen2520_Maybe> ::= <Gen2520> rank => 0
<gen2520_Maybe> ::= rank => -1
<specific_Method_Specification_Designator> ::= <gen2520_Maybe> <METHOD> <method_Name> <data_Type_List> rank => 0
<drop_Data_Type_Statement> ::= <DROP> <TYPE> <schema_Resolved_User_Defined_Type_Name> <drop_Behavior> rank => 0
<SQL_Invoked_Routine> ::= <schema_Routine> rank => 0
<schema_Routine> ::= <schema_Procedure> rank => 0
                   | <schema_Function> rank => -1
<schema_Procedure> ::= <CREATE> <SQL_Invoked_Procedure> rank => 0
<schema_Function> ::= <CREATE> <SQL_Invoked_Function> rank => 0
<SQL_Invoked_Procedure> ::= <PROCEDURE> <schema_Qualified_Routine_Name> <SQL_Parameter_Declaration_List> <routine_Characteristics> <routine_Body> rank => 0
<Gen2533> ::= <function_Specification> rank => 0
            | <method_Specification_Designator> rank => -1
<SQL_Invoked_Function> ::= <Gen2533> <routine_Body> rank => 0
<Gen2536> ::= <comma> <SQL_Parameter_Declaration> rank => 0
<gen2536_Any> ::= <Gen2536>* rank => 0
<Gen2538> ::= <SQL_Parameter_Declaration> <gen2536_Any> rank => 0
<gen2538_Maybe> ::= <Gen2538> rank => 0
<gen2538_Maybe> ::= rank => -1
<SQL_Parameter_Declaration_List> ::= <left_Paren> <gen2538_Maybe> <right_Paren> rank => 0
<parameter_Mode_Maybe> ::= <parameter_Mode> rank => 0
<parameter_Mode_Maybe> ::= rank => -1
<SQL_Parameter_Name_Maybe> ::= <SQL_Parameter_Name> rank => 0
<SQL_Parameter_Name_Maybe> ::= rank => -1
<result_Maybe> ::= <RESULT> rank => 0
<result_Maybe> ::= rank => -1
<SQL_Parameter_Declaration> ::= <parameter_Mode_Maybe> <SQL_Parameter_Name_Maybe> <parameter_Type> <result_Maybe> rank => 0
<parameter_Mode> ::= <IN> rank => 0
                   | <OUT> rank => -1
                   | <INOUT> rank => -2
<locator_Indication_Maybe> ::= <locator_Indication> rank => 0
<locator_Indication_Maybe> ::= rank => -1
<parameter_Type> ::= <data_Type> <locator_Indication_Maybe> rank => 0
<locator_Indication> ::= <AS> <LOCATOR> rank => 0
<dispatch_Clause_Maybe> ::= <dispatch_Clause> rank => 0
<dispatch_Clause_Maybe> ::= rank => -1
<function_Specification> ::= <FUNCTION> <schema_Qualified_Routine_Name> <SQL_Parameter_Declaration_List> <returns_Clause> <routine_Characteristics> <dispatch_Clause_Maybe> rank => 0
<Gen2559> ::= <INSTANCE> rank => 0
            | <STATIC> rank => -1
            | <CONSTRUCTOR> rank => -2
<gen2559_Maybe> ::= <Gen2559> rank => 0
<gen2559_Maybe> ::= rank => -1
<returns_Clause_Maybe> ::= <returns_Clause> rank => 0
<returns_Clause_Maybe> ::= rank => -1
<method_Specification_Designator> ::= <SPECIFIC> <METHOD> <specific_Method_Name> rank => 0
                                    | <gen2559_Maybe> <METHOD> <method_Name> <SQL_Parameter_Declaration_List> <returns_Clause_Maybe> <FOR> <schema_Resolved_User_Defined_Type_Name> rank => -1
<routine_Characteristic_Any> ::= <routine_Characteristic>* rank => 0
<routine_Characteristics> ::= <routine_Characteristic_Any> rank => 0
<routine_Characteristic> ::= <language_Clause> rank => 0
                           | <parameter_Style_Clause> rank => -1
                           | <SPECIFIC> <specific_Name> rank => -2
                           | <deterministic_Characteristic> rank => -3
                           | <SQL_Data_Access_Indication> rank => -4
                           | <null_Call_Clause> rank => -5
                           | <dynamic_Result_Sets_Characteristic> rank => -6
                           | <savepoint_Level_Indication> rank => -7
<savepoint_Level_Indication> ::= <NEW> <SAVEPOINT> <LEVEL> rank => 0
                               | <OLD> <SAVEPOINT> <LEVEL> rank => -1
<dynamic_Result_Sets_Characteristic> ::= <DYNAMIC> <RESULT> <SETS> <maximum_Dynamic_Result_Sets> rank => 0
<parameter_Style_Clause> ::= <PARAMETER> <STYLE> <parameter_Style> rank => 0
<dispatch_Clause> ::= <STATIC> <DISPATCH> rank => 0
<returns_Clause> ::= <RETURNS> <returns_Type> rank => 0
<result_Cast_Maybe> ::= <result_Cast> rank => 0
<result_Cast_Maybe> ::= rank => -1
<returns_Type> ::= <returns_Data_Type> <result_Cast_Maybe> rank => 0
                 | <returns_Table_Type> rank => -1
<returns_Table_Type> ::= <TABLE> <table_Function_Column_List> rank => 0
<Gen2589> ::= <comma> <table_Function_Column_List_Element> rank => 0
<gen2589_Any> ::= <Gen2589>* rank => 0
<table_Function_Column_List> ::= <left_Paren> <table_Function_Column_List_Element> <gen2589_Any> <right_Paren> rank => 0
<table_Function_Column_List_Element> ::= <column_Name> <data_Type> rank => 0
<result_Cast> ::= <CAST> <FROM> <result_Cast_From_Type> rank => 0
<result_Cast_From_Type> ::= <data_Type> <locator_Indication_Maybe> rank => 0
<returns_Data_Type> ::= <data_Type> <locator_Indication_Maybe> rank => 0
<routine_Body> ::= <SQL_Routine_Spec> rank => 0
                 | <external_Body_Reference> rank => -1
<rights_Clause_Maybe> ::= <rights_Clause> rank => 0
<rights_Clause_Maybe> ::= rank => -1
<SQL_Routine_Spec> ::= <rights_Clause_Maybe> <SQL_Routine_Body> rank => 0
<rights_Clause> ::= <SQL> <SECURITY> <INVOKER> rank => 0
                  | <SQL> <SECURITY> <DEFINER> rank => -1
<SQL_Routine_Body> ::= <SQL_Procedure_Statement> rank => 0
<Gen2604> ::= <NAME> <external_Routine_Name> rank => 0
<gen2604_Maybe> ::= <Gen2604> rank => 0
<gen2604_Maybe> ::= rank => -1
<parameter_Style_Clause_Maybe> ::= <parameter_Style_Clause> rank => 0
<parameter_Style_Clause_Maybe> ::= rank => -1
<transform_Group_Specification_Maybe> ::= <transform_Group_Specification> rank => 0
<transform_Group_Specification_Maybe> ::= rank => -1
<external_Security_Clause_Maybe> ::= <external_Security_Clause> rank => 0
<external_Security_Clause_Maybe> ::= rank => -1
<external_Body_Reference> ::= <EXTERNAL> <gen2604_Maybe> <parameter_Style_Clause_Maybe> <transform_Group_Specification_Maybe> <external_Security_Clause_Maybe> rank => 0
<external_Security_Clause> ::= <EXTERNAL> <SECURITY> <DEFINER> rank => 0
                             | <EXTERNAL> <SECURITY> <INVOKER> rank => -1
                             | <EXTERNAL> <SECURITY> <IMPLEMENTATION> <DEFINED> rank => -2
<parameter_Style> ::= <SQL> rank => 0
                    | <GENERAL> rank => -1
<deterministic_Characteristic> ::= <DETERMINISTIC> rank => 0
                                 | <NOT> <DETERMINISTIC> rank => -1
<SQL_Data_Access_Indication> ::= <NO> <SQL> rank => 0
                               | <CONTAINS> <SQL> rank => -1
                               | <READS> <SQL> <DATA> rank => -2
                               | <MODIFIES> <SQL> <DATA> rank => -3
<null_Call_Clause> ::= <RETURNS> <NULL> <ON> <NULL> <INPUT> rank => 0
                     | <CALLED> <ON> <NULL> <INPUT> rank => -1
<maximum_Dynamic_Result_Sets> ::= <unsigned_Integer> rank => 0
<Gen2628> ::= <single_Group_Specification> rank => 0
            | <multiple_Group_Specification> rank => -1
<transform_Group_Specification> ::= <TRANSFORM> <GROUP> <Gen2628> rank => 0
<single_Group_Specification> ::= <group_Name> rank => 0
<Gen2632> ::= <comma> <group_Specification> rank => 0
<gen2632_Any> ::= <Gen2632>* rank => 0
<multiple_Group_Specification> ::= <group_Specification> <gen2632_Any> rank => 0
<group_Specification> ::= <group_Name> <FOR> <TYPE> <path_Resolved_User_Defined_Type_Name> rank => 0
<alter_Routine_Statement> ::= <ALTER> <specific_Routine_Designator> <alter_Routine_Characteristics> <alter_Routine_Behavior> rank => 0
<alter_Routine_Characteristic_Many> ::= <alter_Routine_Characteristic>+ rank => 0
<alter_Routine_Characteristics> ::= <alter_Routine_Characteristic_Many> rank => 0
<alter_Routine_Characteristic> ::= <language_Clause> rank => 0
                                 | <parameter_Style_Clause> rank => -1
                                 | <SQL_Data_Access_Indication> rank => -2
                                 | <null_Call_Clause> rank => -3
                                 | <dynamic_Result_Sets_Characteristic> rank => -4
                                 | <NAME> <external_Routine_Name> rank => -5
<alter_Routine_Behavior> ::= <RESTRICT> rank => 0
<drop_Routine_Statement> ::= <DROP> <specific_Routine_Designator> <drop_Behavior> rank => 0
<Gen2647> ::= <AS> <ASSIGNMENT> rank => 0
<gen2647_Maybe> ::= <Gen2647> rank => 0
<gen2647_Maybe> ::= rank => -1
<user_Defined_Cast_Definition> ::= <CREATE> <CAST> <left_Paren> <source_Data_Type> <AS> <target_Data_Type> <right_Paren> <WITH> <cast_Function> <gen2647_Maybe> rank => 0
<cast_Function> ::= <specific_Routine_Designator> rank => 0
<source_Data_Type> ::= <data_Type> rank => 0
<target_Data_Type> ::= <data_Type> rank => 0
<drop_User_Defined_Cast_Statement> ::= <DROP> <CAST> <left_Paren> <source_Data_Type> <AS> <target_Data_Type> <right_Paren> <drop_Behavior> rank => 0
<user_Defined_Ordering_Definition> ::= <CREATE> <ORDERING> <FOR> <schema_Resolved_User_Defined_Type_Name> <ordering_Form> rank => 0
<ordering_Form> ::= <equals_Ordering_Form> rank => 0
                  | <full_Ordering_Form> rank => -1
<equals_Ordering_Form> ::= <EQUALS> <ONLY> <BY> <ordering_Category> rank => 0
<full_Ordering_Form> ::= <ORDER> <FULL> <BY> <ordering_Category> rank => 0
<ordering_Category> ::= <relative_Category> rank => 0
                      | <map_Category> rank => -1
                      | <state_Category> rank => -2
<relative_Category> ::= <RELATIVE> <WITH> <relative_Function_Specification> rank => 0
<map_Category> ::= <MAP> <WITH> <map_Function_Specification> rank => 0
<specific_Name_Maybe> ::= <specific_Name> rank => 0
<specific_Name_Maybe> ::= rank => -1
<state_Category> ::= <STATE> <specific_Name_Maybe> rank => 0
<relative_Function_Specification> ::= <specific_Routine_Designator> rank => 0
<map_Function_Specification> ::= <specific_Routine_Designator> rank => 0
<drop_User_Defined_Ordering_Statement> ::= <DROP> <ORDERING> <FOR> <schema_Resolved_User_Defined_Type_Name> <drop_Behavior> rank => 0
<Gen2671> ::= <TRANSFORM> rank => 0
            | <TRANSFORMS> rank => -1
<transform_Group_Many> ::= <transform_Group>+ rank => 0
<transform_Definition> ::= <CREATE> <Gen2671> <FOR> <schema_Resolved_User_Defined_Type_Name> <transform_Group_Many> rank => 0
<transform_Group> ::= <group_Name> <left_Paren> <transform_Element_List> <right_Paren> rank => 0
<group_Name> ::= <identifier> rank => 0
<Gen2677> ::= <comma> <transform_Element> rank => 0
<gen2677_Maybe> ::= <Gen2677> rank => 0
<gen2677_Maybe> ::= rank => -1
<transform_Element_List> ::= <transform_Element> <gen2677_Maybe> rank => 0
<transform_Element> ::= <to_Sql> rank => 0
                      | <from_Sql> rank => -1
<to_Sql> ::= <TO> <SQL> <WITH> <to_Sql_Function> rank => 0
<from_Sql> ::= <FROM> <SQL> <WITH> <from_Sql_Function> rank => 0
<to_Sql_Function> ::= <specific_Routine_Designator> rank => 0
<from_Sql_Function> ::= <specific_Routine_Designator> rank => 0
<Gen2687> ::= <TRANSFORM> rank => 0
            | <TRANSFORMS> rank => -1
<alter_Group_Many> ::= <alter_Group>+ rank => 0
<alter_Transform_Statement> ::= <ALTER> <Gen2687> <FOR> <schema_Resolved_User_Defined_Type_Name> <alter_Group_Many> rank => 0
<alter_Group> ::= <group_Name> <left_Paren> <alter_Transform_Action_List> <right_Paren> rank => 0
<Gen2692> ::= <comma> <alter_Transform_Action> rank => 0
<gen2692_Any> ::= <Gen2692>* rank => 0
<alter_Transform_Action_List> ::= <alter_Transform_Action> <gen2692_Any> rank => 0
<alter_Transform_Action> ::= <add_Transform_Element_List> rank => 0
                           | <drop_Transform_Element_List> rank => -1
<add_Transform_Element_List> ::= <ADD> <left_Paren> <transform_Element_List> <right_Paren> rank => 0
<Gen2698> ::= <comma> <transform_Kind> rank => 0
<gen2698_Maybe> ::= <Gen2698> rank => 0
<gen2698_Maybe> ::= rank => -1
<drop_Transform_Element_List> ::= <DROP> <left_Paren> <transform_Kind> <gen2698_Maybe> <drop_Behavior> <right_Paren> rank => 0
<transform_Kind> ::= <TO> <SQL> rank => 0
                   | <FROM> <SQL> rank => -1
<Gen2704> ::= <TRANSFORM> rank => 0
            | <TRANSFORMS> rank => -1
<drop_Transform_Statement> ::= <DROP> <Gen2704> <transforms_To_Be_Dropped> <FOR> <schema_Resolved_User_Defined_Type_Name> <drop_Behavior> rank => 0
<transforms_To_Be_Dropped> ::= <ALL> rank => 0
                             | <transform_Group_Element> rank => -1
<transform_Group_Element> ::= <group_Name> rank => 0
<sequence_Generator_Options_Maybe> ::= <sequence_Generator_Options> rank => 0
<sequence_Generator_Options_Maybe> ::= rank => -1
<sequence_Generator_Definition> ::= <CREATE> <SEQUENCE> <sequence_Generator_Name> <sequence_Generator_Options_Maybe> rank => 0
<sequence_Generator_Option_Many> ::= <sequence_Generator_Option>+ rank => 0
<sequence_Generator_Options> ::= <sequence_Generator_Option_Many> rank => 0
<sequence_Generator_Option> ::= <sequence_Generator_Data_Type_Option> rank => 0
                              | <common_Sequence_Generator_Options> rank => -1
<common_Sequence_Generator_Option_Many> ::= <common_Sequence_Generator_Option>+ rank => 0
<common_Sequence_Generator_Options> ::= <common_Sequence_Generator_Option_Many> rank => 0
<common_Sequence_Generator_Option> ::= <sequence_Generator_Start_With_Option> rank => 0
                                     | <basic_Sequence_Generator_Option> rank => -1
<basic_Sequence_Generator_Option> ::= <sequence_Generator_Increment_By_Option> rank => 0
                                    | <sequence_Generator_Maxvalue_Option> rank => -1
                                    | <sequence_Generator_Minvalue_Option> rank => -2
                                    | <sequence_Generator_Cycle_Option> rank => -3
<sequence_Generator_Data_Type_Option> ::= <AS> <data_Type> rank => 0
<sequence_Generator_Start_With_Option> ::= <START> <WITH> <sequence_Generator_Start_Value> rank => 0
<sequence_Generator_Start_Value> ::= <signed_Numeric_Literal> rank => 0
<sequence_Generator_Increment_By_Option> ::= <INCREMENT> <BY> <sequence_Generator_Increment> rank => 0
<sequence_Generator_Increment> ::= <signed_Numeric_Literal> rank => 0
<sequence_Generator_Maxvalue_Option> ::= <MAXVALUE> <sequence_Generator_Max_Value> rank => 0
                                       | <NO> <MAXVALUE> rank => -1
<sequence_Generator_Max_Value> ::= <signed_Numeric_Literal> rank => 0
<sequence_Generator_Minvalue_Option> ::= <MINVALUE> <sequence_Generator_Min_Value> rank => 0
                                       | <NO> <MINVALUE> rank => -1
<sequence_Generator_Min_Value> ::= <signed_Numeric_Literal> rank => 0
<sequence_Generator_Cycle_Option> ::= <CYCLE> rank => 0
                                    | <NO> <CYCLE> rank => -1
<alter_Sequence_Generator_Statement> ::= <ALTER> <SEQUENCE> <sequence_Generator_Name> <alter_Sequence_Generator_Options> rank => 0
<alter_Sequence_Generator_Option_Many> ::= <alter_Sequence_Generator_Option>+ rank => 0
<alter_Sequence_Generator_Options> ::= <alter_Sequence_Generator_Option_Many> rank => 0
<alter_Sequence_Generator_Option> ::= <alter_Sequence_Generator_Restart_Option> rank => 0
                                    | <basic_Sequence_Generator_Option> rank => -1
<alter_Sequence_Generator_Restart_Option> ::= <RESTART> <WITH> <sequence_Generator_Restart_Value> rank => 0
<sequence_Generator_Restart_Value> ::= <signed_Numeric_Literal> rank => 0
<drop_Sequence_Generator_Statement> ::= <DROP> <SEQUENCE> <sequence_Generator_Name> <drop_Behavior> rank => 0
<grant_Statement> ::= <grant_Privilege_Statement> rank => 0
                    | <grant_Role_Statement> rank => -1
<Gen2748> ::= <comma> <grantee> rank => 0
<gen2748_Any> ::= <Gen2748>* rank => 0
<Gen2750> ::= <WITH> <HIERARCHY> <OPTION> rank => 0
<gen2750_Maybe> ::= <Gen2750> rank => 0
<gen2750_Maybe> ::= rank => -1
<Gen2753> ::= <WITH> <GRANT> <OPTION> rank => 0
<gen2753_Maybe> ::= <Gen2753> rank => 0
<gen2753_Maybe> ::= rank => -1
<Gen2756> ::= <GRANTED> <BY> <grantor> rank => 0
<gen2756_Maybe> ::= <Gen2756> rank => 0
<gen2756_Maybe> ::= rank => -1
<grant_Privilege_Statement> ::= <GRANT> <privileges> <TO> <grantee> <gen2748_Any> <gen2750_Maybe> <gen2753_Maybe> <gen2756_Maybe> rank => 0
<privileges> ::= <object_Privileges> <ON> <object_Name> rank => 0
<table_Maybe> ::= <TABLE> rank => 0
<table_Maybe> ::= rank => -1
<object_Name> ::= <table_Maybe> <table_Name> rank => 0
                | <DOMAIN> <domain_Name> rank => -1
                | <COLLATION> <collation_Name> rank => -2
                | <CHARACTER> <SET> <character_Set_Name> rank => -3
                | <TRANSLATION> <transliteration_Name> rank => -4
                | <TYPE> <schema_Resolved_User_Defined_Type_Name> rank => -5
                | <SEQUENCE> <sequence_Generator_Name> rank => -6
                | <specific_Routine_Designator> rank => -7
<Gen2771> ::= <comma> <action> rank => 0
<gen2771_Any> ::= <Gen2771>* rank => 0
<object_Privileges> ::= <ALL> <PRIVILEGES> rank => 0
                      | <action> <gen2771_Any> rank => -1
<Gen2775> ::= <left_Paren> <privilege_Column_List> <right_Paren> rank => 0
<gen2775_Maybe> ::= <Gen2775> rank => 0
<gen2775_Maybe> ::= rank => -1
<Gen2778> ::= <left_Paren> <privilege_Column_List> <right_Paren> rank => 0
<gen2778_Maybe> ::= <Gen2778> rank => 0
<gen2778_Maybe> ::= rank => -1
<Gen2781> ::= <left_Paren> <privilege_Column_List> <right_Paren> rank => 0
<gen2781_Maybe> ::= <Gen2781> rank => 0
<gen2781_Maybe> ::= rank => -1
<action> ::= <SELECT> rank => 0
           | <SELECT> <left_Paren> <privilege_Column_List> <right_Paren> rank => -1
           | <SELECT> <left_Paren> <privilege_Method_List> <right_Paren> rank => -2
           | <DELETE> rank => -3
           | <INSERT> <gen2775_Maybe> rank => -4
           | <UPDATE> <gen2778_Maybe> rank => -5
           | <REFERENCES> <gen2781_Maybe> rank => -6
           | <USAGE> rank => -7
           | <TRIGGER> rank => -8
           | <UNDER> rank => -9
           | <EXECUTE> rank => -10
<Gen2795> ::= <comma> <specific_Routine_Designator> rank => 0
<gen2795_Any> ::= <Gen2795>* rank => 0
<privilege_Method_List> ::= <specific_Routine_Designator> <gen2795_Any> rank => 0
<privilege_Column_List> ::= <column_Name_List> rank => 0
<grantee> ::= <PUBLIC> rank => 0
            | <authorization_Identifier> rank => -1
<grantor> ::= <CURRENT_USER> rank => 0
            | <CURRENT_ROLE> rank => -1
<Gen2803> ::= <WITH> <ADMIN> <grantor> rank => 0
<gen2803_Maybe> ::= <Gen2803> rank => 0
<gen2803_Maybe> ::= rank => -1
<role_Definition> ::= <CREATE> <ROLE> <role_Name> <gen2803_Maybe> rank => 0
<Gen2807> ::= <comma> <role_Granted> rank => 0
<gen2807_Any> ::= <Gen2807>* rank => 0
<Gen2809> ::= <comma> <grantee> rank => 0
<gen2809_Any> ::= <Gen2809>* rank => 0
<Gen2811> ::= <WITH> <ADMIN> <OPTION> rank => 0
<gen2811_Maybe> ::= <Gen2811> rank => 0
<gen2811_Maybe> ::= rank => -1
<Gen2814> ::= <GRANTED> <BY> <grantor> rank => 0
<gen2814_Maybe> ::= <Gen2814> rank => 0
<gen2814_Maybe> ::= rank => -1
<grant_Role_Statement> ::= <GRANT> <role_Granted> <gen2807_Any> <TO> <grantee> <gen2809_Any> <gen2811_Maybe> <gen2814_Maybe> rank => 0
<role_Granted> ::= <role_Name> rank => 0
<drop_Role_Statement> ::= <DROP> <ROLE> <role_Name> rank => 0
<revoke_Statement> ::= <revoke_Privilege_Statement> rank => 0
                     | <revoke_Role_Statement> rank => -1
<revoke_Option_Extension_Maybe> ::= <revoke_Option_Extension> rank => 0
<revoke_Option_Extension_Maybe> ::= rank => -1
<Gen2824> ::= <comma> <grantee> rank => 0
<gen2824_Any> ::= <Gen2824>* rank => 0
<Gen2826> ::= <GRANTED> <BY> <grantor> rank => 0
<gen2826_Maybe> ::= <Gen2826> rank => 0
<gen2826_Maybe> ::= rank => -1
<revoke_Privilege_Statement> ::= <REVOKE> <revoke_Option_Extension_Maybe> <privileges> <FROM> <grantee> <gen2824_Any> <gen2826_Maybe> <drop_Behavior> rank => 0
<revoke_Option_Extension> ::= <GRANT> <OPTION> <FOR> rank => 0
                            | <HIERARCHY> <OPTION> <FOR> rank => -1
<Gen2832> ::= <ADMIN> <OPTION> <FOR> rank => 0
<gen2832_Maybe> ::= <Gen2832> rank => 0
<gen2832_Maybe> ::= rank => -1
<Gen2835> ::= <comma> <role_Revoked> rank => 0
<gen2835_Any> ::= <Gen2835>* rank => 0
<Gen2837> ::= <comma> <grantee> rank => 0
<gen2837_Any> ::= <Gen2837>* rank => 0
<Gen2839> ::= <GRANTED> <BY> <grantor> rank => 0
<gen2839_Maybe> ::= <Gen2839> rank => 0
<gen2839_Maybe> ::= rank => -1
<revoke_Role_Statement> ::= <REVOKE> <gen2832_Maybe> <role_Revoked> <gen2835_Any> <FROM> <grantee> <gen2837_Any> <gen2839_Maybe> <drop_Behavior> rank => 0
<role_Revoked> ::= <role_Name> rank => 0
<module_Path_Specification_Maybe> ::= <module_Path_Specification> rank => 0
<module_Path_Specification_Maybe> ::= rank => -1
<module_Transform_Group_Specification_Maybe> ::= <module_Transform_Group_Specification> rank => 0
<module_Transform_Group_Specification_Maybe> ::= rank => -1
<module_Collations_Maybe> ::= <module_Collations> rank => 0
<module_Collations_Maybe> ::= rank => -1
<temporary_Table_Declaration_Any> ::= <temporary_Table_Declaration>* rank => 0
<module_Contents_Many> ::= <module_Contents>+ rank => 0
<SQL_Client_Module_Definition> ::= <module_Name_Clause> <language_Clause> <module_Authorization_Clause> <module_Path_Specification_Maybe> <module_Transform_Group_Specification_Maybe> <module_Collations_Maybe> <temporary_Table_Declaration_Any> <module_Contents_Many> rank => 0
<Gen2853> ::= <ONLY> rank => 0
            | <AND> <DYNAMIC> rank => -1
<Gen2855> ::= <FOR> <STATIC> <Gen2853> rank => 0
<gen2855_Maybe> ::= <Gen2855> rank => 0
<gen2855_Maybe> ::= rank => -1
<Gen2858> ::= <ONLY> rank => 0
            | <AND> <DYNAMIC> rank => -1
<Gen2860> ::= <FOR> <STATIC> <Gen2858> rank => 0
<gen2860_Maybe> ::= <Gen2860> rank => 0
<gen2860_Maybe> ::= rank => -1
<module_Authorization_Clause> ::= <SCHEMA> <schema_Name> rank => 0
                                | <AUTHORIZATION> <module_Authorization_Identifier> <gen2855_Maybe> rank => -1
                                | <SCHEMA> <schema_Name> <AUTHORIZATION> <module_Authorization_Identifier> <gen2860_Maybe> rank => -2
<module_Authorization_Identifier> ::= <authorization_Identifier> rank => 0
<module_Path_Specification> ::= <path_Specification> rank => 0
<module_Transform_Group_Specification> ::= <transform_Group_Specification> rank => 0
<module_Collation_Specification_Many> ::= <module_Collation_Specification>+ rank => 0
<module_Collations> ::= <module_Collation_Specification_Many> rank => 0
<Gen2871> ::= <FOR> <character_Set_Specification_List> rank => 0
<gen2871_Maybe> ::= <Gen2871> rank => 0
<gen2871_Maybe> ::= rank => -1
<module_Collation_Specification> ::= <COLLATION> <collation_Name> <gen2871_Maybe> rank => 0
<Gen2875> ::= <comma> <character_Set_Specification> rank => 0
<gen2875_Any> ::= <Gen2875>* rank => 0
<character_Set_Specification_List> ::= <character_Set_Specification> <gen2875_Any> rank => 0
<module_Contents> ::= <declare_Cursor> rank => 0
                    | <dynamic_Declare_Cursor> rank => -1
                    | <externally_Invoked_Procedure> rank => -2
<SQL_Client_Module_Name_Maybe> ::= <SQL_Client_Module_Name> rank => 0
<SQL_Client_Module_Name_Maybe> ::= rank => -1
<module_Character_Set_Specification_Maybe> ::= <module_Character_Set_Specification> rank => 0
<module_Character_Set_Specification_Maybe> ::= rank => -1
<module_Name_Clause> ::= <MODULE> <SQL_Client_Module_Name_Maybe> <module_Character_Set_Specification_Maybe> rank => 0
<module_Character_Set_Specification> ::= <NAMES> <ARE> <character_Set_Specification> rank => 0
<externally_Invoked_Procedure> ::= <PROCEDURE> <procedure_Name> <host_Parameter_Declaration_List> <semicolon> <SQL_Procedure_Statement> <semicolon> rank => 0
<Gen2888> ::= <comma> <host_Parameter_Declaration> rank => 0
<gen2888_Any> ::= <Gen2888>* rank => 0
<host_Parameter_Declaration_List> ::= <left_Paren> <host_Parameter_Declaration> <gen2888_Any> <right_Paren> rank => 0
<host_Parameter_Declaration> ::= <host_Parameter_Name> <host_Parameter_Data_Type> rank => 0
                               | <status_Parameter> rank => -1
<host_Parameter_Data_Type> ::= <data_Type> <locator_Indication_Maybe> rank => 0
<status_Parameter> ::= <SQLSTATE> rank => 0
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
<SQL_Schema_Definition_Statement> ::= <schema_Definition> rank => 0
                                    | <table_Definition> rank => -1
                                    | <view_Definition> rank => -2
                                    | <SQL_Invoked_Routine> rank => -3
                                    | <grant_Statement> rank => -4
                                    | <role_Definition> rank => -5
                                    | <domain_Definition> rank => -6
                                    | <character_Set_Definition> rank => -7
                                    | <collation_Definition> rank => -8
                                    | <transliteration_Definition> rank => -9
                                    | <assertion_Definition> rank => -10
                                    | <trigger_Definition> rank => -11
                                    | <user_Defined_Type_Definition> rank => -12
                                    | <user_Defined_Cast_Definition> rank => -13
                                    | <user_Defined_Ordering_Definition> rank => -14
                                    | <transform_Definition> rank => -15
                                    | <sequence_Generator_Definition> rank => -16
<SQL_Schema_Manipulation_Statement> ::= <drop_Schema_Statement> rank => 0
                                      | <alter_Table_Statement> rank => -1
                                      | <drop_Table_Statement> rank => -2
                                      | <drop_View_Statement> rank => -3
                                      | <alter_Routine_Statement> rank => -4
                                      | <drop_Routine_Statement> rank => -5
                                      | <drop_User_Defined_Cast_Statement> rank => -6
                                      | <revoke_Statement> rank => -7
                                      | <drop_Role_Statement> rank => -8
                                      | <alter_Domain_Statement> rank => -9
                                      | <drop_Domain_Statement> rank => -10
                                      | <drop_Character_Set_Statement> rank => -11
                                      | <drop_Collation_Statement> rank => -12
                                      | <drop_Transliteration_Statement> rank => -13
                                      | <drop_Assertion_Statement> rank => -14
                                      | <drop_Trigger_Statement> rank => -15
                                      | <alter_Type_Statement> rank => -16
                                      | <drop_Data_Type_Statement> rank => -17
                                      | <drop_User_Defined_Ordering_Statement> rank => -18
                                      | <alter_Transform_Statement> rank => -19
                                      | <drop_Transform_Statement> rank => -20
                                      | <alter_Sequence_Generator_Statement> rank => -21
                                      | <drop_Sequence_Generator_Statement> rank => -22
<SQL_Data_Statement> ::= <open_Statement> rank => 0
                       | <fetch_Statement> rank => -1
                       | <close_Statement> rank => -2
                       | <select_Statement_Single_Row> rank => -3
                       | <free_Locator_Statement> rank => -4
                       | <hold_Locator_Statement> rank => -5
                       | <SQL_Data_Change_Statement> rank => -6
<SQL_Data_Change_Statement> ::= <delete_Statement_Positioned> rank => 0
                              | <delete_Statement_Searched> rank => -1
                              | <insert_Statement> rank => -2
                              | <update_Statement_Positioned> rank => -3
                              | <update_Statement_Searched> rank => -4
                              | <merge_Statement> rank => -5
<SQL_Control_Statement> ::= <call_Statement> rank => 0
                          | <return_Statement> rank => -1
<SQL_Transaction_Statement> ::= <start_Transaction_Statement> rank => 0
                              | <set_Transaction_Statement> rank => -1
                              | <set_Constraints_Mode_Statement> rank => -2
                              | <savepoint_Statement> rank => -3
                              | <release_Savepoint_Statement> rank => -4
                              | <commit_Statement> rank => -5
                              | <rollback_Statement> rank => -6
<SQL_Connection_Statement> ::= <connect_Statement> rank => 0
                             | <set_Connection_Statement> rank => -1
                             | <disconnect_Statement> rank => -2
<SQL_Session_Statement> ::= <set_Session_User_Identifier_Statement> rank => 0
                          | <set_Role_Statement> rank => -1
                          | <set_Local_Time_Zone_Statement> rank => -2
                          | <set_Session_Characteristics_Statement> rank => -3
                          | <set_Catalog_Statement> rank => -4
                          | <set_Schema_Statement> rank => -5
                          | <set_Names_Statement> rank => -6
                          | <set_Path_Statement> rank => -7
                          | <set_Transform_Group_Statement> rank => -8
                          | <set_Session_Collation_Statement> rank => -9
<SQL_Diagnostics_Statement> ::= <get_Diagnostics_Statement> rank => 0
<SQL_Dynamic_Statement> ::= <system_Descriptor_Statement> rank => 0
                          | <prepare_Statement> rank => -1
                          | <deallocate_Prepared_Statement> rank => -2
                          | <describe_Statement> rank => -3
                          | <execute_Statement> rank => -4
                          | <execute_Immediate_Statement> rank => -5
                          | <SQL_Dynamic_Data_Statement> rank => -6
<SQL_Dynamic_Data_Statement> ::= <allocate_Cursor_Statement> rank => 0
                               | <dynamic_Open_Statement> rank => -1
                               | <dynamic_Fetch_Statement> rank => -2
                               | <dynamic_Close_Statement> rank => -3
                               | <dynamic_Delete_Statement_Positioned> rank => -4
                               | <dynamic_Update_Statement_Positioned> rank => -5
<system_Descriptor_Statement> ::= <allocate_Descriptor_Statement> rank => 0
                                | <deallocate_Descriptor_Statement> rank => -1
                                | <set_Descriptor_Statement> rank => -2
                                | <get_Descriptor_Statement> rank => -3
<cursor_Sensitivity_Maybe> ::= <cursor_Sensitivity> rank => 0
<cursor_Sensitivity_Maybe> ::= rank => -1
<cursor_Scrollability_Maybe> ::= <cursor_Scrollability> rank => 0
<cursor_Scrollability_Maybe> ::= rank => -1
<cursor_Holdability_Maybe> ::= <cursor_Holdability> rank => 0
<cursor_Holdability_Maybe> ::= rank => -1
<cursor_Returnability_Maybe> ::= <cursor_Returnability> rank => 0
<cursor_Returnability_Maybe> ::= rank => -1
<declare_Cursor> ::= <DECLARE> <cursor_Name> <cursor_Sensitivity_Maybe> <cursor_Scrollability_Maybe> <CURSOR> <cursor_Holdability_Maybe> <cursor_Returnability_Maybe> <FOR> <cursor_Specification> rank => 0
<cursor_Sensitivity> ::= <SENSITIVE> rank => 0
                       | <INSENSITIVE> rank => -1
                       | <ASENSITIVE> rank => -2
<cursor_Scrollability> ::= <SCROLL> rank => 0
                         | <NO> <SCROLL> rank => -1
<cursor_Holdability> ::= <WITH> <HOLD> rank => 0
                       | <WITHOUT> <HOLD> rank => -1
<cursor_Returnability> ::= <WITH> <RETURN> rank => 0
                         | <WITHOUT> <RETURN> rank => -1
<updatability_Clause_Maybe> ::= <updatability_Clause> rank => 0
<updatability_Clause_Maybe> ::= rank => -1
<cursor_Specification> ::= <query_Expression> <order_By_Clause_Maybe> <updatability_Clause_Maybe> rank => 0
<Gen3020> ::= <OF> <column_Name_List> rank => 0
<gen3020_Maybe> ::= <Gen3020> rank => 0
<gen3020_Maybe> ::= rank => -1
<Gen3023> ::= <READ> <ONLY> rank => 0
            | <UPDATE> <gen3020_Maybe> rank => -1
<updatability_Clause> ::= <FOR> <Gen3023> rank => 0
<order_By_Clause> ::= <ORDER> <BY> <sort_Specification_List> rank => 0
<open_Statement> ::= <OPEN> <cursor_Name> rank => 0
<fetch_Orientation_Maybe> ::= <fetch_Orientation> rank => 0
<fetch_Orientation_Maybe> ::= rank => -1
<Gen3030> ::= <fetch_Orientation_Maybe> <FROM> rank => 0
<gen3030_Maybe> ::= <Gen3030> rank => 0
<gen3030_Maybe> ::= rank => -1
<fetch_Statement> ::= <FETCH> <gen3030_Maybe> <cursor_Name> <INTO> <fetch_Target_List> rank => 0
<Gen3034> ::= <ABSOLUTE> rank => 0
            | <RELATIVE> rank => -1
<fetch_Orientation> ::= <NEXT> rank => 0
                      | <PRIOR> rank => -1
                      | <FIRST> rank => -2
                      | <LAST> rank => -3
                      | <Gen3034> <simple_Value_Specification> rank => -4
<Gen3041> ::= <comma> <target_Specification> rank => 0
<gen3041_Any> ::= <Gen3041>* rank => 0
<fetch_Target_List> ::= <target_Specification> <gen3041_Any> rank => 0
<close_Statement> ::= <CLOSE> <cursor_Name> rank => 0
<select_Statement_Single_Row> ::= <SELECT> <set_Quantifier_Maybe> <select_List> <INTO> <select_Target_List> <table_Expression> rank => 0
<Gen3046> ::= <comma> <target_Specification> rank => 0
<gen3046_Any> ::= <Gen3046>* rank => 0
<select_Target_List> ::= <target_Specification> <gen3046_Any> rank => 0
<delete_Statement_Positioned> ::= <DELETE> <FROM> <target_Table> <WHERE> <CURRENT> <OF> <cursor_Name> rank => 0
<target_Table> ::= <table_Name> rank => 0
                 | <ONLY> <left_Paren> <table_Name> <right_Paren> rank => -1
<Gen3052> ::= <WHERE> <search_Condition> rank => 0
<gen3052_Maybe> ::= <Gen3052> rank => 0
<gen3052_Maybe> ::= rank => -1
<delete_Statement_Searched> ::= <DELETE> <FROM> <target_Table> <gen3052_Maybe> rank => 0
<insert_Statement> ::= <INSERT> <INTO> <insertion_Target> <insert_Columns_And_Source> rank => 0
<insertion_Target> ::= <table_Name> rank => 0
<insert_Columns_And_Source> ::= <from_Subquery> rank => 0
                              | <from_Constructor> rank => -1
                              | <from_Default> rank => -2
<Gen3061> ::= <left_Paren> <insert_Column_List> <right_Paren> rank => 0
<gen3061_Maybe> ::= <Gen3061> rank => 0
<gen3061_Maybe> ::= rank => -1
<override_Clause_Maybe> ::= <override_Clause> rank => 0
<override_Clause_Maybe> ::= rank => -1
<from_Subquery> ::= <gen3061_Maybe> <override_Clause_Maybe> <query_Expression> rank => 0
<Gen3067> ::= <left_Paren> <insert_Column_List> <right_Paren> rank => 0
<gen3067_Maybe> ::= <Gen3067> rank => 0
<gen3067_Maybe> ::= rank => -1
<from_Constructor> ::= <gen3067_Maybe> <override_Clause_Maybe> <contextually_Typed_Table_Value_Constructor> rank => 0
<override_Clause> ::= <OVERRIDING> <USER> <VALUE> rank => 0
                    | <OVERRIDING> <SYSTEM> <VALUE> rank => -1
<from_Default> ::= <DEFAULT> <VALUES> rank => 0
<insert_Column_List> ::= <column_Name_List> rank => 0
<Gen3075> ::= <as_Maybe> <merge_Correlation_Name> rank => 0
<gen3075_Maybe> ::= <Gen3075> rank => 0
<gen3075_Maybe> ::= rank => -1
<merge_Statement> ::= <MERGE> <INTO> <target_Table> <gen3075_Maybe> <USING> <table_Reference> <ON> <search_Condition> <merge_Operation_Specification> rank => 0
<merge_Correlation_Name> ::= <correlation_Name> rank => 0
<merge_When_Clause_Many> ::= <merge_When_Clause>+ rank => 0
<merge_Operation_Specification> ::= <merge_When_Clause_Many> rank => 0
<merge_When_Clause> ::= <merge_When_Matched_Clause> rank => 0
                      | <merge_When_Not_Matched_Clause> rank => -1
<merge_When_Matched_Clause> ::= <WHEN> <MATCHED> <THEN> <merge_Update_Specification> rank => 0
<merge_When_Not_Matched_Clause> ::= <WHEN> <NOT> <MATCHED> <THEN> <merge_Insert_Specification> rank => 0
<merge_Update_Specification> ::= <UPDATE> <SET> <set_Clause_List> rank => 0
<Gen3087> ::= <left_Paren> <insert_Column_List> <right_Paren> rank => 0
<gen3087_Maybe> ::= <Gen3087> rank => 0
<gen3087_Maybe> ::= rank => -1
<merge_Insert_Specification> ::= <INSERT> <gen3087_Maybe> <override_Clause_Maybe> <VALUES> <merge_Insert_Value_List> rank => 0
<Gen3091> ::= <comma> <merge_Insert_Value_Element> rank => 0
<gen3091_Any> ::= <Gen3091>* rank => 0
<merge_Insert_Value_List> ::= <left_Paren> <merge_Insert_Value_Element> <gen3091_Any> <right_Paren> rank => 0
<merge_Insert_Value_Element> ::= <value_Expression> rank => 0
                               | <contextually_Typed_Value_Specification> rank => -1
<update_Statement_Positioned> ::= <UPDATE> <target_Table> <SET> <set_Clause_List> <WHERE> <CURRENT> <OF> <cursor_Name> rank => 0
<Gen3097> ::= <WHERE> <search_Condition> rank => 0
<gen3097_Maybe> ::= <Gen3097> rank => 0
<gen3097_Maybe> ::= rank => -1
<update_Statement_Searched> ::= <UPDATE> <target_Table> <SET> <set_Clause_List> <gen3097_Maybe> rank => 0
<Gen3101> ::= <comma> <set_Clause> rank => 0
<gen3101_Any> ::= <Gen3101>* rank => 0
<set_Clause_List> ::= <set_Clause> <gen3101_Any> rank => 0
<set_Clause> ::= <multiple_Column_Assignment> rank => 0
               | <set_Target> <equals_Operator> <update_Source> rank => -1
<set_Target> ::= <update_Target> rank => 0
               | <mutated_Set_Clause> rank => -1
<multiple_Column_Assignment> ::= <set_Target_List> <equals_Operator> <assigned_Row> rank => 0
<Gen3109> ::= <comma> <set_Target> rank => 0
<gen3109_Any> ::= <Gen3109>* rank => 0
<set_Target_List> ::= <left_Paren> <set_Target> <gen3109_Any> <right_Paren> rank => 0
<assigned_Row> ::= <contextually_Typed_Row_Value_Expression> rank => 0
<update_Target> ::= <object_Column> rank => 0
                  | <object_Column> <left_Bracket_Or_Trigraph> <simple_Value_Specification> <right_Bracket_Or_Trigraph> rank => -1
<object_Column> ::= <column_Name> rank => 0
<mutated_Set_Clause> ::= <mutated_Target> <period> <method_Name> rank => 0
<mutated_Target> ::= <object_Column> rank => 0
                   | <mutated_Set_Clause> rank => -1
<update_Source> ::= <value_Expression> rank => 0
                  | <contextually_Typed_Value_Specification> rank => -1
<Gen3121> ::= <ON> <COMMIT> <table_Commit_Action> <ROWS> rank => 0
<gen3121_Maybe> ::= <Gen3121> rank => 0
<gen3121_Maybe> ::= rank => -1
<temporary_Table_Declaration> ::= <DECLARE> <LOCAL> <TEMPORARY> <TABLE> <table_Name> <table_Element_List> <gen3121_Maybe> rank => 0
<Gen3125> ::= <comma> <locator_Reference> rank => 0
<gen3125_Any> ::= <Gen3125>* rank => 0
<free_Locator_Statement> ::= <FREE> <LOCATOR> <locator_Reference> <gen3125_Any> rank => 0
<locator_Reference> ::= <host_Parameter_Name> rank => 0
                      | <embedded_Variable_Name> rank => -1
<Gen3130> ::= <comma> <locator_Reference> rank => 0
<gen3130_Any> ::= <Gen3130>* rank => 0
<hold_Locator_Statement> ::= <HOLD> <LOCATOR> <locator_Reference> <gen3130_Any> rank => 0
<call_Statement> ::= <CALL> <routine_Invocation> rank => 0
<return_Statement> ::= <RETURN> <return_Value> rank => 0
<return_Value> ::= <value_Expression> rank => 0
                 | <NULL> rank => -1
<Gen3137> ::= <comma> <transaction_Mode> rank => 0
<gen3137_Any> ::= <Gen3137>* rank => 0
<Gen3139> ::= <transaction_Mode> <gen3137_Any> rank => 0
<gen3139_Maybe> ::= <Gen3139> rank => 0
<gen3139_Maybe> ::= rank => -1
<start_Transaction_Statement> ::= <START> <TRANSACTION> <gen3139_Maybe> rank => 0
<transaction_Mode> ::= <isolation_Level> rank => 0
                     | <transaction_Access_Mode> rank => -1
                     | <diagnostics_Size> rank => -2
<transaction_Access_Mode> ::= <READ> <ONLY> rank => 0
                            | <READ> <WRITE> rank => -1
<isolation_Level> ::= <ISOLATION> <LEVEL> <level_Of_Isolation> rank => 0
<level_Of_Isolation> ::= <READ> <UNCOMMITTED> rank => 0
                       | <READ> <COMMITTED> rank => -1
                       | <REPEATABLE> <READ> rank => -2
                       | <SERIALIZABLE> rank => -3
<diagnostics_Size> ::= <DIAGNOSTICS> <SIZE> <number_Of_Conditions> rank => 0
<number_Of_Conditions> ::= <simple_Value_Specification> rank => 0
<local_Maybe> ::= <LOCAL> rank => 0
<local_Maybe> ::= rank => -1
<set_Transaction_Statement> ::= <SET> <local_Maybe> <transaction_Characteristics> rank => 0
<Gen3158> ::= <comma> <transaction_Mode> rank => 0
<gen3158_Any> ::= <Gen3158>* rank => 0
<transaction_Characteristics> ::= <TRANSACTION> <transaction_Mode> <gen3158_Any> rank => 0
<Gen3161> ::= <DEFERRED> rank => 0
            | <IMMEDIATE> rank => -1
<set_Constraints_Mode_Statement> ::= <SET> <CONSTRAINTS> <constraint_Name_List> <Gen3161> rank => 0
<Gen3164> ::= <comma> <constraint_Name> rank => 0
<gen3164_Any> ::= <Gen3164>* rank => 0
<constraint_Name_List> ::= <ALL> rank => 0
                         | <constraint_Name> <gen3164_Any> rank => -1
<savepoint_Statement> ::= <SAVEPOINT> <savepoint_Specifier> rank => 0
<savepoint_Specifier> ::= <savepoint_Name> rank => 0
<release_Savepoint_Statement> ::= <RELEASE> <SAVEPOINT> <savepoint_Specifier> rank => 0
<work_Maybe> ::= <WORK> rank => 0
<work_Maybe> ::= rank => -1
<no_Maybe> ::= <NO> rank => 0
<no_Maybe> ::= rank => -1
<Gen3175> ::= <AND> <no_Maybe> <CHAIN> rank => 0
<gen3175_Maybe> ::= <Gen3175> rank => 0
<gen3175_Maybe> ::= rank => -1
<commit_Statement> ::= <COMMIT> <work_Maybe> <gen3175_Maybe> rank => 0
<Gen3179> ::= <AND> <no_Maybe> <CHAIN> rank => 0
<gen3179_Maybe> ::= <Gen3179> rank => 0
<gen3179_Maybe> ::= rank => -1
<savepoint_Clause_Maybe> ::= <savepoint_Clause> rank => 0
<savepoint_Clause_Maybe> ::= rank => -1
<rollback_Statement> ::= <ROLLBACK> <work_Maybe> <gen3179_Maybe> <savepoint_Clause_Maybe> rank => 0
<savepoint_Clause> ::= <TO> <SAVEPOINT> <savepoint_Specifier> rank => 0
<connect_Statement> ::= <CONNECT> <TO> <connection_Target> rank => 0
<Gen3187> ::= <AS> <connection_Name> rank => 0
<gen3187_Maybe> ::= <Gen3187> rank => 0
<gen3187_Maybe> ::= rank => -1
<Gen3190> ::= <USER> <connection_User_Name> rank => 0
<gen3190_Maybe> ::= <Gen3190> rank => 0
<gen3190_Maybe> ::= rank => -1
<connection_Target> ::= <sql_Server_Name> <gen3187_Maybe> <gen3190_Maybe> rank => 0
                      | <DEFAULT> rank => -1
<set_Connection_Statement> ::= <SET> <CONNECTION> <connection_Object> rank => 0
<connection_Object> ::= <DEFAULT> rank => 0
                      | <connection_Name> rank => -1
<disconnect_Statement> ::= <DISCONNECT> <disconnect_Object> rank => 0
<disconnect_Object> ::= <connection_Object> rank => 0
                      | <ALL> rank => -1
                      | <CURRENT> rank => -2
<set_Session_Characteristics_Statement> ::= <SET> <SESSION> <CHARACTERISTICS> <AS> <session_Characteristic_List> rank => 0
<Gen3203> ::= <comma> <session_Characteristic> rank => 0
<gen3203_Any> ::= <Gen3203>* rank => 0
<session_Characteristic_List> ::= <session_Characteristic> <gen3203_Any> rank => 0
<session_Characteristic> ::= <transaction_Characteristics> rank => 0
<set_Session_User_Identifier_Statement> ::= <SET> <SESSION> <AUTHORIZATION> <value_Specification> rank => 0
<set_Role_Statement> ::= <SET> <ROLE> <role_Specification> rank => 0
<role_Specification> ::= <value_Specification> rank => 0
                       | <NONE> rank => -1
<set_Local_Time_Zone_Statement> ::= <SET> <TIME> <ZONE> <set_Time_Zone_Value> rank => 0
<set_Time_Zone_Value> ::= <interval_Value_Expression> rank => 0
                        | <LOCAL> rank => -1
<set_Catalog_Statement> ::= <SET> <catalog_Name_Characteristic> rank => 0
<catalog_Name_Characteristic> ::= <CATALOG> <value_Specification> rank => 0
<set_Schema_Statement> ::= <SET> <schema_Name_Characteristic> rank => 0
<schema_Name_Characteristic> ::= <SCHEMA> <value_Specification> rank => 0
<set_Names_Statement> ::= <SET> <character_Set_Name_Characteristic> rank => 0
<character_Set_Name_Characteristic> ::= <NAMES> <value_Specification> rank => 0
<set_Path_Statement> ::= <SET> <SQL_Path_Characteristic> rank => 0
<SQL_Path_Characteristic> ::= <PATH> <value_Specification> rank => 0
<set_Transform_Group_Statement> ::= <SET> <transform_Group_Characteristic> rank => 0
<transform_Group_Characteristic> ::= <DEFAULT> <TRANSFORM> <GROUP> <value_Specification> rank => 0
                                   | <TRANSFORM> <GROUP> <FOR> <TYPE> <path_Resolved_User_Defined_Type_Name> <value_Specification> rank => -1
<Gen3225> ::= <FOR> <character_Set_Specification_List> rank => 0
<gen3225_Maybe> ::= <Gen3225> rank => 0
<gen3225_Maybe> ::= rank => -1
<Gen3228> ::= <FOR> <character_Set_Specification_List> rank => 0
<gen3228_Maybe> ::= <Gen3228> rank => 0
<gen3228_Maybe> ::= rank => -1
<set_Session_Collation_Statement> ::= <SET> <COLLATION> <collation_Specification> <gen3225_Maybe> rank => 0
                                    | <SET> <NO> <COLLATION> <gen3228_Maybe> rank => -1
<Gen3233> ::= <comma> <character_Set_Specification> rank => 0
<gen3233_Any> ::= <Gen3233>* rank => 0
<character_Set_Specification_List> ::= <character_Set_Specification> <gen3233_Any> rank => -1
<collation_Specification> ::= <value_Specification> rank => 0
<SQL_Maybe> ::= <SQL> rank => 0
<SQL_Maybe> ::= rank => -1
<Gen3239> ::= <WITH> <MAX> <occurrences> rank => 0
<gen3239_Maybe> ::= <Gen3239> rank => 0
<gen3239_Maybe> ::= rank => -1
<allocate_Descriptor_Statement> ::= <ALLOCATE> <SQL_Maybe> <DESCRIPTOR> <descriptor_Name> <gen3239_Maybe> rank => 0
<occurrences> ::= <simple_Value_Specification> rank => 0
<deallocate_Descriptor_Statement> ::= <DEALLOCATE> <SQL_Maybe> <DESCRIPTOR> <descriptor_Name> rank => 0
<get_Descriptor_Statement> ::= <GET> <SQL_Maybe> <DESCRIPTOR> <descriptor_Name> <get_Descriptor_Information> rank => 0
<Gen3246> ::= <comma> <get_Header_Information> rank => 0
<gen3246_Any> ::= <Gen3246>* rank => 0
<Gen3248> ::= <comma> <get_Item_Information> rank => 0
<gen3248_Any> ::= <Gen3248>* rank => 0
<get_Descriptor_Information> ::= <get_Header_Information> <gen3246_Any> rank => 0
                               | <VALUE> <item_Number> <get_Item_Information> <gen3248_Any> rank => -1
<get_Header_Information> ::= <simple_Target_Specification_1> <equals_Operator> <header_Item_Name> rank => 0
<header_Item_Name> ::= <COUNT> rank => 0
                     | <KEY_TYPE> rank => -1
                     | <DYNAMIC_FUNCTION> rank => -2
                     | <DYNAMIC_FUNCTION_CODE> rank => -3
                     | <TOP_LEVEL_COUNT> rank => -4
<get_Item_Information> ::= <simple_Target_Specification_2> <equals_Operator> <descriptor_Item_Name> rank => 0
<item_Number> ::= <simple_Value_Specification> rank => 0
<simple_Target_Specification_1> ::= <simple_Target_Specification> rank => 0
<simple_Target_Specification_2> ::= <simple_Target_Specification> rank => 0
<descriptor_Item_Name> ::= <CARDINALITY> rank => 0
                         | <CHARACTER_SET_CATALOG> rank => -1
                         | <CHARACTER_SET_NAME> rank => -2
                         | <CHARACTER_SET_SCHEMA> rank => -3
                         | <COLLATION_CATALOG> rank => -4
                         | <COLLATION_NAME> rank => -5
                         | <COLLATION_SCHEMA> rank => -6
                         | <DATA> rank => -7
                         | <DATETIME_INTERVAL_CODE> rank => -8
                         | <DATETIME_INTERVAL_PRECISION> rank => -9
                         | <DEGREE> rank => -10
                         | <INDICATOR> rank => -11
                         | <KEY_MEMBER> rank => -12
                         | <LENGTH> rank => -13
                         | <LEVEL> rank => -14
                         | <NAME> rank => -15
                         | <NULLABLE> rank => -16
                         | <OCTET_LENGTH> rank => -17
                         | <PARAMETER_MODE> rank => -18
                         | <PARAMETER_ORDINAL_POSITION> rank => -19
                         | <PARAMETER_SPECIFIC_CATALOG> rank => -20
                         | <PARAMETER_SPECIFIC_NAME> rank => -21
                         | <PARAMETER_SPECIFIC_SCHEMA> rank => -22
                         | <PRECISION> rank => -23
                         | <RETURNED_CARDINALITY> rank => -24
                         | <RETURNED_LENGTH> rank => -25
                         | <RETURNED_OCTET_LENGTH> rank => -26
                         | <SCALE> rank => -27
                         | <SCOPE_CATALOG> rank => -28
                         | <SCOPE_NAME> rank => -29
                         | <SCOPE_SCHEMA> rank => -30
                         | <TYPE> rank => -31
                         | <UNNAMED> rank => -32
                         | <USER_DEFINED_TYPE_CATALOG> rank => -33
                         | <USER_DEFINED_TYPE_NAME> rank => -34
                         | <USER_DEFINED_TYPE_SCHEMA> rank => -35
                         | <USER_DEFINED_TYPE_CODE> rank => -36
<set_Descriptor_Statement> ::= <SET> <SQL_Maybe> <DESCRIPTOR> <descriptor_Name> <set_Descriptor_Information> rank => 0
<Gen3300> ::= <comma> <set_Header_Information> rank => 0
<gen3300_Any> ::= <Gen3300>* rank => 0
<Gen3302> ::= <comma> <set_Item_Information> rank => 0
<gen3302_Any> ::= <Gen3302>* rank => 0
<set_Descriptor_Information> ::= <set_Header_Information> <gen3300_Any> rank => 0
                               | <VALUE> <item_Number> <set_Item_Information> <gen3302_Any> rank => -1
<set_Header_Information> ::= <header_Item_Name> <equals_Operator> <simple_Value_Specification_1> rank => 0
<set_Item_Information> ::= <descriptor_Item_Name> <equals_Operator> <simple_Value_Specification_2> rank => 0
<simple_Value_Specification_1> ::= <simple_Value_Specification> rank => 0
<simple_Value_Specification_2> ::= <simple_Value_Specification> rank => 0
<attributes_Specification_Maybe> ::= <attributes_Specification> rank => 0
<attributes_Specification_Maybe> ::= rank => -1
<prepare_Statement> ::= <PREPARE> <SQL_Statement_Name> <attributes_Specification_Maybe> <FROM> <SQL_Statement_Variable> rank => 0
<attributes_Specification> ::= <ATTRIBUTES> <attributes_Variable> rank => 0
<attributes_Variable> ::= <simple_Value_Specification> rank => 0
<SQL_Statement_Variable> ::= <simple_Value_Specification> rank => 0
<preparable_Statement> ::= <preparable_SQL_Data_Statement> rank => 0
                         | <preparable_SQL_Schema_Statement> rank => -1
                         | <preparable_SQL_Transaction_Statement> rank => -2
                         | <preparable_SQL_Control_Statement> rank => -3
                         | <preparable_SQL_Session_Statement> rank => -4
<preparable_SQL_Data_Statement> ::= <delete_Statement_Searched> rank => 0
                                  | <dynamic_Single_Row_Select_Statement> rank => -1
                                  | <insert_Statement> rank => -2
                                  | <dynamic_Select_Statement> rank => -3
                                  | <update_Statement_Searched> rank => -4
                                  | <merge_Statement> rank => -5
                                  | <preparable_Dynamic_Delete_Statement_Positioned> rank => -6
                                  | <preparable_Dynamic_Update_Statement_Positioned> rank => -7
<preparable_SQL_Schema_Statement> ::= <SQL_Schema_Statement> rank => 0
<preparable_SQL_Transaction_Statement> ::= <SQL_Transaction_Statement> rank => 0
<preparable_SQL_Control_Statement> ::= <SQL_Control_Statement> rank => 0
<preparable_SQL_Session_Statement> ::= <SQL_Session_Statement> rank => 0
<dynamic_Select_Statement> ::= <cursor_Specification> rank => 0
<cursor_Attribute_Many> ::= <cursor_Attribute>+ rank => 0
<cursor_Attributes> ::= <cursor_Attribute_Many> rank => 0
<cursor_Attribute> ::= <cursor_Sensitivity> rank => 0
                     | <cursor_Scrollability> rank => -1
                     | <cursor_Holdability> rank => -2
                     | <cursor_Returnability> rank => -3
<deallocate_Prepared_Statement> ::= <DEALLOCATE> <PREPARE> <SQL_Statement_Name> rank => 0
<describe_Statement> ::= <describe_Input_Statement> rank => 0
                       | <describe_Output_Statement> rank => -1
<nesting_Option_Maybe> ::= <nesting_Option> rank => 0
<nesting_Option_Maybe> ::= rank => -1
<describe_Input_Statement> ::= <DESCRIBE> <INPUT> <SQL_Statement_Name> <using_Descriptor> <nesting_Option_Maybe> rank => 0
<output_Maybe> ::= <OUTPUT> rank => 0
<output_Maybe> ::= rank => -1
<describe_Output_Statement> ::= <DESCRIBE> <output_Maybe> <described_Object> <using_Descriptor> <nesting_Option_Maybe> rank => 0
<nesting_Option> ::= <WITH> <NESTING> rank => 0
                   | <WITHOUT> <NESTING> rank => -1
<using_Descriptor> ::= <USING> <SQL_Maybe> <DESCRIPTOR> <descriptor_Name> rank => 0
<described_Object> ::= <SQL_Statement_Name> rank => 0
                     | <CURSOR> <extended_Cursor_Name> <STRUCTURE> rank => -1
<input_Using_Clause> ::= <using_Arguments> rank => 0
                       | <using_Input_Descriptor> rank => -1
<Gen3356> ::= <comma> <using_Argument> rank => 0
<gen3356_Any> ::= <Gen3356>* rank => 0
<using_Arguments> ::= <USING> <using_Argument> <gen3356_Any> rank => 0
<using_Argument> ::= <general_Value_Specification> rank => 0
<using_Input_Descriptor> ::= <using_Descriptor> rank => 0
<output_Using_Clause> ::= <into_Arguments> rank => 0
                        | <into_Descriptor> rank => -1
<Gen3363> ::= <comma> <into_Argument> rank => 0
<gen3363_Any> ::= <Gen3363>* rank => 0
<into_Arguments> ::= <INTO> <into_Argument> <gen3363_Any> rank => 0
<into_Argument> ::= <target_Specification> rank => 0
<into_Descriptor> ::= <INTO> <SQL_Maybe> <DESCRIPTOR> <descriptor_Name> rank => 0
<result_Using_Clause_Maybe> ::= <result_Using_Clause> rank => 0
<result_Using_Clause_Maybe> ::= rank => -1
<parameter_Using_Clause_Maybe> ::= <parameter_Using_Clause> rank => 0
<parameter_Using_Clause_Maybe> ::= rank => -1
<execute_Statement> ::= <EXECUTE> <SQL_Statement_Name> <result_Using_Clause_Maybe> <parameter_Using_Clause_Maybe> rank => 0
<result_Using_Clause> ::= <output_Using_Clause> rank => 0
<parameter_Using_Clause> ::= <input_Using_Clause> rank => 0
<execute_Immediate_Statement> ::= <EXECUTE> <IMMEDIATE> <SQL_Statement_Variable> rank => 0
<dynamic_Declare_Cursor> ::= <DECLARE> <cursor_Name> <cursor_Sensitivity_Maybe> <cursor_Scrollability_Maybe> <CURSOR> <cursor_Holdability_Maybe> <cursor_Returnability_Maybe> <FOR> <statement_Name> rank => 0
<allocate_Cursor_Statement> ::= <ALLOCATE> <extended_Cursor_Name> <cursor_Intent> rank => 0
<cursor_Intent> ::= <statement_Cursor> rank => 0
                  | <result_Set_Cursor> rank => -1
<statement_Cursor> ::= <cursor_Sensitivity_Maybe> <cursor_Scrollability_Maybe> <CURSOR> <cursor_Holdability_Maybe> <cursor_Returnability_Maybe> <FOR> <extended_Statement_Name> rank => 0
<result_Set_Cursor> ::= <FOR> <PROCEDURE> <specific_Routine_Designator> rank => 0
<input_Using_Clause_Maybe> ::= <input_Using_Clause> rank => 0
<input_Using_Clause_Maybe> ::= rank => -1
<dynamic_Open_Statement> ::= <OPEN> <dynamic_Cursor_Name> <input_Using_Clause_Maybe> rank => 0
<Gen3385> ::= <fetch_Orientation_Maybe> <FROM> rank => 0
<gen3385_Maybe> ::= <Gen3385> rank => 0
<gen3385_Maybe> ::= rank => -1
<dynamic_Fetch_Statement> ::= <FETCH> <gen3385_Maybe> <dynamic_Cursor_Name> <output_Using_Clause> rank => 0
<dynamic_Single_Row_Select_Statement> ::= <query_Specification> rank => 0
<dynamic_Close_Statement> ::= <CLOSE> <dynamic_Cursor_Name> rank => 0
<dynamic_Delete_Statement_Positioned> ::= <DELETE> <FROM> <target_Table> <WHERE> <CURRENT> <OF> <dynamic_Cursor_Name> rank => 0
<dynamic_Update_Statement_Positioned> ::= <UPDATE> <target_Table> <SET> <set_Clause_List> <WHERE> <CURRENT> <OF> <dynamic_Cursor_Name> rank => 0
<Gen3393> ::= <FROM> <target_Table> rank => 0
<gen3393_Maybe> ::= <Gen3393> rank => 0
<gen3393_Maybe> ::= rank => -1
<preparable_Dynamic_Delete_Statement_Positioned> ::= <DELETE> <gen3393_Maybe> <WHERE> <CURRENT> <OF> <scope_Option_Maybe> <cursor_Name> rank => 0
<target_Table_Maybe> ::= <target_Table> rank => 0
<target_Table_Maybe> ::= rank => -1
<preparable_Dynamic_Update_Statement_Positioned> ::= <UPDATE> <target_Table_Maybe> <SET> <set_Clause_List> <WHERE> <CURRENT> <OF> <scope_Option_Maybe> <cursor_Name> rank => 0
<embedded_SQL_Host_Program> ::= <embedded_SQL_Ada_Program> rank => 0
                              | <embedded_SQL_C_Program> rank => -1
                              | <embedded_SQL_Cobol_Program> rank => -2
                              | <embedded_SQL_Fortran_Program> rank => -3
                              | <embedded_SQL_Mumps_Program> rank => -4
                              | <embedded_SQL_Pascal_Program> rank => -5
                              | <embedded_SQL_Pl_I_Program> rank => -6
<SQL_Terminator_Maybe> ::= <SQL_Terminator> rank => 0
<SQL_Terminator_Maybe> ::= rank => -1
<embedded_SQL_Statement> ::= <SQL_Prefix> <statement_Or_Declaration> <SQL_Terminator_Maybe> rank => 0
<statement_Or_Declaration> ::= <declare_Cursor> rank => 0
                             | <dynamic_Declare_Cursor> rank => -1
                             | <temporary_Table_Declaration> rank => -2
                             | <embedded_Authorization_Declaration> rank => -3
                             | <embedded_Path_Specification> rank => -4
                             | <embedded_Transform_Group_Specification> rank => -5
                             | <embedded_Collation_Specification> rank => -6
                             | <embedded_Exception_Declaration> rank => -7
                             | <SQL_Procedure_Statement> rank => -8
<SQL_Prefix> ::= <EXEC> <SQL> rank => 0
               | <ampersand> <SQL> <left_Paren> rank => -1
<SQL_Terminator> ::= <Lex371> rank => 0
                   | <semicolon> rank => -1
                   | <right_Paren> rank => -2
<embedded_Authorization_Declaration> ::= <DECLARE> <embedded_Authorization_Clause> rank => 0
<Gen3425> ::= <ONLY> rank => 0
            | <AND> <DYNAMIC> rank => -1
<Gen3427> ::= <FOR> <STATIC> <Gen3425> rank => 0
<gen3427_Maybe> ::= <Gen3427> rank => 0
<gen3427_Maybe> ::= rank => -1
<Gen3430> ::= <ONLY> rank => 0
            | <AND> <DYNAMIC> rank => -1
<Gen3432> ::= <FOR> <STATIC> <Gen3430> rank => 0
<gen3432_Maybe> ::= <Gen3432> rank => 0
<gen3432_Maybe> ::= rank => -1
<embedded_Authorization_Clause> ::= <SCHEMA> <schema_Name> rank => 0
                                  | <AUTHORIZATION> <embedded_Authorization_Identifier> <gen3427_Maybe> rank => -1
                                  | <SCHEMA> <schema_Name> <AUTHORIZATION> <embedded_Authorization_Identifier> <gen3432_Maybe> rank => -2
<embedded_Authorization_Identifier> ::= <module_Authorization_Identifier> rank => 0
<embedded_Path_Specification> ::= <path_Specification> rank => 0
<embedded_Transform_Group_Specification> ::= <transform_Group_Specification> rank => 0
<embedded_Collation_Specification> ::= <module_Collations> rank => 0
<embedded_Character_Set_Declaration_Maybe> ::= <embedded_Character_Set_Declaration> rank => 0
<embedded_Character_Set_Declaration_Maybe> ::= rank => -1
<host_Variable_Definition_Any> ::= <host_Variable_Definition>* rank => 0
<embedded_SQL_Declare_Section> ::= <embedded_SQL_Begin_Declare> <embedded_Character_Set_Declaration_Maybe> <host_Variable_Definition_Any> <embedded_SQL_End_Declare> rank => 0
                                 | <embedded_SQL_Mumps_Declare> rank => -1
<embedded_Character_Set_Declaration> ::= <SQL> <NAMES> <ARE> <character_Set_Specification> rank => 0
<embedded_SQL_Begin_Declare> ::= <SQL_Prefix> <BEGIN> <DECLARE> <SECTION> <SQL_Terminator_Maybe> rank => 0
<embedded_SQL_End_Declare> ::= <SQL_Prefix> <END> <DECLARE> <SECTION> <SQL_Terminator_Maybe> rank => 0
<embedded_SQL_Mumps_Declare> ::= <SQL_Prefix> <BEGIN> <DECLARE> <SECTION> <embedded_Character_Set_Declaration_Maybe> <host_Variable_Definition_Any> <END> <DECLARE> <SECTION> <SQL_Terminator> rank => 0
<host_Variable_Definition> ::= <ada_Variable_Definition> rank => 0
                             | <c_Variable_Definition> rank => -1
                             | <cobol_Variable_Definition> rank => -2
                             | <fortran_Variable_Definition> rank => -3
                             | <mumps_Variable_Definition> rank => -4
                             | <pascal_Variable_Definition> rank => -5
                             | <pl_I_Variable_Definition> rank => -6
<embedded_Variable_Name> ::= <colon> <host_Identifier> rank => 0
<host_Identifier> ::= <ada_Host_Identifier> rank => 0
                    | <c_Host_Identifier> rank => -1
                    | <cobol_Host_Identifier> rank => -2
                    | <fortran_Host_Identifier> rank => -3
                    | <mumps_Host_Identifier> rank => -4
                    | <pascal_Host_Identifier> rank => -5
                    | <pl_I_Host_Identifier> rank => -6
<embedded_Exception_Declaration> ::= <WHENEVER> <condition> <condition_Action> rank => 0
<condition> ::= <SQL_Condition> rank => 0
<Gen3468> ::= <comma> <sqlstate_Subclass_Value> rank => 0
<gen3468_Maybe> ::= <Gen3468> rank => 0
<gen3468_Maybe> ::= rank => -1
<Gen3471> ::= <sqlstate_Class_Value> <gen3468_Maybe> rank => 0
<SQL_Condition> ::= <major_Category> rank => 0
                  | <SQLSTATE> <Gen3471> rank => -1
                  | <CONSTRAINT> <constraint_Name> rank => -2
<major_Category> ::= <SQLEXCEPTION> rank => 0
                   | <SQLWARNING> rank => -1
                   | <NOT> <FOUND> rank => -2
<sqlstate_Class_Value> ::= <sqlstate_Char> <sqlstate_Char> rank => 0
<sqlstate_Subclass_Value> ::= <sqlstate_Char> <sqlstate_Char> <sqlstate_Char> rank => 0
<sqlstate_Char> ::= <simple_Latin_Upper_Case_Letter> rank => 0
                  | <digit> rank => -1
<condition_Action> ::= <CONTINUE> rank => 0
                     | <go_To> rank => -1
<Gen3484> ::= <GOTO> rank => 0
            | <GO> <TO> rank => -1
<go_To> ::= <Gen3484> <goto_Target> rank => 0
<goto_Target> ::= <unsigned_Integer> rank => 0
<embedded_SQL_Ada_Program> ::= <EXEC> <SQL> rank => 0
<Gen3489> ::= <comma> <ada_Host_Identifier> rank => 0
<gen3489_Any> ::= <Gen3489>* rank => 0
<ada_Initial_Value_Maybe> ::= <ada_Initial_Value> rank => 0
<ada_Initial_Value_Maybe> ::= rank => -1
<ada_Variable_Definition> ::= <ada_Host_Identifier> <gen3489_Any> <colon> <ada_Type_Specification> <ada_Initial_Value_Maybe> rank => 0
<character_Representation_Many> ::= <character_Representation>+ rank => 0
<ada_Initial_Value> ::= <ada_Assignment_Operator> <character_Representation_Many> rank => 0
<ada_Assignment_Operator> ::= <colon> <equals_Operator> rank => 0
<ada_Host_Identifier> ::= <lex568_Many> rank => 0
<ada_Type_Specification> ::= <ada_Qualified_Type_Specification> rank => 0
                           | <ada_Unqualified_Type_Specification> rank => -1
                           | <ada_Derived_Type_Specification> rank => -2
<is_Maybe> ::= <IS> rank => 0
<is_Maybe> ::= rank => -1
<Gen3503> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3503_Maybe> ::= <Gen3503> rank => 0
<gen3503_Maybe> ::= rank => -1
<ada_Qualified_Type_Specification> ::= <Lex569> <period> <CHAR> <gen3503_Maybe> <left_Paren> <Lex570> <double_Period> <length> <right_Paren> rank => 0
                                     | <Lex569> <period> <SMALLINT> rank => -1
                                     | <Lex569> <period> <INT> rank => -2
                                     | <Lex569> <period> <BIGINT> rank => -3
                                     | <Lex569> <period> <REAL> rank => -4
                                     | <Lex569> <period> <DOUBLE_PRECISION> rank => -5
                                     | <Lex569> <period> <BOOLEAN> rank => -6
                                     | <Lex569> <period> <SQLSTATE_TYPE> rank => -7
                                     | <Lex569> <period> <INDICATOR_TYPE> rank => -8
<ada_Unqualified_Type_Specification> ::= <CHAR> <left_Paren> <Lex570> <double_Period> <length> <right_Paren> rank => 0
                                       | <SMALLINT> rank => -1
                                       | <INT> rank => -2
                                       | <BIGINT> rank => -3
                                       | <REAL> rank => -4
                                       | <DOUBLE_PRECISION> rank => -5
                                       | <BOOLEAN> rank => -6
                                       | <SQLSTATE_TYPE> rank => -7
                                       | <INDICATOR_TYPE> rank => -8
<ada_Derived_Type_Specification> ::= <ada_Clob_Variable> rank => 0
                                   | <ada_Clob_Locator_Variable> rank => -1
                                   | <ada_Blob_Variable> rank => -2
                                   | <ada_Blob_Locator_Variable> rank => -3
                                   | <ada_User_Defined_Type_Variable> rank => -4
                                   | <ada_User_Defined_Type_Locator_Variable> rank => -5
                                   | <ada_Ref_Variable> rank => -6
                                   | <ada_Array_Locator_Variable> rank => -7
                                   | <ada_Multiset_Locator_Variable> rank => -8
<Gen3533> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3533_Maybe> ::= <Gen3533> rank => 0
<gen3533_Maybe> ::= rank => -1
<ada_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <left_Paren> <large_Object_Length> <right_Paren> <gen3533_Maybe> rank => 0
<ada_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<ada_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<ada_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<ada_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <predefined_Type> rank => 0
<ada_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<ada_Ref_Variable> ::= <SQL> <TYPE> <IS> <reference_Type> rank => 0
<ada_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <array_Type> <AS> <LOCATOR> rank => 0
<ada_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <multiset_Type> <AS> <LOCATOR> rank => 0
<embedded_SQL_C_Program> ::= <EXEC> <SQL> rank => 0
<c_Storage_Class_Maybe> ::= <c_Storage_Class> rank => 0
<c_Storage_Class_Maybe> ::= rank => -1
<c_Class_Modifier_Maybe> ::= <c_Class_Modifier> rank => 0
<c_Class_Modifier_Maybe> ::= rank => -1
<c_Variable_Definition> ::= <c_Storage_Class_Maybe> <c_Class_Modifier_Maybe> <c_Variable_Specification> <semicolon> rank => 0
<c_Variable_Specification> ::= <c_Numeric_Variable> rank => 0
                             | <c_Character_Variable> rank => -1
                             | <c_Derived_Variable> rank => -2
<c_Storage_Class> ::= <auto> rank => 0
                    | <extern> rank => -1
                    | <static> rank => -2
<c_Class_Modifier> ::= <const> rank => 0
                     | <volatile> rank => -1
<Gen3559> ::= <long> <long> rank => 0
            | <long> rank => -1
            | <short> rank => -2
            | <float> rank => -3
            | <double> rank => -4
<c_Initial_Value_Maybe> ::= <c_Initial_Value> rank => 0
<c_Initial_Value_Maybe> ::= rank => -1
<Gen3566> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3566_Any> ::= <Gen3566>* rank => 0
<c_Numeric_Variable> ::= <Gen3559> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3566_Any> rank => 0
<Gen3569> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3569_Maybe> ::= <Gen3569> rank => 0
<gen3569_Maybe> ::= rank => -1
<Gen3572> ::= <comma> <c_Host_Identifier> <c_Array_Specification> <c_Initial_Value_Maybe> rank => 0
<gen3572_Any> ::= <Gen3572>* rank => 0
<c_Character_Variable> ::= <c_Character_Type> <gen3569_Maybe> <c_Host_Identifier> <c_Array_Specification> <c_Initial_Value_Maybe> <gen3572_Any> rank => 0
<c_Character_Type> ::= <char> rank => 0
                     | <unsigned> <char> rank => -1
                     | <unsigned> <short> rank => -2
<c_Array_Specification> ::= <left_Bracket> <length> <right_Bracket> rank => 0
<c_Host_Identifier> ::= <lex585_Many> rank => 0
<c_Derived_Variable> ::= <c_Varchar_Variable> rank => 0
                       | <c_Nchar_Variable> rank => -1
                       | <c_Nchar_Varying_Variable> rank => -2
                       | <c_Clob_Variable> rank => -3
                       | <c_Nclob_Variable> rank => -4
                       | <c_Blob_Variable> rank => -5
                       | <c_User_Defined_Type_Variable> rank => -6
                       | <c_Clob_Locator_Variable> rank => -7
                       | <c_Blob_Locator_Variable> rank => -8
                       | <c_Array_Locator_Variable> rank => -9
                       | <c_Multiset_Locator_Variable> rank => -10
                       | <c_User_Defined_Type_Locator_Variable> rank => -11
                       | <c_Ref_Variable> rank => -12
<Gen3593> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3593_Maybe> ::= <Gen3593> rank => 0
<gen3593_Maybe> ::= rank => -1
<Gen3596> ::= <comma> <c_Host_Identifier> <c_Array_Specification> <c_Initial_Value_Maybe> rank => 0
<gen3596_Any> ::= <Gen3596>* rank => 0
<c_Varchar_Variable> ::= <VARCHAR> <gen3593_Maybe> <c_Host_Identifier> <c_Array_Specification> <c_Initial_Value_Maybe> <gen3596_Any> rank => 0
<Gen3599> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3599_Maybe> ::= <Gen3599> rank => 0
<gen3599_Maybe> ::= rank => -1
<Gen3602> ::= <comma> <c_Host_Identifier> <c_Array_Specification> <c_Initial_Value_Maybe> rank => 0
<gen3602_Any> ::= <Gen3602>* rank => 0
<c_Nchar_Variable> ::= <NCHAR> <gen3599_Maybe> <c_Host_Identifier> <c_Array_Specification> <c_Initial_Value_Maybe> <gen3602_Any> rank => 0
<Gen3605> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3605_Maybe> ::= <Gen3605> rank => 0
<gen3605_Maybe> ::= rank => -1
<Gen3608> ::= <comma> <c_Host_Identifier> <c_Array_Specification> <c_Initial_Value_Maybe> rank => 0
<gen3608_Any> ::= <Gen3608>* rank => 0
<c_Nchar_Varying_Variable> ::= <NCHAR> <VARYING> <gen3605_Maybe> <c_Host_Identifier> <c_Array_Specification> <c_Initial_Value_Maybe> <gen3608_Any> rank => 0
<Gen3611> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3611_Maybe> ::= <Gen3611> rank => 0
<gen3611_Maybe> ::= rank => -1
<Gen3614> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3614_Any> ::= <Gen3614>* rank => 0
<c_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <left_Paren> <large_Object_Length> <right_Paren> <gen3611_Maybe> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3614_Any> rank => 0
<Gen3617> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3617_Maybe> ::= <Gen3617> rank => 0
<gen3617_Maybe> ::= rank => -1
<Gen3620> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3620_Any> ::= <Gen3620>* rank => 0
<c_Nclob_Variable> ::= <SQL> <TYPE> <IS> <NCLOB> <left_Paren> <large_Object_Length> <right_Paren> <gen3617_Maybe> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3620_Any> rank => 0
<Gen3623> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3623_Any> ::= <Gen3623>* rank => 0
<c_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <predefined_Type> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3623_Any> rank => 0
<Gen3626> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3626_Any> ::= <Gen3626>* rank => 0
<c_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <left_Paren> <large_Object_Length> <right_Paren> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3626_Any> rank => 0
<Gen3629> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3629_Any> ::= <Gen3629>* rank => 0
<c_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3629_Any> rank => 0
<Gen3632> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3632_Any> ::= <Gen3632>* rank => 0
<c_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3632_Any> rank => 0
<Gen3635> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3635_Any> ::= <Gen3635>* rank => 0
<c_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <array_Type> <AS> <LOCATOR> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3635_Any> rank => 0
<Gen3638> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3638_Any> ::= <Gen3638>* rank => 0
<c_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <multiset_Type> <AS> <LOCATOR> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3638_Any> rank => 0
<Gen3641> ::= <comma> <c_Host_Identifier> <c_Initial_Value_Maybe> rank => 0
<gen3641_Any> ::= <Gen3641>* rank => 0
<c_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> <c_Host_Identifier> <c_Initial_Value_Maybe> <gen3641_Any> rank => 0
<c_Ref_Variable> ::= <SQL> <TYPE> <IS> <reference_Type> rank => 0
<c_Initial_Value> ::= <equals_Operator> <character_Representation_Many> rank => 0
<embedded_SQL_Cobol_Program> ::= <EXEC> <SQL> rank => 0
<cobol_Host_Identifier> ::= <lex586_Many> rank => 0
<Gen3648> ::= <Lex587> rank => 0
            | <Lex588> rank => -1
<cobol_Variable_Definition> ::= <Gen3648> <cobol_Host_Identifier> <cobol_Type_Specification> <character_Representation_Any> <period> rank => 0
<cobol_Type_Specification> ::= <cobol_Character_Type> rank => 0
                             | <cobol_National_Character_Type> rank => -1
                             | <cobol_Numeric_Type> rank => -2
                             | <cobol_Integer_Type> rank => -3
                             | <cobol_Derived_Type_Specification> rank => -4
<cobol_Derived_Type_Specification> ::= <cobol_Clob_Variable> rank => 0
                                     | <cobol_Nclob_Variable> rank => -1
                                     | <cobol_Blob_Variable> rank => -2
                                     | <cobol_User_Defined_Type_Variable> rank => -3
                                     | <cobol_Clob_Locator_Variable> rank => -4
                                     | <cobol_Blob_Locator_Variable> rank => -5
                                     | <cobol_Array_Locator_Variable> rank => -6
                                     | <cobol_Multiset_Locator_Variable> rank => -7
                                     | <cobol_User_Defined_Type_Locator_Variable> rank => -8
                                     | <cobol_Ref_Variable> rank => -9
<Gen3666> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3666_Maybe> ::= <Gen3666> rank => 0
<gen3666_Maybe> ::= rank => -1
<Gen3669> ::= <PIC> rank => 0
            | <PICTURE> rank => -1
<Gen3671> ::= <left_Paren> <length> <right_Paren> rank => 0
<gen3671_Maybe> ::= <Gen3671> rank => 0
<gen3671_Maybe> ::= rank => -1
<Gen3674> ::= <X> <gen3671_Maybe> rank => 0
<gen3674_Many> ::= <Gen3674>+ rank => 0
<cobol_Character_Type> ::= <gen3666_Maybe> <Gen3669> <is_Maybe> <gen3674_Many> rank => 0
<Gen3677> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3677_Maybe> ::= <Gen3677> rank => 0
<gen3677_Maybe> ::= rank => -1
<Gen3680> ::= <PIC> rank => 0
            | <PICTURE> rank => -1
<Gen3682> ::= <left_Paren> <length> <right_Paren> rank => 0
<gen3682_Maybe> ::= <Gen3682> rank => 0
<gen3682_Maybe> ::= rank => -1
<Gen3685> ::= <N> <gen3682_Maybe> rank => 0
<gen3685_Many> ::= <Gen3685>+ rank => 0
<cobol_National_Character_Type> ::= <gen3677_Maybe> <Gen3680> <is_Maybe> <gen3685_Many> rank => 0
<Gen3688> ::= <USAGE> <is_Maybe> rank => 0
<gen3688_Maybe> ::= <Gen3688> rank => 0
<gen3688_Maybe> ::= rank => -1
<Gen3691> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3691_Maybe> ::= <Gen3691> rank => 0
<gen3691_Maybe> ::= rank => -1
<cobol_Clob_Variable> ::= <gen3688_Maybe> <SQL> <TYPE> <IS> <CLOB> <left_Paren> <large_Object_Length> <right_Paren> <gen3691_Maybe> rank => 0
<Gen3695> ::= <USAGE> <is_Maybe> rank => 0
<gen3695_Maybe> ::= <Gen3695> rank => 0
<gen3695_Maybe> ::= rank => -1
<Gen3698> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3698_Maybe> ::= <Gen3698> rank => 0
<gen3698_Maybe> ::= rank => -1
<cobol_Nclob_Variable> ::= <gen3695_Maybe> <SQL> <TYPE> <IS> <NCLOB> <left_Paren> <large_Object_Length> <right_Paren> <gen3698_Maybe> rank => 0
<Gen3702> ::= <USAGE> <is_Maybe> rank => 0
<gen3702_Maybe> ::= <Gen3702> rank => 0
<gen3702_Maybe> ::= rank => -1
<cobol_Blob_Variable> ::= <gen3702_Maybe> <SQL> <TYPE> <IS> <BLOB> <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<Gen3706> ::= <USAGE> <is_Maybe> rank => 0
<gen3706_Maybe> ::= <Gen3706> rank => 0
<gen3706_Maybe> ::= rank => -1
<cobol_User_Defined_Type_Variable> ::= <gen3706_Maybe> <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <predefined_Type> rank => 0
<Gen3710> ::= <USAGE> <is_Maybe> rank => 0
<gen3710_Maybe> ::= <Gen3710> rank => 0
<gen3710_Maybe> ::= rank => -1
<cobol_Clob_Locator_Variable> ::= <gen3710_Maybe> <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<Gen3714> ::= <USAGE> <is_Maybe> rank => 0
<gen3714_Maybe> ::= <Gen3714> rank => 0
<gen3714_Maybe> ::= rank => -1
<cobol_Blob_Locator_Variable> ::= <gen3714_Maybe> <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<Gen3718> ::= <USAGE> <is_Maybe> rank => 0
<gen3718_Maybe> ::= <Gen3718> rank => 0
<gen3718_Maybe> ::= rank => -1
<cobol_Array_Locator_Variable> ::= <gen3718_Maybe> <SQL> <TYPE> <IS> <array_Type> <AS> <LOCATOR> rank => 0
<Gen3722> ::= <USAGE> <is_Maybe> rank => 0
<gen3722_Maybe> ::= <Gen3722> rank => 0
<gen3722_Maybe> ::= rank => -1
<cobol_Multiset_Locator_Variable> ::= <gen3722_Maybe> <SQL> <TYPE> <IS> <multiset_Type> <AS> <LOCATOR> rank => 0
<Gen3726> ::= <USAGE> <is_Maybe> rank => 0
<gen3726_Maybe> ::= <Gen3726> rank => 0
<gen3726_Maybe> ::= rank => -1
<cobol_User_Defined_Type_Locator_Variable> ::= <gen3726_Maybe> <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<Gen3730> ::= <USAGE> <is_Maybe> rank => 0
<gen3730_Maybe> ::= <Gen3730> rank => 0
<gen3730_Maybe> ::= rank => -1
<cobol_Ref_Variable> ::= <gen3730_Maybe> <SQL> <TYPE> <IS> <reference_Type> rank => 0
<Gen3734> ::= <PIC> rank => 0
            | <PICTURE> rank => -1
<Gen3736> ::= <USAGE> <is_Maybe> rank => 0
<gen3736_Maybe> ::= <Gen3736> rank => 0
<gen3736_Maybe> ::= rank => -1
<cobol_Numeric_Type> ::= <Gen3734> <is_Maybe> <S> <cobol_Nines_Specification> <gen3736_Maybe> <DISPLAY> <SIGN> <LEADING> <SEPARATE> rank => 0
<cobol_Nines_Maybe> ::= <cobol_Nines> rank => 0
<cobol_Nines_Maybe> ::= rank => -1
<Gen3742> ::= <V> <cobol_Nines_Maybe> rank => 0
<gen3742_Maybe> ::= <Gen3742> rank => 0
<gen3742_Maybe> ::= rank => -1
<cobol_Nines_Specification> ::= <cobol_Nines> <gen3742_Maybe> rank => 0
                              | <V> <cobol_Nines> rank => -1
<cobol_Integer_Type> ::= <cobol_Binary_Integer> rank => 0
<Gen3748> ::= <PIC> rank => 0
            | <PICTURE> rank => -1
<Gen3750> ::= <USAGE> <is_Maybe> rank => 0
<gen3750_Maybe> ::= <Gen3750> rank => 0
<gen3750_Maybe> ::= rank => -1
<cobol_Binary_Integer> ::= <Gen3748> <is_Maybe> <S> <cobol_Nines> <gen3750_Maybe> <BINARY> rank => 0
<Gen3754> ::= <left_Paren> <length> <right_Paren> rank => 0
<gen3754_Maybe> ::= <Gen3754> rank => 0
<gen3754_Maybe> ::= rank => -1
<Gen3757> ::= <Lex596> <gen3754_Maybe> rank => 0
<gen3757_Many> ::= <Gen3757>+ rank => 0
<cobol_Nines> ::= <gen3757_Many> rank => 0
<embedded_SQL_Fortran_Program> ::= <EXEC> <SQL> rank => 0
<fortran_Host_Identifier> ::= <lex597_Many> rank => 0
<Gen3762> ::= <comma> <fortran_Host_Identifier> rank => 0
<gen3762_Any> ::= <Gen3762>* rank => 0
<fortran_Variable_Definition> ::= <fortran_Type_Specification> <fortran_Host_Identifier> <gen3762_Any> rank => 0
<Gen3765> ::= <asterisk> <length> rank => 0
<gen3765_Maybe> ::= <Gen3765> rank => 0
<gen3765_Maybe> ::= rank => -1
<Gen3768> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3768_Maybe> ::= <Gen3768> rank => 0
<gen3768_Maybe> ::= rank => -1
<Gen3771> ::= <lex003_Many> rank => 0
<Gen3771> ::= rank => -1
<Gen3773> ::= <asterisk> <length> rank => 0
<gen3773_Maybe> ::= <Gen3773> rank => 0
<gen3773_Maybe> ::= rank => -1
<Gen3776> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3776_Maybe> ::= <Gen3776> rank => 0
<gen3776_Maybe> ::= rank => -1
<fortran_Type_Specification> ::= <CHARACTER> <gen3765_Maybe> <gen3768_Maybe> rank => 0
                               | <CHARACTER> <KIND> <equals_Operator> <Lex003> <Gen3771> <gen3773_Maybe> <gen3776_Maybe> rank => -1
                               | <INTEGER> rank => -2
                               | <REAL> rank => -3
                               | <DOUBLE> <PRECISION> rank => -4
                               | <LOGICAL> rank => -5
                               | <fortran_Derived_Type_Specification> rank => -6
<fortran_Derived_Type_Specification> ::= <fortran_Clob_Variable> rank => 0
                                       | <fortran_Blob_Variable> rank => -1
                                       | <fortran_User_Defined_Type_Variable> rank => -2
                                       | <fortran_Clob_Locator_Variable> rank => -3
                                       | <fortran_Blob_Locator_Variable> rank => -4
                                       | <fortran_User_Defined_Type_Locator_Variable> rank => -5
                                       | <fortran_Array_Locator_Variable> rank => -6
                                       | <fortran_Multiset_Locator_Variable> rank => -7
                                       | <fortran_Ref_Variable> rank => -8
<Gen3795> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3795_Maybe> ::= <Gen3795> rank => 0
<gen3795_Maybe> ::= rank => -1
<fortran_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <left_Paren> <large_Object_Length> <right_Paren> <gen3795_Maybe> rank => 0
<fortran_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<fortran_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <predefined_Type> rank => 0
<fortran_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<fortran_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<fortran_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<fortran_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <array_Type> <AS> <LOCATOR> rank => 0
<fortran_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <multiset_Type> <AS> <LOCATOR> rank => 0
<fortran_Ref_Variable> ::= <SQL> <TYPE> <IS> <reference_Type> rank => 0
<embedded_SQL_Mumps_Program> ::= <EXEC> <SQL> rank => 0
<mumps_Variable_Definition> ::= <mumps_Numeric_Variable> <semicolon> rank => 0
                              | <mumps_Character_Variable> <semicolon> rank => -1
                              | <mumps_Derived_Type_Specification> <semicolon> rank => -2
<mumps_Host_Identifier> ::= <lex601_Many> rank => 0
<Gen3812> ::= <comma> <mumps_Host_Identifier> <mumps_Length_Specification> rank => 0
<gen3812_Any> ::= <Gen3812>* rank => 0
<mumps_Character_Variable> ::= <VARCHAR> <mumps_Host_Identifier> <mumps_Length_Specification> <gen3812_Any> rank => 0
<mumps_Length_Specification> ::= <left_Paren> <length> <right_Paren> rank => 0
<Gen3816> ::= <comma> <mumps_Host_Identifier> rank => 0
<gen3816_Any> ::= <Gen3816>* rank => 0
<mumps_Numeric_Variable> ::= <mumps_Type_Specification> <mumps_Host_Identifier> <gen3816_Any> rank => 0
<Gen3819> ::= <comma> <scale> rank => 0
<gen3819_Maybe> ::= <Gen3819> rank => 0
<gen3819_Maybe> ::= rank => -1
<Gen3822> ::= <left_Paren> <precision> <gen3819_Maybe> <right_Paren> rank => 0
<gen3822_Maybe> ::= <Gen3822> rank => 0
<gen3822_Maybe> ::= rank => -1
<mumps_Type_Specification> ::= <INT> rank => 0
                             | <DEC> <gen3822_Maybe> rank => -1
                             | <REAL> rank => -2
<mumps_Derived_Type_Specification> ::= <mumps_Clob_Variable> rank => 0
                                     | <mumps_Blob_Variable> rank => -1
                                     | <mumps_User_Defined_Type_Variable> rank => -2
                                     | <mumps_Clob_Locator_Variable> rank => -3
                                     | <mumps_Blob_Locator_Variable> rank => -4
                                     | <mumps_User_Defined_Type_Locator_Variable> rank => -5
                                     | <mumps_Array_Locator_Variable> rank => -6
                                     | <mumps_Multiset_Locator_Variable> rank => -7
                                     | <mumps_Ref_Variable> rank => -8
<Gen3837> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3837_Maybe> ::= <Gen3837> rank => 0
<gen3837_Maybe> ::= rank => -1
<mumps_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <left_Paren> <large_Object_Length> <right_Paren> <gen3837_Maybe> rank => 0
<mumps_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<mumps_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <predefined_Type> rank => 0
<mumps_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<mumps_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<mumps_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<mumps_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <array_Type> <AS> <LOCATOR> rank => 0
<mumps_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <multiset_Type> <AS> <LOCATOR> rank => 0
<mumps_Ref_Variable> ::= <SQL> <TYPE> <IS> <reference_Type> rank => 0
<embedded_SQL_Pascal_Program> ::= <EXEC> <SQL> rank => 0
<pascal_Host_Identifier> ::= <lex602_Many> rank => 0
<Gen3851> ::= <comma> <pascal_Host_Identifier> rank => 0
<gen3851_Any> ::= <Gen3851>* rank => 0
<pascal_Variable_Definition> ::= <pascal_Host_Identifier> <gen3851_Any> <colon> <pascal_Type_Specification> <semicolon> rank => 0
<Gen3854> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3854_Maybe> ::= <Gen3854> rank => 0
<gen3854_Maybe> ::= rank => -1
<Gen3857> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3857_Maybe> ::= <Gen3857> rank => 0
<gen3857_Maybe> ::= rank => -1
<pascal_Type_Specification> ::= <PACKED> <ARRAY> <left_Bracket> <Lex570> <double_Period> <length> <right_Bracket> <OF> <CHAR> <gen3854_Maybe> rank => 0
                              | <INTEGER> rank => -1
                              | <REAL> rank => -2
                              | <CHAR> <gen3857_Maybe> rank => -3
                              | <BOOLEAN> rank => -4
                              | <pascal_Derived_Type_Specification> rank => -5
<pascal_Derived_Type_Specification> ::= <pascal_Clob_Variable> rank => 0
                                      | <pascal_Blob_Variable> rank => -1
                                      | <pascal_User_Defined_Type_Variable> rank => -2
                                      | <pascal_Clob_Locator_Variable> rank => -3
                                      | <pascal_Blob_Locator_Variable> rank => -4
                                      | <pascal_User_Defined_Type_Locator_Variable> rank => -5
                                      | <pascal_Array_Locator_Variable> rank => -6
                                      | <pascal_Multiset_Locator_Variable> rank => -7
                                      | <pascal_Ref_Variable> rank => -8
<Gen3875> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3875_Maybe> ::= <Gen3875> rank => 0
<gen3875_Maybe> ::= rank => -1
<pascal_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <left_Paren> <large_Object_Length> <right_Paren> <gen3875_Maybe> rank => 0
<pascal_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<pascal_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<pascal_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <predefined_Type> rank => 0
<pascal_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<pascal_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<pascal_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <array_Type> <AS> <LOCATOR> rank => 0
<pascal_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <multiset_Type> <AS> <LOCATOR> rank => 0
<pascal_Ref_Variable> ::= <SQL> <TYPE> <IS> <reference_Type> rank => 0
<embedded_SQL_Pl_I_Program> ::= <EXEC> <SQL> rank => 0
<pl_I_Host_Identifier> ::= <lex604_Many> rank => 0
<Gen3889> ::= <DCL> rank => 0
            | <DECLARE> rank => -1
<Gen3891> ::= <comma> <pl_I_Host_Identifier> rank => 0
<gen3891_Any> ::= <Gen3891>* rank => 0
<pl_I_Variable_Definition> ::= <Gen3889> <pl_I_Host_Identifier> <left_Paren> <pl_I_Host_Identifier> <gen3891_Any> <right_Paren> <pl_I_Type_Specification> <character_Representation_Any> <semicolon> rank => 0
<Gen3894> ::= <CHAR> rank => 0
            | <CHARACTER> rank => -1
<varying_Maybe> ::= <VARYING> rank => 0
<varying_Maybe> ::= rank => -1
<Gen3898> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3898_Maybe> ::= <Gen3898> rank => 0
<gen3898_Maybe> ::= rank => -1
<Gen3901> ::= <comma> <scale> rank => 0
<gen3901_Maybe> ::= <Gen3901> rank => 0
<gen3901_Maybe> ::= rank => -1
<Gen3904> ::= <left_Paren> <precision> <right_Paren> rank => 0
<gen3904_Maybe> ::= <Gen3904> rank => 0
<gen3904_Maybe> ::= rank => -1
<pl_I_Type_Specification> ::= <Gen3894> <varying_Maybe> <left_Paren> <length> <right_Paren> <gen3898_Maybe> rank => 0
                            | <pl_I_Type_Fixed_Decimal> <left_Paren> <precision> <gen3901_Maybe> <right_Paren> rank => -1
                            | <pl_I_Type_Fixed_Binary> <gen3904_Maybe> rank => -2
                            | <pl_I_Type_Float_Binary> <left_Paren> <precision> <right_Paren> rank => -3
                            | <pl_I_Derived_Type_Specification> rank => -4
<pl_I_Derived_Type_Specification> ::= <pl_I_Clob_Variable> rank => 0
                                    | <pl_I_Blob_Variable> rank => -1
                                    | <pl_I_User_Defined_Type_Variable> rank => -2
                                    | <pl_I_Clob_Locator_Variable> rank => -3
                                    | <pl_I_Blob_Locator_Variable> rank => -4
                                    | <pl_I_User_Defined_Type_Locator_Variable> rank => -5
                                    | <pl_I_Array_Locator_Variable> rank => -6
                                    | <pl_I_Multiset_Locator_Variable> rank => -7
                                    | <pl_I_Ref_Variable> rank => -8
<Gen3921> ::= <CHARACTER> <SET> <is_Maybe> <character_Set_Specification> rank => 0
<gen3921_Maybe> ::= <Gen3921> rank => 0
<gen3921_Maybe> ::= rank => -1
<pl_I_Clob_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <left_Paren> <large_Object_Length> <right_Paren> <gen3921_Maybe> rank => 0
<pl_I_Blob_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <left_Paren> <large_Object_Length> <right_Paren> rank => 0
<pl_I_User_Defined_Type_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <predefined_Type> rank => 0
<pl_I_Clob_Locator_Variable> ::= <SQL> <TYPE> <IS> <CLOB> <AS> <LOCATOR> rank => 0
<pl_I_Blob_Locator_Variable> ::= <SQL> <TYPE> <IS> <BLOB> <AS> <LOCATOR> rank => 0
<pl_I_User_Defined_Type_Locator_Variable> ::= <SQL> <TYPE> <IS> <path_Resolved_User_Defined_Type_Name> <AS> <LOCATOR> rank => 0
<pl_I_Array_Locator_Variable> ::= <SQL> <TYPE> <IS> <array_Type> <AS> <LOCATOR> rank => 0
<pl_I_Multiset_Locator_Variable> ::= <SQL> <TYPE> <IS> <multiset_Type> <AS> <LOCATOR> rank => 0
<pl_I_Ref_Variable> ::= <SQL> <TYPE> <IS> <reference_Type> rank => 0
<Gen3933> ::= <DEC> rank => 0
            | <DECIMAL> rank => -1
<Gen3935> ::= <DEC> rank => 0
            | <DECIMAL> rank => -1
<pl_I_Type_Fixed_Decimal> ::= <Gen3933> <FIXED> rank => 0
                            | <FIXED> <Gen3935> rank => -1
<Gen3939> ::= <BIN> rank => 0
            | <BINARY> rank => -1
<Gen3941> ::= <BIN> rank => 0
            | <BINARY> rank => -1
<pl_I_Type_Fixed_Binary> ::= <Gen3939> <FIXED> rank => 0
                           | <FIXED> <Gen3941> rank => -1
<Gen3945> ::= <BIN> rank => 0
            | <BINARY> rank => -1
<Gen3947> ::= <BIN> rank => 0
            | <BINARY> rank => -1
<pl_I_Type_Float_Binary> ::= <Gen3945> <FLOAT> rank => 0
                           | <FLOAT> <Gen3947> rank => -1
<direct_SQL_Statement> ::= <directly_Executable_Statement> <semicolon> rank => 0
<directly_Executable_Statement> ::= <direct_SQL_Data_Statement> rank => 0
                                  | <SQL_Schema_Statement> rank => -1
                                  | <SQL_Transaction_Statement> rank => -2
                                  | <SQL_Connection_Statement> rank => -3
                                  | <SQL_Session_Statement> rank => -4
<direct_SQL_Data_Statement> ::= <delete_Statement_Searched> rank => 0
                              | <direct_Select_Statement_Multiple_Rows> rank => -1
                              | <insert_Statement> rank => -2
                              | <update_Statement_Searched> rank => -3
                              | <merge_Statement> rank => -4
                              | <temporary_Table_Declaration> rank => -5
<direct_Select_Statement_Multiple_Rows> ::= <cursor_Specification> rank => 0
<get_Diagnostics_Statement> ::= <GET> <DIAGNOSTICS> <SQL_Diagnostics_Information> rank => 0
<SQL_Diagnostics_Information> ::= <statement_Information> rank => 0
                                | <condition_Information> rank => -1
<Gen3967> ::= <comma> <statement_Information_Item> rank => 0
<gen3967_Any> ::= <Gen3967>* rank => 0
<statement_Information> ::= <statement_Information_Item> <gen3967_Any> rank => 0
<statement_Information_Item> ::= <simple_Target_Specification> <equals_Operator> <statement_Information_Item_Name> rank => 0
<statement_Information_Item_Name> ::= <NUMBER> rank => 0
                                    | <MORE> rank => -1
                                    | <COMMAND_FUNCTION> rank => -2
                                    | <COMMAND_FUNCTION_CODE> rank => -3
                                    | <DYNAMIC_FUNCTION> rank => -4
                                    | <DYNAMIC_FUNCTION_CODE> rank => -5
                                    | <ROW_COUNT> rank => -6
                                    | <TRANSACTIONS_COMMITTED> rank => -7
                                    | <TRANSACTIONS_ROLLED_BACK> rank => -8
                                    | <TRANSACTION_ACTIVE> rank => -9
<Gen3981> ::= <EXCEPTION> rank => 0
            | <CONDITION> rank => -1
<Gen3983> ::= <comma> <condition_Information_Item> rank => 0
<gen3983_Any> ::= <Gen3983>* rank => 0
<condition_Information> ::= <Gen3981> <condition_Number> <condition_Information_Item> <gen3983_Any> rank => 0
<condition_Information_Item> ::= <simple_Target_Specification> <equals_Operator> <condition_Information_Item_Name> rank => 0
<condition_Information_Item_Name> ::= <CATALOG_NAME> rank => 0
                                    | <CLASS_ORIGIN> rank => -1
                                    | <COLUMN_NAME> rank => -2
                                    | <CONDITION_NUMBER> rank => -3
                                    | <CONNECTION_NAME> rank => -4
                                    | <CONSTRAINT_CATALOG> rank => -5
                                    | <CONSTRAINT_NAME> rank => -6
                                    | <CONSTRAINT_SCHEMA> rank => -7
                                    | <CURSOR_NAME> rank => -8
                                    | <MESSAGE_LENGTH> rank => -9
                                    | <MESSAGE_OCTET_LENGTH> rank => -10
                                    | <MESSAGE_TEXT> rank => -11
                                    | <PARAMETER_MODE> rank => -12
                                    | <PARAMETER_NAME> rank => -13
                                    | <PARAMETER_ORDINAL_POSITION> rank => -14
                                    | <RETURNED_SQLSTATE> rank => -15
                                    | <ROUTINE_CATALOG> rank => -16
                                    | <ROUTINE_NAME> rank => -17
                                    | <ROUTINE_SCHEMA> rank => -18
                                    | <SCHEMA_NAME> rank => -19
                                    | <SERVER_NAME> rank => -20
                                    | <SPECIFIC_NAME> rank => -21
                                    | <SUBCLASS_ORIGIN> rank => -22
                                    | <TABLE_NAME> rank => -23
                                    | <TRIGGER_CATALOG> rank => -24
                                    | <TRIGGER_NAME> rank => -25
                                    | <TRIGGER_SCHEMA> rank => -26
<condition_Number> ::= <simple_Value_Specification> rank => 0
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
<CATALOG_NAME> ~ 'CATALOG_NAME':i
<CEIL> ~ 'CEIL':i
<CEILING> ~ 'CEILING':i
<CHAIN> ~ 'CHAIN':i
:lexeme ~ <CHAR>  priority => 1
<CHAR> ~ 'CHAR':i
:lexeme ~ <CHARACTER>  priority => 1
<CHARACTER> ~ 'CHARACTER':i
<CHARACTERISTICS> ~ 'CHARACTERISTICS':i
<CHARACTERS> ~ 'CHARACTERS':i
<CHARACTER_LENGTH> ~ 'CHARACTER_LENGTH':i
<CHARACTER_SET_CATALOG> ~ 'CHARACTER_SET_CATALOG':i
<CHARACTER_SET_NAME> ~ 'CHARACTER_SET_NAME':i
<CHARACTER_SET_SCHEMA> ~ 'CHARACTER_SET_SCHEMA':i
<CHAR_LENGTH> ~ 'CHAR_LENGTH':i
:lexeme ~ <CHECK>  priority => 1
<CHECK> ~ 'CHECK':i
<CHECKED> ~ 'CHECKED':i
<CLASS_ORIGIN> ~ 'CLASS_ORIGIN':i
:lexeme ~ <CLOB>  priority => 1
<CLOB> ~ 'CLOB':i
:lexeme ~ <CLOSE>  priority => 1
<CLOSE> ~ 'CLOSE':i
<COALESCE> ~ 'COALESCE':i
<COBOL> ~ 'COBOL':i
<CODE_UNITS> ~ 'CODE_UNITS':i
:lexeme ~ <COLLATE>  priority => 1
<COLLATE> ~ 'COLLATE':i
<COLLATION> ~ 'COLLATION':i
<COLLATION_CATALOG> ~ 'COLLATION_CATALOG':i
<COLLATION_NAME> ~ 'COLLATION_NAME':i
<COLLATION_SCHEMA> ~ 'COLLATION_SCHEMA':i
<COLLECT> ~ 'COLLECT':i
:lexeme ~ <COLUMN>  priority => 1
<COLUMN> ~ 'COLUMN':i
<COLUMN_NAME> ~ 'COLUMN_NAME':i
<COMMAND_FUNCTION> ~ 'COMMAND_FUNCTION':i
<COMMAND_FUNCTION_CODE> ~ 'COMMAND_FUNCTION_CODE':i
:lexeme ~ <COMMIT>  priority => 1
<COMMIT> ~ 'COMMIT':i
<COMMITTED> ~ 'COMMITTED':i
<CONDITION> ~ 'CONDITION':i
<CONDITION_NUMBER> ~ 'CONDITION_NUMBER':i
:lexeme ~ <CONNECT>  priority => 1
<CONNECT> ~ 'CONNECT':i
<CONNECTION> ~ 'CONNECTION':i
<CONNECTION_NAME> ~ 'CONNECTION_NAME':i
:lexeme ~ <CONSTRAINT>  priority => 1
<CONSTRAINT> ~ 'CONSTRAINT':i
<CONSTRAINTS> ~ 'CONSTRAINTS':i
<CONSTRAINT_CATALOG> ~ 'CONSTRAINT_CATALOG':i
<CONSTRAINT_NAME> ~ 'CONSTRAINT_NAME':i
<CONSTRAINT_SCHEMA> ~ 'CONSTRAINT_SCHEMA':i
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
<COVAR_POP> ~ 'COVAR_POP':i
<COVAR_SAMP> ~ 'COVAR_SAMP':i
:lexeme ~ <CREATE>  priority => 1
<CREATE> ~ 'CREATE':i
:lexeme ~ <CROSS>  priority => 1
<CROSS> ~ 'CROSS':i
:lexeme ~ <CUBE>  priority => 1
<CUBE> ~ 'CUBE':i
<CUME_DIST> ~ 'CUME_DIST':i
:lexeme ~ <CURRENT>  priority => 1
<CURRENT> ~ 'CURRENT':i
<CURRENT_COLLATION> ~ 'CURRENT_COLLATION':i
:lexeme ~ <CURRENT_DATE>  priority => 1
<CURRENT_DATE> ~ 'CURRENT_DATE':i
:lexeme ~ <CURRENT_DEFAULT_TRANSFORM_GROUP>  priority => 1
<CURRENT_DEFAULT_TRANSFORM_GROUP> ~ 'CURRENT_DEFAULT_TRANSFORM_GROUP':i
:lexeme ~ <CURRENT_PATH>  priority => 1
<CURRENT_PATH> ~ 'CURRENT_PATH':i
:lexeme ~ <CURRENT_ROLE>  priority => 1
<CURRENT_ROLE> ~ 'CURRENT_ROLE':i
:lexeme ~ <CURRENT_TIME>  priority => 1
<CURRENT_TIME> ~ 'CURRENT_TIME':i
:lexeme ~ <CURRENT_TIMESTAMP>  priority => 1
<CURRENT_TIMESTAMP> ~ 'CURRENT_TIMESTAMP':i
:lexeme ~ <CURRENT_TRANSFORM_GROUP_FOR_TYPE>  priority => 1
<CURRENT_TRANSFORM_GROUP_FOR_TYPE> ~ 'CURRENT_TRANSFORM_GROUP_FOR_TYPE':i
:lexeme ~ <CURRENT_USER>  priority => 1
<CURRENT_USER> ~ 'CURRENT_USER':i
:lexeme ~ <CURSOR>  priority => 1
<CURSOR> ~ 'CURSOR':i
<CURSOR_NAME> ~ 'CURSOR_NAME':i
:lexeme ~ <CYCLE>  priority => 1
<CYCLE> ~ 'CYCLE':i
<D> ~ 'D':i
<DATA> ~ 'DATA':i
:lexeme ~ <DATE>  priority => 1
<DATE> ~ 'DATE':i
<DATETIME_INTERVAL_CODE> ~ 'DATETIME_INTERVAL_CODE':i
<DATETIME_INTERVAL_PRECISION> ~ 'DATETIME_INTERVAL_PRECISION':i
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
<DENSE_RANK> ~ 'DENSE_RANK':i
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
<DOUBLE_PRECISION> ~ 'DOUBLE_PRECISION':i
:lexeme ~ <DROP>  priority => 1
<DROP> ~ 'DROP':i
:lexeme ~ <DYNAMIC>  priority => 1
<DYNAMIC> ~ 'DYNAMIC':i
<DYNAMIC_FUNCTION> ~ 'DYNAMIC_FUNCTION':i
<DYNAMIC_FUNCTION_CODE> ~ 'DYNAMIC_FUNCTION_CODE':i
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
<INDICATOR_TYPE> ~ 'INDICATOR_TYPE':i
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
<KEY_MEMBER> ~ 'KEY_MEMBER':i
<KEY_TYPE> ~ 'KEY_TYPE':i
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
:lexeme ~ <Lex371>  priority => 1
<Lex371> ~ 'END-EXEC'
:lexeme ~ <Lex469>  priority => 1
<Lex469> ~ 'REGR_R2'
<Lex543> ~ [^']
<Lex558> ~ [a-zA-Z]
<Lex559> ~ [a-zA-Z0-9_]
<Lex561> ~ [^\[\]()|\^\-+*_%?{\\]
<Lex562> ~ [\x{5c}]
<Lex563> ~ [\[\]()|\^\-+*_%?{\\]
<Lex569> ~ 'Interfaces.SQL'
<Lex570> ~ '1'
<Lex587> ~ '01'
<Lex588> ~ '77'
<Lex596> ~ '9'
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
<MESSAGE_LENGTH> ~ 'MESSAGE_LENGTH':i
<MESSAGE_OCTET_LENGTH> ~ 'MESSAGE_OCTET_LENGTH':i
<MESSAGE_TEXT> ~ 'MESSAGE_TEXT':i
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
<OCTET_LENGTH> ~ 'OCTET_LENGTH':i
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
<PARAMETER_MODE> ~ 'PARAMETER_MODE':i
<PARAMETER_NAME> ~ 'PARAMETER_NAME':i
<PARAMETER_ORDINAL_POSITION> ~ 'PARAMETER_ORDINAL_POSITION':i
<PARAMETER_SPECIFIC_CATALOG> ~ 'PARAMETER_SPECIFIC_CATALOG':i
<PARAMETER_SPECIFIC_NAME> ~ 'PARAMETER_SPECIFIC_NAME':i
<PARAMETER_SPECIFIC_SCHEMA> ~ 'PARAMETER_SPECIFIC_SCHEMA':i
<PARTIAL> ~ 'PARTIAL':i
:lexeme ~ <PARTITION>  priority => 1
<PARTITION> ~ 'PARTITION':i
<PASCAL> ~ 'PASCAL':i
<PATH> ~ 'PATH':i
<PERCENTILE_CONT> ~ 'PERCENTILE_CONT':i
<PERCENTILE_DISC> ~ 'PERCENTILE_DISC':i
<PERCENT_RANK> ~ 'PERCENT_RANK':i
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
:lexeme ~ <REGR_AVGX>  priority => 1
<REGR_AVGX> ~ 'REGR_AVGX':i
:lexeme ~ <REGR_AVGY>  priority => 1
<REGR_AVGY> ~ 'REGR_AVGY':i
:lexeme ~ <REGR_COUNT>  priority => 1
<REGR_COUNT> ~ 'REGR_COUNT':i
:lexeme ~ <REGR_INTERCEPT>  priority => 1
<REGR_INTERCEPT> ~ 'REGR_INTERCEPT':i
:lexeme ~ <REGR_SLOPE>  priority => 1
<REGR_SLOPE> ~ 'REGR_SLOPE':i
:lexeme ~ <REGR_SXX>  priority => 1
<REGR_SXX> ~ 'REGR_SXX':i
:lexeme ~ <REGR_SXY>  priority => 1
<REGR_SXY> ~ 'REGR_SXY':i
:lexeme ~ <REGR_SYY>  priority => 1
<REGR_SYY> ~ 'REGR_SYY':i
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
<RETURNED_CARDINALITY> ~ 'RETURNED_CARDINALITY':i
<RETURNED_LENGTH> ~ 'RETURNED_LENGTH':i
<RETURNED_OCTET_LENGTH> ~ 'RETURNED_OCTET_LENGTH':i
<RETURNED_SQLSTATE> ~ 'RETURNED_SQLSTATE':i
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
<ROUTINE_CATALOG> ~ 'ROUTINE_CATALOG':i
<ROUTINE_NAME> ~ 'ROUTINE_NAME':i
<ROUTINE_SCHEMA> ~ 'ROUTINE_SCHEMA':i
:lexeme ~ <ROW>  priority => 1
<ROW> ~ 'ROW':i
:lexeme ~ <ROWS>  priority => 1
<ROWS> ~ 'ROWS':i
<ROW_COUNT> ~ 'ROW_COUNT':i
<ROW_NUMBER> ~ 'ROW_NUMBER':i
<S> ~ 'S':i
:lexeme ~ <SAVEPOINT>  priority => 1
<SAVEPOINT> ~ 'SAVEPOINT':i
<SCALE> ~ 'SCALE':i
<SCHEMA> ~ 'SCHEMA':i
<SCHEMA_NAME> ~ 'SCHEMA_NAME':i
<SCOPE> ~ 'SCOPE':i
<SCOPE_CATALOG> ~ 'SCOPE_CATALOG':i
<SCOPE_NAME> ~ 'SCOPE_NAME':i
<SCOPE_SCHEMA> ~ 'SCOPE_SCHEMA':i
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
<SERVER_NAME> ~ 'SERVER_NAME':i
<SESSION> ~ 'SESSION':i
:lexeme ~ <SESSION_USER>  priority => 1
<SESSION_USER> ~ 'SESSION_USER':i
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
<SPECIFIC_NAME> ~ 'SPECIFIC_NAME':i
:lexeme ~ <SQL>  priority => 1
<SQL> ~ 'SQL':i
:lexeme ~ <SQLEXCEPTION>  priority => 1
<SQLEXCEPTION> ~ 'SQLEXCEPTION':i
:lexeme ~ <SQLSTATE>  priority => 1
<SQLSTATE> ~ 'SQLSTATE':i
<SQLSTATE_TYPE> ~ 'SQLSTATE_TYPE':i
:lexeme ~ <SQLWARNING>  priority => 1
<SQLWARNING> ~ 'SQLWARNING':i
<SQRT> ~ 'SQRT':i
:lexeme ~ <START>  priority => 1
<START> ~ 'START':i
<STATE> ~ 'STATE':i
<STATEMENT> ~ 'STATEMENT':i
:lexeme ~ <STATIC>  priority => 1
<STATIC> ~ 'STATIC':i
<STDDEV_POP> ~ 'STDDEV_POP':i
<STDDEV_SAMP> ~ 'STDDEV_SAMP':i
<STRUCTURE> ~ 'STRUCTURE':i
<STYLE> ~ 'STYLE':i
<SUBCLASS_ORIGIN> ~ 'SUBCLASS_ORIGIN':i
:lexeme ~ <SUBMULTISET>  priority => 1
<SUBMULTISET> ~ 'SUBMULTISET':i
<SUBSTRING> ~ 'SUBSTRING':i
<SUM> ~ 'SUM':i
:lexeme ~ <SYMMETRIC>  priority => 1
<SYMMETRIC> ~ 'SYMMETRIC':i
:lexeme ~ <SYSTEM>  priority => 1
<SYSTEM> ~ 'SYSTEM':i
:lexeme ~ <SYSTEM_USER>  priority => 1
<SYSTEM_USER> ~ 'SYSTEM_USER':i
:lexeme ~ <TABLE>  priority => 1
<TABLE> ~ 'TABLE':i
<TABLESAMPLE> ~ 'TABLESAMPLE':i
<TABLE_NAME> ~ 'TABLE_NAME':i
<TEMPORARY> ~ 'TEMPORARY':i
:lexeme ~ <THEN>  priority => 1
<THEN> ~ 'THEN':i
<TIES> ~ 'TIES':i
:lexeme ~ <TIME>  priority => 1
<TIME> ~ 'TIME':i
:lexeme ~ <TIMESTAMP>  priority => 1
<TIMESTAMP> ~ 'TIMESTAMP':i
:lexeme ~ <TIMEZONE_HOUR>  priority => 1
<TIMEZONE_HOUR> ~ 'TIMEZONE_HOUR':i
:lexeme ~ <TIMEZONE_MINUTE>  priority => 1
<TIMEZONE_MINUTE> ~ 'TIMEZONE_MINUTE':i
:lexeme ~ <TO>  priority => 1
<TO> ~ 'TO':i
<TOP_LEVEL_COUNT> ~ 'TOP_LEVEL_COUNT':i
:lexeme ~ <TRAILING>  priority => 1
<TRAILING> ~ 'TRAILING':i
<TRANSACTION> ~ 'TRANSACTION':i
<TRANSACTIONS_COMMITTED> ~ 'TRANSACTIONS_COMMITTED':i
<TRANSACTIONS_ROLLED_BACK> ~ 'TRANSACTIONS_ROLLED_BACK':i
<TRANSACTION_ACTIVE> ~ 'TRANSACTION_ACTIVE':i
<TRANSFORM> ~ 'TRANSFORM':i
<TRANSFORMS> ~ 'TRANSFORMS':i
<TRANSLATE> ~ 'TRANSLATE':i
:lexeme ~ <TRANSLATION>  priority => 1
<TRANSLATION> ~ 'TRANSLATION':i
:lexeme ~ <TREAT>  priority => 1
<TREAT> ~ 'TREAT':i
:lexeme ~ <TRIGGER>  priority => 1
<TRIGGER> ~ 'TRIGGER':i
<TRIGGER_CATALOG> ~ 'TRIGGER_CATALOG':i
<TRIGGER_NAME> ~ 'TRIGGER_NAME':i
<TRIGGER_SCHEMA> ~ 'TRIGGER_SCHEMA':i
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
<USER_DEFINED_TYPE_CATALOG> ~ 'USER_DEFINED_TYPE_CATALOG':i
<USER_DEFINED_TYPE_CODE> ~ 'USER_DEFINED_TYPE_CODE':i
<USER_DEFINED_TYPE_NAME> ~ 'USER_DEFINED_TYPE_NAME':i
<USER_DEFINED_TYPE_SCHEMA> ~ 'USER_DEFINED_TYPE_SCHEMA':i
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
:lexeme ~ <VAR_POP>  priority => 1
<VAR_POP> ~ 'VAR_POP':i
:lexeme ~ <VAR_SAMP>  priority => 1
<VAR_SAMP> ~ 'VAR_SAMP':i
<VIEW> ~ 'VIEW':i
:lexeme ~ <WHEN>  priority => 1
<WHEN> ~ 'WHEN':i
:lexeme ~ <WHENEVER>  priority => 1
<WHENEVER> ~ 'WHENEVER':i
:lexeme ~ <WHERE>  priority => 1
<WHERE> ~ 'WHERE':i
:lexeme ~ <WIDTH_BUCKET>  priority => 1
<WIDTH_BUCKET> ~ 'WIDTH_BUCKET':i
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
<_> ~ '_':i
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
<lex003_Many> ~ [0-9]*
<lex557_Many> ~ [\d]+
<lex568_Many> ~ [^\s]+
<lex585_Many> ~ [^\s]+
<lex586_Many> ~ [^\s]+
<lex597_Many> ~ [^\s]+
<lex601_Many> ~ [^\s]+
<lex602_Many> ~ [^\s]+
<lex604_Many> ~ [^\s]+
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

