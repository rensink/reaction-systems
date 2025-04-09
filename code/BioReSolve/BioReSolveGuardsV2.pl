/*

MIT License

Copyright (c) 2020 Moreno Falaschi, Giulia Palma, Linda Brodo, Roberto Bruni

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

/* 
This code has been developed and tested under 

SWI-Prolog: https://www.swi-prolog.org/

In particular, it exploits the following libraries, see the link below for documentation

https://www.swi-prolog.org/pldoc/man?section=libpl
*/
:- use_module(library(lists)).
/* defines:
- append
*/
:- use_module(library(ordsets)).
/* defines:
- list_to_ord_set
- ord_membercheck
- ord_add_element
- ord_subset
- ord_disjoint
- ord_intersect
- ord_intersection
- ord_empty
- ord_union
- ord_subtract
*/
:- use_module(library(assoc)).
/* defines:
- empty_assoc
- put_assoc
- get_assoc
- gen_assoc
- assoc_to_list
*/
:- use_module(library('dcg/basics')) .


%==== WORKING DIRECTORIES ======================================================================

/* IMPORTANT: 
change the following directives to load a Reaction System specification
by pointing to a path in your file system:
*/

% :- ["/Users/bruni/Documents/GitHub/reaction-systems/code/BioReSolve/BT474.pl"].
% :- ["/Users/bruni/Documents/GitHub/reaction-systems/code/BioReSolve/cmsb2024-last.pl"].
% :- ["/Users/bruni/Documents/GitHub/reaction-systems/code/BioReSolve/cmsb2024-paolo.pl"].
% :- ["/Users/bruni/Documents/GitHub/reaction-systems/code/BioReSolve/datamod23.pl"].
:- ["/Users/bruni/Documents/GitHub/reaction-systems/code/BioReSolve/toy-student.pl"].


/* IMPORTANT: 
Some predicates automatically save some output on the file system 
(mostly LTS representations in .dot format)
wdpath/1 sets the working directory with permissions for I/O on files
*/
wdpath("/Users/bruni/Documents/GitHub/reaction-systems/code/BioReSolve/").

%==== DCG PARSING RULES

/* DCG rules are used for user-friendly definition of Reaction System processes:

The family of pars_*(Str,Term) predicates converts compact infix notation to Prolog terms
via an intermdiate translation to list of chars.
- string_chars/2 is a built-in predicate that takes care of the conversion between strings and list of chars
- phrase/2 is a built-in predicate for the application of DCG rules
- DCG clauses (defined using --> instead of :-) take care of the conversion between list of chars and terms
*/

/* Entities and process constants */
parse_ide(Str,Term) :- string_chars(Str,Chars) , phrase(ide(Term),Chars) .
/* DCG clauses for identifiers
identifiers, used for entities and recursively defined context constants;
any identifier is a sequence of letters, _ and digits that starts with a small cap letter.
*/
ide(X) --> [C], { code_type(C, lower) } , ide_rest(Cs), { atom_codes(X, [C|Cs]) } .
ide_rest([]) --> [] .
ide_rest([C|Cs]) --> ide_next(C), ide_rest(Cs) .
ide_next('_') --> ['_'].
ide_next(C) --> [C], { code_type(C, lower) } ;
                [C], { code_type(C, upper) } ;
                [C], { code_type(C, digit) } .


/* Sets of entities */
parse_set(Str,OrdSet) :- string_chars(Str,Chars) , phrase(set_of_entities(Term),Chars), 
                         list_to_ord_set(Term,OrdSet) .
/* DCG clauses for sets of entities
a set of entities is represented with the usual set notation, 
as a comma-separated list of identifiers enclosed in brackets.
The parsing returns an ORDERED SET.
*/
set_of_entities([]) --> ['{'] , blanks, ['}'] .
set_of_entities([E|Es]) --> ['{'] , blanks, ide(E) , blanks , set_of_entities_rest(Es) .
set_of_entities_rest([E|Es]) --> [','] , blanks, ide(E) , blanks , set_of_entities_rest(Es) .
set_of_entities_rest([]) --> ['}'] .


/* Context-processes */
parse_ctx(Str,Term) :- string_chars(Str,Chars) , phrase(ctx_processes(Term),Chars) .
/* DCG clauses for the parallel composition of context-processes
a context-process is either 
- "nil", the null process, represented by the term nil
- "ide", a constant identifier, represented by the term rec(ide)
- "C.K", a process K prefixed by a set of entities C, represented by the term pre(C,K)
- "<N,K1>.K", a process K prefixed by a N steps from context K1, represented by the term do(N,K1,K)
- "(K1 + ... + Kn)", the choice between processes K1,...,Kn, represented by the summation term plus(K1,plus(...,Kn))
the parallel composition of context-processes is just a list of context processes.
- "?R,I,C?.K", a process K prefixed by a set of entities C guarded by reactants R and inhibitors I, 
represented by the term guarded(R,I,C,K)
*/
ctx_processes([]) --> ['['] , blanks , [']'] .
ctx_processes([K|Ks]) --> ['['] , blanks , ctx_process(K) , blanks , ctx_processes_rest(Ks) .
ctx_processes_rest([K|Ks]) --> [','] , blanks , ctx_process(K) , blanks , ctx_processes_rest(Ks) .
ctx_processes_rest([]) --> [']'] .

ctx_process(K) --> set_of_entities(C) , blanks , ['.'] , blanks , ctx_process(K1) , { list_to_ord_set(C,OC), K = pre(OC,K1) } ;
                   ['('] , ctx_process(K1) , blanks , ctx_process_rest(Ks) , { summation([K1|Ks],K) } ;
                   ['<'] , num(N) , blanks , [','] , blanks , ctx_process(K1) , ['>'] , blanks , ['.'] , blanks , ctx_process(K2) , { K = do(N,K1,K2) } ;
                   ['?'] , set_of_entities(R) , blanks , [','] , blanks , set_of_entities(I) , blanks , [','] , blanks , set_of_entities(C) , ['?'] , blanks , ['.'] , blanks , ctx_process(K1) , { list_to_ord_set(R,OR), list_to_ord_set(I,OI), list_to_ord_set(C,OC), K = guarded(OR,OI,OC,K1) } ;
                   ide(X) , { X == nil , K = nil } ;
                   ide(X) , { X \== nil, K = rec(X) } .
ctx_process_rest([K|Ks]) --> ['+'] , blanks, ctx_process(K) , blanks , ctx_process_rest(Ks) .
ctx_process_rest([]) --> [')'] .

summation([K],K) :- ! .
summation([K|Ks],plus(K,K1)) :- summation(Ks,K1) .
/* DCG clauses for numbers
a number is a non-negative natural number.
*/
num(N) --> [C] , { code_type(C, digit) }, num_rest(Cs), { number_codes(N, [C|Cs]) } .
num_rest([]) --> [] .
num_rest([C|Cs]) --> num_next(C), num_rest(Cs) .
num_next(C) --> [C], { code_type(C, digit) } .


/* Environments */
parse_env(Str,AssocList) :- string_chars(Str,Chars) , phrase(env(Term),Chars) , 
                            create_env(Term,AssocList) .
create_env([],AssocList) :- empty_assoc(AssocList) .
create_env([def(Ide,K)|Ds],AssocList) :- create_env(Ds,AssocListRest), 
                                         put_assoc(Ide,AssocListRest,K,AssocList) .
/* DCG clauses for environments of possibly recursively defined context-process constants
a constant declaration D takes the form "ide = K", represented by the term def(ide,K)
an environment is AN ASSOCIATION LIST of constant declarations
*/
env([D|Ds]) --> ['['] , blanks , ide(X) , blanks , ['='] , blanks , ctx_process(K) , { D = def(X,K) } , blanks , env_rest(Ds) .
env_rest([D|Ds]) --> [','] , blanks , ide(X) , blanks , ['='] , blanks , ctx_process(K) , { D = def(X,K) } , blanks , env_rest(Ds) .
env_rest([]) --> [']'] .


/* Assertions */
parse_assert(Str,Term) :- string_chars(Str,Chars) , phrase(formula_assert(Term),Chars) .
/* DCG clauses for assertion predicates over the labels of the transitions of Reaction Systems processes
we recall that labels are of the form obs(E,C,T,R,RI,I,IR,P) where
- E are the entities in the system
- C are the entities provided by the context
- T are the entities available (the union of E and C)
- R are the reagents of applied reactions
- RI are the entities whose presence inhibited some reaction
- I are the inhibitors of applied reactions
- IR are the entities whose absence inhibited some reaction
- P are the produced entities
an assertion is either 
- "? inW", the non-emptyness test for T, represented by the term nonempty(ent)
- "? inR", the non-emptyness test for R\cup RI, represented by the term nonempty(rea)
- "? inI", the non-emptyness test for I\cup IR, represented by the term nonempty(inh)
- "? inP", the non-emptyness test for P, represented by the term nonempty(pro)
- "C inW", the test for inclusion of the set of entities C in T, represented by the process sub(C,ent)
- "C inR", the test for inclusion of the set of entities C in R\cup RI, represented by the process sub(C,rea)
- "C inI", the test for inclusion of the set of entities C in I\cup IR, represented by the process sub(C,inh)
- "C inP", the test for inclusion of the set of entities C in P, represented by the process sub(C,pro)
- "-F", the negation of the assertion F, represented by the term not(F)
- "(F1 ^ F2)", the xor of assertions F1 and F2, represented by the term xor(F1,F2)
- "(F1 \\/ ... \\/ Fn)", the disjunction between assertions F1,...,Fn, represented by the disjunction term or(F1,or(...,Fn))
- "(F1 /\\ ... /\\ Fn)", the conjunction between assertions F1,...,Fn, represented by the conjunction term and(F1,and(...,Fn))
*/
formula_assert(F) --> ['-'] , blanks , formula_assert(F1) , { F = not(F1) } ;
                      ['('] , blanks , formula_assert(F1) , blanks , ['^'] , blanks , formula_assert(F2) , blanks , [')'] , { F = xor(F1,F2) } ;
                      ['('] , blanks , formula_assert(F1) , blanks , formula_assert_rest_or(Fs) , { disjunction([F1|Fs],F) } ;
                      ['('] , blanks , formula_assert(F1) , blanks , formula_assert_rest_and(Fs) , { conjunction([F1|Fs],F) } ;
                      set_of_entities(C) , blanks , ['i','n','W'] , { list_to_ord_set(C,OC), F = sub(OC,ent) } ;
                      set_of_entities(C) , blanks , ['i','n','R'] , { list_to_ord_set(C,OC), F = sub(OC,rea) } ;
                      set_of_entities(C) , blanks , ['i','n','I'] , { list_to_ord_set(C,OC), F = sub(OC,inh) } ;
                      set_of_entities(C) , blanks , ['i','n','P'] , { list_to_ord_set(C,OC), F = sub(OC,pro) } ;
                      ['?'] , blanks , ['i','n','W'] , { F = nonempty(ent) } ;
                      ['?'] , blanks , ['i','n','R'] , { F = nonempty(rea) } ;
                      ['?'] , blanks , ['i','n','I'] , { F = nonempty(inh) } ;
                      ['?'] , blanks , ['i','n','P'] , { F = nonempty(pro) } .

formula_assert_rest_or([F|Fs]) --> ['\\','/'] , blanks, formula_assert(F) , blanks , formula_assert_rest_or(Fs) .
formula_assert_rest_or([]) --> [')'] .
formula_assert_rest_and([F|Fs]) --> ['/','\\'] , blanks, formula_assert(F) , blanks , formula_assert_rest_and(Fs) .
formula_assert_rest_and([]) --> [')'] .

disjunction([F],F) :- ! .
disjunction([F|Fs],or(F,F1)) :- disjunction(Fs,F1) .
conjunction([F],F) :- ! .
conjunction([F|Fs],and(F,F1)) :- conjunction(Fs,F1) .


/* BioHML formulas */
parse_bhml(Str,Term) :- string_chars(Str,Chars) , phrase(formula_bhml(Term),Chars) .
/* DCG clauses for BioHML formulas
a BioHML formula is either 
- "true"
- "false"
- "(G1 \\/ ... \\/ Gn)", the disjunction between formulas G1,...,Gn, represented by the disjunction term or(G1,or(...,Gn))
- "(G1 /\\ ... /\\ Gn)", the conjunction between formulas G1,...,Gn, represented by the conjunction term and(G1,and(...,Gn))
- "<F>G", the diamond operator represented by the term diamond(F,G), where F is an assertion
- "[F]G", the box operator represented by the term box(F,G), where F is an assertion
*/
formula_bhml(G) --> ['t','r','u','e'] , { G=true } ;
                    ['f','a','l','s','e'] , { G=false } ;
                    ['('] , blanks , formula_bhml(G1) , blanks , formula_bhml_rest_or(Gs) , { disjunction([G1|Gs],G) } ;
                    ['('] , blanks , formula_bhml(G1) , blanks , formula_bhml_rest_and(Gs) , { conjunction([G1|Gs],G) } ;
                    ['<'] , blanks , formula_assert(F) , blanks , ['>'] , blanks ,formula_bhml(G1) , { G = diamond(F,G1) } ;
                    ['['] , blanks , formula_assert(F) , blanks , [']'] , blanks ,formula_bhml(G1) , { G = box(F,G1) } .

formula_bhml_rest_or([G|Gs]) --> ['\\','/'] , blanks, formula_bhml(G) , blanks , formula_bhml_rest_or(Gs) .
formula_bhml_rest_or([]) --> [')'] .
formula_bhml_rest_and([G|Gs]) --> ['/','\\'] , blanks, formula_bhml(G) , blanks , formula_bhml_rest_and(Gs) .
formula_bhml_rest_and([]) --> [')'] .

%==== Some parsing examples: try the following queries
/*
parse_set("{c,b,a}",C).

parse_ctx("[({a}.nil + x + y)]",Ks).

parse_env("[ x = {a}.{b}.x , y = ({a,c}.y + {b,c}.y)]",Delta).

parse_assert("-(? inP /\\ - {a,b,c} inR /\\ ? inW)",F).

parse_bhml("(<{a} inW>true \\/ [-{a} inW]<{a} inW>true)",G).
*/

%==== FILE SYSTEM I/O ======================================================================

/* openTmpStream and createTmpFileName are used to create I/O streams towards
the file system
- createTmpFileName(Type,Suffix,FileName) creates a new name for a file exploiting a timestamp
- openTmpStream(Type,Suffix,Stream) open a stream in write mode towards a file 
named according to createTmpFileName and situated in the folder defined as working_directory
*/
createTmpFileName(Type,Suffix,FileName) :- get_time(TimeStamp),
                                           stamp_date_time(TimeStamp,DateTime,'UTC'),
                                           date_time_value(date,DateTime,date(Y,Mo,D)),
                                           date_time_value(time,DateTime,time(H,Mi,S)),
                                           atomic_list_concat(['tmp',Type,Y,Mo,D,H,Mi,S],'-',Name),
                                           atomic_list_concat([Name,Suffix],FileName).

openTmpStream(Type,Suffix,Stream) :- wdpath(WD),
                                     working_directory(_,WD),
                                     createTmpFileName(Type,Suffix,FileName),
                                     open(FileName,write,Stream).

%==== BASICS ======================================================================

/*
This initial part allows to define the 'classical' mechanism to compute in a Reaction System (RS) Framework
We have the following sets:
R is a odered set of reagents;
I is a odered set of inhibitors;
P is a odered set of products;
T = odered set of entities which represent the current computation state
*/

/*
The predicate enable(R,I,T) checks if a reaction (R,I,P) can take place (is enabled) in T.
A reaction can take place iff 
- all its reactants R belong to T
- and its inhibitor I are disjoint from T.
*/
enable(R,I,T):- ord_subset(R,T), ord_disjoint(I,T).

/*
The predicate result(T,R,I,P,P1),
computes the outcome P1 of the reaction (R,I,P) given the current state T:
P1 is P if enable(R,I,T) is true, otherwise it is the empty list [].
*/
result(T,R,I,P,P):- enable(R,I,T),!.
result(_,_,_,_,[]).

/* 
The predicate result(T,Rs,P) computes the outcome P of the reactions Rs given the current state T
*/
result(_,[],[]).
result(T,[react(R,I,P)|Rs],P1):- enable(R,I,T),!,
                                 result(T,Rs,P2),
                                 ord_union(P,P2,P1).
result(T,[react(_,_,_)|Rs],L):- result(T,Rs,L).

%==== NEW STUFF FOR PAPER ON SOS RULES =======================================================

%==== TRANSITIONS

/* we recall the syntax for context processes:
nil stops the computation
rec(X) recursive invocation of constant X
pre(C,K) make C available then behaves as K
do(N,K1,K) behaves as K1 for the first N steps, then as K
plus(K1,K2) chooses between K1 and K2
*/

/* unfold(D,Delta,K,Choices) returns the list of choices for the context K given the process definitions Delta
and the current set of entities D
Choices is a list of context moves choice(C,K) where C is a set of entities and K is the continuation
unfold/3 can be applied to single context processes K or to lists of context process Ks
*/
% handle single process
unfold(_,_,nil,[]).
unfold(D,Delta,rec(X),Choices) :- get_assoc(X,Delta,K), unfold(D,Delta,K,Choices).
unfold(_,_,pre(C,K),[choice(C,[K])]).
unfold(D,_,guarded(R,I,C,K),[choice(C,[K])]) :- enable(R,I,D).
unfold(D,_,guarded(R,I,_,_),[]) :- \+ enable(R,I,D).
unfold(D,Delta,do(0,_,K),Choices) :- unfold(D,Delta,K,Choices).
unfold(D,Delta,do(1,K1,K),Choices) :- unfold(D,Delta,K1,Choices1), replace(K,Choices1,Choices).
unfold(D,Delta,do(N,K1,K),Choices) :- N>1, unfold(D,Delta,K1,Choices1), succ(M,N), embed_do(M,K,Choices1,Choices).
unfold(D,Delta,plus(K1,K2),Choices) :- unfold(D,Delta,K1,Choices1), unfold(D,Delta,K2,Choices2), append(Choices1,Choices2,Choices).
% handle lists of processes
unfold(_,_,[],[choice([],[])]).
unfold(D,Delta,[K|Ks],Choices) :- unfold(D,Delta,K,CK),unfold(D,Delta,Ks,CKs),shuffle(CK,CKs,Choices).

/* replace(K,Choices1,Choices) returns the list of choices Choices obtained
by replacing each continuation in Choices1 with K 
*/
replace(_,[],[]).
replace(K,[choice(C1,[_])|CKs1],[choice(C1,[K])|CKs]) :- replace(K,CKs1,CKs).
/* embed_do(M,K,Choices1,Choices) returns the list of choices Choices obtained
by replacing each continuation K1 in Choices1 with do(N,K1,K) 
*/
embed_do(_,_,[],[]).
embed_do(N,K,[choice(C1,[K1])|CKs1],[choice(C1,[do(N,K1,K)])|CKs]) :- embed_do(N,K,CKs1,CKs).

/* shuffle(CKs1,CKs2,Choices) given two lists of choices Cks1 and Cks2,
returns the list Choices of all possible combinations of the choices in CKs1 with those in CKs2
shuffle can be applied to single choices or to lists of choices
*/
% handle lists of choices
shuffle([],_,[]).
shuffle([choice(C,K)|CK],CKs,Choices) :- shuffle(choice(C,K),CKs,Ch1),
                                         shuffle(CK,CKs,Ch2),
                                         append(Ch1,Ch2,Choices).
% handle single choices
shuffle(choice(_,_),[],[]).
shuffle(choice(C1,K1),[choice(C2,K2)|CKs],[choice(C,K)|Choices]) :- ord_union(C1,C2,C),
                                                                    append(K1,K2,K),
                                                                    shuffle(choice(C1,K1),CKs,Choices).
/* a system process S is sys(Delta,E,Ks,Rs) consists of
- an environment Delta (an ASSOCIATION LIST of constant declarations X->K)
- the ORDERED SET E of currently available entities (produced from the previous step)
- the list Ks of context processes
- the list Rs of reaction rules react(R,I,P) (where R,I,P are ORDERED SETS of entities)
*/

