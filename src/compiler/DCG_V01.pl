% DCG (Parser) for language
% Author: Melissa Day
% Version: 1.0
% Date: 4/13/18

% Program
program(t_program(X)) --> [start], 
							block(X), 
							[end].

% Block
block(t_block(X, Y)) --> [[], 
						decl(X), 
						[.], 
						stmtList(Y), 
						[]].
block(t_block(X)) --> [[], 
						stmtList(X), 
						[]].

% Declaration
decl(t_decl(X, Y, Z)) --> dataType(X), 
						stmtList(Y), 
						[.], 
						decl(Z).
decl(t_decl(X, Y)) --> dataType(X), 
						stmtList(Y), 
						[.].

% Data types
% ****** Need to start with lowercase to use with Prolog??? Or change back to uppercase to match original grammar??? *******
dataType(int) --> [int].
dataType(bool) --> [bool].

% Statement List
stmtList(t_stmtList(X, Y)) --> stmt(X),
								[.],
								stmtList(Y).
stmtList(t_stmtList(X)) --> stmt(X),
							[.].
stmtList(t_stmtList(X)) --> block(X).

% Statement
stmt(t_stmt(X)) --> assignStmt(X).
stmt(t_stmt(X)) --> ifStmt(X).
stmt(t_stmt(X)) --> whileStmt(X).

% Assignment Statement
assignStmt(t_assignStmt(X, Y)) --> ident(X) [is] arithExpr(Y). 

% If Statement
% *****Treat if and open ( as separate tokens? Or should be: [if (]   ???
ifStmt(t_ifStmt(X, Y, Z)) --> [if], 
								[(], 
								boolExpr(X), 
								[)], 
								block(Y), 
								[else], 
								block(Z).

% While Statement
% ******Treat if and open ( as separate tokens? Or should be: [while (]   ???
whileStmt(t_whileStmt(X, Y)) --> [while], 
									[(], 
									boolExpr(X), 
									[)], 
									block(Y).

% Boolean Expression
% ***** Check this: may need to fix T and F values for this
% May need to update Grammar
boolExpr(true) --> [true].
boolExpr(false) --> [false].
% Comparator
boolExpr(t_boolExpr(X, Y)) --> arithExpr(X),
							[=:],
							arithExpr(Y).
% Not
boolExpr(t_boolExpr(X)) --> [!!],
							arithExpr(X).
% Less than
boolExpr(t_boolExpr(X, Y)) --> arithExpr(X),
							[<<],
							arithExpr(Y).							
% Greater than
boolExpr(t_boolExpr(X, Y)) --> arithExpr(X),
							[>>],
							arithExpr(Y).	
							

% Arithmetic Expression: Addition and Subtraction
arithExpr(t_arithExpr(X, Y)) --> multDivExpr(X),
									[+],
									arithExpr(Y).
arithExpr(t_arithExpr(X, Y)) --> multDivExpr(X),
									[-],
									arithExpr(Y).
arithExpr(t_arithExpr(X)) --> multDivExpr(X).

% Arithmetic Expression: Multiplication and Division
multDivExpr(t_multDivExpr(X, Y)) --> ident(X), 
										[*], 
										multDivExpr(Y).
multDivExpr(t_multDivExpr(X, Y)) --> num(X), 
										[*], 
										multDivExpr(Y).
multDivExpr(t_multDivExpr(X, Y)) --> ident(X), 
										[\],     *************Change direction of this??
										multDivExpr(Y).
multDivExpr(t_multDivExpr(X, Y)) --> num(X), 
										[\], 
										multDivExpr(Y).
multDivExpr(t_multDivExpr(X)) --> ident(X).
multDivExpr(t_multDivExpr(X)) --> num(X).

% Identifier
ident(t_ident(X, Y)) --> letter(X), 
							ident(Y).
ident(t_ident(X, Y)) --> letter(Y).

% Number
num(t_num(X, Y)) --> digit(X),
						num(Y).
num(t_num(X)) --> digit(X).

% Integer data type
% Mistake on grammar??? Seems like this doesn't make sense
int(0) --> [0].
int(1) --> [1].
int(2) --> [2].
int(3) --> [3].
int(4) --> [4].
int(5) --> [5].
int(6) --> [6].
int(7) --> [7].
int(8) --> [8].
int(9) --> [9].

% Boolean data type
bool(true) --> [true].
bool(false) --> [false].

% Digit
digit(0) --> [0].
digit(1) --> [1].
digit(2) --> [2].
digit(3) --> [3].
digit(4) --> [4].
digit(5) --> [5].
digit(6) --> [6].
digit(7) --> [7].
digit(8) --> [8].
digit(9) --> [9].

% Letters
letter(a) --> [a].
letter(b) --> [b].
letter(c) --> [c].
letter(d) --> [d].
letter(e) --> [e].
letter(f) --> [f].
letter(g) --> [g].
letter(h) --> [h].
letter(i) --> [i].
letter(j) --> [j].
letter(k) --> [k].
letter(l) --> [l].
letter(m) --> [m].
letter(n) --> [n].
letter(o) --> [o].
letter(p) --> [p].
letter(q) --> [q].
letter(r) --> [r].
letter(s) --> [s].
letter(t) --> [t].
letter(u) --> [u].
letter(v) --> [v].
letter(w) --> [w].
letter(x) --> [x].
letter(y) --> [y].
letter(z) --> [z].
letter(A) --> [A].
letter(B) --> [B].
letter(C) --> [C].
letter(D) --> [D].
letter(E) --> [E].
letter(F) --> [F].
letter(G) --> [G].
letter(H) --> [H].
letter(I) --> [I].
letter(J) --> [J].
letter(K) --> [K].
letter(L) --> [L].
letter(M) --> [M].
letter(N) --> [N].
letter(O) --> [O].
letter(P) --> [P].
letter(Q) --> [Q].
letter(R) --> [R].
letter(S) --> [S].
letter(T) --> [T].
letter(U) --> [U].
letter(V) --> [V].
letter(W) --> [W].
letter(X) --> [X].
letter(Y) --> [Y].
letter(Z) --> [Z].








