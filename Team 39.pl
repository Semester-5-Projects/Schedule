ta_slot_assignment([ta(A,B)|T],[ta(A,B1)|T],A):-
B>0,
B1 is B-1.

ta_slot_assignment([ta(A,B)|T],[ta(A,B)|T1],X):-
A\=X,
ta_slot_assignment(T,T1,X).




slot_assignment(LabsNum,TAs,RemTAs,Assignment):-
slot_assignmenth(LabsNum,TAs,X),
letters(X,Z),
permutation(Z,Assignment),
helper(TAs,Assignment,RemTAs).

helper(P,[],P).
helper(TAs,[H|T],P):-
ta_slot_assignment(TAs,X,H),
helper(X,T,P).

letters([],[]).
letters([ta(A,_)|T],[A|T1]):-
letters(T,T1).

slot_assignmenth(0,_,[]).
slot_assignmenth(LabsNum,TAs,[A|B]) :- LabsNum > 0,
   hel(A,TAs,R), LabsNum1 is LabsNum-1, slot_assignmenth(LabsNum1,R,B).
hel(X,[X|L],L).
hel(X,[_|L],R) :- hel(X,L,R).




max_slots_per_day(DaySched,Max):-
flatten(DaySched,X),
msort(X,Y),
encode(Y,Z),
checkMax(Z,Max).

checkMax([],_).
checkMax([[A,_]|T],Max):-
A =<Max, checkMax(T,Max).

pack([],[]).
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).
transfer(X,[],[],[X]).
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).

encode(L1,L2) :- pack(L1,L), transform(L,L2).
transform([],[]).
transform([[X|Xs]|Ys],[[N,X]|Zs]) :- length([X|Xs],N), transform(Ys,Zs).



day_schedule([],X,X,[]).
day_schedule([H|T],TAs,RemTAs,[Assignment|T1]):-
slot_assignment(H,TAs,X,Assignment),
day_schedule(T,X,RemTAs,T1).



week_schedule([],_,_,[]).
week_schedule([H|T],TAs,DayMax,[Assignment|T1]):-
day_schedule(H,TAs,RemTAs,Assignment),
max_slots_per_day(Assignment,DayMax),
week_schedule(T,RemTAs,DayMax,T1).



