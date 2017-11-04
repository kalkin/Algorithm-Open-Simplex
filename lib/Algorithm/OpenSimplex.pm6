use NativeCall;

my Str $lib;
BEGIN {
    $lib = %?RESOURCES<libraries/opensimplex>.absolute;
}

unit class Algorithm::OpenSimplex;

class Struct is repr('CStruct') is rw {
    has Pointer[int16] $.perm is rw;
    has Pointer[int16] $.permGradIndex3D is rw;
}

has $!struct;
has int64 $.seed = time;

submethod BUILD(:$!seed) {
    my Pointer[Struct] $pointer .= new;
    open_simplex_noise($!seed, $pointer);
    $!struct := $pointer.deref;
}

method noise2d(Num(Numeric) $x, Num(Numeric) $y) returns num64 {
    return open_simplex_noise2($!struct, $x, $y);
}

method noise3d(Num(Numeric) $x, Num(Numeric) $y, Num(Numeric) $z) returns num64 {
    return open_simplex_noise3($!struct, $x, $y, $z);
}

method noise4d(Num(Numeric) $w, Num(Numeric) $x, Num(Numeric) $y, Num(Numeric) $z) returns num64 {
    return open_simplex_noise4($!struct, $w, $x, $y, $z);
}

method DESTROY() { open_simplex_noise_free($!struct) }

sub open_simplex_noise(int64, Pointer[Struct] is rw) is native($lib) returns int32 {*}
sub open_simplex_noise2(Struct, num64, num64) is native($lib) returns num64 {*}
sub open_simplex_noise3(Struct, num64, num64, num64) is native($lib) returns num64 {*}
sub open_simplex_noise4(Struct, num64, num64, num64, num64) is native($lib) returns num64 {*}
sub open_simplex_noise_free(Struct) is native($lib) returns Nil {*}
