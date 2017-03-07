init([],0).
goal([a,a,a], 3).

can(L,X) :- goal(L,X).
can([a|L],Y) :- can(L,X), (Y is X+1).

test :- init(L,X), can(L,X), write('can'), write(X), nl, write(L).

suma(X,Y,Z) :- Z is X+Y.
suma2(X,Y,X+Y).
suma3(X,Y,(Z is X+Y)).