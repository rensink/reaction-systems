
% set_prolog_flag(stack_limit, 2_147_483_648). 
% main_do(digraph).

myentities([]).
adventities(E) :- myentities(E). % an adversary with the same entities

/* environment */

myenvironment('[ x1 = (x11 + y),
                 x2 = (x21 + y),
                 x3 = (x31 + y),
                 x4 = (x41 + y),
                 x5 = (x51 + y),
                 x6 = (x61 + y),
                 x7 = (x71 + y),
                 x8 = (x81 + y),
                 x9 = (x91 + y),
                 x11 = {tgfb}.x11,
                 x21 = {il23}.x21,
                 x31 = {il12}.x31,
                 x41 = {il18}.x41,
                 x51 = {il4e}.x51,
                 x61 = {il27}.x61,
                 x71 = {il6e}.x71,
                 x81 = {ifnge}.x81,
                 x91 = {tcr}.x91,
                 y = {}.y]').

 
/* context processes */

mycontext("[x1,x2,x3,x4,x5,x6,x7,x8,x9]"). 
advcontext(K) :- mycontext(K). % an adversary with the same reactions context

/* reactions (the keyword react can be omitted)*/

myreactions([react([il4r],[socs1,ifng],[stat6]),
react([tgfb,nfat],[void],[tgfbr]),
react([tbet],[void],[il12r]),
react([stat4],[gata3],[il2r]),
react([tcr],[gata3],[il12r]),
react([il12,nfat],[void],[il12r]),
react([il2r],[void],[stat5]),
react([gata3],[tbet],[gata3]),
react([stat5],[tgfb,rorgt,foxp3,tbet],[gata3]),
react([stat6,nfat],[tgfb,rorgt,foxp3,tbet],[gata3]),
react([stat3],[void],[il23r]),   
react([il23,stat3],[tbet],[il23r]), 
react([tbet],[stat3],[ifng]),
react([nfkb],[void],[ifng]),
react([stat4,nfkb,nfat],[stat6,stat3],[ifng]),
react([tgfbr,stat3,il6r],[tbet,gata3,foxp3],[rorgt]),
react([tgfbr,stat3,il21r],[tbet,gata3,foxp3],[rorgt]),
react([il21],[void],[il21r]),
react([il18,il12],[stat6],[il18r]),
react([il6e],[void],[il6r]),
react([il6],[void],[il6r]),
react([il18r],[void],[irak]),
react([il12r,il12],[gata3],[stat4]),
react([tbet],[void],[socs1]),
react([stat1],[void],[socs1]),
react([gata3,nfat],[stat1],[il4]),
react([stat3,nfat],[void],[il21]),
react([rorgt],[void],[il6]),
react([stat5],[il21r,il6r,gata3],[foxp3]),
react([stat5],[il21r,stat3,gata3],[foxp3]),
react([tgfbr],[il21r,il6r,gata3],[foxp3]),
react([tgfbr],[il21r,stat3,gata3],[foxp3]),
react([tbet],[ifng,il12,rorgt,foxp3],[tbet]),
react([stat4],[rorgt,foxp3],[tbet]),
react([stat1],[rorgt,foxp3],[tbet]),
react([il27,nfat],[void],[stat1]),
react([jak1],[void],[stat1]),
react([il21r],[void],[stat3]),
react([il23r],[void],[stat3]),
react([il6r],[void],[stat3]),
react([ifngr],[socs1],[jak1]),
react([il2,nfat],[void],[il2r]),
react([il4e],[void],[il4r]),
react([il4],[socs1],[il4r]),
react([irak],[foxp3],[nfkb]),
react([tcr],[foxp3],[nfat]),
react([stat3,il17,il23r],[stat1,stat5],[il17]),
react([rorgt],[stat1],[il17]),
react([nfat,nfkb],[tbet],[il2]),
react([ifng,nfat],[void],[ifngr]),
react([ifnge,nfat],[void],[ifngr])
]).
advreactions(Rs) :- myreactions(Rs). % an adversary with the same reactions

myexperiment([10,10],[[a,b],[a]]).

myassert("-{c} inW").

mybhml("<-{c} inW>[-{c} inW]<-{c} inW>true").



