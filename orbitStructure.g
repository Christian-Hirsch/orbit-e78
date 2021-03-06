##############################################################
#Retrieve group action structure from orbits
##############################################################
#This is the core procedure and uses the orbits computed from
#fullCheck as input
####
# Arguments
#        W: Weyl group
#        orbits: orbits computed for the action of P on cosets
#        PRoots: Roots generating the group P
####
# Result
#       An array "solution" such that P(solution[k]) is an elementary abelian 2-subgroup generated by reflections acting simply transitively on the k-th orbit of "orbits".
###



orbitStruct:=function(W,orbits,PRoots)
local element,i,isMover,isSimplyTransitive,measgrSize,movers,moversroots,orbit,PPerm,Q,refl,root,solution;

PPerm:=[];
solution:=[];

#Determine the permutational representation of the basis elements of the maximal elementary abelian subgroup generated by reflections on the root system of W
for root in PRoots do
	Add(PPerm,Reflections(W)[root]);
od;

for orbit in orbits do 

#first determine those basis elements P which do not fix the orbit pointwise
	movers:=[];
	moversroots:=[];
	for i in [1..Length(PRoots)] do
		isMover:=false;

		#check if the ith basis element of the maximal elementary abelian subroup gen. by reflections fixes the orbit pointwise
		refl:=PPerm[i];
			for element in orbit do
				if not(isMover) then 
					isMover:=not(element*refl=element);
				fi;
			od;

		#otherwise add it to the solution set
		if isMover then 
			Add(movers,i);
			Add(moversroots,PRoots[i]);
		fi;
	od;
	
	# now check, if the operation of movers on the orbit is simply transitive
	Q:=ReflectionSubgroup(W,moversroots);
	if (not(IsRegular(Q,orbit,OnRight))) then 
		Print("Action not simply transitive!");
	fi;
	Add(solution,movers);
od;
return solution;
end;

##############################################################
#Retrieve the group action structure from root system data
##############################################################
#First compute cosets U\W(E_n) and the associated orbits under 
#right multiplication by P. Then, it checks that for each 
#orbit there exists an elementary abelian 2-subgroup of P
#generated by reflections acting simply transitively on the
#kth orbit. 
####
# Arguments
#        n: 7 or 8
#        URoots: Roots generating the group U
#        PRoots: Roots generating the group P
####
# Result
#       An array "solution" such that P(solution[k]) is an elementary abelian 2-subgroup acting simply transitively on the k-th orbit of "orbits".
###
fullCheck:=function(n,URoots,PRoots)
local W,U,P,RCosets,orbs,solution;

#Compute subgroups
W:=CoxeterGroup("E",n);
U:=ReflectionSubgroup(W,URoots);
P:=ReflectionSubgroup(W,PRoots);

#Compute cosets
RCosets:=RightCosets(W,U);
Print("Number of Right cosets is ");
Print(Length(RCosets));
Print("\n");

#Compute orbits
orbs:=Orbits(P,RCosets,OnRight);
Print("Orbits computed\n");

#Compute structure of action on orbits
solution:=orbitStruct(W,orbs,PRoots);
return map(solution, ["a1","b1","a2","b2","a3","b3","a4","b4"]);
end;