/* The predicate oneTransition(S,L,S1) holds if 
the system S has one transition with label L to system S1
when S=sys(Delta,E,Ks,Rs)
- the label L has the form obs(E,C,T,R,RI,I,IR,P)
- the target system process has the form sys(Delta,P,Ks',Rs)
i.e. Delta and Rs are not changed and the product set P in the label becomes the set of available entities
*/
oneTransition(sys(Delta,E,Ks,Rs),L,S) :- unfold(E,Delta,Ks,Choices),
                                         oneTransition(Delta,E,Choices,Rs,tr(L,S)).
oneTransition(Delta,E,[choice(C,K)|_],Rs,M) :- transition(Delta,E,C,K,Rs,M).
oneTransition(Delta,E,[_|Cs],Rs,M) :- oneTransition(Delta,E,Cs,Rs,M).

/* transition(Delta,E,C,K,Rs,Move) returns the unique possible transition Move=tr(L,S1) 
given the current Delta, available entities E \cup C, context continuation K and reactions Rs
*/                                                  
transition(Delta,E,C,K,Rs,tr(obs(E,C,T,R,RI,I,IR,P),sys(Delta,P,K,Rs))) :- ord_union(E,C,T), resultLabel(E,C,T,Rs,obs(E,C,T,R,RI,I,IR,P)).

/* resultLabel(E,C,T,Rs,L) returns the label originating from the execution of reactions Rs with available entities T
*/
resultLabel(E,C,T,[],obs(E,C,T,[],[],[],[],[])).
resultLabel(E,C,T,[react(R,I,P)|Rs],L):- enable(R,I,T),!,
                                         resultLabel(E,C,T,Rs,L1),
                                         unionObs(obs(E,C,T,R,[],I,[],P),L1,L).
resultLabel(E,C,T,[react(R,I,_)|Rs],L):- ord_intersection(I,T,RI),ord_subtract(R,T,IR),
                                         resultLabel(E,C,T,Rs,L1),
                                         unionObs(obs(E,C,T,[],RI,[],IR,[]),L1,L).

/* unionObs(L1,L2,L) combines the labels L1 and L2 into L
*/
unionObs(obs(E,C,T,R1,RI1,I1,IR1,P1),obs(_,_,_,R2,RI2,I2,IR2,P2),obs(E,C,T,R,RI,I,IR,P)) :- ord_union(R1,R2,R),
                                                                                            ord_union(RI1,RI2,RI),
                                                                                            ord_union(I1,I2,I),
                                                                                            ord_union(IR1,IR2,IR),
                                                                                            ord_union(P1,P2,P).

/* allTransitions(S,Moves) returns the ORDERED SET Moves of all possible transitions tr(obs(...),S1) of system S
*/
allTransitions(sys(Delta,E,Ks,Rs),Moves) :- unfold(E,Delta,Ks,Choices),
                                            allTransitions(Delta,E,Choices,Rs,Ms),
                                            list_to_ord_set(Ms,Moves).
allTransitions(_,_,[],_,[]).
allTransitions(Delta,E,[choice(C,K)|Cs],Rs,[M|Ms]) :- transition(Delta,E,C,K,Rs,M),
                                                      allTransitions(Delta,E,Cs,Rs,Ms).

/* since Delta and Rs are unchanged during the evolution of a reaction system,
it is not necessary to incorporate them in all states, which are entirely determined
by the pair ek(E,K) of current entities and context.
The 'smart' versions of many predicates exploit this fact to dramatically reduce 
the size of terms when Delta and Rs are very large.
*/

/* smartTransition(Rs,E,C,Ks,Move) returns the unique possible transition Move=tr(L,EK) 
given the reactions Rs, available entities E and context C, and context continuation Ks
*/                     
smartTransition(Rs,E,C,Ks,tr(obs(E,C,T,R,RI,I,IR,P),ek(P,Ks))) :- ord_union(E,C,T), resultLabel(E,C,T,Rs,obs(E,C,T,R,RI,I,IR,P)).

/* smartOneTransition(Delta,Rs,EK,L,EK1) holds 
if the smart system EK has one transition with label L to smart system EK1
when EK=ek(E,Ks)
- the label L has the form obs(E,C,T,R,RI,I,IR,P)
- the target system process has the form ek(P,Ks')
i.e. the product set P in the label becomes the set of available entities
*/
smartOneTransition(Delta,Rs,ek(E,Ks),L,EK) :- unfold(E,Delta,Ks,Choices),
                                              smartOneTransition(Rs,E,Choices,tr(L,EK)).
smartOneTransition(Rs,E,[choice(C,K)|_],M) :- smartTransition(Rs,E,C,K,M).
smartOneTransition(Rs,E,[_|Cs],M) :- smartOneTransition(Rs,E,Cs,M).


smartAllTransitions(Delta,Rs,ek(E,Ks),Moves) :- unfold(E,Delta,Ks,Choices),
                                                smartAllTransitions(Delta,E,Choices,Rs,Ms),
                                                list_to_ord_set(Ms,Moves).
smartAllTransitions(_,_,[],_,[]).
smartAllTransitions(Delta,E,[choice(C,K)|Cs],Rs,[M|Ms]) :- smartTransition(Rs,E,C,K,M),
                                                           smartAllTransitions(Delta,E,Cs,Rs,Ms).

%==== Some transition examples: try the following queries
/*
oneTransition(sys([],[a,b],[],[react([a],[c],[a]),react([b],[d],[b])]) , L , S).

allTransitions(sys([],[a,b],[],[react([a],[c],[a]),react([b],[d],[b])]) , Moves).

parse_ctx("[({a}.nil + {b}.nil)]",Ks) , oneTransition(sys([],[],Ks,[react([a],[c],[a]),react([b],[d],[b])]),L,S).

parse_ctx("[({a}.nil + {b}.nil)]",Ks) , allTransitions(sys([],[],Ks,[react([a],[c],[a]),react([b],[d],[b])]),Moves).

parse_ctx("[({a}.nil + {b}.nil),({c}.nil + {d}.nil)]",Ks) , oneTransition(sys([],[],Ks,[react([a],[c],[a]),react([b],[d],[b])]),L,S).

parse_ctx("[({a}.nil + {b}.nil),({c}.nil + {d}.nil)]",Ks) , allTransitions(sys([],[],Ks,[react([a],[c],[a]),react([b],[d],[b])]),Moves).
*/

%==== TERMINATING COMPUTATIONS

/* When the context in the system S guarantees termination after a finite number of steps,
the predicate oneTarget(S,N,E) holds 
when E is the set of entities in one of the terminal states reached in N steps
*/
oneTarget(sys(Delta,E,Ks,Rs),N,E1) :- smartOneTarget(Delta,Rs,ek(E,Ks),0,N,E1).
% smart version
smartOneTarget(Delta,Rs,EK,N,N1,E) :- smartOneTransition(Delta,Rs,EK,_,EK1), 
                                      succ(N,M),
                                      smartOneTarget(Delta,Rs,EK1,M,N1,E).
smartOneTarget(Delta,Rs,ek(E,K),N,N,E) :- \+ smartOneTransition(Delta,Rs,ek(E,K),_,_).

/* When the context in the system S guarantees termination after a finite number of steps,
the predicate target(S,E) returns the set of entities in the first terminal state that is found
and the number of steps needed to reach it
*/
target(sys(Delta,E,Ks,Rs),N,E1) :- smartTarget(Delta,Rs,ek(E,Ks),0,N,E1).
% smart version
smartTarget(Delta,Rs,EK,N,N1,E) :- smartOneTransition(Delta,Rs,EK,_,EK1), !, 
                                   succ(N,M),
                                   smartTarget(Delta,Rs,EK1,M,N1,E).
smartTarget(_,_,ek(E,_),N,N,E).

/* When the context in the system S guarantees termination after a finite number of steps,
the predicate oneRun(S,Ss) holds when Ss is one of the possible sequence of states traversed by 
a computation that starts at S
the predicate run(S,Ss) returns just the first found sequence
*/
oneRun(S,[S|Ss]) :- oneTransition(S,_,S1), oneRun(S1,Ss).
oneRun(S,[S]) :- \+ oneTransition(S,_,_).

run(S,[S|Ss]) :- oneTransition(S,_,S1), !, run(S1,Ss).
run(S,[S]).

/* smart versions of the above predicates, only records the traces of entities and used contexts
*/
smartOneRunEK(sys(Delta,E,Ks,Rs),EKs) :- smartOneRunEK(Delta,Rs,ek(E,Ks),EKs). 
smartOneRunEK(Delta,Rs,EK,[EK|EKs]) :- smartOneTransition(Delta,Rs,EK,_,EK1), 
                                       smartOneRunEK(Delta,Rs,EK1,EKs).
smartOneRunEK(Delta,Rs,EK,[EK]) :- \+ smartOneTransition(Delta,Rs,EK,_,_).

smartRunEK(sys(Delta,E,Ks,Rs),EKs) :- smartRunEK(Delta,Rs,ek(E,Ks),EKs). 
smartRunEK(Delta,Rs,EK,[EK|EKs]) :- smartOneTransition(Delta,Rs,EK,_,EK1), !, 
                                    smartRunEK(Delta,Rs,EK1,EKs).
smartRunEK(_,_,EK,[EK]).

/* splitted versions of the above predicates, 
records separately the traces of entities E and used contexts C and their union T
*/
smartOneTransitionECT(Delta,Rs,EK,EK1,E,C,T) :- smartOneTransition(Delta,Rs,EK,obs(E,C,T,_,_,_,_,_),EK1).

smartOneRunECT(sys(Delta,E,Ks,Rs),Es,Cs,Ts) :- smartOneRunECT(Delta,Rs,ek(E,Ks),Es,Cs,Ts). 
smartOneRunECT(Delta,Rs,EK,[E|Es],[C|Cs],[T|Ts]) :- smartOneTransitionECT(Delta,Rs,EK,EK1,E,C,T), 
                                                    smartOneRunECT(Delta,Rs,EK1,Es,Cs,Ts).
smartOneRunECT(Delta,Rs,ek(E,K),[E],[[]],[E]) :- \+ smartOneTransitionECT(Delta,Rs,ek(E,K),_,_,_,_).

smartRunECT(sys(Delta,E,Ks,Rs),Es,Cs,Ts) :- smartRunECT(Delta,Rs,ek(E,Ks),Es,Cs,Ts). 
smartRunECT(Delta,Rs,EK,[E|Es],[C|Cs],[T|Ts]) :- smartOneTransitionECT(Delta,Rs,EK,EK1,E,C,T), !, 
                                                 smartRunECT(Delta,Rs,EK1,Es,Cs,Ts).
smartRunECT(_,_,ek(E,_),[E],[[]],[E]).

%==== FIXED PERPETUAL CONTEXT (AND CONFLUENCE)

/* A special case of systems is when the context recursively provides always the same set of entities.
The corresponding computation is infinite.
It consists of a finite sequence of states (Prefix) followed by a looping sequence (Loop).
IMPORTANT: We assume the only context has the form x = Q.x 
and disregard any other process context and the rest of the environment Delta.
The set of reactions Rs and the context x are constant.
Each state of the computation is distinguished by the current entities E.
Under these assumptions, the predicate lollipop finds the Prefix and the Loop sequences of entities. 
*/
lollipop(sys(Delta,E,_,Rs),Prefix,Loop) :- get_assoc(x,Delta,pre(Q,rec(x))),
                                           lollipopAux(Rs,Q,E,[],Prefix,Loop).
lollipop(Rs,Q,E,Prefix,Loop) :- lollipopAux(Rs,Q,E,[],Prefix,Loop).

lollipopAux(_,_,E,ReverseTrace,Prefix,Loop) :- split(E,ReverseTrace,Prefix,[],Loop), !.
lollipopAux(Rs,Q,E,ReverseTrace,Prefix,Loop) :- ord_union(E,Q,T),
                                                result(T,Rs,P),
                                                lollipopAux(Rs,Q,P,[E|ReverseTrace],Prefix,Loop).
split(E,[E|ReverseTrace],Prefix,LoopAux,[E|LoopAux]) :- reverse(ReverseTrace,Prefix),!.
split(E,[F|ReverseTrace],Prefix,LoopAux,Loop) :- split(E,ReverseTrace,Prefix,[F|LoopAux],Loop).

loop(S,Loop) :- lollipop(S,_,Loop).

% version that records the unions of entities and context
lollipopT(sys(Delta,E,_,Rs),Prefix,Loop) :- get_assoc(x,Delta,pre(Q,rec(x))),
                                            lollipopT(Rs,Q,E,Prefix,Loop).
lollipopT(Rs,Q,E,Prefix,Loop) :- ord_union(E,Q,T), lollipopAuxT(Rs,Q,T,[],Prefix,Loop).

lollipopAuxT(_,_,T,ReverseTrace,Prefix,Loop) :- split(T,ReverseTrace,Prefix,[],Loop), !.
lollipopAuxT(Rs,Q,T,ReverseTrace,Prefix,Loop) :- result(T,Rs,P),
                                                 ord_union(P,Q,PQ),
                                                 lollipopAux(Rs,Q,PQ,[T|ReverseTrace],Prefix,Loop).

/* Two set of entities E1 and E2 are confluent w.r.t. the perpetual context Q iff
they reach the same loop.
The predicate confluent(Rs,Q,Es,Loop,Distance,Dimension) checks if all the sets
of entities in Es are confluent and if so returns the Loop, the maximal length of
prefixes traversed to reached the loop and its dimension (length).
*/
confluent(_,_,[],[],0,0).
confluent(Rs,Q,[E|Es],Loop,Distance,Dimension) :- lollipop(Rs,Q,E,Prefix,Loop),
                                                  length(Prefix,MaxDistance),
                                                  length(Loop,Dimension),
                                                  list_to_ord_set(Loop,OrdLoop),
                                                  confluents(Rs,Q,Es,OrdLoop,MaxDistance,Distance).
confluents(_,_,[],_,MaxDistance,MaxDistance).
confluents(Rs,Q,[E|Es],OrdLoop,MaxDistance,Distance) :- lollipop(Rs,Q,E,Prefix,[F|_]),
                                                        ord_memberchk(F,OrdLoop),
                                                        length(Prefix,NewDistance),
                                                        NewMaxDistance is max(MaxDistance,NewDistance),
                                                        confluents(Rs,Q,Es,OrdLoop,NewMaxDistance,Distance).

/* The predicate invariant(Rs,Q,Es,Inv,Loop) checks if all the sets
of entities in Es are confluent and if so returns the set Inv of all traversed
states, together with the loop.
*/
invariant(_,_,[],[],[]).
invariant(Rs,Q,[E|Es],Inv,Loop) :- lollipop(Rs,Q,E,Prefix,Loop),
                                   append(Prefix,Loop,Trace),
                                   list_to_ord_set(Trace,OrdTrace),
                                   invariants(Rs,Q,Es,OrdTrace,Inv).

invariants(_,_,[],OrdTrace,OrdTrace).
invariants(Rs,Q,[E|Es],OrdTrace,Inv) :- invariantsAux(Rs,Q,E,OrdTrace,[],New),
                                        list_to_ord_set(New,OrdNew),
                                        ord_union(OrdTrace,OrdNew,OrdTrace1),
                                        invariants(Rs,Q,Es,OrdTrace1,Inv).

invariantsAux(_,_,E,OrdTrace,Prefix,Prefix) :- ord_memberchk(E,OrdTrace), !.
invariantsAux(Rs,Q,E,OrdTrace,Prefix,New) :- \+ member(E,Prefix),
                                             ord_union(E,Q,T),
                                             result(T,Rs,P),
                                             invariantsAux(Rs,Q,P,OrdTrace,[E|Prefix],New).

/* Suppose the context has the form
Q1. ... Q1.Q2. ... Q2. ... Qn. ... Qn. ...
and that each context Q1, Q2, ... , Q(n-1) is provided for a large number of times,
enough to stabilize the system in a loop (while Qn is provided infinitely many times).
Then it can be the case that when the context switches from Qi to Q(i+1),
no matter what is the current state of the loop for Qi at the moment of the switching,
the system will stabilize in the same loop for Q(i+1):
If this is the case the system is called "loop confluent".
The predicate loopConfluent checks this property over the list of contexts
[Q1,Q2,...,Qn] and returns the lists of Loops, Distances and Dimensions for all Qi's
*/
loopConfluent(_,[],_,[],[],[]) :- !.
loopConfluent(_,_,[],[],[],[]) :- !.
loopConfluent(Rs,[Q],Es,[Loop],[Distance],[Dimension]) :- !, confluent(Rs,Q,Es,Loop,Distance,Dimension).
loopConfluent(Rs,[Q|Qs],Es,[Loop|Loops],[Distance|Distances],[Dimension|Dimensions]) :- 
             !, confluent(Rs,Q,Es,Loop,Distance,Dimension), !,
             write('ok: '),write(Loop),nl, % DEBUG
             loopConfluent(Rs,Qs,Loop,Loops,Distances,Dimensions).

/* "strong confluence" requires loop confluence and additionally check
that even if the context is switched BEFORE REACHING THE LOOP for Qi
the traversed states are still confluent for Q(i+1)
IMPORTANT: this notion of confluence assumes each context can be executed 0 or more times 
*/
strongConfluent(_,[],_,[],[],[]) :- !.
strongConfluent(_,_,[],[],[],[]) :- !.
strongConfluent(Rs,[Q],Es,[Inv],[Loop],[Dimension]) :- 
             !, invariant(Rs,Q,Es,Inv,Loop), length(Inv,Dimension).
strongConfluent(Rs,[Q|Qs],Es,[Inv|Invs],[Loop|Loops],[Dimension|Dimensions]) :- 
             !, invariant(Rs,Q,Es,Inv,Loop), length(Inv,Dimension), !,
             write('ok: '),write(Dimension),nl, % DEBUG
             strongConfluent(Rs,Qs,Inv,Invs,Loops,Dimensions).

/* "weak confluence" requires loop confluence and additionally check
that even if the context is switched AFTER PROVIDING Qi BUT BEFORE REACHING THE LOOP for Qi
the traversed states are still confluent for Q(i+1)
IMPORTANT: this notion of confluence assumes each context can be executed 1 or more times 
*/
weakConfluent(_,[],_,[],[],[]) :- !.
weakConfluent(_,_,[],[],[],[]) :- !.
weakConfluent(Rs,[Q],Es,[Inv],[Loop],[Dimension]) :- 
             !, next(Rs,Q,Es,Es1), list_to_ord_set(Es1,OrdEs),
             invariant(Rs,Q,OrdEs,Inv,Loop), length(Inv,Dimension).
weakConfluent(Rs,[Q|Qs],Es,[Inv|Invs],[Loop|Loops],[Dimension|Dimensions]) :- 
             !, next(Rs,Q,Es,Es1), list_to_ord_set(Es1,OrdEs),
             invariant(Rs,Q,OrdEs,Inv,Loop), length(Inv,Dimension), !,
             write('ok: '),write(Dimension),nl, % DEBUG
             weakConfluent(Rs,Qs,Inv,Invs,Loops,Dimensions).

/* The predicate next(Rs,Q,Es,Ps) returns the list of results for all the states in 
the list Es when Q is provided by the context
*/
next(_,_,[],[]).
next(Rs,Q,[E|Es],[P|Ps]) :- ord_union(E,Q,T), result(T,Rs,P), next(Rs,Q,Es,Ps).


%==== FREQUENCY

/* Some experiments exploit a deterministic context to estimate how much frequently
some entities appear in a finite run.
This can be done naively by collecting the states traversed in the run, and counting the 
overall number of occurrences of each entity divided by the number of steps.
IMPORTANT: S is assumed to be deterministic and terminating.
*/
naiveFreq(S,AssocList) :- smartRunECT(S,Es,_,_),
                          create_freq(Es,1,AssocList).

