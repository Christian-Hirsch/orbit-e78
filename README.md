# Technical Appendix for the article "On the mod 2 invariants of Weyl groups"

This repository provides the code used in the techincal appendix of the article [On the mod 2 invariants of Weyl groups](https://arxiv.org/abs/1805.04670). 

The determination of the mod 2 invariants for the Weyl groups in the cases <img src="http://latex.codecogs.com/svg.latex?W(E_7)" /> and <img src="http://latex.codecogs.com/svg.latex?W(E_8)" /> relies on Lemmas 4.21 and 4.22. In their proof information on the orbit structure of a group action of maximal elementary abelian 2-subgroups generated by reflections on certain cosets. Here, we explain how to extract this information using a short `GAP` script.

More precisely, the setting concerns the action of a maximal elementary abelian 2-subgroup <img src="http://latex.codecogs.com/svg.latex?P=P(S){\subset}W(E_n)" />  generated by reflections at the roots <img src="http://latex.codecogs.com/svg.latex?S" /> on the cosets <img src="http://latex.codecogs.com/svg.latex?U{\setminus} W(E_n)" /> for a suitable subgroup <img src="http://latex.codecogs.com/svg.latex?U{\subset}W(E_n)" />. The `GAP` script provides for each orbit <img src="http://latex.codecogs.com/svg.latex?\mathcal{O}_k" /> of this action a subset <img src="http://latex.codecogs.com/gif.latex?S_k{\subset}S" /> of all roots such that
1. The action of <img src="http://latex.codecogs.com/svg.latex?P(S_k)" /> is simply transitive on <img src="http://latex.codecogs.com/svg.latex?\mathcal{O}_k" /> and 
2. The action of <img src="http://latex.codecogs.com/svg.latex?P(S\setminus{S_k})" /> on <img src="http://latex.codecogs.com/svg.latex?\mathcal{O}_k" /> is trivial.


## Prerequisites

Version 3.4 of the [GAP system](https://www.gap-system.org) together with the [CHEVIE](http://www.math.rwth-aachen.de/~CHEVIE/) library. Most conveniently installed by following https://webusers.imj-prg.fr/~jean.michel/gap3/

## Usage

The core code is contained in the [orbitStructure.g](./orbitStructure.g) file, whereas [auxFun.g](./auxFun.g) contains auxiliary functions. 

### E7
Within a `GAP` session load the required packages via
```sh
 Read("../auxFun.g");
 Read("../orbitStructure.g");
```
adapting the file paths if necessary. In `GAP` the subgroups <img src="http://latex.codecogs.com/gif.latex?$U$" />  and <img src="http://latex.codecogs.com/gif.latex?$P$" /> are represented by the indices [2, 4, 5, 6, 7, 63] and
[3, 2, 5, 28, 7, 49, 63], respectively:
```sh
 SU:=[2, 4, 5, 6, 7, 63];
 SP:=[3, 2, 5, 28, 7, 49, 63];
```
The asserted subsets of `SP` are then determined via
```sh
X:= fullCheck(7, SU, SP);
```
Next, we filter the subsets consisting of at most 3 roots.
```sh
Y:=Filtered(X,x-> Length(x)<=3);   
```
Then, `Y` consists of the 28 elements described in Lemma 4.21. This can be verified either by direct comparison, or by calling 
```sh
e7Correct(Y);
true
```

### E8
Dealing with E8 involves only small modifications. First, the subgroups are now determined by the root systems

```sh
 SU:=[2,4,5,6,7,8,97];
 SP:=[3,2,5,32,7,61,97,120];
```
Then, we determine again the sybsets of `SP` via 
```sh
X:= fullCheck(8, SU, SP);
```
The computation can take between 10 and 30 minutes depending on the underlying hardware. We filter the subsets consisting now of at most 4 roots.
```sh
Y:=Filtered(X,x-> Length(x)<=4);   
```
Then, `Y` consists of the 56 elements described in Lemma 4.22. This can be verified either by direct comparison, or by calling 
```sh
e8Correct(Y);
true
```
