use Test;
use Algorithm::Open-Simplex;

my $algo  = Algorithm::Open-Simplex.new(:seed(666));
my $algo2 = Algorithm::Open-Simplex.new(:seed(666));
plan 1;
ok $algo.noise2d(2.0, 4.0) == $algo2.noise2d(2.0, 4.0);