/* The predicate create_freq(Es,W,AssocList) takes a list of states and a weight and 
returns the associative list entity->(weighted) frequency
The default weight should be 1
*/
create_freq(Es,W,AssocList) :- length(Es,Total),
                               append(Es,MEs),
                               msort(MEs,Mset),
                               create_freq(Mset,W,Total,AssocList).

/* create_freq/4 is an auxiliary predicate that takes in input an ordered list
with repetitions (a multiset) and a weight and returns the associative list entity->(weighted) frequency
The default weight should be 1
*/
create_freq([],_,_,AssocList) :- empty_assoc(AssocList) .
create_freq([A|E],W,Total,AssocList) :- count(A,E,1,N,RestE), 
                                        Freq is floor(N*W*100/Total),
                                        create_freq(RestE,W,Total,AssocListRest), 
                                        put_assoc(A,AssocListRest,Freq,AssocList).
/* count(A,E,N,M,RestE) computes M=N+N1, where N1 is the length of the longest prefix
A,...,A of the list E. RestE is the rest of the list.
*/
count(_,[],N,N,[]) :- !.
count(A,[A|E],N,M,RestE) :- !, succ(N,N1),
                            count(A,E,N1,M,RestE).
count(_,E,N,N,E).


/* As noted before, special case of systems is when the context recursively always provides 
the same set of entities:
the corresponding computation is infinite and it consists of 
a finite sequence of states (Prefix) followed by a looping sequence (Loop).
IMPORTANT: We assume the only context has the form x = Q.x 
and disregard any other process context and the rest of the environment Delta.
The set of reactions Rs and the context x are constant.
Each state of the computation is distinguished by the current entities E.
Under these assumptions, entitites frequencies can be computed directly by
considering their occurrences in the finite Loop (assuming the states traversed
in the finite Prefix to stabilize the system in the loop are not relevant).
The predicate loopFreq computes such frequencies.
*/
loopFreq(sys(Delta,E,_,Rs),AssocList) :- get_assoc(x,Delta,pre(Q,rec(x))),
                                         loopFreq(Rs,1,Q,E,_,AssocList).
loopFreq(Rs,W,Q,E,Loop,AssocList) :- lollipop(Rs,Q,E,_,Loop),
                                     create_freq(Loop,W,AssocList).


/* Suppose the context has the form
Q1. ... Q1.Q2. ... Q2. ... Qn. ... Qn. ...
and that each context Q1, Q2, ... , Q(n-1) is provided for a large number of times,
enough to stabilize the system in a loop (while Qn is provided infinitely many times).
If the system is "loop confluent" then the frequency that matters most is
that of the nth loop (as if all the other transient states are ignored).
The predicate limitFreq computes such frequencies.
IMPORTANT: the calculation makes sense if the computation is infinite and one of the following holds
- the system is loop confluent and Q1...Q(n-1) are provided enough times to reach their correspoding loops
- the system is weak confluent and Q1...Q(n-1) are provided at least one time each
- the system is strong confluent
*/
limitFreq(Rs,[Q],E,LimitLoop,AssocList) :- !, loopFreq(Rs,1,Q,E,LimitLoop,AssocList).
limitFreq(Rs,[Q|Qs],E,LimitLoop,AssocList) :- lollipop(Rs,Q,E,_,[F|_]),
                                              limitFreq(Rs,Qs,F,LimitLoop,AssocList).

/* Suppose the context has the form
Q1. ... Q1.Q2. ... Q2. ... Qn. ... Qn.
and that each context Qi is provided for a large number of times Wi,
enough to stabilize the system in Loop_i after traversing a Prefix_i 
(note that Qn is also provided finitely many times so that the run is finite)
If the length of each Prefix_i is irrelevant w.r.t. W_i the frequencies that
matter the most are those in each Loop_i.
This fact can be exploited to drastically reduce the time of the experiment
by estimating the frequencies of the run as the (weighted) sum of the frequencies in
each loop.
The predicate fastFreqs computes such estimated frequencies.
IMPORTANT: the calculation makes sense if 
- the computation is finite
- and all transient states in Prefix_i are irrelevant
- and the system is loop confluent and Q1...Q(n-1) 
  are provided enough times to reach their correspoding loops
*/
fastFreq(Rs,Ws,Qs,E,AssocList) :- fastFreqs(Rs,Ws,Qs,E,PairLists),
                                  append(PairLists,PairsList),
                                  msort(PairsList,OrdPairsList),
                                  sum_list(Ws,TotW),
                                  wsum_freq(OrdPairsList,TotW,AssocList).
fastFreqs(_,[],[],_,[]). 
fastFreqs(Rs,[W|Ws],[Q|Qs],E,[PairList|PairLists]) :- loopFreq(Rs,W,Q,E,[F|_],AssocList),
                                                      assoc_to_list(AssocList,PairList),
                                                      fastFreqs(Rs,Ws,Qs,F,PairLists).
                                 
/* wsum_freq takes an ordered list of item-value pairs and 
returns the assoclist item->(values sum)/TotW 
*/
wsum_freq([],_,AssocList) :- empty_assoc(AssocList) .
wsum_freq([(A-V)|AVs],TotW,AssocList) :- sum(A,AVs,V,N,RestAVs), 
                                           Freq is floor(N/TotW),
                                           wsum_freq(RestAVs,TotW,AssocListRest), 
                                           put_assoc(A,AssocListRest,Freq,AssocList).
sum(_,[],N,N,[]) :- !.
sum(A,[(A-U)|AVs],V,M,RestAVs) :- !, N is U+V,
                                  sum(A,AVs,N,M,RestAVs).
sum(_,AVs,N,N,AVs).

%==== LTS GRAPH CREATION

/* graph(S,Nodes,Arcs) generates the LTS (Nodes,Arcs) of all processes reachable from the system process S
it exploits the auxiliary predicate graphAux(Ss,Ns,As,Nodes,Arcs) where
- Ss are the nodes to visit
- Ns are the nodes already explored
- As are the arcs already inserted
- (Nodes,Arcs) is the graph to compute
*/
graph(S,Nodes,Arcs) :- write('computing '), flush_output, % DEBUG
                       graphAux([S],[],[],Nodes,Arcs),
                       writeln(' done!'), flush_output. % DEBUG
graphAux([],Nodes,Arcs,Nodes,Arcs).
graphAux([S|Ss],Ns,As,Nodes,Arcs) :- ord_memberchk(S,Ns),!,
                                     graphAux(Ss,Ns,As,Nodes,Arcs).
graphAux([S|Ss],Ns,As,Nodes,Arcs) :- write('.'), flush_output, % DEBUG
                                     allTransitions(S,Moves),
                                     statesAndArcs(S,Moves,NewStates,NewArcs),
                                     append(NewStates,Ss,Ss1),
                                     append(NewArcs,As,As1),
                                     ord_add_element(Ns,S,Ns1), !,
                                     graphAux(Ss1,Ns1,As1,Nodes,Arcs).
statesAndArcs(_,[],[],[]).
statesAndArcs(S,[tr(L,S1)|Moves],NewStates,NewArcs) :- statesAndArcs(S,Moves,NewSs,NewAs),
                                                       ord_add_element(NewSs,S1,NewStates),
                                                       ord_add_element(NewAs,arc(S,L,S1),NewArcs).

/* smart version of the previous predicate: Delta and Rs are removed from state descriptions,
which become entities-context processes pairs ek(E,K)
*/
smartGraph(sys(Delta,E,Ks,Rs),Nodes,Arcs) :- write('computing '), flush_output, % DEBUG
                                             smartGraphAux(Delta,Rs,[ek(E,Ks)],[],[],Nodes,Arcs),
                                             writeln(' done!'), flush_output. % DEBUG
smartGraphAux(_,_,[],Nodes,Arcs,Nodes,Arcs).
smartGraphAux(Delta,Rs,[EK|EKs],Ns,As,Nodes,Arcs) :- ord_memberchk(EK,Ns),!,
                                                     smartGraphAux(Delta,Rs,EKs,Ns,As,Nodes,Arcs).
smartGraphAux(Delta,Rs,[EK|EKs],Ns,As,Nodes,Arcs) :- write('.'), flush_output, % DEBUG
                                                     smartAllTransitions(Delta,Rs,EK,Moves),
                                                     statesAndArcs(EK,Moves,NewStates,NewArcs),
                                                     append(NewStates,EKs,EKs1),
                                                     append(NewArcs,As,As1),
                                                     ord_add_element(Ns,EK,Ns1),
                                                     smartGraphAux(Delta,Rs,EKs1,Ns1,As1,Nodes,Arcs).


%==== GRAPHICAL REPRESENTATIONS OF LTS, RUNS, LOLLIPOPS

/* This section collects a series of predicates for saving on the file systems 
text like representations in .dot format of graphs describing Reaction Systems computations

A file in .dot format roughly consists of the list of nodes and arcs of the graph,
it can be edited with any text editor.

Graphs in .dot format can be visualized using, e.g., 

GraphViz (https://graphviz.org)
Gephi (https://gephi.org)

or one of the online tools available at

https://visjs.github.io/vis-network/examples/network/data/dotLanguage/dotEdgeStyles.html
http://magjac.com/graphviz-visual-editor/

The python script dottoxml.py available at

www: https://bitbucket.org/dirkbaechle/dottoxml

can be used for conversions to other formats (Graphml|GML|GDF)

In particular, graphs in .graphml format can be conveniently manipulated
using the graph editor

yEd (https://www.yworks.com/products/yed)

*/


/* digraph(S) saves on the file systems a text like representation of the 
whole LTS for system process S
*/
digraph(S) :- graph(S,Nodes,Arcs),
              writeDigraph(Nodes,Arcs).

writeDigraph(Nodes,Arcs) :- openTmpStream(plaindigraph,'.dot',Stream),
                            digraphstyle(DGStyle),
                            write(Stream,DGStyle),
                            writeNodes(Stream,Nodes),
                            writeEdges(Stream,Arcs),
                            writeln(Stream,'}'),
                            close(Stream).

/* digraphstyle/1 sets the default style for nodes and edges 
*/
digraphstyle('digraph G {\n\nnode [shape=box, style="filled, rounded"]\nedge [arrowhead = vee]\n\n').

/* For readability issues, each node sys(Delta,E,Ks,Rs) is represented by Ks;E
*/
writeNodes(Stream,[]) :- nl(Stream).
writeNodes(Stream,[sys(_,E,K,_)|Ns]) :- writeNode(Stream,E,K),writeln(Stream,';'),
                                        writeNodes(Stream,Ns).

%writeNode(Stream,[],K) :- write(Stream,'"'),!,writeKs(Stream,K),write(Stream,'-"').
writeNode(Stream,E,K) :- write(Stream,'"'),writeKs(Stream,K),writeE(Stream,E),write(Stream,'"').

writeE(Stream,[]) :- write(Stream,'0').
writeE(Stream,[A]) :- write(Stream,A),!.
writeE(Stream,[A|E]) :- write(Stream,A),write(Stream,';'),writeE(Stream,E).

writeKs(_,[]).
writeKs(Stream,[K|Ks]) :- writeK(Stream,K),write(Stream,';'),writeKs(Stream,Ks).

writeK(Stream,nil) :- write(Stream,'nil').
writeK(Stream,rec(X)) :- write(Stream,X).
writeK(Stream,pre(C,K)) :- writeE(Stream,C),write(Stream,'.'),writeK(Stream,K).
writeK(Stream,plus(K1,K2)) :- writeK(Stream,K1),write(Stream,'+'),writeK(Stream,K2).
writeK(Stream,do(_,K1,_)) :- % ABSTRACT AWAY FROM SOME DETAILS
                             % write(Stream,'do_'),
                             % writeK(Stream,K1),write(Stream,'_do_'),
                             % write(Stream,N)
                             % , write(Stream,'_then_'),
                             writeK(Stream,K1) % ERBB specific
                             .

/* For readability issues, each label obs(E,C,T,R,RI,I,IR,P) is represented by C
*/
writeEdges(Stream,[]) :- nl(Stream).
writeEdges(Stream,[arc(sys(_,E,K,_),obs(_,C,_,_,_,_,_,_),sys(_,E1,K1,_))|Ts]) :- 
      writeEdge(Stream,E,K,E1,K1),
      write(Stream,' [ label = "'),writeE(Stream,C),writeln(Stream,'" ];'),
      writeEdges(Stream,Ts).

writeEdge(Stream,E,K,E1,K1) :- writeNode(Stream,E,K),write(Stream,' -> '),writeNode(Stream,E1,K1).


/* smart version of the previous predicate: Delta and Rs are removed from state descriptions,
which become entities-context processes pairs ek(E,K)

Additionally, more flexibility in the graph layout is given by parametric difinitions
of labels for nodes and edges of the graph:

EKMask can be
- hide: a shorthand for ek([],hide)
- ek(all,all): the label of a state ek(E,K) shows K;E (DEFAULT OPTION)
- ek(all,hide): the label of a state ek(E,K) shows E
- ek(Mask,all): the label of a state ek(E,K) shows K;(E \cap Mask)
- ek(Mask,hide): the label of a state ek(E,K) shows (E \cap Mask)

ECTView can be
- hide: any label is represented by tau (DEFAULT OPTION)
- prod(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by P
- prod(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by P \cap View
- ent(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by E
- ent(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by E \cap View
- ctx(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by C
- ctx(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by C \cap View
- cup(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by T
- cup(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by T \cap View
- diff(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by C-E
- diff(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by C-E \cap View
- sep(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by C , E
- sep(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by C \cap View , E \cap View
- delta(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by two arrows
       the red arrow is labelled with E-P (entities deleted)
       the blue arrow is labelled with P-E (entities added)
- delta(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by two arrows
       the red arrow is labelled with E-P \cap View (entities in View that disappear)
       the blue arrow is labelled with P-E \cap View (entities in View that appear)
*/
smartDigraph(S,Nodes,Arcs) :- smartDigraph(S,Nodes,Arcs,ek(all,all),ctx(all)).
smartDigraph(S,Nodes,Arcs,EKMask,ECTView) :- smartGraph(S,Nodes,Arcs),
                                             writeSmartDigraph(Nodes,Arcs,EKMask,ECTView).

writeSmartDigraph(Nodes,Arcs) :- writeSmartDigraph(Nodes,Arcs,ek(all,all),ctx(all)).
writeSmartDigraph(Nodes,Arcs,EKMask,ECTView) :- openTmpStream(digraph,'.dot',Stream),
                                                digraphstyle(DGStyle),
                                                write(Stream,DGStyle),
                                                writeSmartNodes(Stream,Nodes,EKMask),
                                                writeSmartEdges(Stream,Arcs,ECTView),
                                                writeln(Stream,'}'),
                                                close(Stream).


/* The label of each node is displayed when the graph is visualized.
The definition of the label for the node ek(E,K) is parametric on EKMask

We recall that EKMask can be
- hide: a shorthand for ek([],hide)
- ek(all,all): the label of a state ek(E,K) shows K;E (DEFAULT OPTION)
- ek(all,hide): the label of a state ek(E,K) shows E
- ek(Mask,all): the label of a state ek(E,K) shows (E \cap Mask) , K
- ek(Mask,hide): the label of a state ek(E,K) shows (E \cap Mask)
*/
writeSmartNodes(Stream,[],_) :- nl(Stream).
writeSmartNodes(Stream,[ek(E,K)|Ns],EKMask) :- writeNode(Stream,E,K),
                                               nodeStyle(E,K,Style),
                                               writeNodeLabel(Stream,E,K,EKMask,Style),
                                               writeSmartNodes(Stream,Ns,EKMask).

%writeNodeLabel(Stream,_,_,hide,Style) :- write(Stream,' [ label = "s", fillcolor='),write(Stream,Style),writeln(Stream,'];').
writeNodeLabel(Stream,E,K,hide,Style) :- !, writeNodeLabel(Stream,E,K,ek([],hide),Style).
writeNodeLabel(Stream,E,K,ek(all,all),Style) :- !, write(Stream,' [ label = "'),writeKs(Stream,K),writeE(Stream,E),write(Stream,'", fillcolor='),write(Stream,Style),writeln(Stream,'];').
writeNodeLabel(Stream,E,_,ek(all,hide),Style) :- !, write(Stream,' [ label = "'),writeE(Stream,E),write(Stream,'", fillcolor='),write(Stream,Style),writeln(Stream,'];').
writeNodeLabel(Stream,E,K,ek(Mask,all),Style) :- ord_intersection(E,Mask,EMask),
                                                 write(Stream,' [ label = "'),writeKs(Stream,K),writeE(Stream,EMask),write(Stream,'", fillcolor='),write(Stream,Style),writeln(Stream,'];').
writeNodeLabel(Stream,E,_,ek(Mask,hide),Style) :- ord_intersection(E,Mask,EMask),
                                                  write(Stream,' [ label = "'),writeE(Stream,EMask),write(Stream,'", fillcolor='),write(Stream,Style),writeln(Stream,'];').

