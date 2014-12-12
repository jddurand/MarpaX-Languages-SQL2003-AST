use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::SQL2003::AST::Actions;
use Marpa::R2;
use Carp qw/croak/;

# ABSTRACT: Translate SQL-2003 source to an AST - Semantic actions generic class

# VERSION

=head1 DESCRIPTION

This modules give a semantic actions generic class associated to SQL-2003 grammar

=cut

sub new {
    my $class = shift;
    my $self = {};
    bless($self, $class);
    return $self;
}

# ----------------------------------------------------------------------------------------

sub _nonTerminalSemantic { croak "Please implement the _nonTerminalSemantic method!"; }

# ----------------------------------------------------------------------------------------

sub _lexemeValue { croak "Please implement the _lexemeValue method!"; }

# ----------------------------------------------------------------------------------------

sub _lexemeStart { croak "Please implement the _lexemeStart method!"; }

# ----------------------------------------------------------------------------------------

sub _lexemeLength { croak "Please implement the _lexemeLength method!"; }

# ----------------------------------------------------------------------------------------

sub _childByIndex { croak "Please implement the _childByIndex method!"; }
sub _firstChild { my $self = shift; return $self->_childByIndex(@_, 0) }
sub _secondChild { my $self = shift; return $self->_childByIndex(@_, 1) }

# ----------------------------------------------------------------------------------------

sub _getRuleDescription {
  my ($self) = @_;

  my $rule_id     = $Marpa::R2::Context::rule;
  my $slg         = $Marpa::R2::Context::slg;
  my ($lhs, @rhs) = map { $slg->symbol_display_form($_) } $slg->rule_expand($rule_id);

  return ($lhs, @rhs);
}

# ----------------------------------------------------------------------------------------

sub _showProgressAndExit {
  my $slr         = $Marpa::R2::Context::slr;

  die $slr->show_progress();
}

# ----------------------------------------------------------------------------------------

