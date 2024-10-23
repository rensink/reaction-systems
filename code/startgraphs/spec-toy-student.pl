
myentities([cpowder,tpowder]).

myreactions([
	react([idle],[pm],[pm]),
	react([pm],[idle],[pm]),
	react([ccoin,cpowder,milk],[],[cappuccino]),
	react([tcoin,tpowder],[],[tea]),
    react([cpowder],[],[cpowder]),
    react([tpowder],[],[tpowder]),
    react([anger],[],[danger])
]).

mycontext("[refill,student]").

myenvironment("[
	refill = ({milk}.refill + {}.refill),
	student = (?{pm},{},{tcoin}?.gettea + ?{},{pm},{ccoin}?.getcappuccino + {idle}.student),
    gettea = (?{tea},{},{}?.student + ?{},{tea},{anger}?.gettea),
    getcappuccino = (?{cappuccino},{},{}?.student + ?{},{cappuccino},{anger}?.getcappuccino)
    ]").

% IGNORE WHAT FOLLOWS
adventities(E) :- myentities(E). % an adversary with the same entities
advreactions(Rs) :- myreactions(Rs). % an adversary with the same reactions
advcontext(K) :- mycontext(K). % an adversary with the same reactions context

myexperiment([10,10],[[a,b],[a]]).

myassert("-{c} inW").

mybhml("<-{c} inW>[-{c} inW]<-{c} inW>true").


