use Test;
use Algorithm::Open-Simplex-Noise;

my $algo  = Algorithm::Open-Simplex-Noise.new(:seed(666));
my $algo2 = Algorithm::Open-Simplex-Noise.new(:seed(666));
plan 1;
ok $algo.noise2d(2.0, 4.0) == $algo2.noise2d(2.0, 4.0);
