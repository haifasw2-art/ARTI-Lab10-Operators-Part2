% ============================================================
% Prolog Operators Part II - Task 2
% Login System
% ------------------------------------------------------------
% Checks the username and password against the dataset.
% Correct  -> "Login Successful"
% Wrong    -> "Login Unsuccessful" + 2 more attempts
% After 3 wrong attempts -> "Sorry, you exceeded the maximum
%                            number of attempts, try again later."
%
% Run with:   ?- login.
% Type lowercase and end every input with a full stop, e.g.
%   |: sara.
%   |: pass456.
% ============================================================

% ---------------- Dataset: user(Username, Password) ----------------
user(ahmad, pass123).
user(sara,  pass456).
user(ali,   pass789).

% ---------------- Start: first attempt ----------------
login :- attempt(1).

% ---------------- Attempts ----------------
% More than 3 attempts -> stop
attempt(N) :-
    N > 3, !,
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.

% Ask for username and password, then check them
attempt(N) :-
    write('Enter username:'), nl,
    read(Username),
    write('Enter password:'), nl,
    read(Password),
    check(Username, Password, N).

% ---------------- Check ----------------
% Correct username and password
check(Username, Password, _) :-
    user(Username, Password), !,
    write('Login Successful'), nl.

% Wrong -> count this attempt and try again
check(_, _, N) :-
    write('Login Unsuccessful'), nl,
    N1 is N + 1,
    attempt(N1).

% ------------------------------------------------------------
% Example runs:
% ?- login.            (enter sara.  pass456.)
%    Login Successful
%
% ?- login.            (enter a wrong password 3 times)
%    Login Unsuccessful
%    Login Unsuccessful
%    Login Unsuccessful
%    Sorry, you exceeded the maximum number of attempts, try again later.
% ------------------------------------------------------------
