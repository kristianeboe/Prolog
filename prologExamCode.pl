q2([H|T], H, T).
q2([H|T], E, [H|NT]) :-
    q2(T, E, NT).

multiply(X, Y, A, XY) :-
    (X = 0 ->
        XY = A
    ;
        X1 is (X - 1),
        A1 is (A + Y),
        multiply(X1, Y, A1, XY)
        ).

filter(_, [], []).
filter(P, [X|Xs], Filtered) :-
    ( call(P, X) -> % Why not simply P(X)
        Filtered = [X|Filtered1]
    ;   Filtered = Filtered1
    ),
    filter(P, Xs, Filtered1).
