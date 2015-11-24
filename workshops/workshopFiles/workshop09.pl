sumlist_([], 0).
sumlist_([N|Ns], Sum) :-
	sumlist_(Ns, Sum0),
	Sum is N + Sum0.

sumlist(List, Sum):-
    sumlist(List, 0, Sum).

sumlist([], A, A).
sumlist([N|Ns], A, Sum) :-
    A1 is N + A,
    sumlist(Ns, A1, Sum).

tree(empty).
tree(node(Left,_,Right)) :-
	tree(Left),
	tree(Right).


tree_list(empty, []).
tree_list(node(Left, Elt, Right)) :-
    tree_list(Left, List1),
    tree_list(Right, List2),
    append(List1, [Elt|List2], List).

list_tree([], empty).
list_tree(List, node(Left,Elt,Right)) :-
	append(Front, [Elt|Back], List),
	list_tree(Front, Left),
	list_tree(Back, Right).
