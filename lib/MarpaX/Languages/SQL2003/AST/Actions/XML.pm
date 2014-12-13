use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::SQL2003::AST::Actions::XML;
use parent 'MarpaX::Languages::SQL2003::AST::Actions';
use SUPER;
use XML::LibXML;
use Scalar::Util qw/blessed/;

# ABSTRACT: Translate SQL-2003 source to an AST - XML semantic actions

# VERSION

=head1 DESCRIPTION

This modules give the XML semantic actions associated to SQL-2003 grammar

=cut

sub new {
    my $class = shift;
    my $self = {
		dom => XML::LibXML::Document->new(),
	       };
    bless($self, $class);
    return $self;
}

# ----------------------------------------------------------------------------------------

sub _nonTerminalSemantic {
  my $self = shift;

  my ($lhs, @rhs) = $self->_getRuleDescription();

  my $maxRhs = $#rhs;

  $lhs =~ s/^<//;
  $lhs =~ s/>$//;

  my $node = XML::LibXML::Element->new($lhs);

  foreach (0..$#_) {
    my $index = $_;
    my $child;
    if (! blessed($_[$index])) {
      #
      # This is a lexeme
      #
      $child = XML::LibXML::Element->new($rhs[$index]);
      $child->setAttribute('start',  $_[$index]->[0]);
      $child->setAttribute('length', $_[$index]->[1]);
      $child->setAttribute('text',   $_[$index]->[2]);
      $child->setAttribute('value',  $_[$index]->[3]);
      my $i = 4;
      while ($#{$_[$index]} >= $i) {
	$child->setAttribute($_[$index]->[$i], $_[$index]->[$i+1]);
	$i += 2;
      }
    } else {
      $child = $_[$index];
    }
    $node->addChild($child);
  }

  my $rc;

  if ($lhs eq 'SQL Start Sequence') {
    $self->{dom}->setDocumentElement($node);
    $rc = $self->{dom};
  } else {
    $rc = $node;
  }

  return $rc;
}

# ----------------------------------------------------------------------------------------

sub _lexemeValue {
  my ($self, $node) = @_;

  if (! defined($node)) {
    return undef;
  }

  return $node->getAttribute('value');
}

# ----------------------------------------------------------------------------------------

sub _lexemeStart {
  my ($self, $node) = @_;

  if (! defined($node)) {
    return undef;
  }

  return $node->getAttribute('start');
}

# ----------------------------------------------------------------------------------------

sub _lexemeLength {
  my ($self, $node) = @_;

  if (! defined($node)) {
    return undef;
  }

  return $node->getAttribute('length');
}

# ----------------------------------------------------------------------------------------

sub _childByIndex {
  my ($self, $node, $index) = @_;

  if (! defined($node)) {
    return undef;
  }

  my $i = -1;
  my $child = $node->firstChild();
  while (++$i < $index) {
    $child = $child->nextSibling();
  }

  return $child;
}

# ----------------------------------------------------------------------------------------

sub _unicodeDelimitedIdentifier { super(); }

# ----------------------------------------------------------------------------------------

sub _unicodeDelimitedIdentifierUescape { super(); }

# ----------------------------------------------------------------------------------------

sub _showProgressAndExit { super(); }

# ----------------------------------------------------------------------------------------

sub _nationalCharacterStringLiteral { super(); }

# ----------------------------------------------------------------------------------------

sub _characterStringLiteral { super(); }

# ----------------------------------------------------------------------------------------

sub _signedNumericLiteral { super(); }

# ----------------------------------------------------------------------------------------

sub _unsignedNumericLiteral { super(); }

# ----------------------------------------------------------------------------------------

1;
