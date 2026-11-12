% ============================================================
% Prolog Operators Part II - Task 1
% Calculate the area and the perimeter of the
% square, rectangle and triangle.
% ------------------------------------------------------------
% Run the menu with:   ?- start.
% Or call the rules directly (examples at the bottom).
% Type a full stop after every input, e.g.  5.
% ============================================================

% ---------------- Square ----------------
% Area = side^2      Perimeter = 4 * side
square_area(Side, Area)           :- Area is Side * Side.
square_perimeter(Side, Perimeter) :- Perimeter is 4 * Side.

% ---------------- Rectangle ----------------
% Area = width * height      Perimeter = 2 * (width + height)
rectangle_area(Width, Height, Area) :-
    Area is Width * Height.
rectangle_perimeter(Width, Height, Perimeter) :-
    Perimeter is 2 * (Width + Height).

% ---------------- Triangle ----------------
% Area = 1/2 * base * vertical height      Perimeter = a + b + c
triangle_area(Base, Height, Area) :-
    Area is 0.5 * Base * Height.
triangle_perimeter(A, B, C, Perimeter) :-
    Perimeter is A + B + C.

% ---------------- Menu ----------------
start :-
    nl,
    write('** AREA AND PERIMETER **'), nl,
    write('s. square'), nl,
    write('r. rectangle'), nl,
    write('t. triangle'), nl,
    write('e. exit'), nl,
    write('ENTER YOUR CHOICE .'), nl,
    read(Choice),
    option(Choice).

option(s) :- !,
    write('Enter the length of the side:'), nl, read(S),
    square_area(S, A),
    square_perimeter(S, P),
    write('Area = '), write(A), nl,
    write('Perimeter = '), write(P), nl,
    start.

option(r) :- !,
    write('Enter the width:'), nl, read(W),
    write('Enter the height:'), nl, read(H),
    rectangle_area(W, H, A),
    rectangle_perimeter(W, H, P),
    write('Area = '), write(A), nl,
    write('Perimeter = '), write(P), nl,
    start.

option(t) :- !,
    write('Enter the base:'), nl, read(B),
    write('Enter the vertical height:'), nl, read(H),
    write('Enter side a:'), nl, read(SA),
    write('Enter side b:'), nl, read(SB),
    write('Enter side c:'), nl, read(SC),
    triangle_area(B, H, A),
    triangle_perimeter(SA, SB, SC, P),
    write('Area = '), write(A), nl,
    write('Perimeter = '), write(P), nl,
    start.

option(e) :- !,
    write('Goodbye!'), nl.

option(_) :-
    write('Invalid choice, please try again.'), nl,
    start.

% ------------------------------------------------------------
% Direct tests:
% ?- square_area(4, A).                 A = 16.
% ?- square_perimeter(4, P).            P = 16.
% ?- rectangle_area(3, 5, A).           A = 15.
% ?- rectangle_perimeter(3, 5, P).      P = 16.
% ?- triangle_area(6, 4, A).            A = 12.0.
% ?- triangle_perimeter(3, 4, 5, P).    P = 12.
% ------------------------------------------------------------
