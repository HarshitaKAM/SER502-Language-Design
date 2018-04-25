tokenize(Input_fileName, ListOf_Tokens) :-
 							 open(Input_fileName, read, Stream),
 							 readfrom(Stream, FileTokens),
 							 close(Stream),
							list_cleaning(FileTokens, ListOf_Tokens).

readfrom(Stream, [Token|FileTokens]) :-
 							 \+ at_end_of_stream(Stream),
  							findNext(Stream, Token),
 							 !,
 							 readfrom(Stream, FileTokens).
readfrom(_, []).

charNext(Stream, [Ascii_Char|String], Ascii_Char) :-
 							 Ascii_Char>32,
 							 get0(Stream, AsciiChar_Next),
 							 !,
 							 charNext(Stream, String, AsciiChar_Next).
charNext(_, [], _).


findNext(Stream, Token) :-
							  get0(Stream, Ascii_Char),
 							 charNext(Stream, String, Ascii_Char),
							  atom_codes(Token, String).

list_cleaning([], []) :-
  !.
list_cleaning([''|FileTokens], ListOf_Tokens) :-
 								 !,
 								 list_cleaning(FileTokens, ListOf_Tokens).
list_cleaning([Token|FileTokens], [Token|ListOf_Tokens]) :-
list_cleaning(FileTokens, ListOf_Tokens).
