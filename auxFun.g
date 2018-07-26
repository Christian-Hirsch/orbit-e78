##############################################################
#Swap a and b
##############################################################
####
# Arguments
#        root: string of form "ai" or "bi"
####
# Result
#	"ai" if input was "bi" and "bi" if input was "ai"
####
partner:=function(root)
	local ab;
	if root[1]='a' then ab:='b'; else ab:='a';fi;
	return [ab, root[2]];
end;

##############################################################
#Count number of (ai,bi) pairs in a list
##############################################################
####
# Arguments
#       rootList: list of roots
####
# Result
#	number of (ai,bi) pairs in the input
####
partnerCount:=function(rootList)
	local element,counter,p;
	counter:=0;
	for element in rootList do
		if (partner(element) in rootList) then 
			counter:=counter+1;
		fi;
	od;
	return QuoInt(counter,2);
end;

##############################################################
#Count number of 'a'-roots contained in a list 
##############################################################
####
# Arguments
#       rootList: list of roots
####
# Result
#	number of 'a'-roots in the input
####
aCount:=function(rootList)
local element,counter;
counter:=0;
for element in rootList do
	if element[1]='a' then counter:=counter+1;fi;
od;
return counter;
end;

##############################################################
#Apply dictionary to list of lists
##############################################################
####
# Arguments
#        list: list of lists indexes
#        dictionary: array
####
# Result
#       list of list  words corresponding as determined by the
#	list of list of indexes
###
map:=function(listList, dictionary)
local list,transcriptionList,result,result_el,element;
	result:=[];
	for list in listList do
		result_el:=[];
		for element in list do
			Add(result_el,dictionary[element]);
		od;
		Add(result,result_el);
	od;
return result;
end;


###############################################################
#Check if action structure for E7 is correct
##############################################################
####
# Arguments
#        rootLists: list of lists of roots 
####
# Result
#	false if the input contains a list of type [ai,bi,a4]
#	or a list of type [x1,y2,z3] with an even number of 
#	a's
####
e7Correct:=function(rootLists)
	if( 	(["b1","b2","b3"] in rootLists) or
		(["a1","a2","b3"] in rootLists) or
		(["a1","b2","a3"] in rootLists) or
		(["b1","a2","a3"] in rootLists) or
		(["a1","b1","a4"] in rootLists) or
		(["a2","b2","a4"] in rootLists) or
		(["a3","b3","a4"] in rootLists)) then 
		return false;
	fi;
	return true;
end;

###############################################################
#Check if action structure for E8 is correct
##############################################################
####
# Arguments
#        rootLists: list of lists of roots 
####
# Result
#	true if every list in the input is either of the form
#	[w1, x2, y3, z4] with an odd number of a's or of the
#	form [ai,bi,xj,yk]
####
e8Correct:=function(rootLists)
	local list;
	for list in rootLists do
		if( 	partnerCount(list)=2 or
			(partnerCount(list)=0 and
			((aCount(list) mod 2)=0))
			) then
			return false;
		fi;
	od;
	return true;
	end;


