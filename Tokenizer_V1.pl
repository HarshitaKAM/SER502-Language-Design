 % Tokenizer_v1 (tokenizes every single string from the input file) : 
            % Author- Harshita Kajal

%generates list of tokens taking file as input. Sample running code is: ?- tokenize("demoinput_file.txt", List).


%adding tokens to list






readfrom(Stream, [Token|FileTokens]) :-
 							 \+ at_end_of_stream(Stream),
  							findNext(Stream, Token),
 							 !,
 							 readfrom(Stream, FileTokens).


readfrom(_, []).


%generating tokens

generate([],[]) :-
  			!.


generate([''|FileTokens],ListOf_Tokens) :-
 								 !,
 								 generate(FileTokens, ListOf_Tokens).
								 
generate([Token|FileTokens],[Token|ListOf_Tokens]) :-
		generate(FileTokens, ListOf_Tokens).




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





