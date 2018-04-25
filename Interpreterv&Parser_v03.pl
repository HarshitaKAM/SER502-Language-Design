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

%interpreter(PTokens, P, FinalEnv) :- program(PTree, PTokens, []),
%                        Env = [(p,P)], evalProgram(PTree, Env, FinalEnv).

interpreter(_, P, FinalEnv) :-
PTree = parsetree(block(slist(stmt(assign(iden(letter('p')), arithexp(exp(factor(num(digit('2')))))))))),
Env = [(p,P)], evalProgram(PTree, Env, FinalEnv).

evalProgram(parsetree(X), StartEnv, EndEnv) :- evalK(X, StartEnv, EndEnv).

evalK(block(X), StartEnv, EndEnv) :- evalSL(X, StartEnv, EndEnv).

evalSL(slist(X), StartEnv, EndEnv) :- evalS(X, StartEnv, EndEnv).

evalS(stmt(X), StartEnv, EndEnv) :- evalA(X, StartEnv, EndEnv).

evalA(assign(X,Y), StartEnv, EndEnv) :- evalE(Y, StartEnv, Val),
X = evalI(Z, StartEnv, Val),
update(Z, Val, StartEnv, EndEnv).

evalI(letter(X), StartEnv, Val) :- evalLetter(X, StartEnv, Val).

evalE(arithexp(X), StartEnv, Val) :- evalEx(X, StartEnv, Val).

evalEx(exp(X), StartEnv, Val) :- evalFactor(X, StartEnv, Val).

evalFactor(factor(X), StartEnv, Val) :- evalNum(X, StartEnv, Val).

evalNum(num(X), StartEnv, Val) :- evalDigit(X, StartEnv, Val).

lookUp(X, [(X,V) | _], V).
lookUp(X, [_ | T], V) :- lookUp(X,T,V).

update(X,V,[],[(X,V)]).
update(X,V,[(X,_) | T], [(X,V) | T]).
update(X,V, [H|T], [H|Env1]) :- update(X,V,T,Env1).
% Need to fix update for this case: update(X,5,[(X,3),(Z,2)],Result).

%Works- tested with:
%?- evalDigit(digit('3'), Val).
%Val = 3.
evalDigit(digit(D),StartEnv, Val) :- eval_(D, StartEnv, Val).

%?- evalLetter(letter('p'), [(X,3)], Res).
%Res = p.
evalLetter(letter(L),StartEnv, Val) :- eval_(L, StartEnv, Val).

eval_('0', _, Val) :- Val is 0.
eval_('1', _, Val) :- Val is 1.
eval_('2', _, Val) :- Val is 2.
eval_('3', _, Val) :- Val is 3.
eval_('4', _, Val) :- Val is 4.
eval_('5', _, Val) :- Val is 5.
eval_('6', _, Val) :- Val is 6.
eval_('7', _, Val) :- Val is 7.
eval_('8', _, Val) :- Val is 8.
eval_('9', _, Val) :- Val is 9.


eval_('p', _, Val) :- Val = p.