/* based on the content of E and K it is also possible to set a different style
for the node: here we just set the color, but in principle other attributes
can be defined */ 
nodeStyle(E,_,'"#FF5533"') :- ord_memberchk(col_major,E), ! . % used for the AFIB example
nodeStyle(E,_,'"#E6E600"') :- ord_memberchk(danger,E), ! . % used for the AFIB example
nodeStyle(E,_,'"#FFAD33"') :- ord_memberchk(col_moderate,E), ! . % used for the AFIB example
nodeStyle(E,_,'"#99CCFF"') :- ord_memberchk(col_minor,E), ! . % used for the AFIB example
nodeStyle(E,_,'"#E6E600"') :- ord_memberchk(alert_dup,E), ! . % used for the AFIB example
nodeStyle(E,_,'"#FFAA99"') :- ord_memberchk(q4,E), ! . % used for the NDFA example
nodeStyle(_,[rec(e3)],'"#FFAA99"') :- ! .
nodeStyle(_,[rec(e4)],'"#FFAA99"') :- ! .
nodeStyle(_,[rec(x1)],'"#FFAA99"') :- ! .
nodeStyle(_,[rec(x1a)],'"#FFAA99"') :- ! .
nodeStyle(_,[rec(x1b)],'"#FFAA99"') :- ! .
nodeStyle(_,[rec(x2)],'"#FF9933"') :- ! .
nodeStyle(_,[rec(x3)],'"#FFEE99"') :- ! .
nodeStyle(_,[rec(x4)],'"#BBFF99"') :- ! .
nodeStyle(_,[rec(x5)],'"#99FFEE"') :- ! .
nodeStyle(_,[rec(x6)],'"#99AAFF"') :- ! .
nodeStyle(_,[rec(x7)],'"#CC99FF"') :- ! .
nodeStyle(_,[rec(x8)],'"#EE99FF"') :- ! .
nodeStyle(_,[rec(x9)],'"#FF99AA"') :- ! .
nodeStyle(_,[rec(y1)],'"#FFAA99"') :- ! .
nodeStyle(_,[rec(y2)],'"#FF9933"') :- ! .
nodeStyle(_,[rec(y3)],'"#FFEE99"') :- ! .
nodeStyle(_,[rec(y4)],'"#BBFF99"') :- ! .
nodeStyle(_,[rec(y5)],'"#99FFEE"') :- ! .
nodeStyle(_,[rec(y6)],'"#99AAFF"') :- ! .
nodeStyle(_,[rec(y7)],'"#CC99FF"') :- ! .
nodeStyle(_,[rec(y8)],'"#EE99FF"') :- ! .
nodeStyle(_,[rec(y9)],'"#FF99AA"') :- ! .
nodeStyle(_,[rec(z1)],'"#FFAA99"') :- ! .
nodeStyle(_,[rec(z2)],'"#FF9933"') :- ! .
nodeStyle(_,[rec(z3)],'"#FFEE99"') :- ! .
nodeStyle(_,[rec(z4)],'"#BBFF99"') :- ! .
nodeStyle(_,[rec(z5)],'"#99FFEE"') :- ! .
nodeStyle(_,[rec(z6)],'"#99AAFF"') :- ! .
nodeStyle(_,[rec(z7)],'"#CC99FF"') :- ! .
nodeStyle(_,[rec(z8)],'"#EE99FF"') :- ! .
nodeStyle(_,[rec(z9)],'"#FF99AA"') :- ! .
nodeStyle(_,[rec(x)],'"#88EEFF"') :- ! .
nodeStyle(_,[do(_,rec(x1),_)],'"#FFAA99"') :- ! .
nodeStyle(_,[do(_,rec(x2),_)],'"#FF9933"') :- ! .
nodeStyle(_,[do(_,rec(x3),_)],'"#FFEE99"') :- ! .
nodeStyle(_,[do(_,rec(x4),_)],'"#BBFF99"') :- ! .
nodeStyle(_,[do(_,rec(x5),_)],'"#99FFEE"') :- ! .
nodeStyle(_,[do(_,rec(x6),_)],'"#99AAFF"') :- ! .
nodeStyle(_,[do(_,rec(x7),_)],'"#CC99FF"') :- ! .
nodeStyle(_,[do(_,rec(x8),_)],'"#EE99FF"') :- ! .
nodeStyle(_,[do(_,rec(x9),_)],'"#FF99AA"') :- ! .
nodeStyle(_,[do(_,rec(y1),_)],'"#FFAA99"') :- ! .
nodeStyle(_,[do(_,rec(y2),_)],'"#FF9933"') :- ! .
nodeStyle(_,[do(_,rec(y3),_)],'"#FFEE99"') :- ! .
nodeStyle(_,[do(_,rec(y4),_)],'"#BBFF99"') :- ! .
nodeStyle(_,[do(_,rec(y5),_)],'"#99FFEE"') :- ! .
nodeStyle(_,[do(_,rec(y6),_)],'"#99AAFF"') :- ! .
nodeStyle(_,[do(_,rec(y7),_)],'"#CC99FF"') :- ! .
nodeStyle(_,[do(_,rec(y8),_)],'"#EE99FF"') :- ! .
nodeStyle(_,[do(_,rec(y9),_)],'"#FF99AA"') :- ! .
nodeStyle(_,[do(_,_,rec(x1))],'"#FFAA99"') :- ! .
nodeStyle(_,[do(_,_,rec(x2))],'"#FF9933"') :- ! .
nodeStyle(_,[do(_,_,rec(x3))],'"#FFEE99"') :- ! .
nodeStyle(_,[do(_,_,rec(x4))],'"#BBFF99"') :- ! .
nodeStyle(_,[do(_,_,rec(x5))],'"#99FFEE"') :- ! .
nodeStyle(_,[do(_,_,rec(x6))],'"#99AAFF"') :- ! .
nodeStyle(_,[do(_,_,rec(x7))],'"#CC99FF"') :- ! .
nodeStyle(_,[do(_,_,rec(x8))],'"#EE99FF"') :- ! .
nodeStyle(_,[do(_,_,rec(x9))],'"#FF99AA"') :- ! .
nodeStyle(_,[do(_,_,rec(z1))],'"#FFAA99"') :- ! .
nodeStyle(_,[do(_,_,rec(z2))],'"#FF9933"') :- ! .
nodeStyle(_,[do(_,_,rec(z3))],'"#FFEE99"') :- ! .
nodeStyle(_,[do(_,_,rec(z4))],'"#BBFF99"') :- ! .
nodeStyle(_,[do(_,_,rec(z5))],'"#99FFEE"') :- ! .
nodeStyle(_,[do(_,_,rec(z6))],'"#99AAFF"') :- ! .
nodeStyle(_,[do(_,_,rec(z7))],'"#CC99FF"') :- ! .
nodeStyle(_,[do(_,_,rec(z8))],'"#EE99FF"') :- ! .
nodeStyle(_,[do(_,_,rec(z9))],'"#FF99AA"') :- ! .
nodeStyle(_,[nil],'white') :- ! .
nodeStyle(_,_,'white') :- ! .
% nodeStyle(_,_,'"#AAEEFF"').


/* The label of each edge is displayed when the graph is visualized.
The definition of the edge label for the transition label obs(E,C,T,R,RI,I,IR,P) is parametric on ECTView

We recall that ECTView can be
- hide: any label is represented by tau (DEFAULT OPTION)
- prod(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by P
- prod(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by P \cap View
- ent(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by E
- ent(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by E \cap View
- ctx(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by C
- ctx(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by C \cap View
- cup(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by T
- cup(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by T \cap View
- diff(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by C-E
- diff(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by C-E \cap View
- sep(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by C , E
- sep(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by C \cap View , E \cap View
- delta(all): a label obs(E,C,T,R,RI,I,IR,P) is represented by two arrows
       the red arrow is labelled with E-P (entities deleted)
       the blue arrow is labelled with P-E (entities added)
- delta(View): a label obs(E,C,T,R,RI,I,IR,P) is represented by two arrows
       the red arrow is labelled with E-P \cap View (entities in View that disappear)
       the blue arrow is labelled with P-E \cap View (entities in View that appear)
*/
writeSmartEdges(Stream,[],_) :- !, nl(Stream).
writeSmartEdges(Stream,[arc(ek(E,K),L,ek(E1,K1))|Ts],delta(AllView)) :- !,
      writeEdge(Stream,E,K,E1,K1),
      writeEdgeLabel(Stream,L,delta(AllView),deleted),
      writeEdge(Stream,E,K,E1,K1),
      writeEdgeLabel(Stream,L,delta(AllView),added),
      writeSmartEdges(Stream,Ts,delta(AllView)).
writeSmartEdges(Stream,[arc(ek(E,K),L,ek(E1,K1))|Ts],ECTView) :- 
      writeEdge(Stream,E,K,E1,K1),
      writeEdgeLabel(Stream,L,ECTView),
      writeSmartEdges(Stream,Ts,ECTView).

writeEdgeLabel(Stream,N) :- 
      write(Stream,' [ label = "'),write(Stream,N),writeln(Stream,'" ];').

writeEdgeLabel(Stream,_,hide) :- 
      writeln(Stream,' [ label = "tau" ];').
writeEdgeLabel(Stream,obs(_,_,_,_,_,_,_,P),prod(all)) :- !,
      write(Stream,' [ label = "'),writeE(Stream,P),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(_,_,_,_,_,_,_,P),prod(View)) :-
      ord_intersection(P,View,PView),
      write(Stream,' [ label = "'),writeE(Stream,PView),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(E,_,_,_,_,_,_,_),ent(all)) :- !,
      write(Stream,' [ label = "'),writeE(Stream,E),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(E,_,_,_,_,_,_,_),ent(View)) :-
      ord_intersection(E,View,EView),
      write(Stream,' [ label = "'),writeE(Stream,EView),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(_,C,_,_,_,_,_,_),ctx(all)) :- !,
      write(Stream,' [ label = "'),writeE(Stream,C),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(_,C,_,_,_,_,_,_),ctx(View)) :-
      ord_intersection(C,View,CView),
      write(Stream,' [ label = "'),writeE(Stream,CView),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(_,_,T,_,_,_,_,_),cup(all)) :- !,
      write(Stream,' [ label = "'),writeE(Stream,T),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(_,_,T,_,_,_,_,_),cup(View)) :-
      ord_intersection(T,View,TView),
      write(Stream,' [ label = "'),writeE(Stream,TView),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(E,C,_,_,_,_,_,_),diff(all)) :- !,
      ord_subtract(C,E,CminusE),
      write(Stream,' [ label = "'),writeE(Stream,CminusE),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(E,C,_,_,_,_,_,_),diff(View)) :- 
      ord_subtract(C,E,CminusE),
      ord_intersection(CminusE,View,CminusEView),
      write(Stream,' [ label = "'),writeE(Stream,CminusEView),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(E,C,_,_,_,_,_,_),sep(all)) :- !,
      write(Stream,' [ label = "'),writeE(Stream,C),write(Stream,';'),writeE(Stream,E),writeln(Stream,'" ];').
writeEdgeLabel(Stream,obs(E,C,_,_,_,_,_,_),sep(View)) :-
      ord_intersection(C,View,CView),
      ord_intersection(E,View,EView),
      write(Stream,' [ label = "'),writeE(Stream,CView),write(Stream,';'),writeE(Stream,EView),writeln(Stream,'" ];').

/* IMPORTANT: these clauses apply to set of entities Del/Add, not to observations obs(...)
*/
writeEdgeLabel(Stream,Del,deleted) :- 
      write(Stream,' [ color=red, label = <<font color="red"><b>'),writeE(Stream,Del),writeln(Stream,'</b></font>> ];').
writeEdgeLabel(Stream,Add,added) :- 
      write(Stream,' [ color=blue, label = <<font color="blue"><b>'),writeE(Stream,Add),writeln(Stream,'</b></font>> ];').

writeEdgeLabel(Stream,obs(E,_,_,_,_,_,_,P),delta(all),deleted) :- !,
      ord_subtract(E,P,Deleted),
      writeEdgeLabel(Stream,Deleted,deleted).
writeEdgeLabel(Stream,obs(E,_,_,_,_,_,_,P),delta(all),added) :- !,
      ord_subtract(P,E,Added),
      writeEdgeLabel(Stream,Added,added).
writeEdgeLabel(Stream,obs(E,_,_,_,_,_,_,P),delta(View),deleted) :- 
      ord_subtract(E,P,Deleted),
      ord_intersection(Deleted,View,DeletedView),
      writeEdgeLabel(Stream,DeletedView,deleted).
writeEdgeLabel(Stream,obs(E,_,_,_,_,_,_,P),delta(View),added) :- 
      ord_subtract(P,E,Added),
      ord_intersection(Added,View,AddedView),
      writeEdgeLabel(Stream,AddedView,added).


/* EXPERIMENTAL FEATURE
The idea is to automatically simplify the LTS graph to make it more readable
- The Nodes and Arcs of the whole LTS are computed 
- We find the entities common to ALL the states
- We find the entities common to ALL contexts
- We remove from nodes and arcs the common entities
*/
autoGraph(S,RedNodes,RedArcs,CapE,CapC) :- smartGraph(S,Nodes,Arcs),
                                           cupcap(Nodes,_,CapE),
                                           cupcap(Arcs,_,CapC),
                                           ord_union(CapE,CapC,CapT),
                                           reduce(Nodes,CapE,CapC,CapT,RedNodes),
                                           reduce(Arcs,CapE,CapC,CapT,RedArcs).

autoDigraph(S,Nodes,Arcs,CapE,CapC) :- autoDigraph(S,Nodes,Arcs,CapE,CapC,ek(all,all),ctx(all)).
autoDigraph(S,Nodes,Arcs,CapE,CapC,EKMask,ECTView) :- autoGraph(S,Nodes,Arcs,CapE,CapC),
                                                      writeSmartDigraph(Nodes,Arcs,EKMask,ECTView).

/* The predicate cupcap computes the union and intersection of 
- the entities in a list of nodes
- the entities provided by the contexts in a list of labels
*/
cupcap([],[],[]).
cupcap([ek(E,_)],E,E) :- !.
cupcap([ek(E,_)|EKs],Cup,Cap) :- cupcap(EKs,Cups,Caps),
                                 ord_union(E,Cups,Cup),
                                 ord_intersection(E,Caps,Cap).
cupcap([arc(_,obs(_,C,_,_,_,_,_,_),_)],C,C) :- !.
cupcap([arc(_,obs(_,C,_,_,_,_,_,_),_)|Arcs],Cup,Cap) :- cupcap(Arcs,Cups,Caps),
                                                        ord_union(C,Cups,Cup),
                                                        ord_intersection(C,Caps,Cap).

/* The predicate reduce removes the common entities from nodes and arcs 
*/
reduce([],_,_,_,[]).
reduce([X|Xs],CapE,CapC,CapT,[X1|Xs1]) :- 
      reduce(X,CapE,CapC,CapT,X1),
      reduce(Xs,CapE,CapC,CapT,Xs1).
reduce(ek(E,K),CapE,_,_,ek(E1,K)) :- 
      ord_subtract(E,CapE,E1).
reduce(arc(EK,L,EK1),CapE,CapC,CapT,arc(RedEK,RedL,RedEK1)) :- 
      reduce(EK,CapE,CapC,CapT,RedEK),
      reduce(L,CapE,CapC,CapT,RedL),
      reduce(EK1,CapE,CapC,CapT,RedEK1).
reduce(obs(E,C,_,R,RI,I,IR,P),CapE,CapC,CapT,obs(E1,C1,T1,R1,RI1,I,IR,P1)) :-
      ord_subtract(E,CapE,E1),
      ord_subtract(C,CapC,C1),
      ord_union(E1,C1,T1),
      ord_subtract(R,CapT,R1),
      ord_subtract(RI,CapT,RI1),
      ord_subtract(P,CapE,P1).


/* EXPERIMENTAL FEATURE
The idea is to automatically simplify as much as possible the LTS graph to make it more readable
We apply autoGraph so that
- The Nodes and Arcs of the whole LTS are computed 
- We find the entities common to ALL the states
- We find the entities common to ALL contexts
- We remove from nodes and arcs the common entities
Then we try to further simplify the LTS in the following way:
- We find the entities common to ALL the states WITH THE SAME CONTEXT
- We remove from nodes and arcs the common entities W.R.T. THEIR CONTEXTS
*/
miniGraph(S,MiniNodes,MiniArcs,CapE,CapC,AL) :- autoGraph(S,RedNodes,RedArcs,CapE,CapC),
                                                create_map(RedNodes,AL),
                                                ctxreduce(RedNodes,AL,MiniNodes),
                                                ctxreduce(RedArcs,AL,MiniArcs).

miniDigraph(S,Nodes,Arcs,CapE,CapC,AL) :- 
         miniDigraph(S,Nodes,Arcs,CapE,CapC,AL,ek(all,all),ctx(all)).
miniDigraph(S,Nodes,Arcs,CapE,CapC,AL,EKMask,ECTView) :- 
         miniGraph(S,Nodes,Arcs,CapE,CapC,AL),
         writeSmartDigraph(Nodes,Arcs,EKMask,ECTView).

/* The predicate create_map(EKs,AssocList1) takes a list of nodes ek(E,K) 
and returns the association list that assign to eack context K the ordered set of entities
that are common to all nodes with context K
*/
create_map(EKs,AssocList1) :- empty_assoc(AssocList),
                              create_map_aux(EKs,AssocList,AssocList1).
create_map_aux([],AssocList,AssocList).
create_map_aux([ek(E,K)|EKs],AssocList,AssocList2) :- get_assoc(K,AssocList,CapE,AssocList1,CapE1), !,
                                                      ord_intersection(CapE,E,CapE1),
                                                      create_map_aux(EKs,AssocList1,AssocList2).
create_map_aux([ek(E,K)|EKs],AssocList,AssocList2) :- put_assoc(K,AssocList,E,AssocList1),
                                                      create_map_aux(EKs,AssocList1,AssocList2).


/* The predicate ctxreduce removes from nodes and arcs the common entities 
W.R.T. THE SAME context, as specified by the association list AL
*/
ctxreduce([],_,[]).
ctxreduce([X|Xs],AL,[X1|Xs1]) :- 
      ctxreduce(X,AL,X1),
      ctxreduce(Xs,AL,Xs1).
ctxreduce(ek(E,K),AL,ek(RedE,K)) :- 
      get_assoc(K,AL,CapE),
      ord_subtract(E,CapE,RedE).
ctxreduce(arc(ek(E,K),L,ek(E1,K1)),AL,arc(ek(RedE,K),RedL,ek(RedE1,K1))) :- 
      get_assoc(K,AL,CapE),
      ord_subtract(E,CapE,RedE),
      get_assoc(K1,AL,CapE1),
      ord_subtract(E1,CapE1,RedE1),
      ctxreduce(L,CapE,CapE1,RedL).
ctxreduce(obs(E,C,_,R,RI,I,IR,P),CapE,CapE1,obs(E1,C,T1,R1,RI1,I,IR,P1)) :-
      ord_subtract(E,CapE,E1),
      ord_union(E1,C,T1),
      ord_subtract(R,CapE,R1),
      ord_subtract(RI,CapE,RI1),
      ord_subtract(P,CapE1,P1).



/* When the context in the system S guarantees termination after a finite number of steps,
we can represent the first single run found by using predicates runDigraph
IMPORTANT: if the system is deterministic, it is the only possible run.
The following options can be given (Type):
- rundigraph: records just the entities
- runTdigraph: records the union of entities and contexts
- runECdigraph: records the entities and the contexts separately

The predicate writeRunDigraph takes care of the layout of the trace.

Using smartRunECT, all the labels are discarded to improve efficiency.
If some information from the labels must be displayed use smartDigraph instead.

Some flexibility in the graph layout is given by parametric definitions
of labels for nodes and edges of the graph:

Mask can be
- all: the label of a state E shows all its entities E (DEFAULT OPTION)
- a set Mask: the label of a state E shows only the entities in E CAP Mask

View can be
- all: between a state E and its successor E' there are two arrows (DEFAULT OPTION)
       the red arrow is labelled with E-E' (entities deleted)
       the blue arrow is labelled with E'-E (entities added)
- a number N: the arrow between a state E and its successor E' are progressive numbers starting at N
- a set View: between a state E and its successor E' there are two arrows
       the red arrow is labelled with E-E' CAP View (entities in View that disappear)
       the blue arrow is labelled with E'-E CAP View (entities in View that appear)
*/
runDigraph(S,Type,Es,Cs,Ts) :- runDigraph(S,Type,Es,Cs,Ts,all,all).
runDigraph(sys(Delta,E,Ks,Rs),rundigraph,Es,Cs,Ts,Mask,View) :- smartRunECT(Delta,Rs,ek(E,Ks),Es,Cs,Ts),
                                                                writeRunDigraph(Es,rundigraph,Mask,View).
runDigraph(sys(Delta,E,Ks,Rs),runTdigraph,Es,Cs,Ts,Mask,View) :- smartRunECT(Delta,Rs,ek(E,Ks),Es,Cs,Ts),
                                                                writeRunDigraph(Ts,runTdigraph,Mask,View).
runDigraph(sys(Delta,E,Ks,Rs),runECdigraph,Es,Cs,Ts,Mask,View) :- smartRunECT(Delta,Rs,ek(E,Ks),Es,Cs,Ts),
                                                                  writeRunDigraph(Es,Cs,runECdigraph,Mask,View).


/* The predicate writeRunDigraph takes the sets of entities traversed during a finite computation
and saves the corresponding graph in .dot format
*/
writeRunDigraph(Es) :- writeRunDigraph(Es,rundigraph,all,all).
writeRunDigraph(Es,Type,Mask,View) :- openTmpStream(Type,'.dot',Stream),
                                      digraphstyle(DGStyle),
                                      write(Stream,DGStyle),
                                      writeNodesRun(Stream,Es,Mask),
                                      writeEdgesRun(Stream,Es,View),
                                      writeln(Stream,'}'),
                                      close(Stream).

writeRunDigraph(Es,Cs) :- writeRunDigraph(Es,Cs,runECdigraph,all,all).
writeRunDigraph(Es,Cs,Type,Mask,View) :- openTmpStream(Type,'.dot',Stream),
                                         digraphstyle(DGStyle),
                                         write(Stream,DGStyle),
                                         writeNodesRun(Stream,Es,Cs,Mask),
                                         writeEdgesRun(Stream,Es,Cs,View),
                                         writeln(Stream,'}'),
                                         close(Stream).

/* The label of each node is displayed when the graph is visualized.
The definition of the label for the node E is parametric on Mask

We recall that Mask can be
- all: the label of a state E shows all its entities E (DEFAULT OPTION)
- a set Mask: the label of a state E shows only the entities in E CAP Mask
*/
writeNodesRun(Stream,[],_) :- nl(Stream).
writeNodesRun(Stream,[E|Es],all) :- !, writeNodeRun(Stream,E), 
                                       nodeRunStyle(E,Style),
                                       writeNodeRunLabel(Stream,E,Style),
                                       % writeln(Stream,';'),
                                       writeNodesRun(Stream,Es,all).
