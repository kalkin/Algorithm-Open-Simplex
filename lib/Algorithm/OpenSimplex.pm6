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

=begin pod
=head1 NAME

Algorithm::OpenSimplex - n-dimensional gradient noise function

=head1 SYNOPSIS

    use Algorithm::OpenSimplex;
    my $algo   = Algorithm::OpenSimplex.new: :seed(666);
    my $foo1 = $algo.noise2d(1.0, 1.0);
    my $foo2 = $algo.noise3d(1.0, 1.0, 1.0);
    my $foo3 = $algo.noise4d(1.0, 1.0, 1.0, 1.0);

=head1 DESCRIPTION

This is a L<doc:NativeCall> wrapper around an OpenSimplex C implementation.

OpenSimplex noise is an n-dimensional gradient noise function that was developed
in order to overcome the patent-related issues surrounding Simplex noise, while
continuing to also avoid the visually-significant directional artifacts
characteristic of Perlin noise. (source: Wikipedia)

=ACKNOWLEDGEMENT
=item Big thanks to L<geekosaur|https://github.com/geekosaur> for figuring out how to
properly use pointers-to-pointers with L<doc:NativeCall>.
=item L<C implementation|https://github.com/smcameron/open-simplex-noise-in-c> by
L<Stephen M. Cameron|https://github.com/smcameron>
=item L<Original Java Implementation|https://gist.github.com/KdotJPG/b1270127455a94ac5d19>
by L<Kurt Spencer|https://github.com/KdotJPG>


=head1 AUTHOR

Bahtiar `kalkin-` Gadimov bahtiar@gadimov.de


=head1 COPYRIGHT AND LICENSE

Copyright © Bahtiar `kalkin-` Gadimov bahtiar@gadimov.de

This library is free software; you can redistribute it and/or modify it under
the Artistic License 2.0.

=end pod
