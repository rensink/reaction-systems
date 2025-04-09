
myentities([cpowder,tpowder]).

myreactions([
	react([idle],[am],[am]),
	react([am],[idle],[am]),
	react([ccoin,cpowder],[nomilk],[cappuccino]),
	react([ccoin,cpowder,nomilk],[],[espresso]),
	react([tcoin,tpowder],[],[tea]),
    react([cpowder],[],[cpowder]),
    react([tpowder],[],[tpowder]),
    react([anger],[],[bang])
]).

mycontext("[refill,student]").

myenvironment("[
	refill = ({nomilk}.refill + {}.refill),
	student = (?{},{am},{tcoin}?.gettea + ?{am},{},{ccoin}?.getcappuccino + {idle}.student),
    gettea = (?{tea},{},{}?.student + ?{},{tea},{anger}?.student),
    getcappuccino = (?{cappuccino},{},{}?.student + ?{espresso},{},{anger}?.student)
    ]").

% IGNORE WHAT FOLLOWS
adventities(E) :- myentities(E). % an adversary with the same entities
advreactions(Rs) :- myreactions(Rs). % an adversary with the same reactions
advcontext(K) :- mycontext(K). % an adversary with the same reactions context

myexperiment([10,10],[[a,b],[a]]).

myassert("-{c} inW").

mybhml("<-{c} inW>[-{c} inW]<-{c} inW>true").


