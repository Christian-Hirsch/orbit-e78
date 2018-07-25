# Technical Appendix for the article "On the mod 2 invariants of Weyl groups"

This repository provides the code used in the techincal appendix of the article [On the mod 2 invariants of Weyl groups](https://arxiv.org/abs/1805.04670). 

The determination of the mod 2 invariants for the Weyl groups in the cases $W(E_7)$ and $W(E_8)$ relies on Lemmas 4.21 and 4.22. In their proof information on the orbit structure of a group action of maximal elementary abelian 2-subgroups on certain cosets. Here, we explain how to extract this information using a short `GAP` program.


## Prerequisite

Version 3.4 of the [GAP system](https://www.gap-system.org) together with the [CHEVIE](http://www.math.rwth-aachen.de/~CHEVIE/) library. Most conveniently installed by following https://webusers.imj-prg.fr/~jean.michel/gap3/

## Getting Started

The core programming code is contained in the [coxOrbit](./coxOrbit) script. Further details TBA.
