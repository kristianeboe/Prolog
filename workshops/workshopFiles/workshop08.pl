%Q1
list_of(_,[]).
list_of(Elt, [Elt|List]) :-
  list_of(Elt, List).

%Q2
all_same(List) :-
  list_of(_, List).

%Q3
adjacent(E1, E2, List) :-
    append(_, [E1, E2 | List], List).

%Count to
count_from_X_to_Y(X,X):-
    write(X), nl.
count_from_X_to_Y(X,Y) :-
    write(X), nl,
    A is X+1,
    count_from_X_to_Y(A,Y).

%Q4
adjacent2(E1,E2,[E1,E2|_]).
adjacent2(E1, E2, [_, List]):-
    adjacent2(E1,E2,List).

%Q5
before(E1,E2, [_|Tail]):-
    before(E1,E2, Tail).
before(E1,E2, [E1|Tail]):-
    member(E2,Tail).

%Q6
insert_member(N, tree(_,N,_)).
insert_member(N, tree(L,N0,_)):-
    N<N0,
    insert_member(N, L).
insert_member(N, tree(_,N0,R)):-
    N>N0,
    insert_member(N,R).

intset_insert(N, empty, tree(empty,N,empty)).
intset_insert(N, tree(L,N,R), tree(L,N,R)).
intset_insert(N, tree(L0,N0,R), tree(L,N0,R)) :-
	N < N0,
	intset_insert(N, L0, L).
intset_insert(N, tree(L,N0,R0), tree(L,N0,R)) :-
	N > N0,
	intset_insert(N, R0, R).
