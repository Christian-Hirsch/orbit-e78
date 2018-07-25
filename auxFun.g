


#check if the list doesn't contain any invariants of type e_3 or v_2x_{\alpha_4}
e7Correct:=function(invList)
	if( 	(["b1","b2","b3"] in invList) or
		(["a1","a2","b3"] in invList) or
		(["a1","b2","a3"] in invList) or
		(["b1","a2","a3"] in invList) or
		(["a1","b1","a4"] in invList) or
		(["a2","b2","a4"] in invList) or
		(["a3","b3","a4"] in invList)) then 
		Print("Fail");
		return;
	fi;
	Print("Ok");Print("\n");
end;

#an input of "a1" gives back "b1"; an input of "b2" gives back "a2", etc.
partner:=function(root)
	if(root="a1") then return "b1";fi;
	if(root="b1") then return "a1";fi;
	if(root="a2") then return "b2";fi;
	if(root="b2") then return "a2";fi;
	if(root="a3") then return "b3";fi;
	if(root="b3") then return "a3";fi;
	if(root="a4") then return "b4";fi;
	if(root="b4") then return "a4";fi;
	Print("Input Fail");
end;

#counts the number of partner-pairs contained in a list
partnerCount:=function(List)
local element,counter,p;
counter:=0;
for element in List do
	p:=partner(element);
	if (p in List) then 
		counter:=counter+1;
	fi;
od;
counter:=QuoInt(counter,2);
return counter;
end;

#counts the number of "a"-roots contained in a list
aCount:=function(List)
local element,counter,aList;
aList:=["a1","a2","a3","a4"];
counter:=0;
for element in List do
	if (element in aList) then counter:=counter+1;fi;
od;
return counter;
end;

#check if the list doesn't contain any invariants of type e_4 or v_4
e8Correct:=function(InvList)
local list;
for list in InvList do
	if( 	partnerCount(list)=2 or
		(partnerCount(list)=0 and
		((aCount(list) mod 2)=0))
		) then
		Print("Fail");
		return;
	fi;
od;
	Print("Ok");Print("\n");
end;


e7Transcription:=function(n)
local dictionary;
if (n>7) then Print("Transcription Fail");return;fi;
dictionary:=["a1","b1","a2","b2","a3","b3","a4"];
return dictionary[n];
end;

e7TranscriptionList:=function(list)
local element,transcription,result;
	result:=[];
	for element in list do
		transcription:=e7Transcription(element);
		Add(result,transcription);
	od;
return result;
end;

e7TranscriptionListList:=function(listList)
local list,transcriptionList,result;
	result:=[];
	for list in listList do
		transcriptionList:=e7TranscriptionList(list);
		Add(result,transcriptionList);
	od;
return result;
end;

e8Transcription:=function(n)
local dictionary;
if (n>8) then Print("Transcription Fail");return;fi;
dictionary:=["a1","b1","a2","b2","a3","b3","a4","b4"];
return dictionary[n];
end;

e8TranscriptionList:=function(list)
local element,transcription,result;
	result:=[];
	for element in list do
		transcription:=e8Transcription(element);
		Add(result,transcription);
	od;
return result;
end;

e8TranscriptionListList:=function(listList)
local list,transcriptionList,result;
	result:=[];
	for list in listList do
		transcriptionList:=e8TranscriptionList(list);
		Add(result,transcriptionList);
	od;
return result;
end;

fullCheckE7:=function(URoots,PRoots)
local W,X,Y;
W:=CoxeterGroup("E",7);
X:=fullCheck(W,URoots,PRoots);
Y:=e7TranscriptionListList(X);
return Y;
end;

fullCheckE8:=function(URoots,PRoots)
local W,X,Y;
W:=CoxeterGroup("E",8);
X:=fullCheck(W,URoots,PRoots);
Y:=e8TranscriptionListList(X);
return Y;
end;

