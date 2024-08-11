## A very simple 'skeleton' extension

This sample extension exemplifies an organization that some might
find useful in writing language extensions for ableC.

The `grammars` directory contains all the Silver source of the
language extension.

The `examples` directory demonstrates how to create an ableC compiler
using the extension and some sample programs using that extension.
This directory contains a script that can be used to compile and
run the examples.

The `tests` directory contains some positive and negative tests of
various features of the extension.  

Header files containing definitions used by the extension are placed
in the `include` directory.  

At the top level, a `Makefile` is provided to allow examples,
modular analyses, and tests to be easily built by running `make`.

Extension designers are of course free to organize files as they
choose.  This is simply an example that works well for us.

## Modular analysis of language extensions

Silver and Copper provide two modular analyses that provide strong
composability guarantees to the programmer using a set of
independently-developed language extensions.

Specifically, any set of language extensions that pass the analyses
can be automatically composed to form a working compiler.

Each of these analysis are to be run by the extension developer on
their extension.  If the extension fails to pass the analysis, the
extension designer needs to modify the extension specification to make
it pass.

The first analysis is the *modular determinism analysis* and it
ensures that the composed specification of the lexical and
context-free syntax of ambiguities.

The second is the *modular well-definedness analysis*.  It ensures
that the composed attribute grammar is well-defined and thus the
semantic analysis and code generation phases will complete
successfully.

The `make mda` and `make mwda` commands allow the programmer to verify
that the extensions do in fact pass these modular analyses.

