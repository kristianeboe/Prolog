:- ensure_loaded(borders).
:- ensure_loaded(cities).
:- ensure_loaded(countries).
:- ensure_loaded(rivers).

country(X) :-
    country(X,_,_,_,_,_,_,_).

larger(X,Y) :-
    country(X,_,_,_,A,_,_,_),
    country(Y,_,_,_,B,_,_,_),
    A > B.

river_country(X,C) :-
    river(X, Cs),
    country(C),
    member(C, Cs).

country_region(C,R) :-
    country(C, R, _,_,_,_,_,_).

% river_country(X, C1), river_country(X,C2), country_region(C1, R1), country_region(C2, R2), R1 \= R2.
