:- ensure_loaded(library(clpfd)).

correspond(E1, L1, E2, L2) :-
    nth1(X, L1, E1), nth1(E2, L2, X).


interleave(Ls, L) :-
    %same_lengths(Ls),
    transpose(Ls, L1),
    flatten(L1, L).




same_lengths([Head|Tail]) :-
    length(Head, X),
    same_lengths(Tail, X).
same_lengths([Head], X) :-
    length(Head, X).
same_lengths([Head|Tail], X) :-
    length(Head, X),
    same_lengths(Tail, X).


/*interleave2([], [X], L):-
    L = [X].
interleave2([X], [], L):-
    L = [X].
*/

interleave2([], [], []).

interleave2([H1|T1], [H2|T2], L) :-
    L = [H1,H2|L1],
    interleave2(T1, T2, L1).
