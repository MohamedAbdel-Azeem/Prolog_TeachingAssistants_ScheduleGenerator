
ta_slot_assignment([],[],_).
ta_slot_assignment([ta(Name1,Load)|T],[ta(Name1,Load)|T1],Name):- Name\=Name1, ta_slot_assignment(T,T1,Name).
ta_slot_assignment([ta(Name,Load)|T],[ta(Name,Load1)|T],Name):- Load1 is Load -1.


no_dups([]).
no_dups([H|T]):-
	\+ member(H,T),
	no_dups(T).

slot_assignment(LabsNum,TAs,RemTAs,Assignment):-
	slot_assignment_helper(LabsNum,TAs,RemTAs,Assignment),
	no_dups(Assignment).
	

slot_assignment_helper(0,TAs,TAs,[]).
slot_assignment_helper(LabsNum,TAs,RemTAs,[Name|Assignment]):-
	LabsNum>0,
	member(ta(Name,Load),TAs),
	Load > 0,
	ta_slot_assignment(TAs,MidRemTAs,Name),
	NewLabsNum is LabsNum-1,
	slot_assignment_helper(NewLabsNum,MidRemTAs,RemTAs,Assignment).

	
max_slots_per_day(DaySched,Max):-
	flatten(DaySched,Flat),
	underMax(Flat,Max),!.
	
	
underMax([],_).	
underMax([H|T],Max):-
	occurOf([H|T],H,NumOfOccurences),
	NumOfOccurences =< Max,
	underMax(T,Max).
	
	
occurOf([],_,0).
occurOf([X|T],X,Y):- occurOf(T,X,Z), Y is 1+Z.
occurOf([X1|T],X,Z):- X1\=X,occurOf(T,X,Z).
	



day_schedule([],TAs,TAs,[]).

day_schedule([H|T],TAs,RemTAs,[X|Assignment]):-
	slot_assignment(H,TAs,MidRemTAs,X),
	day_schedule(T,MidRemTAs,RemTAs,Assignment).
	
week_schedule([],_,_,[]).
week_schedule([H|T],TAs,DayMax,[X|Result]):-
	day_schedule(H,TAs,RemTAs,X),
	max_slots_per_day(X,DayMax),
	week_schedule(T,RemTAs,DayMax,Result).
	
	