Major requirements:

The abstract syntax for the language LAMBDA
is given in the file project.sats. This form
of syntax is often referred to as level-0 syntax.

This final project of yours should contain
the following component:

1.

fun trans01_tpgm: t0pgm -> t1pgm

[trans01_tpgm] translates from level-0
syntax to level-1 syntax (which is also
given in project.sats). This translation
should properly resolving all the binding
issues due to lexical scoping.

2.

Type-checking based on so-called type inference
of Hindely-style should be implemented on the
level-1 syntax.

3.

A interpreter for LAMBD based on the level-1 syntax
should be implemented.

4.

Please design your own level-2 syntax for some sort
of low-level language and then implement a function that
emits C code for a program in this low-level language.
