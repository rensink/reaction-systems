
myentities([out_1,out_2]).

myenvironment("[
	k1 = ({}.k1 + {act_1}.k1), 
	k2 = ({}.k2 + {act_2}.k2)
	]").

mycontext("[k1,k2]").

myreactions([
	react([out_1],[act_1],[out_1]),
	react([req_1],[act_1],[req_1]),
	react([req_1,lock],[],[req_1]),
	react([req_1,act_2],[],[req_1]),
	react([in_1],[act_1],[in_1]),
	react([out_1,act_1],[],[req_1]),
	react([req_1,act_1],[lock,act_2],[in_1,lock]),
	react([in_1,act_1],[],[out_1,done]),
	react([out_2],[act_2],[out_2]),
	react([req_2],[act_2],[req_2]),
	react([req_2,lock],[],[req_2]),
	react([req_2,act_1],[],[req_2]),
	react([in_2],[act_2],[in_2]),
	react([out_2,act_2],[],[req_2]),
	react([req_2,act_2],[lock,act_1],[in_2,lock]),
	react([in_2,act_2],[],[out_2,done]),
	react([lock],[done],[lock])
	]).


adventities(E) :- myentities(E). % an adversary with the same entities
advreactions(Rs) :- myreactions(Rs). % an adversary with the same reactions
advcontext(K) :- mycontext(K). % an adversary with the same reactions context
myexperiment([10,10],[[a,b],[a]]).
myassert("-{c} inW").
mybhml("<-{c} inW>[-{c} inW]<-{c} inW>true").

