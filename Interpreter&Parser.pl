% DCG (Parser) for grammar
% Author: Sowmya Madabhushi
% Version: 1.4
% Date: 4/21/18

% Program
program(parsetree(X))--> [start], k(X),[end].
% Block
k(block(X,Y))-->['['],d(X),sl(Y),[']'].
k(block(X))-->['['],sl(X),[']'].

% Declaration
d(dec(X,Y,Z))-->dt(X),i(Y),['.'],d(Z).
d(dec(X,Y))-->dt(X),i(Y),['.'].
d(dec(X,Y,Z))-->dt(X), a(Y), ['.'],d(Z).
d(dec(X,Y))-->dt(X), a(Y), ['.'].

% Data types
dt(dtype(int))-->[int].
dt(dtype(bool))-->[bool].

% Statement List
sl(slist(X,Y))-->s(X),['.'],sl(Y).
sl(slist(X))-->s(X),['.'].
sl(slist(X))-->k(X).

% Statement
s(stmt(X))--> a(X).
s(stmt(X))-->if(X).
s(stmt(X))-->w(X).

% Assignment Statement
a(assign(X,Y))-->i(X),[is],e(Y).

% If Statement
if(ifstate(X,Y,Z))-->[if],['('],b(X),[')'],k(Y),[else],k(Z).

% While Statement
w(while(X,Y))-->[while],['('],b(X),[')'],k(Y).

% Boolean Expression
b(boolexp(true))-->[true].
b(boolexp(false))-->[false].

% Comparator
b(boolexp(X,Y))-->e(X),['=:'],e(Y).

% Not
b(boolexp(X))-->['!!'],e(X).

% Less than
b(boolexp(X,Y))-->e(X),['<<'],e(Y).

% Greater than
b(boolexp(X,Y))-->e(X),['>>'],e(Y).

% Arithmetic Expression: Addition and Subtraction
e(arithexp(X,Y))-->ex(X),res(Y).
e(arithexp(X))-->ex(X).

% Resolution for Addition and Substraction
res(resarith(X,Y))-->['+'],ex(X),res(Y).
res(resarith(X,Y))-->['-'],ex(X),res(Y).
res(resarith(X))-->['+'],ex(X).
res(resarith(X))-->['-'],ex(X).

% Arithmetic Expression: Multiplication and Division
ex(exp(X,Y))-->f(X),resmd(Y).
ex(exp(X))-->f(X).

% Resolution for Multiplication and Division
resmd(resmuldiv(X,Y))-->['*'],f(X),resmd(Y).
resmd(resmuldiv(X,Y))-->['/'],f(X),resmd(Y).
resmd(resmuldiv(X))-->['*'],f(X).
resmd(resmuldiv(X))-->['/'],f(X).

% Factors for Multiplication and Division
f(factor(X))-->i(X).
f(factor(X))-->n(X).

% Identifier
i(iden(X,Y))-->l(X),i(Y).
i(iden(X))-->l(X).
% Number
n(num(X,Y))-->dg(X),n(Y).
n(num(X))-->dg(X).
% Digit
dg(digit(0)) --> [0].
dg(digit(1)) --> [1].
dg(digit(2)) --> [2].
dg(digit(3)) --> [3].
dg(digit(4)) --> [4].
dg(digit(5)) --> [5].
dg(digit(6)) --> [6].
dg(digit(7)) --> [7].
dg(digit(8)) --> [8].
dg(digit(9)) --> [9].
% Letters
l(letter(a))-->[a].
l(letter(b))-->[b].
l(letter(c))-->[c].
l(letter(d))-->[d].
l(letter(e))-->[e].
l(letter(f))-->[f].
l(letter(g))-->[g].
l(letter(h))-->[h].
l(letter(i))-->[i].
l(letter(j))-->[j].
l(letter(k))-->[k].
l(letter(l))-->[l].
l(letter(m))-->[m].
l(letter(n))-->[n].
l(letter(o))-->[o].
l(letter(p))-->[p].
l(letter(q))-->[q].
l(letter(r))-->[r].
l(letter(s))-->[s].
l(letter(t))-->[t].
l(letter(u))-->[u].
l(letter(v))-->[v].
l(letter(w))-->[w].
l(letter(x))-->[x].
l(letter(y))-->[y].
l(letter(z))-->[z].

% =====================================

% Interpreter
% Author: Melissa Day
% Version: 1.0
% Date: 4/20/18

interpreter(PTokens, X, Y, Output) :- program(PTree, PTokens, []),
										Env = [(x,X), (y,Y)],
										evalProgram(PTree, Env, FinalEnv),
										lookUp(z, FinalEnv, Output).

% Program
evalProgram(parsetree(X), StartEnv, EndEnv) :- evalK(X, StartEnv, EndEnv).

% Block
% Change environment through chaining of the statements
/*evalK(block(X,Y), StartEnv, EndEnv) :- evalD(X, StartEnv, Env1),
								evalSL(Y, Env1, EndEnv). */
evalK(block(X), StartEnv, EndEnv) :- evalSL(X, StartEnv, EndEnv).
										
