% Tokenizer_v1 (tokenizes every single string from the input file) : NEEDS Changes
% Author- Harshita Kajal

%generates list of tokens taking file as input. Sample running code is: tokenize("document.txt", List).

tokenize(Input_fileName, ListOf_Tokens) :-
 							 open(Input_fileName, read, Stream),
 							 readfrom(Stream, FileTokens),
 							 close(Stream).
							


%adding tokens to list

readfrom(Stream, [Token|FileTokens]) :-
 							 \+ at_end_of_stream(Stream),
  							findNext(Stream, Token),
 							 !,
 							 readfrom(Stream, FileTokens).
readfrom(_, []).




charNext(Stream, [Ascii_Char|String], Ascii) :-
 							
 							 get0(Stream, AsciiChar_Next),
 							 !,
 							 charNext(Stream, String, AsciiChar_Next).
charNext(_, [], _).




findNext(Stream, Token) :-
							  get0(Stream, Ascii_Char),
 							 charNext(Stream, String, Ascii_Char),
							  atom_number(Token, String),
							  atom_codes(Token, String).
