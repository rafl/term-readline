#!perl

use strict;
use warnings;
use Test::More 0.89;

BEGIN { $ENV{PERL_RL} = 'Perl5' }

use Term::ReadLine;

my $term = Term::ReadLine->new('T:R:P5');

# We can't load Term::ReadLine::Perl5 before Term::ReadLine as there's a
# circular require that'll screw up driver detection.

eval "use Term::ReadLine::Perl5; 1" or
    plan skip_all => "Term::ReadLine::Perl5 not installed.";

is($term->ReadLine, 'Term::ReadLine::Perl5', 'Correct type');

done_testing;