writeNodesRun(Stream,[E|Es],Mask) :- ord_intersection(E,Mask,EMask),
                                     writeNodeRun(Stream,E), 
                                     nodeRunStyle(E,Style),
                                     writeNodeRunLabel(Stream,EMask,Style),
                                     % write(Stream,' [ label = "'),writeE(Stream,EMask),writeln(Stream,'" ];'),
                                     writeNodesRun(Stream,Es,Mask).

writeNodesRun(Stream,[],[],_) :- nl(Stream).
writeNodesRun(Stream,[E|Es],[C|Cs],all) :- !, writeNodeRun(Stream,E,C), 
                                              ord_union(E,C,T), % style def applies to E \cup C
                                              nodeRunStyle(T,Style),
                                              writeNodeRunLabel(Stream,E,C,Style),
                                              %nl(Stream),
                                              writeNodesRun(Stream,Es,Cs,all).
writeNodesRun(Stream,[E|Es],[C|Cs],Mask) :- writeNodeRun(Stream,E,C), 
                                            ord_union(E,C,T), % style def applies to E \cup C
                                            nodeRunStyle(T,Style),
                                            ord_intersection(E,Mask,EMask),
                                            ord_intersection(C,Mask,CMask),
                                            writeNodeRunLabel(Stream,EMask,CMask,Style),
                                            %write(Stream,' [ label = "'),writeE(Stream,EMask),write(Stream,';'),writeE(Stream,CMask),writeln(Stream,'" ];'),
                                            writeNodesRun(Stream,Es,Cs,Mask).

%writeNodeRun(Stream,[]) :- write(Stream,'"-"'), !.
writeNodeRun(Stream,E) :- write(Stream,'"'),writeE(Stream,E),write(Stream,'"').

% First the context, then the entities
%writeNodeRun(Stream,[],[]) :- write(Stream,'"0;0"'), !.
writeNodeRun(Stream,E,C) :- write(Stream,'"'),writeE(Stream,C),write(Stream,';'),writeE(Stream,E),write(Stream,'"').


writeNodeRunLabel(Stream,E,Style) :- write(Stream,' [ label = "'),writeE(Stream,E),write(Stream,'", fillcolor='),write(Stream,Style),writeln(Stream,'];').
% First the context, then the entities
writeNodeRunLabel(Stream,E,C,Style) :- write(Stream,' [ label = "'),writeE(Stream,C),write(Stream,';'),writeE(Stream,E),write(Stream,'", fillcolor='),write(Stream,Style),writeln(Stream,'];').

/* based on the content of E it is also possible to set a different style
for the node: here we just set the color, but in principle other attributes
can be defined */ 
nodeRunStyle(E,'"#FFAA99"') :- ord_memberchk(stress,E), ! . % ERBB specific
nodeRunStyle(E,'"#FF9933"') :- ord_memberchk(egf,E), ! . % ERBB specific
nodeRunStyle(E,'"#FFEE99"') :- ord_memberchk(alpha_il,E), ! . % ERBB specific
nodeRunStyle(E,'"#BBFF99"') :- ord_memberchk(extpump,E), ! . % ERBB specific
nodeRunStyle(E,'"#99FFEE"') :- ord_memberchk(alpha_ql,E), ! . % ERBB specific
nodeRunStyle(E,'"#99AAFF"') :- ord_memberchk(alpha_sl,E), ! . % ERBB specific
nodeRunStyle(E,'"#CC99FF"') :- ord_memberchk(alpha_1213l,E), ! . % ERBB specific
nodeRunStyle(E,'"#EE99FF"') :- ord_memberchk(ecm,E), ! . % ERBB specific
nodeRunStyle(E,'"#FF99AA"') :- ord_memberchk(ras,E), ! . % ERBB specific
nodeRunStyle(_,'"#AAEEFF"').


/* The label of each edge is displayed when the graph is visualized.
The definition of the edge label is parametric on View

We recall that View can be
- all: between a state E and its successor E' there are two arrows (DEFAULT OPTION)
       the red arrow is labelled with E-E' (entities deleted)
       the blue arrow is labelled with E'-E (entities added)
- a number N: the arrow between a state E and its successor E' are progrssive numbers starting at N
- a set View: between a state E and its successor E' there are two arrows
       the red arrow is labelled with E-E' CAP View (entities in View that disappear)
       the blue arrow is labelled with E'-E CAP View (entities in View that appear)
*/
writeEdgesRun(Stream,[],_) :- nl(Stream).
writeEdgesRun(Stream,[_],_) :- nl(Stream).
writeEdgesRun(Stream,[E,E1|Es],all) :- !, ord_subtract(E,E1,Deleted),
                                          ord_subtract(E1,E,Added),
                                          writeEdgeRun(Stream,E,E1),
                                          writeEdgeLabel(Stream,Deleted,deleted),
                                          writeEdgeRun(Stream,E,E1),
                                          writeEdgeLabel(Stream,Added,added),
                                          writeEdgesRun(Stream,[E1|Es],all).
writeEdgesRun(Stream,[E,E1|Es],N) :- number(N), !, 
                                     writeEdgeRun(Stream,E,E1),
                                     writeEdgeLabel(Stream,N),
                                     succ(N,M),
                                     writeEdgesRun(Stream,[E1|Es],M).
writeEdgesRun(Stream,[E,E1|Es],View) :- ord_subtract(E,E1,Deleted),
                                        ord_subtract(E1,E,Added),
                                        ord_intersection(Added,View,AddedView),
                                        ord_intersection(Deleted,View,DeletedView),
                                        writeEdgeRun(Stream,E,E1),
                                        writeEdgeLabel(Stream,DeletedView,deleted),
                                        writeEdgeRun(Stream,E,E1),
                                        writeEdgeLabel(Stream,AddedView,added),
                                        writeEdgesRun(Stream,[E1|Es],View).

writeEdgesRun(Stream,[],[],_) :- nl(Stream).
writeEdgesRun(Stream,[_],[_],_) :- nl(Stream).
writeEdgesRun(Stream,[E,E1|Es],[C,C1|Cs],all) :- !, ord_union(E,C,T),
                                                    ord_union(E1,C1,T1),
                                                    ord_subtract(T,T1,TDeleted),
                                                    ord_subtract(T1,T,TAdded),
                                                    writeEdgeRun(Stream,E,C,E1,C1),
                                                    writeEdgeLabel(Stream,TDeleted,deleted),
                                                    writeEdgeRun(Stream,E,C,E1,C1),
                                                    writeEdgeLabel(Stream,TAdded,added),
                                                    writeEdgesRun(Stream,[E1|Es],[C1|Cs],all).
writeEdgesRun(Stream,[E,E1|Es],[C,C1|Cs],N) :- number(N), !, 
                                               writeEdgeRun(Stream,E,C,E1,C1),
                                               writeEdgeLabel(Stream,N),
                                               succ(N,M),
                                               writeEdgesRun(Stream,[E1|Es],[C1|Cs],M).
writeEdgesRun(Stream,[E,E1|Es],[C,C1|Cs],View) :- ord_union(E,C,T),
                                                  ord_union(E1,C1,T1),
                                                  ord_subtract(T,T1,TDeleted),
                                                  ord_subtract(T1,T,TAdded),
                                                  ord_intersection(TAdded,View,TAddedView),
                                                  ord_intersection(TDeleted,View,TDeletedView),
                                                  writeEdgeRun(Stream,E,C,E1,C1),
                                                  writeEdgeLabel(Stream,TDeletedView,deleted),
                                                  writeEdgeRun(Stream,E,C,E1,C1),
                                                  writeEdgeLabel(Stream,TAddedView,added),
                                                  writeEdgesRun(Stream,[E1|Es],[C1|Cs],View).


writeEdgeRun(Stream,E,E1) :- writeNodeRun(Stream,E),write(Stream,' -> '),writeNodeRun(Stream,E1).

writeEdgeRun(Stream,E,C,E1,C1) :- writeNodeRun(Stream,E,C),write(Stream,' -> '),writeNodeRun(Stream,E1,C1).


/* When the context has the form x = Q.x the system will stabilize in a Loop after
traversing a finite Prefix. The computation of the corresponding graph can be simplified
because the context is always the same (x), so states differ just for the set of entities.
All the labels are discarded to improve efficiency.
If some information from the labels must be displayed use smartDigraph instead.
*/

/* The predicate lollipopDigraph prepares the sequence of entities 
and then invokes writeRunDigraph to save the corresponding graph in .dot format

The following options can be given (Type):
- lollipopdigraph: records just the entities
- lollipopTDigraph: the entities in the context Q are included in all the states
*/
lollipopDigraph(S,Q,Type,Prefix,Loop) :- lollipopDigraph(S,Q,Type,Prefix,Loop,all,all).
lollipopDigraph(sys(_,E,_,Rs),Q,lollipopdigraph,Prefix,[F|Loop],Mask,View) :- 
        lollipopAux(Rs,Q,E,[],Prefix,[F|Loop]),
        append([F|Loop],[F],LoopF),
        append(Prefix,LoopF,PrefixLoopF),
        writeRunDigraph(PrefixLoopF,lollipopdigraph,Mask,View).

lollipopDigraph(sys(_,E,_,Rs),Q,lollipopTDigraph,Prefix,[F|Loop],Mask,View) :- 
        ord_union(E,Q,T), lollipopAuxT(Rs,Q,T,[],Prefix,[F|Loop]),
        append([F|Loop],[F],LoopF),
        append(Prefix,LoopF,PrefixLoopF),
        writeRunDigraph(PrefixLoopF,lollipopTDigraph,Mask,View).


/* EXPERIMENTAL FEATURE
The idea is to create a minimal length experiment K that traverses all loops
in a loop confluent system w.r.t. [Q1,...,Qn] and then draw the corresponding digraph
*/
loopconfDigraph(S,Qs,K,Delta,Es,Cs,Ts) :- 
        loopconfDigraph(S,Qs,K,Delta,Es,Cs,Ts,all,1).
loopconfDigraph(sys(_,E,_,Rs),Qs,K,Delta,Es,Cs,Ts,Mask,View) :-
        loopConfluent(Rs,Qs,[E],_,Distances,Dimensions),
        experiment(1,Qs,Distances,Dimensions,K,Env),
        create_env(Env,Delta),
        smartRunECT(Delta,Rs,ek(E,[K]),Es,Cs,Ts),
        ord_intersection(Es,CapE),
        reduceE(Es,CapE,RedEs),
        writeRunDigraph(RedEs,rundigraph,Mask,View).
        %smartDigraph(sys(Delta,E,[K],Rs),Nodes,Arcs,EKMask,ECTView).

reduceE([],_,[]).
reduceE([E|Es],CapE,[RedE|RedEs]) :- ord_subtract(E,CapE,RedE),reduceE(Es,CapE,RedEs).
/* the predicate experiment([Q1,...,Qn],[N1,...,Nn],[M1,...,Mn])
builds the experiment with Ni+Mi occurrences of each Qi
*/
experiment(_,[],[],[],nil,[]).
experiment(X,[Q|Qs],[N|Ns],[M|Ms],do(N1,rec(Xx),K),[def(Xx,pre(Q,rec(Xx)))|Env]) :- 
                                                  succ(X,Y),
                                                  experiment(Y,Qs,Ns,Ms,K,Env),
                                                  N1 is N+M,
                                                  atom_concat(x,X,Xx).

/* the predicate nthprefix(N1,Q,K1,K)
builds the experiment with N1 occurrences of Q before K
*/
%% nthprefix(0,_,K,K) :- !.
%% nthprefix(N,Q,K1,pre(Q,K)) :- succ(M,N), nthprefix(M,Q,K1,K).



%==== Some LTS examples: try the following queries
/*
digraph(sys([],[a,b],[],[react([a],[c],[a]),react([b],[d],[b])])).

parse_ctx("[({a}.nil + {b}.nil)]",Ks) , digraph(sys([],[],Ks,[react([a],[c],[a]),react([b],[d],[b])])).

parse_env("[x=({a}.x + {b}.nil)]",Delta),parse_ctx("[x,x]",Ks) , digraph(sys(Delta,[],Ks,[react([a],[c],[a]),react([b],[d],[b])])).

digraph(sys([],[],[plus(pre([a,b],pre([a],pre([a,c],nil))),pre([a,b],pre([a],pre([a],nil))))],[react([a,b],[c],[b])])).
*/

%==== F Assertions

/* Assertions express properties of transition labels obs(E,C,T,R,RI,I,IR,P)

We recall that an assertion is either 
- "? inW", the non-emptyness test for T, represented by the term nonempty(ent)
- "? inR", the non-emptyness test for R\cup RI, represented by the term nonempty(rea)
- "? inI", the non-emptyness test for I\cup IR, represented by the term nonempty(inh)
- "? inP", the non-emptyness test for P, represented by the term nonempty(pro)
- "C inW", the test for inclusion of the set of entities C in T, represented by the process sub(C,ent)
- "C inR", the test for inclusion of the set of entities C in R\cup RI, represented by the process sub(C,rea)
- "C inI", the test for inclusion of the set of entities C in I\cup IR, represented by the process sub(C,inh)
- "C inP", the test for inclusion of the set of entities C in P, represented by the process sub(C,pro)
- "-F", the negation of the assertion F, represented by the term not(F)
- "(F1 ^ F2)", the xor of assertions F1 and F2, represented by the term xor(F1,F2)
- "(F1 \\/ ... \\/ Fn)", the disjunction between assertions F1,...,Fn, represented by the disjunction term or(F1,or(...,Fn))
- "(F1 /\\ ... /\\ Fn)", the conjunction between assertions F1,...,Fn, represented by the conjunction term and(F1,and(...,Fn))
*/

/* 
The predicate select(N,L,E) returns the set of entities extracted from the label L 
according to the index N (one of ent, rea, inh, pro)
*/
selectSet(ent,obs(_,_,T,_,_,_,_,_),T).
selectSet(rea,obs(_,_,_,R,RI,_,_,_),UR) :- ord_union(R,RI,UR).
selectSet(inh,obs(_,_,_,_,_,I,IR,_),UI) :- ord_union(I,IR,UI).
selectSet(pro,obs(_,_,_,_,_,_,_,P),P).

/*
The predicate checkAssertion(L,F) holds if the label L satisfies the assertion F
*/
checkAssertion(_,true).
checkAssertion(L,sub(S,N)) :- selectSet(N,L,X), ord_subset(S,X) . 
checkAssertion(L,nonempty(N)) :- selectSet(N,L,X), ord_empty(X).
checkAssertion(L,and(F1,F2)) :- checkAssertion(L,F1),checkAssertion(L,F2).
checkAssertion(L,or(F1,_)) :- checkAssertion(L,F1),!.
checkAssertion(L,or(_,F2)) :- checkAssertion(L,F2).
checkAssertion(L,xor(F1,F2)) :- checkAssertion(L,F1), \+ checkAssertion(L,F2).
checkAssertion(L,xor(F1,F2)) :- checkAssertion(L,F2), \+ checkAssertion(L,F1).
checkAssertion(L,not(F)) :- \+ checkAssertion(L,F).

%==== F-Biosimulation

/* biosim(P,Q,F,BioRel) returns a F-biosimulation BioRel that relates P and Q, if it exists
Rel is an ORDERED SET that contains pairs of systems processes: 
pair(sys(PDelta,PE,PK,PRs),sys(QDelta,QE,QK,QRs))
*/
biosim(P,Q,F,BioRel) :- biosimRel([pair(P,Q)],[],F,BioRel).

/* in biosimRel(BR1,BR2,F,BR), 
- BR1 are the pairs still to check
- BR2 is an ORDERED SET that contains are the pairs of processes assumed to be F-biosimilar
- BR is the resulting F-biosimulation (an ORDERED SET of pairs)
*/
biosimRel([],BR,_,BR).
biosimRel([pair(P,Q)|Rest],BR,F,BioRel) :- ord_memberchk(pair(P,Q),BR),
                                           biosimRel(Rest,BR,F,BioRel).
biosimRel([pair(P,Q)|Rest],BR,F,BioRel) :- \+ ord_memberchk(pair(P,Q),BR),
                                           P == Q,
                                           sim(P,Q,F,S1),
                                           append(Rest,S1,Rest1),
                                           ord_add_element(BR,pair(P,Q),BR1),
                                           biosimRel(Rest1,BR1,F,BioRel).
biosimRel([pair(P,Q)|Rest],BR,F,BioRel) :- \+ ord_memberchk(pair(P,Q),BR),
                                           P \== Q,
                                           sim(P,Q,F,S1),
                                           sim(Q,P,F,S2),
                                           append(Rest,S1,Rest1),
                                           append(Rest1,S2,Rest2),
                                           ord_add_element(BR,pair(P,Q),BR1),
                                           ord_add_element(BR1,pair(Q,P),BR2),
                                           biosimRel(Rest2,BR2,F,BioRel).

/* sim and checksim are auxiliary predicates to check that 
Q can simulate all F-transitions of P
*/
sim(P,Q,F,S) :- allTransitionsF(F,P,Moves),
                checksim(Q,Moves,F,S).
checksim(_,[],_,[]).
checksim(Q,[tr(y,P1)|Ms],F,[pair(P1,Q1)|S]) :- oneTransition(Q,L,Q1),
                                               checkAssertion(L,F),
                                               checksim(Q,Ms,F,S).
checksim(Q,[tr(n,P1)|Ms],F,[pair(P1,Q1)|S]) :- oneTransition(Q,L,Q1),
                                               \+ checkAssertion(L,F),
                                               checksim(Q,Ms,F,S).

/* allTransitionsF is the same as allTransitions except for the fact that 
it simplifies the label to y/n depending on the satisfaction of the assertion F
it is exploited to reduce the complexity of the bisimulation check 
by reducing the number of transitions between the same states
*/
allTransitionsF(F,sys(Delta,E,Ks,Rs),Moves) :- unfold(E,Delta,Ks,Choices),
                                               allTransitionsF(F,Delta,E,Choices,Rs,Moves).
allTransitionsF(_,_,_,[],_,[]).
allTransitionsF(F,Delta,E,[choice(C,K)|Cs],Rs,Moves) :- ord_union(E,C,T),transitionF(F,Delta,E,C,T,K,Rs,M),
                                                        allTransitionsF(F,Delta,E,Cs,Rs,Ms),
                                                        ord_add_element(Ms,M,Moves).

/* transitionF is the same as transition except for the fact that 
it simplifies the label to y/n depending on the satisfaction of the assertion F
it is exploited to reduce the complexity of the bisimulation check 
by reducing the number of transitions between the same states
*/
transitionF(F,Delta,E,C,T,K,Rs,tr(y,sys(Delta,P,K,Rs))) :- resultLabel(E,C,T,Rs,obs(E,C,T,R,RI,I,IR,P)),checkAssertion(obs(E,C,T,R,RI,I,IR,P),F).
transitionF(F,Delta,E,C,T,K,Rs,tr(n,sys(Delta,P,K,Rs))) :- resultLabel(E,C,T,Rs,obs(E,C,T,R,RI,I,IR,P)),\+ checkAssertion(obs(E,C,T,R,RI,I,IR,P),F).


/* the smart version of the predicate biosim returns a relation
Rel (it is still an ORDERED SET) that contains pairs of entities/context processes: 
pair(ek(PE,PK),ek(QE,QK))
*/
smartBiosim(sys(PDelta,PE,PK,PRs),sys(QDelta,QE,QK,QRs),F,BioRel) :- 
     smartBiosimRel(PDelta,QDelta,PRs,QRs,[pair(ek(PE,PK),ek(QE,QK))],[],F,BioRel).

/* smart version of the predicate biosimRel: 
operates on states ek(E,K) instead of sys(Delta,E,K,Rs)
*/
smartBiosimRel(_,_,_,_,[],BR,_,BR).
smartBiosimRel(PDelta,QDelta,PRs,QRs,[pair(P,Q)|Rest],BR,F,BioRel) :- 
     ord_memberchk(pair(P,Q),BR),
     smartBiosimRel(PDelta,QDelta,PRs,QRs,Rest,BR,F,BioRel).
