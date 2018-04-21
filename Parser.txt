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