sub _unicodeValue {
  my ($self, $start, $length, $Unicode_Delimited_Identifier_Value, $Unicode_Escape_Specifier_Value) = @_;

  #
  # $Unicode_Escape_Specifier_Value is in the form 'X'
  #
  if ($Unicode_Escape_Specifier_Value =~ /[a-fA-F0-9]/   # <hexit>
      ||
      $Unicode_Escape_Specifier_Value eq '+'             # <plus sign>
      ||
      $Unicode_Escape_Specifier_Value =~ /\s/            # <white space>, whatever this mean
     ) {
    croak "Unicode specifier '$Unicode_Escape_Specifier_Value' (" . sprintf("0x%x", $Unicode_Escape_Specifier_Value) . ") is not allowed";
  }
  #
  # Now that we have the unicode specifier, redo on-the-fly a grammar that is handling the full text!
  #
  $self->{Unicode_Escape_Specifier} //= {};
  if (! defined($self->{Unicode_Escape_Specifier}->{$Unicode_Escape_Specifier_Value})) {
    my $Unicode_Escape_Specifier_Hex = sprintf('%x', ord($Unicode_Escape_Specifier_Value));
    my $data = <<GRAMMAR;
#
# No notion of discard here. We can write everything in G1
#
:default ::= action => ::first
:start ::= <Unicode delimited identifier value>

<Unicode delimited identifier value> ::= ('U&"') <Unicode delimiter body> ('"')

<nondoublequote character> ~ [^"]
                           | [\\x{$Unicode_Escape_Specifier_Hex}] '"'

<Unicode delimiter body> ::= <Unicode identifier part>+ action => MarpaX::Languages::SQL2003::AST::Actions::_concat
<Unicode identifier part> ::= <Unicode delimited identifier part>
                            | <Unicode escape value>

<Unicode delimited identifier part> ::= <nondoublequote character>   action => MarpaX::Languages::SQL2003::AST::Actions::_lastChar
                                      | <doublequote symbol>

<doublequote symbol> ::= '""' action => MarpaX::Languages::SQL2003::AST::Actions::_lastChar

<Unicode escape value> ::=
		<Unicode 4 digit escape value> action => MarpaX::Languages::SQL2003::AST::Actions::_Unicode4
	|	<Unicode 6 digit escape value> action => MarpaX::Languages::SQL2003::AST::Actions::_Unicode4
	|	<Unicode character escape value> action => MarpaX::Languages::SQL2003::AST::Actions::_UnicodeEscape


<hexit> ~ [a-fA-f0-9]

<Unicode 4 digit escape value> ~ [\\x{$Unicode_Escape_Specifier_Hex}] <hexit> <hexit> <hexit> <hexit>
<Unicode 6 digit escape value> ~ [\\x{$Unicode_Escape_Specifier_Hex}] '+' <hexit> <hexit> <hexit> <hexit> <hexit> <hexit>
<Unicode character escape value> ~ [\\x{$Unicode_Escape_Specifier_Hex}] [\\x{$Unicode_Escape_Specifier_Hex}]

GRAMMAR
    $self->{Unicode}->{$Unicode_Escape_Specifier_Value} = Marpa::R2::Scanless::G->new({source => \$data});
  }
  my $r = Marpa::R2::Scanless::R->new({grammar => $self->{Unicode}->{$Unicode_Escape_Specifier_Value},
                                       # trace_terminals => 1,
                                       # trace_values => 1,
                                       semantics_package => 'MarpaX::Languages::SQL2003::AST::Actions'});
  $r->read(\$Unicode_Delimited_Identifier_Value);
  #
  # Fake this is a lexeme
  #
  my $text = ${$r->value};
  #
  # Unicode stuff. Make sure this has the UTF8 flag in perl.
  # Otherwise you might hit the "error: string is not in UTF-8".
  #
  utf8::upgrade($text);
  return [$start, $length, $text];
}

# ----------------------------------------------------------------------------------------

sub _unicodeDelimitedIdentifier {
  my ($self, $Unicode_Delimited_Identifier_Lexeme) = @_;

  #
  # $Unicode_Delimited_Identifier_Value is a lexeme, not yet processed
  #
  my $Unicode_Delimited_Identifier_Value = $Unicode_Delimited_Identifier_Lexeme->[2];

  my $start = $Unicode_Delimited_Identifier_Lexeme->[0];
  my $length = $Unicode_Delimited_Identifier_Lexeme->[1];

  return $self->_unicodeValue($start, $length, $Unicode_Delimited_Identifier_Value, '\\');
}

# ----------------------------------------------------------------------------------------

sub _unicodeDelimitedIdentifierUescape {
  my ($self, $Unicode_Delimited_Identifier_Lexeme, $separator_L0_any, $Unicode_Escape_Specifier) = @_;

  #
  # $Unicode_Delimited_Identifier_Value is a lexeme, not yet processed
  #
  my $Unicode_Delimited_Identifier_Value = $Unicode_Delimited_Identifier_Lexeme->[2];
  #
  # $Unicode_Escape_Specifier is: 
  # <Unicode_Escape_Specifier> ::= <XXX_Maybe>
  # <XXX_Maybe> ::= <XXX>
  # <XXX_Maybe> ::=
  # <XXX> ::= <UESCAPE> <LEXEME>
  # where LEXEME is the escape specifier. Constraint is:
  # Syntax rule 15: <Unicode escape character> shall be a single character
  # from the source language character set other than a <hexit>, <plus
  # sign>, or <white space>.
  my $Unicode_Escape_Specifier_Lexeme = $self->_secondChild($self->_firstChild($self->_firstChild($Unicode_Escape_Specifier)));
  my $Unicode_Escape_Specifier_Value = $self->_lexemeValue($Unicode_Escape_Specifier_Lexeme);

  my $start = $Unicode_Delimited_Identifier_Lexeme->[0];
  my $end = $self->_lexemeStart($Unicode_Escape_Specifier_Lexeme) + $self->_lexemeLength($Unicode_Escape_Specifier_Lexeme) - 1;
  my $length = $end - $start;

  substr($Unicode_Escape_Specifier_Value,  0, 1) = '';
  substr($Unicode_Escape_Specifier_Value, -1, 1) = '';

  return $self->_unicodeValue($start, $length, $Unicode_Delimited_Identifier_Value, $Unicode_Escape_Specifier_Value);
}

# ----------------------------------------------------------------------------------------

sub _concat {
  my ($self, @args) = @_;

  return join('', @args);
}

# ----------------------------------------------------------------------------------------

sub _lastChar {
  my ($self, $string) = @_;

  return substr($string, -1, 1);
}

# ----------------------------------------------------------------------------------------

sub _Unicode6 {
  # <Unicode 6 digit escape value> ~ [\\x{$Unicode_Escape_Specifier_Hex}] '+' <hexit> <hexit> <hexit> <hexit> <hexit> <hexit>
  my ($self, $unicode) = @_;

  substr($unicode, 0, 2) = '';

  return chr(hex($unicode));
}

# ----------------------------------------------------------------------------------------

sub _Unicode4 {
  # <Unicode 4 digit escape value> ~ [\\x{$Unicode_Escape_Specifier_Hex}] <hexit> <hexit> <hexit> <hexit>
  my ($self, $unicode) = @_;

  substr($unicode, 0, 1) = '';

  return chr(hex($unicode));
}

# ----------------------------------------------------------------------------------------

sub _UnicodeEscape {
  # <Unicode character escape value> ~ [\\x{$Unicode_Escape_Specifier_Hex}] [\\x{$Unicode_Escape_Specifier_Hex}]
  my ($self, $unicode) = @_;

  substr($unicode, 0, 1) = '';

  return $unicode;
}

# ----------------------------------------------------------------------------------------

1;
