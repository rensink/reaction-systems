# ccReact: An Interacting Language for Reaction Systems

Reaction Systems (RSs) are a successful computational framework inspired by
biological systems, where entities are produced by reactions and can be used to
enable or inhibit other reactions. In RSs interaction with the environment is
modelled by a linear sequence of sets of entities called context. 

_ccReact_ is an interaction language for RSs that extends the classic RS
computational model by allowing the specification of possibly recursive,
nondeterministic conditional context sequences, enhancing the interactive
capabilities of the models. This repository contains the specification of
_ccReact_ in the rewriting system [Maude](http://maude.cs.illinois.edu/). Our
implementation allows to:

* Simulate the RS by rewriting;
* Check reachability properties using the `search` command; and 
* Verify CTL and LTL properties using [umaudemc](https://github.com/fadoss/umaudemc).
 
Details about ccReact can be found in [this paper](./paper.pdf),


## Getting started

The project was tested in [Maude 3.2.1](http://maude.cs.illinois.edu/). and
with [umaudemc](https://github.com/fadoss/umaudemc) for model checking LTL and
CTL temporal formulas. 

## Files

- `syntax`: Basic sorts and operators to define reactions, contexts and
  _ccReact_ processes. 
- `semantics`: Rules defining the evaluation of contexts and how the system
  evolve.

The directly `case-studies` contains some simple examples to illustrate the
definition of RSs and the specification of properties. More interesting, we
present different analyses concerning the protein signaling networks in the
HER2-positive subtype breast cancer. 

Additional information about the case studies and the Maude specifications can be 
found in this [paper](./paper.pdf) and the header of the files.