% Declaration
% // ???
/*evalD(dec(X,Y,Z), StartEnv, EndEnv) :- evalDT(X, StartEnv, Env1),
								evalI(Y, Env1, Env2),
						evalD(Z, Env2, EndEnv).
evalD(dec(X,Y), StartEnv, EndEnv) :- evalDT(X, StartEnv, Env1),
								evalI(Y, Env1, EndEnv).
evalD(dec(X,Y,Z), StartEnv, EndEnv) :- evalDT(X, StartEnv, Env1),
								evalA(Y, Env1, Env2),
								evalD(Z, Env2, EndEnv).
evalD(dec(X,Y), StartEnv, EndEnv) :- evalDT(X, StartEnv, Env1),
								evalA(Y, Env1, EndEnv).  */

% Data types
/*% ???  Anything needed here for the interpreter -- what to do for terminals?
evalDT(dtype(int), StartEnv, Val) :-  */

% Statement List
evalSL(slist(X,Y), StartEnv, EndEnv) :- evalS(X, StartEnv, Env1),
										evalSL(Y, Env1, EndEnv).
evalSL(slist(X), StartEnv, EndEnv) :- evalS(X, StartEnv, EndEnv).
evalSL(slist(X), StartEnv, EndEnv) :- evalK(X, StartEnv, EndEnv).

% Statement
evalS(stmt(X), StartEnv, EndEnv) :- evalA(X, StartEnv, EndEnv).
/*evalS(stmt(X), StartEnv, EndEnv) :- evalIf(X, StartEnv, EndEnv).
evalS(stmt(X), StartEnv, EndEnv) :- evalWhile(X, StartEnv, EndEnv).*/

% Assignment Statement
evalA(assign(X,Y), StartEnv, EndEnv) :- evalE(Y, StartEnv, Val),
										X = iden(Z),
										update(Z, Val, StartEnv, EndEnv).

% If Statement
/*evalIf(ifstate(X,Y,Z), StartEnv, EndEnv) :- evalBool(X, StartEnv, Val),
											evalK(Y, StartEnv, EndEnv),
											evalK(Z, StartEnv, EndEnv).  */

% While Statement
/*evalWhile(while(X,Y), StartEnv, EndEnv) :- evalBool(X, StartEnv, Val),
												evalK(Y, StartEnv, EndEnv).  */

% Boolean Expression
% What to do for terminal cases of [true] and [false]??
% How to represent the different situations: NOT, Comparator, Less than, etc.?

%evalBool

% Comparator
/*evalBool(boolexp(X,Y), StartEnv, Val) :- evalE(X, StartEnv, Val),
											evalE(Y, StartEnv, Val).

% Not
evalBool(boolexp(X), StartEnv, Val) :- evalE(X, StartEnv, Val).

% Less than
evalBool(boolexp(X,Y), StartEnv, Val) :- evalE(X, StartEnv, Val1),
											evalE(Y, StartEnv, Val2),
											Val1 < Val2.

% Greater than
evalBool(boolexp(X,Y), StartEnv, Val) :- evalE(X, StartEnv, Val1),
											evalE(Y, StartEnv, Val2)
											Val1 > Val2.  */

% Arithmetic Expression: Addition and Subtraction
% ???
evalE(arithexp(X,Y), StartEnv, Val) :- evalEx(X, StartEnv, Val),
										evalRes(Y, StartEnv, Val).
evalE(arithexp(X), StartEnv, Val) :- evalEx(X, StartEnv, Val).

% Resolution for Addition and Substraction
evalRes(resarith(X,Y), StartEnv, Val) :- evalEx(X, StartEnv, Val1),
											evalRes(Y, StartEnv, Val2),
											Val is Val1+Val2.


evalRes(resarith(X,Y), StartEnv, Val) :- evalEx(X, StartEnv, Val1),
											evalRes(Y, StartEnv, Val2),
											Val is Val1-Val2.											

% Arithmetic Expression: Multiplication and Division
/*evalEx(exp(X,Y), StartEnv, Val) :- evalF(X, StartEnv, Val1),
									evalResMD(Y, StartEnv, Val2),
									Val is V1 * V2. */
evalEx(exp(X), StartEnv, Val) :- evalF(X, StartEnv, Val).

% Resolution for Multiplication and Division
%evalResMD

% Factors for Multiplication and Division
evalF(factor(X), StartEnv, Val) :- evalI(X, StartEnv, Val).
evalF(factor(X), StartEnv, Val) :- evalN(X, StartEnv, Val).

% Identifier
% ??? Logic for putting both together (first line)
%evalI(iden(X,Y), StartEnv, Val) :- lookUp(X, StartEnv, Val1),
	%								evalI(Y, StartEnv, Val2),
	%								Val is atom_concat(Val1, Val2, Val).
evalI(iden(X), StartEnv, Val) :- lookUp(X, StartEnv, Val).									
											
% Number
% ??? Logic for putting both together (first line)
evalN(num(X,Y), StartEnv, Val) :- lookUp(X, StartEnv, Val1),
									evalN(Y, StartEnv, Val2),
									Val is (Val1*10+Val2).
evalN(num(X), StartEnv, Val) :- lookUp(X, StartEnv, Val).									

% Digit


% Letters



										
lookUp(X, [(X,V) | _], V).
lookUp(X, [_ | T], V) :- lookUp(X,T,V).

update(X,V,[(X,_) | T], [(X,V) | T]).
update(X,V, [H|T], [H|Env1]) :- update(X,V,T,Env1).
										