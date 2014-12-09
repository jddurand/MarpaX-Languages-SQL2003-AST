use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::SQL2003::AST::Actions::Blessed;
use XML::LibXML;
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

sub _getRuleDescription {
  my ($self) = @_;

  my $rule_id     = $Marpa::R2::Context::rule;
  my $slg         = $Marpa::R2::Context::slg;
  my ($lhs, @rhs) = map { $slg->symbol_display_form($_) } $slg->rule_expand($rule_id);

  return ($lhs, @rhs);
}
1;