smartBiosimRel(PDelta,QDelta,PRs,QRs,[pair(P,Q)|Rest],BR,F,BioRel) :- 
     \+ ord_memberchk(pair(P,Q),BR),
     P == Q,
     smartSim(PDelta,QDelta,PRs,QRs,P,Q,F,S1),
     append(Rest,S1,Rest1),
     ord_add_element(BR,pair(P,Q),BR1),
     smartBiosimRel(PDelta,QDelta,PRs,QRs,Rest1,BR1,F,BioRel).
smartBiosimRel(PDelta,QDelta,PRs,QRs,[pair(P,Q)|Rest],BR,F,BioRel) :- 
     \+ ord_memberchk(pair(P,Q),BR),
     P \== Q,
     smartSim(PDelta,QDelta,PRs,QRs,P,Q,F,S1),
     smartSim(PDelta,QDelta,PRs,QRs,Q,P,F,S2),
     append(Rest,S1,Rest1),
     append(Rest1,S2,Rest2),
     ord_add_element(BR,pair(P,Q),BR1),
     ord_add_element(BR1,pair(Q,P),BR2),
     smartBiosimRel(PDelta,QDelta,PRs,QRs,Rest2,BR2,F,BioRel).

/* smart versions of the auxiliary predicates sim and checksim
*/
smartSim(PDelta,QDelta,PRs,QRs,P,Q,F,S) :- 
     smartAllTransitionsF(PDelta,PRs,F,P,Moves),
     smartChecksim(QDelta,QRs,Q,Moves,F,S).
smartChecksim(_,_,_,[],_,[]).
smartChecksim(QDelta,QRs,Q,[tr(y,P1)|Ms],F,[pair(P1,Q1)|S]) :- 
     smartOneTransition(QDelta,QRs,Q,L,Q1),
     checkAssertion(L,F),
     smartChecksim(QDelta,QRs,Q,Ms,F,S).
smartChecksim(QDelta,QRs,Q,[tr(n,P1)|Ms],F,[pair(P1,Q1)|S]) :- 
     smartOneTransition(QDelta,QRs,Q,L,Q1),
     \+ checkAssertion(L,F),
     smartChecksim(QDelta,QRs,Q,Ms,F,S).

/* smart versions of the predicates allTransitionsF and transitionF
*/
smartAllTransitionsF(Delta,Rs,F,ek(E,Ks),Moves) :- 
     unfold(E,Delta,Ks,Choices),
     smartAllTransitionsF(F,Delta,E,Choices,Rs,Moves).
smartAllTransitionsF(_,_,_,[],_,[]).
smartAllTransitionsF(F,Delta,E,[choice(C,K)|Cs],Rs,Moves) :- 
     ord_union(E,C,T),smartTransitionF(F,E,C,T,K,Rs,M),
     smartAllTransitionsF(F,Delta,E,Cs,Rs,Ms),
     ord_add_element(Ms,M,Moves).

smartTransitionF(F,E,C,T,K,Rs,tr(y,ek(P,K))) :- 
     resultLabel(E,C,T,Rs,obs(E,C,T,R,RI,I,IR,P)),
     checkAssertion(obs(E,C,T,R,RI,I,IR,P),F).
smartTransitionF(F,E,C,T,K,Rs,tr(n,ek(P,K))) :- 
     resultLabel(E,C,T,Rs,obs(E,C,T,R,RI,I,IR,P)),
     \+ checkAssertion(obs(E,C,T,R,RI,I,IR,P),F).

%==== BioHML

/* checkBioHML(S,G,B) returns B=ok if the system S satisfies the BioHML formula G
returns an explanation B of the reason why G is not satisfied otherwise
*/
checkBioHML(_,true,ok).
checkBioHML(S,false,no(S,false)).
checkBioHML(S,and(G1,_),B) :- checkBioHML(S,G1,B), B \== ok, !.
checkBioHML(S,and(_,G2),B) :- checkBioHML(S,G2,B), B \== ok, !.
checkBioHML(_,and(_,_),ok).
checkBioHML(S,or(G1,_),ok) :- checkBioHML(S,G1,ok), !.
checkBioHML(S,or(_,G2),ok) :- checkBioHML(S,G2,ok), !.
checkBioHML(S,or(G1,G2),no(S,[B1,B2])) :- checkBioHML(S,G1,B1),checkBioHML(S,G2,B2).
checkBioHML(S,diamond(F,G),B) :- allTransitions(S,Moves),filter(Moves,F,Ms),checkOne(S,F,Ms,G,B).
checkBioHML(S,box(F,G),B) :- allTransitions(S,Moves),filter(Moves,F,Ms),checkAll(S,F,Ms,G,B).

/* filter(Moves,F,Ms) returns the list Ms of all the moves tr(L,S) in Moves such that L satisfies F
*/
filter([],_,[]).
filter([tr(L,S)|Moves],F,[tr(L,S)|Ms]) :- checkAssertion(L,F),!,filter(Moves,F,Ms).
filter([tr(_,_)|Moves],F,Ms) :- filter(Moves,F,Ms).

/* checkOne(S,F,Ms,G,B) checks if there is one transition tr(L,S1) in the list Ms such that S1 satisfies G
if this is the case B=ok, otherwise B explains why the check fails
S and F are needed to build the explanation when there are no moves available
*/
checkOne(S,F,[],_,no(S,miss(F))).
checkOne(_,_,[tr(_,S1)|_],G,ok) :- checkBioHML(S1,G,ok), !.
checkOne(S,F,[tr(_,_)|Ms],G,B) :- checkOne(S,F,Ms,G,B).

/* checkAll(S,Ms,G,B) checks if all transitions tr(L,S1) in the list Ms are such that S1 satisfies G
if this is the case B=ok, otherwise B explains why the check fails
S is needed to build the explanation when there is one transitions that violates the property
+*/
checkAll(_,_,[],_,ok).
checkAll(S,F,[tr(L,S1)|_],G,no(S,has(L,F,B))) :- checkBioHML(S1,G,B), B\==ok, !.
checkAll(S,F,[tr(_,_)|Ms],G,B) :- checkAll(S,F,Ms,G,B).


/* smart versions of the previous predicates: operate on ek(E,K) states
*/
smartBioHML(sys(Delta,E,K,Rs),G,B) :- smartCheckBioHML(Delta,Rs,ek(E,K),G,B).

smartCheckBioHML(_,_,_,true,ok).
smartCheckBioHML(_,_,EK,false,no(EK,false)).
smartCheckBioHML(Delta,Rs,EK,and(G1,_),B) :- smartCheckBioHML(Delta,Rs,EK,G1,B), 
                                             B \== ok, !.
smartCheckBioHML(Delta,Rs,EK,and(_,G2),B) :- smartCheckBioHML(Delta,Rs,EK,G2,B), 
                                             B \== ok, !.
smartCheckBioHML(_,_,_,and(_,_),ok).
smartCheckBioHML(Delta,Rs,EK,or(G1,_),ok) :- smartCheckBioHML(Delta,Rs,EK,G1,ok), !.
smartCheckBioHML(Delta,Rs,EK,or(_,G2),ok) :- smartCheckBioHML(Delta,Rs,EK,G2,ok), !.
smartCheckBioHML(Delta,Rs,EK,or(G1,G2),no(EK,[B1,B2])) :- smartCheckBioHML(Delta,Rs,EK,G1,B1),
                                                         smartCheckBioHML(Delta,Rs,EK,G2,B2).
smartCheckBioHML(Delta,Rs,EK,diamond(F,G),B) :- smartAllTransitions(Delta,Rs,EK,Moves),
                                                filter(Moves,F,Ms), 
                                                smartCheckOne(Delta,Rs,EK,F,Ms,G,B).
smartCheckBioHML(Delta,Rs,EK,box(F,G),B) :- smartAllTransitions(Delta,Rs,EK,Moves),
                                            filter(Moves,F,Ms),
                                            smartCheckAll(Delta,Rs,EK,F,Ms,G,B).

/* checkOne(S,F,Ms,G,B) checks if there is one transition tr(L,S1) in the list Ms such that S1 satisfies G
if this is the case B=ok, otherwise B explains why the check fails
S and F are needed to build the explanation when there are no moves available
*/
smartCheckOne(_,_,EK,F,[],G,no(EK,miss(diamond(F,G)))).
smartCheckOne(Delta,Rs,_,_,[tr(_,EK1)|_],G,ok) :- smartCheckBioHML(Delta,Rs,EK1,G,ok), !.
smartCheckOne(Delta,Rs,EK,F,[tr(_,_)|Ms],G,B) :- smartCheckOne(Delta,Rs,EK,F,Ms,G,B).

/* checkAll(S,Ms,G,B) checks if all transitions tr(L,S1) in the list Ms are such that S1 satisfies G
if this is the case B=ok, otherwise B explains why the check fails
S is needed to build the explanation when there is one transitions that violates the property
+*/
smartCheckAll(_,_,_,_,[],_,ok).
smartCheckAll(Delta,Rs,EK,F,[tr(L,EK1)|_],G,no(EK,has(L,F,B))) :- smartCheckBioHML(Delta,Rs,EK1,G,B), B \== ok, !.
smartCheckAll(Delta,Rs,EK,F,[tr(_,_)|Ms],G,B) :- smartCheckAll(Delta,Rs,EK,F,Ms,G,B).

%==== UTIL (NOT USED?)

% contextsEKs(EKs,Ks) returns the ordered set of contexts Ks in the list of states EKs
contextsEKs([],[]).
contextsEKs([ek(_,K)|EKs],Ks1) :- contextsEKs(EKs,Ks),ord_add_element(Ks,K,Ks1).

% contextsEKs(EKs,Es) returns the ordered set of entity sets Es in the list of states EKs
entitiesEKs([],[]).
entitiesEKs([ek(E,_)|EKs],Es1) :- entitiesEKs(EKs,Es),ord_add_element(Es,E,Es1).



%==== USER SPECIFICATIONS 

/* To experiment with a Reaction System the user can easily customize the application 
by changing the lines at the beginning of this file to import some default definitions
and set the working directory

:- ["PATH/spec-FILE.pl"].
wdpath("PATH/").

where PATH is the actual path in your file system to spec-FILE.pl
and spec-FILE.pl is the name of the file where the following predicates
must be user-defined:
- myenvironment/1, mycontext/1, myentities/1, myreactions/1: custom Reaction System
- myexperiment/2: a special kind of context
- mybhml/1: a BioHML formula to check
- myassert/1, advcontext/1, adventities/1, advreactions/1:
  for chcking bio-similarity of the custom Reaction System and an adversary Reaction System 
  IMPORTANT: the custom and adversary Reaction Systems share the same environment

The file spec-template.pl contains sample definitions and further instructions
*/

/* the predicate mysystem/1 returns the default system process 
*/
mysystem(sys(Delta,E,Ks,Rs)) :- myparsedenvironment(Delta),
                                myordentities(E),
                                myparsedcontext(Ks),
                                mypossiblereactions(Rs). % OPTIMIZATION!
                                % myordreactions(Rs).

/* the predicate mysystem/1 returns the default system process of the adversary
for bio-simulation analysis
*/
advsystem(sys(Delta,E,Ks,Rs)) :- myparsedenvironment(Delta),
                                 advordentities(E),
                                 advparsedcontext(Ks),
                                 advordreactions(Rs).

/* myordentities/1 and advordentities/1 return the ordered sets of entities
as specified by the lists returned by user-defined predicates myentities/1 and adventities/1
*/
myordentities(E) :- myentities(UE), list_to_ord_set(UE,E).
advordentities(E) :- adventities(UE), list_to_ord_set(UE,E).

/* myordreactions/1 and advordreactions/1 return the ordered sets of reactions
as specified by the list returned by user-defined predicates myreactions/1 and advreactions/1
*/
myordreactions(Rs) :- myreactions(URs), ordered_reactions(URs,LRs), list_to_ord_set(LRs,Rs).
advordreactions(Rs) :- advreactions(URs), ordered_reactions(URs,LRs), list_to_ord_set(LRs,Rs).

/* ordered_reactions/2 takes a list of reactions react(LR,LI,LP) where LR,LI,LP are lists, 
and returns an ordered set of reactions react(R,I,P) where R,I,P are ordered sets
*/
ordered_reactions([],[]).
ordered_reactions([react(LR,LI,LP)|URs],[react(R,I,P)|Rs]) :- list_to_ord_set(LR,R),
                                                              list_to_ord_set(LI,I),
                                                              list_to_ord_set(LP,P),
                                                              ordered_reactions(URs,Rs).

/* myparsedcontext/1 and advparsedcontext/1 return the default contexts for the default
Reaction System and its default adversary, by parsing the
terms in user-friendly syntax defined by mycontext/1 and advcontext/1 in the spec-*.pl file
*/
myparsedcontext(Ks) :- mycontext(KsDesc),parse_ctx(KsDesc,Ks).
advparsedcontext(Ks) :- advcontext(KsDesc),parse_ctx(KsDesc,Ks).

/* myparsedenvironment/1 returns the default environment by parsing the
term in user-friendly syntax defined by myenvironment/1 in the spec-*.pl file
IMPORTANT: the custom and adversary Reaction Systems share the same environment
*/
myparsedenvironment(Delta) :- myenvironment(DeltaDesc),parse_env(DeltaDesc,Delta).


/* myordexperiment/1 returns the list of ordered sets of context for a default experiment
as specified by the list returned by the user-defined predicates myexperiment/2
NOTE: Ws is just a list of numbers with the same length as Qs telling how many times
the i-th context in the list Qs should be provided
*/
myordexperiment(Ws,Qs) :- myexperiment(Ws,UQs),ordered_contextset(UQs,Qs).

/* ordered_contextset/2 takes a list [LQ1,...,LQn] where LQi are lists of entities, 
and returns a list [Q1,...,Qn] where Qi are ordered sets
*/
ordered_contextset([],[]).
ordered_contextset([LQ|UQs],[Q|Qs]) :- list_to_ord_set(LQ,Q),
                                       ordered_contextset(UQs,Qs).


/* myparsedassert/1 and myparsedbhml/1 return the default assertion and bhml formula
by parsing the terms in user-friendly syntax defined by myassert/1 and mybhml/1
*/
myparsedassert(F) :- myassert(FDesc),parse_assert(FDesc,F).
myparsedbhml(G) :- mybhml(GDesc),parse_bhml(GDesc,G).



/* EXPERIMENTAL FEATURE: try to discard reactions that will be never enabled 
mypossiblereactions/1 returns (an over-approximation of the) ordered set of reactions that can
be enabled given the custom initial state and the context specified by 
myentities/1, mycontext/1 and myenvironment/1
*/
mypossiblereactions(OkRs) :- myordreactions(Rs),
                             entitiesMissing(MissingE),
                             splitadmissible(Rs,MissingE,_,OkRs).
myimpossiblereactions(NoRs) :- myordreactions(Rs),
                               entitiesMissing(MissingE),
                               splitadmissible(Rs,MissingE,NoRs,_).

/* The predicate entitiesMissing/1 returns the oredered set of reactants that can never be
provided by the custom initial state and contexts
*/
entitiesMissing(MissingE) :- entitiesP(AllP), % entities that can be produced by some reaction
                             myordentities(E), % entities that are present in the initial state
                             fromcontext(FromC), % entities that can be produced by some context
                             ord_union([AllP,E,FromC],PossibleE),
                             entitiesR(AllR), % entities whose presence is requested by some reaction
                             ord_subtract(AllR,PossibleE,MissingE).
% IN SPEC-ERBB.PL [ag, alpha_il, b_catenin, cdc42, dgk, erbb2_contr, erbb2deg_contr, erbb3_contr, erbb4_contr, exte_cadherin, gab1, mekk2, mkk3, nck, nrg, p120_catenin, pertuzumab, pi3k, plc_g, ptp1b, rac, shc, spry2, tgfa, trastuzumab]

/* splitadmissible(Rs,MissingE,NoRs,OkRs) splits the ordered set of reactions Rs 
into the partition of reactions that cannot be enabled (NoRs) and those that can be enabled (NoRs)
on the basis of the ordered set of entities MissingE that will never be present
*/
splitadmissible([],_,[],[]).
splitadmissible([react(R,I,P)|Rs],AbsentE,Impossible,Possible) :- 
        ord_intersect(R,AbsentE), !,
        splitadmissible(Rs,AbsentE,Impossibles,Possible),
        ord_add_element(Impossibles,react(R,I,P),Impossible).
splitadmissible([react(R,I,P)|Rs],AbsentE,Impossible,Possible) :- 
        ord_disjoint(R,AbsentE),
        splitadmissible(Rs,AbsentE,Impossible,Possibles),
        ord_add_element(Possibles,react(R,I,P),Possible).

/* The predicates entitiesR/1, entitiesI/1, entitiesP/1 collect the entities that,
respectively, appear as reactants, inhibitors and products of some custom reaction
NOTE: the meta-predicate bagof is used for convenience
*/
entitiesR(AllR) :- myordreactions(Rs),bagof(R,isR(R,Rs),AllB),ord_union(AllB,AllR).
entitiesI(AllI) :- myordreactions(Rs),bagof(I,isI(I,Rs),AllB),ord_union(AllB,AllI).
entitiesP(AllP) :- myordreactions(Rs),bagof(P,isP(P,Rs),AllB),ord_union(AllB,AllP).
isR(R,Rs) :- member(react(R,_,_),Rs).
isI(I,Rs) :- member(react(_,I,_),Rs).
isP(P,Rs) :- member(react(_,_,P),Rs).

/* The predicate entitiesRIP/1 collects the entities that appear in some custom reaction
*/
entitiesRIP(AllRIP) :- entitiesR(AllR),entitiesI(AllI),entitiesP(AllP),ord_union([AllR,AllI,AllP],AllRIP).

entitiesAll(All) :- entitiesRIP(AllRIP),myordentities(E),fromcontext(FromC),entitiesDelta(AllQ),ord_union([AllRIP,E,FromC,AllQ],All).

entitiesNotNeeded(NotUsedE) :- fromcontext(FromC),entitiesRIP(All),ord_subtract(FromC,All,NotUsedE).
% IN SPEC-ERBB.PL [alphail, mekkl, pip2_345, pip_34, rak] APPAIONO NEL CONTESTO MA NON SONO MAI USATE!!!

/* The predicate entitiesDelta/1 returns the set of entities that appear in 
some process constant declaration inside the custom environment Delta
*/
entitiesDelta(AllQ) :- myparsedenvironment(Delta),bagof(Q,isQ(Q,Delta),AllB),ord_union(AllB,AllQ).
isQ(Q,Delta) :- gen_assoc(Id,Delta,_),
                entitiesId(Id,Delta,Q). % defined below

/* The predicate idsDelta/1 returns the set of process constants that are defined in 
the customenvironment Delta
*/
idsDelta(AllIds) :- myparsedenvironment(Delta),
                    setof(Id,isId(Id,Delta),AllIds).
isId(Id,Delta) :- gen_assoc(Id,Delta,_).

/* The predicate fromcontext/1 returns the ordered set of entities that can be provided by 
some custom context.
NOTE: in case recursively defined process constants are present, the environment is
inspected to recursively compute the entities that are involved in their definitions
*/
fromcontext(FromC) :- myparsedenvironment(Delta),
                      myparsedcontext(Ks),
                      recentitiesKs(Ks,Delta,FromC).

/* The predicate recentitiesKs(Ks,Delta,Q) returns the ordered set of entities Q 
that can be provided by a list of contexts Ks according to the environment Delta
*/
recentitiesKs([],_,[]).
recentitiesKs([K|Ks],Delta,Q1) :- recentitiesK(K,Delta,Q),
                                  recentitiesKs(Ks,Delta,Qs),
                                  ord_union(Q,Qs,Q1).

/* The predicate recentitiesK(K,Delta,Q) returns the ordered set of entities Q 
that can be provided by a context K according to the environment Delta
*/
recentitiesK(nil,_,[]).
recentitiesK(rec(Id),Delta,Q) :- entitiesId(Id,Delta,Q).
recentitiesK(pre(Q1,K1),Delta,Q) :- recentitiesK(K1,Delta,Q2),
                                    ord_union(Q1,Q2,Q).
