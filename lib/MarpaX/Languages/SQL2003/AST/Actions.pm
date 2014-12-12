use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::SQL2003::AST::Actions;
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

sub _nonTerminalSemantic { croak "Please implement the _nonTerminalSemantic action!"; }

# ----------------------------------------------------------------------------------------

sub _getRuleDescription {
  my ($self) = @_;

  my $rule_id     = $Marpa::R2::Context::rule;
  my $slg         = $Marpa::R2::Context::slg;
  my ($lhs, @rhs) = map { $slg->symbol_display_form($_) } $slg->rule_expand($rule_id);

  return ($lhs, @rhs);
}

1;
