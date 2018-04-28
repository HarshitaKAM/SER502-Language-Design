%==============================================================================

% DCG (Parser) for grammar : Genrated the parse tree

% Author: Sowmya Madabhushi, Melissa Day
% Date: 4/28/2018

/* Query to generate just parse trees :
 L = <list of tokens>,program(P,L,Output).
 The sample programs for the list of tokens can be obtained from data folder */

% Program
    program(parsetree(X))--> ['start'], k(X),['end'].

% Block
    k(blockdec(X,Y))-->['['],d(X),sl(Y),[']'].
    k(block(X))-->['['],sl(X),[']'].

% Declaration
    d(decid(X,Y,Z))-->dt(X),i(Y),['.'],d(Z).
    d(deci(X,Y))-->dt(X),i(Y),['.'].
    d(decad(X,Y,Z))-->dt(X), a(Y), ['.'],d(Z).
    d(deca(X,Y))-->dt(X), a(Y), ['.'].

% Data types
    dt(dtype1('int'))-->['int'].
    dt(dtype2('bool'))-->['bool'].

% Statement List
    sl(slistrec(X,Y))-->s(X),['.'],sl(Y).
    sl(slist(X))-->s(X),['.'].
    sl(slistblock(X))-->k(X).

% Statement
    s(stmtassign(X))--> a(X).
    s(stmtif(X))-->if(X).
    s(stmtwhile(X))-->w(X).

% Assignment Statement
    a(assign(X,Y))-->i(X),['is'],e(Y).

% If Statement
    if(ifstate(X,Y))-->['if'],['('],b(X),[')'],k(Y).

% While Statement
    w(while(X,Y))-->['while'],['('],b(X),[')'],k(Y).

% Boolean Expression
    b(boolexptrue('true'))-->['true'].
    b(boolexpfalse('false'))-->['false'].

% Comparator
    b(boolexpeq(X,Y))-->e(X),['=:'],e(Y).

% Not
    b(boolexpnot(X))-->['!!'],e(X).

% Less than
    b(boolexplt(X,Y))-->e(X),['<<'],e(Y).

% Greater than
    b(boolexpgt(X,Y))-->e(X),['>>'],e(Y).

% Arithmetic Expression: Addition and Subtraction
    e(arithexp1(X,Y))-->ex(X),res(Y).
    e(arithexp(X))-->ex(X).

% Resolution for Addition and Substraction
    res(resarithplus(X,Y))-->['+'],ex(X),res(Y).
    res(resarithminus(X,Y))-->['-'],ex(X),res(Y).
    res(resarithsum(X))-->['+'],ex(X).
    res(resarithsub(X))-->['-'],ex(X).

% Arithmetic Expression: Multiplication and Division
    ex(exp1(X,Y))-->f(X),resmd(Y).
    ex(exp(X))-->f(X).

% Resolution for Multiplication and Division
    resmd(resmul1(X,Y))-->['*'],f(X),resmd(Y).
    resmd(resdiv1(X,Y))-->['/'],f(X),resmd(Y).
    resmd(resmul2(X))-->['*'],f(X).
    resmd(resdiv2(X))-->['/'],f(X).

% Factors for Multiplication and Division
    f(factori(X))-->i(X).
    f(factorn(X))-->n(X).

% Identifier
    i(iden1(X,Y))-->l(X),i(Y).
    i(iden(X))-->l(X).

% Number
    n(num1(X,Y))-->dg(X),n(Y).
    n(num(X))-->dg(X).

% Digit
    dg(digit('0')) --> ['0'].
    dg(digit('1')) --> ['1'].
    dg(digit('2')) --> ['2'].
    dg(digit('3')) --> ['3'].
    dg(digit('4')) --> ['4'].
    dg(digit('5')) --> ['5'].
    dg(digit('6')) --> ['6'].
    dg(digit('7')) --> ['7'].
    dg(digit('8')) --> ['8'].
    dg(digit('9')) --> ['9'].

% Letters - Lowercase
    l(letter('a'))-->['a'].
    l(letter('b'))-->['b'].
    l(letter('c')) --> ['c'].
    l(letter('d'))-->['d'].
    l(letter('e'))-->['e'].
    l(letter('f'))-->['f'].
    l(letter('g'))-->['g'].
    l(letter('h'))-->['h'].
    l(letter('i'))-->['i'].
    l(letter('j'))-->['j'].
    l(letter('k'))-->['k'].
    l(letter('l'))-->['l'].
    l(letter('m'))-->['m'].
    l(letter('n'))-->['n'].
    l(letter('o'))-->['o'].
    l(letter('p'))-->['p'].
    l(letter('q'))-->['q'].
    l(letter('r'))-->['r'].
    l(letter('s'))-->['s'].
    l(letter('t'))-->['t'].
    l(letter('u'))-->['u'].
    l(letter('v'))-->['v'].
    l(letter('w'))-->['w'].
    l(letter('x'))-->['x'].
    l(letter('y'))-->['y'].
    l(letter('z'))-->['z'].

% Letters - Uppercase
    l(letter('A'))-->['A'].
    l(letter('B'))-->['B'].
    l(letter('C')) --> ['C'].
    l(letter('D'))-->['D'].
    l(letter('E'))-->['E'].
    l(letter('F'))-->['F'].
    l(letter('G'))-->['G'].
    l(letter('H'))-->['H'].
    l(letter('I'))-->['I'].
    l(letter('J'))-->['J'].
    l(letter('K'))-->['K'].
    l(letter('L'))-->['L'].
    l(letter('M'))-->['M'].
    l(letter('N'))-->['N'].
    l(letter('O'))-->['O'].
    l(letter('P'))-->['P'].
    l(letter('Q'))-->['Q'].
    l(letter('R'))-->['R'].
    l(letter('S'))-->['S'].
    l(letter('T'))-->['T'].
    l(letter('U'))-->['U'].
    l(letter('V'))-->['V'].
    l(letter('W'))-->['W'].
    l(letter('X'))-->['X'].
    l(letter('Y'))-->['Y'].
    l(letter('Z'))-->['Z'].