recentitiesK(guarded(Q1,Q2,Q3,K1),Delta,Q) :- recentitiesK(K1,Delta,Q4),
                                           ord_union([Q1,Q2,Q3,Q4],Q).
recentitiesK(do(_,K1,K2),Delta,Q) :- recentitiesK(K1,Delta,Q1),
                                     recentitiesK(K2,Delta,Q2),
                                     ord_union(Q1,Q2,Q).
recentitiesK(plus(K1,K2),Delta,Q) :- recentitiesK(K1,Delta,Q1),
                                     recentitiesK(K2,Delta,Q2),
                                     ord_union(Q1,Q2,Q).

/* The predicate entitiesId(Id,Delta,Q) returns the ordered set of entities Q 
that can be provided by the process constant Id according to the environment Delta
*/
entitiesId(Id,Delta,Q) :- invokes(Id,Delta,Ids),
                          entitiesIds(Ids,Delta,Q).

/* The predicate invokes(Id,Delta,Ids) returns the ordered set of process constants
that can recursively invoked by rec(Id)
NOTE: similar to a (breadth first) graph exploration
*/
invokes(Id,Delta,Ids) :- invokesAux([Id],Delta,[],Ids).
invokesAux([],_,Ids,Ids).
invokesAux([Id|Ids],Delta,AccIds,ResIds) :- ord_memberchk(Id,AccIds), !,
                                            invokesAux(Ids,Delta,AccIds,ResIds).
invokesAux([Id|Ids],Delta,AccIds,ResIds) :- get_assoc(Id,Delta,K),
                                            idsK(K,KIds),
                                            append(KIds,Ids,Ids1),
                                            ord_add_element(AccIds,Id,AccIds1),
                                            invokesAux(Ids1,Delta,AccIds1,ResIds).
/* The predicate idsK(K,KIds) returns the ordered set KIds of process constants that appear in K
*/
idsK(nil,[]).
idsK(rec(X),[X]).
idsK(pre(_,K),Ids) :- idsK(K,Ids).
idsK(guarded(_,_,_,K),Ids) :- idsK(K,Ids).
idsK(do(_,K1,K2),Ids) :- idsK(K1,Ids1),idsK(K2,Ids2),ord_union(Ids1,Ids2,Ids).
idsK(plus(K1,K2),Ids) :- idsK(K1,Ids1),idsK(K2,Ids2),ord_union(Ids1,Ids2,Ids).

/* The predicate entitiesIds(Ids,Delta,Q) returns the ordered set of entities that appear
in the declaration of some process constant in the ordered set Ids according as
defined in the environment Delta
*/
entitiesIds([],_,[]).
entitiesIds([Id|Ids],Delta,Q) :- get_assoc(Id,Delta,K),
                                 entitiesK(K,QId),
                                 entitiesIds(Ids,Delta,QIds),
                                 ord_union(QId,QIds,Q).

/* The predicate entitiesK(K,QId) returns the ordered set of entities that appear
directly in the context process K
*/
entitiesK(nil,[]).
entitiesK(rec(_),[]).
entitiesK(pre(Q1,K1),Q) :- entitiesK(K1,Q2),ord_union(Q1,Q2,Q).
entitiesK(guarded(Q1,Q2,Q3,K1),Q) :- entitiesK(K1,Q4),ord_union([Q1,Q2,Q3,Q4],Q).
entitiesK(do(_,K1,K2),Q) :- entitiesK(K1,Q1),entitiesK(K2,Q2),ord_union(Q1,Q2,Q).
entitiesK(plus(K1,K2),Q) :- entitiesK(K1,Q1),entitiesK(K2,Q2),ord_union(Q1,Q2,Q).

/* NOT USED?
*/
entitiesKs([],[]).
entitiesKs([K1|Ks],Q) :- entitiesK(K1,Q1),entitiesKs(Ks,Qs),ord_union(Q1,Qs,Q).


%==== USER INTERACTION VIA main PREDICATE

/* the main/3 predicate computes useful information about Reaction Systems
different "options" are possible, depending on its first parameter 
the main/2 variant saves the information on the file system
The possible options are:
- target: assumes termination
- run: assumes termination
- loop: assumes a perpetual context x = Q.x
- freq: assumes determinism and termination
- limitfreq: assumes a perpetual context of the form Q1. ... Q1.Q2. ... Q2. ... Qn. ...
- fastfreq:  assumes a perpetual context of the form Q1. ... Q1.Q2. ... Q2. ... Qn. ...
- digraph: LTS of any Reaction System
- advdigraph: LTS of any (adversary) Reaction System
- autodigraph: reduced LTS of any Reaction System
- minidigraph: further reduced LTS of any Reaction System
- rundigraph: assumes termination
- biosim: applicable to any pair of Reaction Systems
- biohml: applicable to any Reaction System
*/

% REMARK: for large Reaction Systems it may be needed to extend the stack limit size
% set_prolog_flag(stack_limit, 2_147_483_648). 
% set_prolog_flag(stack_limit, 4_294_967_296). 
% set_prolog_flag(stack_limit, 8_589_934_592).


main(Option,Result,Time) :- statistics(runtime,[Start|_]),
                            main_do(Option,Result),
                            statistics(runtime,[Stop|_]),
                            plus(Time,Start,Stop).
main(Option,Time) :- statistics(runtime,[Start|_]),
                     main_do(Option),
                     statistics(runtime,[Stop|_]),
                     plus(Time,Start,Stop).


% SUPPRESS SOME WARNINGS 
:- discontiguous main_do/1.
:- discontiguous main_do/2.


% option stat:
% prints some general information about the custom Reaction System
main_do(stat,MissingE) :- writeln('Some statistics about your custom RS:'),
                          writeln('============================================================='),
                          % entities in the initial state
                          myordentities(E),length(E,NE), 
                          format('the initial state has ~w entities:~n',[NE]),
                          writeln(E),
                          % reactants of some reactions
                          entitiesR(AllR),length(AllR,NR), 
                          format('~nthe reactants are ~w:~n',[NR]),
                          writeln(AllR),
                          % inhibitors of some reactions
                          entitiesI(AllI),length(AllI,NI), 
                          format('~nthe inhibitors are ~w:~n',[NI]),
                          writeln(AllI),
                          % products of some reactions
                          entitiesP(AllP),length(AllP,NP),
                          format('~nthe products are ~w:~n',[NP]),
                          writeln(AllP),
                          % entities appearing in some reactions
                          ord_union([AllR,AllI,AllP],AllRIP),length(AllRIP,NRIP),
                          format('~nthe reactions involve ~w entities:~n',[NRIP]),
                          writeln(AllRIP),
                          % entities appearing in the environment
                          entitiesDelta(AllQ),length(AllQ,NQ), 
                          format('~nthe environment involves ~w entities:~n',[NQ]),
                          writeln(AllQ),
                          % entities appearing in the context
                          fromcontext(FromC),length(FromC,NFromC),
                          format('~nthe context involves ~w entities:~n',[NFromC]),
                          writeln(FromC),
                          % all entities in the RS
                          ord_union([AllRIP,E,FromC,AllQ],All),length(All,NAll),
                          format('~nthe whole RS involves ~w entities:~n',[NAll]),
                          writeln(All),
                          % missing reactants
                          ord_union([AllP,E,FromC],PossibleE),
                          ord_subtract(AllR,PossibleE,MissingE),length(MissingE,NMissingE), 
                          format('~nthere are ~w reactants that will never be available:~n',[NMissingE]),
                          writeln(MissingE),
                          % entities from the context that will never be used
                          entitiesNotNeeded(NotUsedE),length(NotUsedE,NNotUsedE),
                          format('~nthe context can provide ~w entities that will never be used:~n',[NNotUsedE]),
                          writeln(NotUsedE),
                          % reactions
                          myordreactions(Rs),length(Rs,NRs), 
                          format('~nthe overall number of reactions is ~w:~n',[NRs]),
                          splitadmissible(Rs,MissingE,NoRs,OkRs),
                          % reactions that can be enabled
                          length(OkRs,NOkRs),
                          format('- the applicable reactions are ~w~n',[NOkRs]),
                          % reactions that cannot be enabled
                          length(NoRs,NNoRs),
                          format('- the are ~w reactions that will never be enabled~n',[NNoRs]),
                          writeln('=============================================================').
main_do(stat) :- % save result on file system
                 openTmpStream(stat,'.txt',Stream),
                 writeln(Stream,'Some statistics about your custom RS:'),
                 writeln(Stream,'============================================================='),
                 % entities in the initial state
                 myordentities(E),length(E,NE), 
                 format(Stream,'the initial state has ~w entities:~n',[NE]),
                 writeln(Stream,E),
                 % reactants of some reactions
                 entitiesR(AllR),length(AllR,NR), 
                 format(Stream,'~nthe reactants are ~w:~n',[NR]),
                 writeln(Stream,AllR),
                 % inhibitors of some reactions
                 entitiesI(AllI),length(AllI,NI), 
                 format(Stream,'~nthe inhibitors are ~w:~n',[NI]),
                 writeln(Stream,AllI),
                 % products of some reactions
                 entitiesP(AllP),length(AllP,NP),
                 format(Stream,'~nthe products are ~w:~n',[NP]),
                 writeln(Stream,AllP),
                 % entities appearing in some reactions
                 ord_union([AllR,AllI,AllP],AllRIP),length(AllRIP,NRIP),
                 format(Stream,'~nthe reactions involve ~w entities:~n',[NRIP]),
                 writeln(Stream,AllRIP),
                 % entities appearing in the environment
                 entitiesDelta(AllQ),length(AllQ,NQ), 
                 format(Stream,'~nthe environment involves ~w entities:~n',[NQ]),
                 writeln(Stream,AllQ),
                 % entities appearing in the context
                 fromcontext(FromC),length(FromC,NFromC),
                 format(Stream,'~nthe context involves ~w entities:~n',[NFromC]),
                 writeln(Stream,FromC),
                 % all entities in the RS
                 ord_union([AllRIP,E,FromC,AllQ],All),length(All,NAll),
                 format(Stream,'~nthe whole RS involves ~w entities:~n',[NAll]),
                 writeln(Stream,All),
                 % missing reactants
                 ord_union([AllP,E,FromC],PossibleE),
                 ord_subtract(AllR,PossibleE,MissingE),length(MissingE,NMissingE), 
                 format(Stream,'~nthere are ~w reactants that will never be available:~n',[NMissingE]),
                 writeln(Stream,MissingE),
                 % entities from the context that will never be used
                 entitiesNotNeeded(NotUsedE),length(NotUsedE,NNotUsedE),
                 format(Stream,'~nthe context can provide ~w entities that will never be used:~n',[NNotUsedE]),
                 writeln(Stream,NotUsedE),
                 % reactions
                 myordreactions(Rs),length(Rs,NRs), 
                 format(Stream,'~nthe overall number of reactions is ~w:~n',[NRs]),
                 splitadmissible(Rs,MissingE,NoRs,OkRs),
                 % reactions that can be enabled
                 length(OkRs,NOkRs),
                 format(Stream,'- the applicable reactions are ~w~n',[NOkRs]),
                 % reactions that cannot be enabled
                 length(NoRs,NNoRs),
                 format(Stream,'- the are ~w reactions that will never be enabled~n',[NNoRs]),
                 writeln(Stream,'============================================================='),
                 close(Stream).



% option target:
% finds a final set of entities in a terminating Reaction System
main_do(target,E) :- mysystem(S),
                     target(S,_,E).
main_do(target) :- main_do(target,E),
                   % save result on file system
                   save(target,E).


% option run:
% finds the list of traversed states in a (deterministic) terminating Reaction System
main_do(run,Es) :- mysystem(S),
                   smartRunECT(S,Es,_,_).
main_do(run) :- main_do(run,Es),
                % save result on file system
                saveList(runE,Es).


% option loop:
% finds the looping list of states in a Reaction System with a perpetual context
% IMPORTANT: for loops, we assume Delta defines the process constant x = Q.x and the context process is x
main_do(loop,Loop) :- mysystem(S),
                      loop(S,Loop).
main_do(loop) :- main_do(loop,Loop),
                 % save result on file system
                 saveList(loop,Loop).


% option freq:
% finds the frequency of each entity in the traversed states for a (deterministic) terminating Reaction System
main_do(freq,PairList) :- mysystem(S),
                          naiveFreq(S,AssocList),
                          assoc_to_list(AssocList,PairList).
main_do(freq) :- main_do(freq,PairList),
                 % save result on file system
                 savePairList(freq,PairList).


% option limitfreq:
% finds the frequency of each entity in the limit loop of a nonterminating Reaction System
% whose context has the form Q1. ... Q1.Q2. ... Q2. ... Qn. ...
% IMPORTANT: myordexperiment/2 returns the list of weights Wi (here ignored) and the list of contexts Qi
main_do(limitfreq,PairList) :- myordreactions(Rs),myordexperiment(_,Qs),myordentities(E),
                               limitFreq(Rs,Qs,E,_,AssocList),
                               assoc_to_list(AssocList,PairList).
main_do(limitfreq) :- main_do(limitfreq,PairList),
                      % save result on file system
                      savePairList(limitfreq,PairList).


% option fastfreq:
% finds the frequency of each entity in the traversed loops of a terminating Reaction System
% whose context has the form Q1. ... Q1.Q2. ... Q2. ... Qn. ... Qn.nil
% and each Qi is repeated Wi times
% IMPORTANT: myordexperiment/2 returns the list of weights Wi and the list of contexts Qi
main_do(fastfreq,PairList) :- myordreactions(Rs),myordexperiment(Ws,Qs),myordentities(E),
                              fastFreq(Rs,Ws,Qs,E,AssocList),
                              assoc_to_list(AssocList,PairList).
main_do(fastfreq) :- main_do(fastfreq,PairList),
                     % save result on file system
                     savePairList(fastfreq,PairList).


% option digraph:
% computes the LTS and save it in .dot format
main_do(digraph,Arcs) :- mysystem(S),
                         % smartDigraph(S,_,Arcs).
                         % list_to_ord_set([diltiazem,verapamil,propranolol,carvedilol,bisoprolol,atenolol,flecainide,warfarin,apixaban,dabigatran,vkant,benazepril,captopril,olmesortan,irbesartan,indapamide,chlorothiazide],Med),
                         %list_to_ord_set([headache,hypertension,pregnant,asthma,aspirine,paracetamol,ibuprofen,acediur,norvasc],Med),
                         %smartDigraph(S,_,Arcs,ek(Med,hide),ctx(all)).
                         %smartDigraph(S,_,Arcs,ek(all,all),ctx(all)).
                         smartDigraph(S,_,Arcs,ek(all,hide),ctx(all)).
                         % smartDigraph(S,_,Arcs,ek([],all),hide).
                         % smartDigraph(S,_,Arcs,ek([akt,ilk,camkk,grb2,pdk1,pi3k,pip2_34,pip3_345,sos],all),ent([akt,ilk,camkk,grb2,pdk1,pi3k,pip2_34,pip3_345,sos])).
main_do(digraph) :- main_do(digraph,_).
main_name(FileName) :- mysystem(S),
                   smartGraph(S,Nodes,Arcs),
                   % smartDigraph(S,Nodes,Arcs,ek(all,hide),ctx(all)),
                   wdpath(WD),
                   working_directory(_,WD),
                   open(FileName,write,Stream),
                   digraphstyle(DGStyle),
                   write(Stream,DGStyle),
                   writeSmartNodes(Stream,Nodes,ek(all,hide)),
                   writeSmartEdges(Stream,Arcs,ctx(all)),
                   writeln(Stream,'}'),
                   close(Stream).     
    

% option advdigraph:
% computes the LTS of the adversary system and save it in .dot format
main_do(advdigraph,Arcs) :- advsystem(S),
                            smartDigraph(S,_,Arcs).
main_do(advdigraph) :- main_do(advdigraph,_).

% option autodigraph:
% computes the LTS, removes common entities and save it in .dot format
main_do(autodigraph,Arcs) :- mysystem(S),
                             autoDigraph(S,_,Arcs,_,_).
main_do(autodigraph) :- mysystem(S),
                        autoDigraph(S,_,_,CapE,CapC),
                        % save info on file system
                        saveList(commonEnt,CapE),
                        saveList(commonCtx,CapC).


% option minidigraph:
% computes the LTS, removes common entities W.R.T. THE SAME CONTEXT and save it in .dot format
main_do(minidigraph,Arcs) :- mysystem(S),
                             miniDigraph(S,_,Arcs,_,_,_).
main_do(minidigraph) :- mysystem(S),
                        miniDigraph(S,_,_,CapE,CapC,AssocList),
                        % save info on file system
                        saveList(commonEnt,CapE),
                        saveList(commonCtx,CapC),
                        assoc_to_list(AssocList,PairList),
                        saveList(commonK,PairList).


% option rundigraph:
% computes the sequence of states traversed by a single (finite) run and save it in .dot format
% IMPORTANT: useful to observe cycles in an experiment
main_do(rundigraph,Es) :- mysystem(S),
                          runDigraph(S,rundigraph,Es,_,_,all,all).
                          % runDigraph(S,rundigraph,Es,_,_,all,1).
                          % runDigraph(S,runECdigraph,Es,_,_,[],1).
                          % runDigraph(S,runECdigraph,Es,_,_,[akt,ilk,camkk,grb2,pdk1,pi3k,pip2_34,pip3_345,sos],[akt,ilk,camkk,pdk1,pi3k,pip2_34,pip3_345,sos]).
main_do(rundigraph) :- main_do(rundigraph,_).

% option shortrundigraph:
% creates a minimal length experiment K that traverses all loops
% in a loop confluent system w.r.t. [Q1,...,Qn] and then draw the corresponding digraph
main_do(shortrundigraph,K) :- mysystem(S),
                              myexperiment(_,Qs),
                              loopconfDigraph(S,Qs,K,_,_,_,_).
main_do(shortrundigraph) :- mysystem(S),
                            myexperiment(_,Qs),
                            loopconfDigraph(S,Qs,K,Delta,_,_,_),
                            assoc_to_list(Delta,PairList),
                            % save info on file system
                            openTmpStream(shortexperiment,'.txt',StreamK),
                            writeln(StreamK,K),
                            nl(StreamK),
                            writeList(StreamK,PairList),
                            close(StreamK).


% option biosim:
% computes an F-biosimulation between two system processes
% IMPORTANT: it requires the definition of the assertion F and the adversary system
% IMPORTANT: it runs the smart version of the predicates for efficiency reasons,
%            so the processes in the relation are entity/context pairs ek(E,K)
main_do(biosim,BioRel) :- mysystem(S),
                          myparsedassert(F),
                          advsystem(S1),
                          smartBiosim(S,S1,F,BioRel).
main_do(biosim) :- main_do(biosim,BioRel),
                   % save result on file system
                   saveList(biosim,BioRel).


% option biohml:
% checks if a system satisfies a bio HML formula,
% returns some explanation if this is not the case
% IMPORTANT: it requires the definition of the bhml formula G
% IMPORTANT: it runs the smart version of the predicates for efficiency reasons,
%            so the processes in the relation are entity/context pairs ek(E,K)
main_do(biohml,Answer) :- mysystem(S),
                          myparsedbhml(G),
                          smartBioHML(S,G,Answer).
main_do(biohml) :- main_do(biohml,Answer),
                   % save result on file system
                   saveList(biohml,[Answer]).



