% Interpreter
% Author: Melissa Day
% Version: 1.0
% Date: 4/20/18

interpreter(PTokens, X, Y, Output) :- parser(PTree, PTokens, []),
										Env = [(x,X), (y,Y)],
										evalProgram(PTree, Env, FinalEnv),
										lookUp(z, FinalEnv, Output).

% Program
evalProgram(parsetree(X), StartEnv, EndEnv) :- evalK(X, StartEnv, EndEnv).

% Block
% Change environment through chaining of the statements
evalK(block(X,Y), StartEnv, EndEnv) :- evalD(X, StartEnv, Env1),
								evalSL(Y, Env1, EndEnv).
evalK(block(X), StartEnv, EndEnv) :- evalSL(X, StartEnv, EndEnv).
										
% Declaration
% // ???
evalD(dec(X,Y,Z), StartEnv, EndEnv) :- evalDT(X, StartEnv, Env1),
								evalI(Y, Env1, Env2),
			// ???				evalD(Z, Env2, EndEnv).
evalD(dec(X,Y), StartEnv, EndEnv) :- evalDT(X, StartEnv, Env1),
								evalI(Y, Env1, EndEnv).
evalD(dec(X,Y,Z), StartEnv, EndEnv) :- evalDT(X, StartEnv, Env1),
								evalA(Y, Env1, Env2),
								evalD(Z, Env2, EndEnv).
evalD(dec(X,Y), StartEnv, EndEnv) :- evalDT(X, StartEnv, Env1),
								evalA(Y, Env1, EndEnv).

% Data types
% ???  Anything needed here for the interpreter -- what to do for terminals?
evalDT(dtype(int), StartEnv, Val) :- 

% Statement List
evalSL(slist(X,Y), StartEnv, EndEnv) :- evalS(X, StartEnv, Env1),
										evalSL(Y, Env1, EndEnv).
evalSL(slist(X), StartEnv, EndEnv) :- evalS(X, StartEnv, EndEnv).
evalSL(slist(X), StartEnv, EndEnv) :- evalK(X, StartEnv, EndEnv).

% Statement
evalS(stmt(X), StartEnv, EndEnv) :- evalA(X, StartEnv, EndEnv).
evalS(stmt(X), StartEnv, EndEnv) :- evalIf(X, StartEnv, EndEnv).
evalS(stmt(X), StartEnv, EndEnv) :- evalWhile(X, StartEnv, EndEnv).

% Assignment Statement
evalA(assign(X,Y), StartEnv, EndEnv) :- evalE(Y, StartEnv, Val),
										X = iden(Z),
										update(Z, Val, StartEnv, EndEnv).

% If Statement
evalIf(ifstate(X,Y,Z), StartEnv, EndEnv) :- evalBool(X, StartEnv, Val),
											evalK(Y, StartEnv, EndEnv),
											evalK(Z, StartEnv, EndEnv).

% While Statement
evalWhile(while(X,Y), StartEnv, EndEnv) :- evalBool(X, StartEnv, Val),
												evalK(Y, StartEnv, EndEnv).

% Boolean Expression
% What to do for terminal cases of [true] and [false]??
% How to represent the different situations: NOT, Comparator, Less than, etc.?

evalBool

% Comparator
evalBool(boolexp(X,Y), StartEnv, Val) :- evalE(X, StartEnv, Val),
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
											Val1 > Val2.

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


% Resolution for Multiplication and Division
evalResMD

% Factors for Multiplication and Division
evalF

% Identifier
% ??? Logic for putting both together (first line)
evalI(iden(X,Y), StartEnv, Val) :- lookUp(X, StartEnv, Val),
									evalI(Y, StartEnv, Val).
evalI(iden(X), StartEnv, Val) :- lookUp(X, StartEnv, Val).									
											
% Number
% ??? Logic for putting both together (first line)
evalN(num(X,Y), StartEnv, Val) :- lookUp(X, StartEnv, Val),
									evalN(Y, StartEnv, Val).
evalN(num(X), StartEnv, Val) :- lookUp(X, StartEnv, Val).									

% Digit

% Letters



										
lookUp(X, [(X,V) | _], V).
lookUp(X, [_ | T], V) :- lookUp(X,T,V).

update(X,V,[(X,_) | T], [(X,V) | T]).
update(X,V, [H|T], [H|Env1]) :- update(X,V,T,Env1).
										