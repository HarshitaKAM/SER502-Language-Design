%============================================================================

	    % Tokenizer_v1 (tokenizes every single string from the input file) : 
            % Author- Harshita Kajal

%generates list of tokens taking file as input. Sample running code is: ?- tokenize("demoinput_file.txt", List).


%adding tokens to list





%tokens are being read and added to the string

readfrom(Stream, [Token|FileTokens]) :-
 							 \+ at_end_of_stream(Stream),
  							findNext(Stream, Token),
							 readfrom(Stream, FileTokens).


readfrom(_, []).


%generating tokens

%generating list of tokens

generate([],[]) :-
  			!.


generate([''|FileTokens],ListOf_Tokens) :-
 								 !,
 								 generate(FileTokens, ListOf_Tokens).
								 
generate([Token|FileTokens],[Token|ListOf_Tokens]) :-
		generate(FileTokens, ListOf_Tokens).


%fetching next character from the stream whose ASCII values are greater than 32.
%and the characters are separated by space.

charNext(Stream,[Ascii_Char|String],Ascii_Char) :-
                             Ascii_Char >32, %&& Ascii_Char <47 ,
 							 get0(Stream, AsciiChar_Next),
 							 !,
 							 charNext(Stream, String, AsciiChar_Next).


charNext(_,[], _).





tokenize(Input_fileName,ListOf_Tokens) :-
 							 open(Input_fileName, read, Stream),
 							 readfrom(Stream, FileTokens),
 							 close(Stream),
							generate(FileTokens, ListOf_Tokens).




findNext(Stream, Token) :-
							  get0(Stream, Ascii_Char),
 							 charNext(Stream, String, Ascii_Char),
							  %atom_number(Token, String),
							  %atom_strings(Token, String).
							  atom_codes(Token, String).
							  %number_codes(Token, String).

%============================================================

% DCG (Parser) for grammar
% Author: Sowmya Madabhushi
% Version: 1.4
% Date: 4/21/18

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
if(ifstate(X,Y,Z))-->['if'],['('],b(X),[')'],k(Y),['else'],k(Z).

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
% Letters
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
l(letter('p')) --> ['p'].
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
l(letter('P')) --> ['P'].
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
%l(letter('P')) --> ['P'].


% =====================================

% Interpreter
% Author: Melissa Day
% Version: 1.0
% Date: 4/20/18

% Runs the interpreter and the program, writes output of parse tree and environment output to a file
% Expected parameters:
%		PTokens: List of tokens from the tokenizer as input for the parse tree
%		FinalEnv: Environment after program has executed
%		OutputFileName: Name of the file to write the parse tree and program execution results to
interpreter(PTokens, FinalEnv, OutputFileName) :- program(PTree, PTokens, []),
						writeOutputToNewFile(OutputFileName, "Parse Tree: "),
						writeOutputToExistingFile(OutputFileName, PTree),
						Env = [], 
						evalProgram(PTree, Env, FinalEnv),
						writeOutputToExistingFile(OutputFileName, "Final Environment: "),
						writeOutputToExistingFile(OutputFileName, FinalEnv).

% used for testing while
interpreter(_, FinalEnv) :- 
					PTree = parsetree(block(slist(stmtwhile(while(boolexptrue(true), block(slist(stmtassign(assign(iden(letter(b)), arithexp(exp(factorn(num(digit('4')))))))))))))),
						Env = [], evalProgram(PTree, Env, FinalEnv).
						
						
%interpreter(_, FinalEnv) :- 
%					PTree = parsetree(block(slist(stmtassign(assign(iden(letter(p)), arithexp(exp(factorn(num1(digit('1'), num(digit('2'))))))))))),
%						Env = [], evalProgram(PTree, Env, FinalEnv).

evalProgram(parsetree(X), StartEnv, EndEnv) :- evalK(X, StartEnv, EndEnv).

% Blocks
%evalK(blockdec(X,Y), StartEnv, EndEnv) :- evalDeclaration(X, StartEnv, Env1),
%											evalSL(Y, )

evalK(blockdec(X,Y), StartEnv, EndEnv) :- evalD(X, StartEnv, EndEnv),
evalSL(Y, StartEnv, EndEnv).

evalK(block(X), StartEnv, EndEnv) :- evalSL(X, StartEnv, EndEnv).

evalD(deca(X,Y), StartEnv, EndEnv) :- evalDT(X, StartEnv),
evalA(Y, StartEnv, EndEnv).

evalDT(dtype1(X),StartEnv) :- eval_(X, StartEnv).

% Declarations
%evalDeclaration

% Data types
% Tested with: 
% evalDT(dtype('bool'),Type).
% Output: Type = bool
% evalDT(dtype('int'),Type).
% Output: Type = int
evalDT(dtype1(int)).

evalSL(slistrec(X,Y), StartEnv, EndEnv) :- evalS(X, StartEnv, Env1),
										evalSL(Y, Env1, EndEnv).
evalSL(slist(X), StartEnv, EndEnv) :- evalS(X, StartEnv, EndEnv).

evalS(stmtassign(X), StartEnv, EndEnv) :- evalA(X, StartEnv, EndEnv).

evalS(stmtwhile(X), StartEnv, EndEnv) :- evalW(X, StartEnv, EndEnv).

evalA(assign(X,Y), StartEnv, EndEnv) :- evalE(Y, StartEnv, Val),
										evalI(X, StartEnv, Z),
										update(Z, Val, StartEnv, EndEnv).
