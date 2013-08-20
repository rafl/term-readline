#!perl

use Test::More;
eval "use Term::ReadLine::Perl5; 1" or
    plan skip_all => "Term::ReadLine::Perl5 not installed.";

$ENV{PERL_RL} = 'Perl5';

use File::Basename;
use File::Spec;
$term_readline=File::Spec->catfile(dirname(__FILE__), '..', 'lib', 'Term', 'ReadLine.pm');
require $term_readline;
$term = Term::ReadLine->new('T:R:P5');
ok($term, "Created term object");
is($term->ReadLine, 'Term::ReadLine::Perl5', 'Correct type');
done_testing();
