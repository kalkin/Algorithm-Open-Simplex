use NativeCall;

my Str $lib;
BEGIN {
    $lib = %?RESOURCES<libraries/opensimplex>.absolute;
}

unit class Algorithm::Open-Simplex;

class Struct is repr('CStruct') is rw {
    has int16 $.perm is rw = 0;
    has int16 $.permGradIndex3D is rw = 0;
}

has $!struct;
has int64 $.seed = time;

submethod BUILD(:$!seed) {
    $!struct = Struct.new;
    open_simplex_noise($!seed, $!struct);
}

sub open_simplex_noise(int64, Struct is rw) is native($lib) returns int32 {*}


method noise2d(Num(Numeric) $x, Num(Numeric) $y) returns num64 {
    return open_simplex_noise2($!struct, $x, $y);
}

sub open_simplex_noise2(Struct is rw, num64, num64) is native($lib) returns num64 {*}

