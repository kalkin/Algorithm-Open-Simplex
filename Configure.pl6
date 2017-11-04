#!/usr/bin/env perl6
use v6;
use LibraryMake;
my %vars = get-vars('.');
%vars<opensimplex> = $*VM.platform-library-name('opensimplex'.IO);
mkdir "resources" unless "resources".IO.e;
mkdir "resources/libraries" unless "resources/libraries".IO.e;
process-makefile('.', %vars);
shell(%vars<MAKE>);