main_do(rs2gts) :- 
    myparsedenvironment(Delta),
    assoc_to_list(Delta,PairList),
    myparsedcontext(Ks),
    myordreactions(Rs),
    myordentities(Es),
    entitiesAll(AllRIP),
    fix_gty(TypeLines0),
    en_to_gty(AllRIP,TypeLines1),
    openTmpStream(rs2gst,'.gty',TypeStream),
    writeListInline(TypeStream,["<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<gxl xmlns=\"http://www.gupro.de/GXL/gxl-1.0.dtd\">\n    <graph role=\"type\" edgeids=\"false\" edgemode=\"directed\" id=\"type\">\n        <attr name=\"$version\">\n            <string>curly</string>\n        </attr>\n"]),
    writeListInline(TypeStream,TypeLines0),
    writeListInline(TypeStream,TypeLines1),
    writeListInline(TypeStream,["    </graph>\n</gxl>\n"]),
    close(TypeStream),
    en_to_gts(AllRIP,Lines0),
    in_to_gts(Es,Lines1),
    rs_to_gts('react','Reaction',0,Rs,Lines2),
    co_to_gts(Delta,'ktx',0,Ks,Lines3),
    de_to_gts(Delta,'env',0,PairList,Lines4),
    gts_node('nil','nil','State',Lines5),
    openTmpStream(rs2gst,'.gst',Stream),
    writeListInline(Stream,["<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<gxl xmlns=\"http://www.gupro.de/GXL/gxl-1.0.dtd\">\n    <graph role=\"graph\" edgeids=\"false\" edgemode=\"directed\" id=\"reactions\">\n        <attr name=\"$version\">\n            <string>curly</string>\n        </attr>\n"]),
    writeListInline(Stream,Lines0),
    writeListInline(Stream,Lines1),
    writeListInline(Stream,Lines2),
    writeListInline(Stream,Lines3),
    writeListInline(Stream,Lines4),
    writeListInline(Stream,Lines5),
    writeListInline(Stream,["    </graph>\n</gxl>\n"]),
    close(Stream).

writeListInline(_,[]).
writeListInline(Stream,[L|Ls]) :- write(Stream,L), writeListInline(Stream,Ls).

gty_node(Id,["        <node id=\"",Id,"\">\n        </node>\n        <edge from=\"",Id,"\" to=\"",Id,"\">\n            <attr name=\"label\">\n                <string>type:",Id,"</string>\n            </attr>\n        </edge>\n"]).
gty_node_name(Id,["        <node id=\"",Id,"\">\n        </node>\n        <edge from=\"",Id,"\" to=\"",Id,"\">\n            <attr name=\"label\">\n                <string>string:name</string>\n            </attr>\n        </edge>\n        <edge from=\"",Id,"\" to=\"",Id,"\">\n            <attr name=\"label\">\n                <string>type:",Id,"</string>\n            </attr>\n        </edge>\n"]).

fix_gty(Lines4) :-
%    gty_node_name('Token',Lines0), %% Arend 
%    gty_node_name('State',Lines1),
%    gty_node('Step',Lines2),
%    gty_node_name('Rule',Lines3),
%    gty_node_name('Entity',Lines4),
    gty_node('Entity',Lines4).
%    gty_node('Reaction',Lines5),
%    gty_node_name('RInstance',Lines6),
%    gty_node_name('EInstance',Lines7),
%    gts_edge('Token','State','current',Lines8),
%    gts_edge('State','Step','next',Lines9),
%    gts_edge('Step','State','move',Lines10),
%    gts_edge('Step','Rule','sub:',Lines11),
%    gts_edge('Rule','Entity','reactant',Lines12),
%    gts_edge('Rule','Entity','inhibitor',Lines13),
%    gts_edge('Rule','Entity','product',Lines14),
%    gts_edge('Reaction','Rule','sub:',Lines15),
%    gts_edge('RInstance','Reaction','of',Lines16),
%    gts_edge('RInstance','EInstance','reactant',Lines17),
%    gts_edge('RInstance','EInstance','product',Lines18),
%    gts_edge('EInstance','Entity','of',Lines19),
%    gts_edge('Rule','Rule','flag:fired',Lines20),
%    gts_edge('EInstance','EInstance','flag:last',Lines21),
%    gts_edge('Entity','Entity','flag:present',Lines22),
%    append([Lines0,Lines1,Lines2,Lines3,Lines4,Lines5,Lines6,Lines7,Lines8,Lines9,Lines10,Lines11,Lines12,Lines13,Lines14,Lines15,Lines16,Lines17,Lines18,Lines19,Lines20,Lines21,Lines22],Lines).

en_to_gty([],[]).
% en_to_gty([E|Es],Lines) :-
%     ord_memberchk(E,[danger,major]), %% Arend
%     gty_node(E,LinesE),
%     gts_edge(E,'Entity','sub:',LinesSub), 
%     gts_edge(E,E,'flag:forbidden',LinesForb),
%     en_to_gty(Es,LinesEs),
%     append([LinesE,LinesSub,LinesForb,LinesEs],Lines).
en_to_gty([E|Es],Lines) :-
%     \+ ord_memberchk(E,[danger,major]), %% Arend
    gty_node(E,LinesE),
    gts_edge(E,'Entity','sub:',LinesSub), 
    en_to_gty(Es,LinesEs),
    append([LinesE,LinesSub,LinesEs],Lines).


de_to_gts(_,_,_,[],[]).
de_to_gts(Delta,Label,N,[(X-K)|PairList],Lines) :-
    gts_node(X,X,'State',LinesX),
    k_to_gts(Delta,Label,X,0,K,LinesK,_),
    M is N+1, de_to_gts(Delta,Label,M,PairList,LinesPL),
    append([LinesX,LinesK,LinesPL],Lines).


co_to_gts(_,_,_,[],[]).
co_to_gts(Delta,Label,N,[nil|Ks],Lines) :- !,
    co_to_gts(Delta,Label,N,Ks,Lines).
co_to_gts(Delta,Label,N,[rec(Kide)|Ks],Lines) :- !,
    atomics_to_string(['token_',N],Token),
    gts_node(Token,Token,'Token',LinesToken),
    gts_edge(Token,Kide,'current',LinesCurrent),
    M is N+1, co_to_gts(Delta,Label,M,Ks,LinesKs),
    append([LinesToken,LinesCurrent,LinesKs],Lines).
% Remember:
% do(H,_,K) :- 1>H, !, K
% do(H1,do(H2,K1,K2),K) :- H1>H2, !, H is H1-H2, do(H2,K1,do(H,K2,K))
% do(H1,do(H2,K1,K2),K) :- !, do(H1,K1,K)
% do(H,rec(X),K) :- !, get_assoc(X,Delta,K1), do(H,K1,K)
% do(H,pre(C,K1),K) :- !, H1 is H-1, pre(C,do(H1,K1,K))
% do(H,guarded(R,I,C,K1),K) :- !, H1 is H-1, guarded(R,I,C,do(H1,K1,K))
% do(H,plus(K1,K2),K) :- !, plus(do(H,K1,K),do(H,K2,K))
co_to_gts(Delta,Label,N,[do(H,_,K)|Ks],Lines) :- 1>H, !,
    co_to_gts(Delta,Label,N,[K|Ks],Lines).
co_to_gts(Delta,Label,N,[do(H1,do(H2,K1,K2),K)|Ks],Lines) :- H1>H2, !,
    H is H1-H2, co_to_gts(Delta,Label,N,[do(H2,K1,do(H,K2,K))|Ks],Lines).
co_to_gts(Delta,Label,N,[do(H1,do(_,K1,_),K)|Ks],Lines) :- !,
    co_to_gts(Delta,Label,N,[do(H1,K1,K)|Ks],Lines).
co_to_gts(Delta,Label,N,[do(H,rec(X),K)|Ks],Lines) :- !,
    get_assoc(X,Delta,K1),
    co_to_gts(Delta,Label,N,[do(H,K1,K)|Ks],Lines).
co_to_gts(Delta,Label,N,[do(H,pre(C,K1),K)|Ks],Lines) :- !,
    H1 is H-1, co_to_gts(Delta,Label,N,[pre(C,do(H1,K1,K))|Ks],Lines).
co_to_gts(Delta,Label,N,[do(H,guarded(R,I,C,K1),K)|Ks],Lines) :- !,
    H1 is H-1, co_to_gts(Delta,Label,N,[guarded(R,I,C,do(H1,K1,K))|Ks],Lines).
co_to_gts(Delta,Label,N,[do(H,plus(K1,K2),K)|Ks],Lines) :- !,
    co_to_gts(Delta,Label,N,[plus(do(H,K1,K),do(H,K2,K))|Ks],Lines).
% only pre / plus / guarded
co_to_gts(Delta,Label,N,[K|Ks],Lines) :-
    atomics_to_string([Label,'_',N],Kide),
    gts_node(Kide,Kide,'State',LinesKide),
    atomics_to_string(['token_',N],Token),
    gts_node(Token,Token,'Token',LinesToken),
    gts_edge(Token,Kide,'current',LinesCurrent),
    k_to_gts(Delta,Label,Kide,0,K,LinesK,_),
    M is N+1, co_to_gts(Delta,Label,M,Ks,LinesKs),
    append([LinesKide,LinesToken,LinesCurrent,LinesK,LinesKs],Lines).

m_to_gts(_,_,StepIde,_,N,nil,Lines,N) :- !,
    gts_edge(StepIde,'nil','move',Lines).
m_to_gts(_,_,StepIde,_,N,rec(Ide),Lines,N) :- !,
    gts_edge(StepIde,Ide,'move',Lines).
% Remember:
% do(H,_,K) :- 1>H, !, K
% do(H1,do(H2,K1,K2),K) :- H1>H2, !, H is H1-H2, do(H2,K1,do(H,K2,K))
% do(H1,do(H2,K1,K2),K) :- !, do(H1,K1,K)
% do(H,rec(X),K) :- !, get_assoc(X,Delta,K1), do(H,K1,K)
% do(H,pre(C,K1),K) :- !, H1 is H-1, pre(C,do(H1,K1,K))
% do(H,guarded(R,I,C,K1),K) :- !, H1 is H-1, guarded(R,I,C,do(H1,K1,K))
% do(H,plus(K1,K2),K) :- !, plus(do(H,K1,K),do(H,K2,K))
m_to_gts(Delta,Label,StepIde,Kide,N,do(H,_,K),Lines,M) :- 1>H, !,
    m_to_gts(Delta,Label,StepIde,Kide,N,K,Lines,M).
m_to_gts(Delta,Label,StepIde,Kide,N,do(H1,do(H2,K1,K2),K),Lines,M) :- H1>H2, !,
    H is H1-H2, m_to_gts(Delta,Label,StepIde,Kide,N,do(H2,K1,do(H,K2,K)),Lines,M).
m_to_gts(Delta,Label,StepIde,Kide,N,do(H1,do(_,K1,_),K),Lines,M) :- !,
    m_to_gts(Delta,Label,StepIde,Kide,N,do(H1,K1,K),Lines,M).
m_to_gts(Delta,Label,StepIde,Kide,N,do(H,rec(X),K),Lines,M) :- !,
    get_assoc(X,Delta,K1), m_to_gts(Delta,Label,StepIde,Kide,N,do(H,K1,K),Lines,M).
m_to_gts(Delta,Label,StepIde,Kide,N,do(H,pre(C,K1),K),Lines,M) :- !,
    H1 is H-1, m_to_gts(Delta,Label,StepIde,Kide,N,pre(C,do(H1,K1,K)),Lines,M).
m_to_gts(Delta,Label,StepIde,Kide,N,do(H,guarded(R,I,C,K1),K),Lines,M) :- !,
    H1 is H-1, m_to_gts(Delta,Label,StepIde,Kide,N,guarded(R,I,C,do(H1,K1,K)),Lines,M).
m_to_gts(Delta,Label,StepIde,Kide,N,do(H,plus(K1,K2),K),Lines,M) :- !,
    m_to_gts(Delta,Label,StepIde,Kide,N,plus(do(H,K1,K),do(H,K2,K)),Lines,M).
% only pre / plus / guarded
m_to_gts(Delta,Label,StepIde,Kide,N,K,Lines,M) :-
    atomics_to_string([Label,'_',N],Kide),
    gts_node(Kide,Kide,'State',LinesKide),
    gts_edge(StepIde,Kide,'move',LinesMove),
    N1 is N+1, k_to_gts(Delta,Label,Kide,N1,K,LinesK,M),
    append([LinesKide,LinesMove,LinesK],Lines).

% only pre / plus / guarded + aggiunto rec(X)
k_to_gts(Delta,Label,Kide,N,rec(X),Lines,M) :-
    get_assoc(X,Delta,K1),
    k_to_gts(Delta,Label,Kide,N,K1,Lines,M).
% Remember:
% do(H,_,K) :- 1>H, !, K
% do(H1,do(H2,K1,K2),K) :- H1>H2, !, H is H1-H2, do(H2,K1,do(H,K2,K))
% do(H1,do(H2,K1,K2),K) :- !, do(H1,K1,K)
% do(H,rec(X),K) :- !, get_assoc(X,Delta,K1), do(H,K1,K)
% do(H,pre(C,K1),K) :- !, H1 is H-1, pre(C,do(H1,K1,K))
% do(H,guarded(R,I,C,K1),K) :- !, H1 is H-1, guarded(R,I,C,do(H1,K1,K))
% do(H,plus(K1,K2),K) :- !, plus(do(H,K1,K),do(H,K2,K))
k_to_gts(Delta,Label,Kide,N,do(H,_,K),Lines,M) :- 1>H , !,
    k_to_gts(Delta,Label,Kide,N,K,Lines,M).
k_to_gts(Delta,Label,Kide,N,do(H1,do(H2,K1,K2),K),Lines,M) :- H1>H2, !,
    H is H1-H2, k_to_gts(Delta,Label,Kide,N,do(H2,K1,do(H,K2,K)),Lines,M).
k_to_gts(Delta,Label,Kide,N,do(H1,do(_,K1,_),K),Lines,M) :- !,
    k_to_gts(Delta,Label,Kide,N,do(H1,K1,K),Lines,M).
k_to_gts(Delta,Label,Kide,N,do(H,rec(X),K),Lines,M) :- !,
    get_assoc(X,Delta,K1), k_to_gts(Delta,Label,Kide,N,do(H,K1,K),Lines,M).
k_to_gts(Delta,Label,Kide,N,do(H,pre(C,K1),K),Lines,M) :- !,
    H1 is H-1, k_to_gts(Delta,Label,Kide,N,pre(C,do(H1,K1,K)),Lines,M).
k_to_gts(Delta,Label,Kide,N,do(H,guarded(R,I,C,K1),K),Lines,M) :- !,
    H1 is H-1, k_to_gts(Delta,Label,Kide,N,guarded(R,I,C,do(H1,K1,K)),Lines,M).
k_to_gts(Delta,Label,Kide,N,do(H,plus(K1,K2),K),Lines,M) :- !,
    k_to_gts(Delta,Label,Kide,N,plus(do(H,K1,K),do(H,K2,K)),Lines,M).
k_to_gts(Delta,Label,Kide,N,guarded(R,I,C,K1),Lines,M) :-
    atomics_to_string([Kide,'_',N],StepIde),
    rs_to_gts(Kide,'Step',N,[react(R,I,C)],LinesStep),
    gts_edge(Kide,StepIde,'next',LinesNext),
    N1 is N+1, m_to_gts(Delta,Label,StepIde,Kide,N1,K1,LinesK1,M),
    append([LinesStep,LinesNext,LinesK1],Lines).
k_to_gts(Delta,Label,Kide,N,pre(C,K1),Lines,M) :-
    atomics_to_string([Kide,'_',N],StepIde),
    rs_to_gts(Kide,'Step',N,[react([],[],C)],LinesStep),
    gts_edge(Kide,StepIde,'next',LinesNext),
    N1 is N+1, m_to_gts(Delta,Label,StepIde,Kide,N1,K1,LinesK1,M),
    append([LinesStep,LinesNext,LinesK1],Lines).
k_to_gts(Delta,Label,Kide,N,plus(K1,K2),Lines,M) :-
    k_to_gts(Delta,Label,Kide,N,K1,LinesK1,N1),
    k_to_gts(Delta,Label,Kide,N1,K2,LinesK2,M),
    append([LinesK1,LinesK2],Lines).

gts_node(Id,Type,["        <node id=\"",Id,"\">\n        </node>\n        <edge from=\"",Id,"\" to=\"",Id,"\">\n            <attr name=\"label\">\n                <string>id:",Id,"</string>\n            </attr>\n        </edge>\n        <edge from=\"",Id,"\" to=\"",Id,"\">\n            <attr name=\"label\">\n                <string>type:",Type,"</string>\n            </attr>\n        </edge>\n"]).
gts_node(Id,Name,Type,["        <node id=\"",Id,"\">\n        </node>\n        <edge from=\"",Id,"\" to=\"",Id,"\">\n            <attr name=\"label\">\n                <string>id:",Id,"</string>\n            </attr>\n        </edge>\n        <edge from=\"",Id,"\" to=\"",Id,"\">\n            <attr name=\"label\">\n                <string>type:",Type,"</string>\n            </attr>\n        </edge>\n        <edge from=\"",Id,"\" to=\"",Id,"\">\n            <attr name=\"label\">\n                <string>let:name=\"",Name,"\"</string>\n            </attr>\n        </edge>\n"]).
gts_edge(From,To,Label,["        <edge from=\"",From,"\" to=\"",To,"\">\n            <attr name=\"label\">\n                <string>",Label,"</string>\n            </attr>\n        </edge>\n"]).

rs_to_gts(_,_,_,[],[]).
rs_to_gts(Label,Type,N,[react(R,I,P)|Rs],Lines) :- 
    atomics_to_string([Label,'_',N],RN),
    gts_node(RN,RN,Type,LinesRN),
    rea_to_gts(RN,'reactant',R,LinesR),
    rea_to_gts(RN,'inhibitor',I,LinesI),
    rea_to_gts(RN,'product',P,LinesP),
    M is N+1, rs_to_gts(Label,Type,M,Rs,LinesRs),
    append([LinesRN,LinesR,LinesI,LinesP,LinesRs],Lines).

rea_to_gts(_,_,[],[]).
rea_to_gts(RN,Label,[E|Es],Lines) :- 
    gts_edge(RN,E,Label,LinesE),
    rea_to_gts(RN,Label,Es,LinesEs),
    append([LinesE,LinesEs],Lines).

en_to_gts([],[]).
en_to_gts([E|Es],Lines) :-
    ord_memberchk(E,[danger,major]), %% Arend
    gts_node(E,E,E,LinesE),
    gts_edge(E,E,'flag:forbidden',LinesForb),  %% Arend
    en_to_gts(Es,LinesEs),
    append([LinesE,LinesForb,LinesEs],Lines).
en_to_gts([E|Es],Lines) :-
    \+ ord_memberchk(E,[danger,major]), %% Arend
    gts_node(E,E,E,LinesE),
    en_to_gts(Es,LinesEs),
    append([LinesE,LinesEs],Lines).

in_to_gts([],[]).
in_to_gts([E|Es],Lines) :-
    gts_edge(E,E,'flag:present',LinesE),
    in_to_gts(Es,LinesEs),
    append([LinesE,LinesEs],Lines).





/* Predicates save/2, saveList/2 and savePairList/2 save some infos in newly created .txt files
*/
save(Tag,E) :- openTmpStream(Tag,'.txt',Stream),
               writeln(Stream,E),
               close(Stream).

/* saveList/2 writes each element of a list on a separate line 
*/
saveList(Tag,Es) :- openTmpStream(Tag,'.txt',Stream),
                    writeList(Stream,Es),
                    close(Stream).
writeList(Stream,[]) :- nl(Stream).
writeList(Stream,[L|Ls]) :- writeln(Stream,L), writeList(Stream,Ls).

/* savePairList/2 is used to save requencies 
*/
savePairList(Tag,PairList) :- openTmpStream(Tag,'.txt',Stream),
                              writePairList(Stream,PairList),
                              close(Stream).

writePairList(Stream,[]) :- nl(Stream).
writePairList(Stream,[(A-U)|PairList]) :- 
        write(Stream,A), write(Stream,': '), write(Stream, U), writeln(Stream,"%"),
        writePairList(Stream,PairList).


% EXPERIMENTAL FEATURES:
% frequency, autodigraph, minidigraph, loopconfdigraph, possible reactions
% Missing entities for ERBB!!! entitiesMissing/1 entitiesNotNeeded/1
% nodeStyle customization

% TODO
% mostrare passaggio del tempo mentre calcola il grafo?
% con sequenza Q1...Qn produrre direttamente grafi separati?
% ek(E,K) -> ke(K,E) ????
% projections: mapping nodes to terms via any labelling function









