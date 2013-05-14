package WWW::GetProve::Verification;
# ABSTRACT: Verification response object

=head1 SYNOPSIS

=cut

use Moo;
use DateTime;
use DateTime::Format::ISO8601;

for my $attr (qw( id tel country )) {
	has $attr => (
		is => 'ro',
		predicate => 1,
		coerce => sub { "$_[0]" },
	);
}

for my $attr (qw( test verified call text )) {
	has $attr => (
		is => 'ro',
		predicate => 1,
		coerce => sub { $_[0] ? 1 : 0 },
	);
}

for my $attr (qw( created updated )) {
	has $attr => (
		is => 'ro',
		predicate => 1,
		isa => sub {
			die $_[0]." need to be DateTime object (or an ISO8601 string that we coerce to it)" unless ref $_[0] && $_[0]->isa('DateTime')
		},
		coerce => sub {
			DateTime::Format::ISO8601->parse_datetime($_[0]) unless ref $_[0] && $_[0]->isa('DateTime')
		},
	);
}

1;