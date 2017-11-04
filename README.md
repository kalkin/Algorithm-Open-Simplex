[![Build Status](https://travis-ci.org/kalkin/Algorithm-Open-Simplex.svg?branch=master)](https://travis-ci.org/kalkin/Algorithm-Open-Simplex)

NAME
====

Algorithm::OpenSimplex - n-dimensional gradient noise function

SYNOPSIS
========

    use Algorithm::OpenSimplex;
    my $algo   = Algorithm::OpenSimplex.new: :seed(666);
    my $foo1 = $algo.noise2d(1.0, 1.0);
    my $foo2 = $algo.noise3d(1.0, 1.0, 1.0);
    my $foo3 = $algo.noise4d(1.0, 1.0, 1.0, 1.0);

DESCRIPTION
===========

This is a [doc:NativeCall](doc:NativeCall) wrapper around an OpenSimplex C implementation.

OpenSimplex noise is an n-dimensional gradient noise function that was developed in order to overcome the patent-related issues surrounding Simplex noise, while continuing to also avoid the visually-significant directional artifacts characteristic of Perlin noise. (source: Wikipedia)

ACKNOWLEDGEMENT
===============



  * Big thanks to [geekosaur](https://github.com/geekosaur) for figuring out how to properly use pointers-to-pointers with [doc:NativeCall](doc:NativeCall).

  * [C implementation](https://github.com/smcameron/open-simplex-noise-in-c) by [Stephen M. Cameron](https://github.com/smcameron)

  * [Original Java Implementation](https://gist.github.com/KdotJPG/b1270127455a94ac5d19) by [Kurt Spencer](https://github.com/KdotJPG)

AUTHOR
======

Bahtiar `kalkin-` Gadimov bahtiar@gadimov.de

COPYRIGHT AND LICENSE
=====================

Copyright © Bahtiar `kalkin-` Gadimov bahtiar@gadimov.de

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