evalW(while(X,Y), StartEnv, EndEnv) :- evalB(X, StartEnv), 
   evalK(Y, StartEnv, EndEnv).

evalB(boolexptrue(X),StartEnv) :- eval_(X, StartEnv).

evalI(iden1(X,Y), StartEnv, String) :- evalLetter(X, StartEnv, Val),
										evalI(Y, StartEnv, Val2),
										append(Val, Val2, String).

%evalDigit(X, StartEnv, Val1),
%										evalNum(Y, StartEnv, Val2),Val is (Val1*10+Val2).
										
%Tested with:										
%?- evalI(iden(letter('p')), [(X, 3)], Result).
%Result = p.
evalI(iden(X), StartEnv, Val) :- evalLetter(X, StartEnv, Val).									

evalE(arithexp1(X,Y), StartEnv, Val) :- evalEx(X, StartEnv, Val1), 
    evalRes(Y, StartEnv, Val2), Val is (Val1+Val2).

evalE(arithexp(X), StartEnv, Val) :- evalEx(X, StartEnv, Val).

evalRes(resarithsum(X), StartEnv, Val) :- evalEx(X, StartEnv, Val), Val is (Val+0).

evalEx(exp(X), StartEnv, Val) :- evalFactor(X, StartEnv, Val).

evalEx(exp1(X,Y), StartEnv, Val) :- evalFactor(X, StartEnv, Val1),
    evalResmd(Y, StartEnv, Val2), Val is (Val1*Val2).

evalResmd(resmul2(X), StartEnv, Val) :- evalFactor(X, StartEnv, Val), Val is (Val*1).

evalFactor(factorn(X), StartEnv, Val) :- evalNum(X, StartEnv, Val).

evalNum(num1(X,Y), StartEnv, Val) :- evalDigit(X, StartEnv, Val1),
										evalNum(Y, StartEnv, Val2), Val is (Val1*10+Val2).

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

%Value for boolean expression

eval_('int', _).

eval_('true', _).

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


% May want to delete these, if tokenizer doesn't work
eval_('a', _, Val) :- Val = a.
eval_('b', _, Val) :- Val = b.
eval_('c', _, Val) :- Val = c.
eval_('d', _, Val) :- Val = d.
eval_('e', _, Val) :- Val = e.
eval_('f', _, Val) :- Val = f.
eval_('g', _, Val) :- Val = g.
eval_('h', _, Val) :- Val = h.
eval_('i', _, Val) :- Val = i.
eval_('j', _, Val) :- Val = j.
eval_('k', _, Val) :- Val = k.
eval_('l', _, Val) :- Val = l.
eval_('m', _, Val) :- Val = m.
eval_('n', _, Val) :- Val = n.
eval_('o', _, Val) :- Val = o.
eval_('p', _, Val) :- Val = p.
eval_('q', _, Val) :- Val = q.
eval_('r', _, Val) :- Val = r.
eval_('s', _, Val) :- Val = s.
eval_('t', _, Val) :- Val = t.
eval_('u', _, Val) :- Val = u.
eval_('v', _, Val) :- Val = v.
eval_('w', _, Val) :- Val = w.
eval_('x', _, Val) :- Val = x.
eval_('y', _, Val) :- Val = y.
eval_('z', _, Val) :- Val = z.

% Rules for capital letters
eval_('A', _, Val) :- Val = a.
eval_('B', _, Val) :- Val = b.
eval_('C', _, Val) :- Val = c.
eval_('D', _, Val) :- Val = d.
eval_('E', _, Val) :- Val = e.
eval_('F', _, Val) :- Val = f.
eval_('G', _, Val) :- Val = g.
eval_('H', _, Val) :- Val = h.
eval_('I', _, Val) :- Val = i.
eval_('J', _, Val) :- Val = j.
eval_('K', _, Val) :- Val = k.
eval_('L', _, Val) :- Val = l.
eval_('M', _, Val) :- Val = m.
eval_('N', _, Val) :- Val = n.
eval_('O', _, Val) :- Val = o.
eval_('P', _, Val) :- Val = p.
eval_('Q', _, Val) :- Val = q.
eval_('R', _, Val) :- Val = r.
eval_('S', _, Val) :- Val = s.
eval_('T', _, Val) :- Val = t.
eval_('U', _, Val) :- Val = u.
eval_('V', _, Val) :- Val = v.
eval_('W', _, Val) :- Val = w.
eval_('X', _, Val) :- Val = x.
eval_('Y', _, Val) :- Val = y.
eval_('Z', _, Val) :- Val = z.



%?- interpreter(L, [], Output).
%Output = [(p, 2),  (q, 3)] ;
	

%========================
% File IO Predicates to be used for printint parse tree to output filefield
writeOutputToNewFile(FileName, TextToWrite) :-
	open(FileName,write,Stream),
	write(Stream, TextToWrite),
	nl(Stream),
	close(Stream).

writeOutputToExistingFile(FileName, TextToWrite) :-
	open(FileName,append,Stream),
	write(Stream, TextToWrite),
	nl(Stream),
	close(Stream).

%========================
% Runs the entire program from tokenizing to output.
% Saves results of parsetree and final environment to an output program called "ProgramOutput.txt"
% Expected Parameters:
%	InputFileName: Filename where the program input is stored, Extension should be .hbsm
% 	
main(InputFileName, FinalEnvironment) :- tokenize(InputFileName, Tokens),
											interpreter(Tokens, FinalEnvironment, "ProgramOutput.txt").
