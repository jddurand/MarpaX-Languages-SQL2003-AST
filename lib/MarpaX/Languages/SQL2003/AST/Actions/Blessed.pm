use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::SQL2003::AST::Actions::Blessed;
use parent 'MarpaX::Languages::SQL2003::AST::Actions';
use SUPER;
use Scalar::Util qw/blessed/;

# ABSTRACT: Translate SQL-2003 source to an AST - Blessed semantic actions

# VERSION

=head1 DESCRIPTION

This modules give the blessed semantic actions associated to SQL-2003 grammar

=cut

sub new {
    my $class = shift;
    my $self = {};
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

  my @array = ();

  foreach (0..$#_) {
    my $child;
    if (! blessed($_[$_])) {
      #
      # This is a lexeme
      #
      $child = bless($_[$_], $rhs[$_]);
    } else {
      $child = $_[$_];
    }
    push(@array, $child);
  }

  return bless(\@array, $lhs);
}

# ----------------------------------------------------------------------------------------

sub _lexemeValue {
  my ($self, $node) = @_;

  if (! defined($node)) {
    return undef;
  }

  return $node->[2];
}

# ----------------------------------------------------------------------------------------

sub _lexemeStart {
  my ($self, $node) = @_;

  if (! defined($node)) {
    return undef;
  }

  return $node->[0];
}

# ----------------------------------------------------------------------------------------

sub _lexemeLength {
  my ($self, $node) = @_;

  if (! defined($node)) {
    return undef;
  }

  return $node->[1];
}

# ----------------------------------------------------------------------------------------

sub _childByIndex {
  my ($self, $node, $index) = @_;

  if (! defined($node)) {
    return undef;
  }

  return ($index <= $#{$node}) ? $node->[$index] : undef;
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

1;
