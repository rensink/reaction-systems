mycontext("[k,k]"). % at least one and at most two processes are activated

myentities([out_1,out_2,out_3,out_4]).

myenvironment("[
    k = ({act_1}.k + {act_2}.k + {act_3}.k + {act_4}.k)
    ]").

myreactions([
    react([out_1],[act_1],[out_1]),
    react([out_1,act_1],[],[req_1]),
    react([req_1],[act_1],[req_1]),
    react([req_1,lock],[],[req_1]),
    react([in_1],[act_1],[in_1]),
    react([in_1,act_1],[],[out_1,done]),
    react([req_1,act_2],[],[req_1]),
    react([req_1,act_3],[],[req_1]),
    react([req_1,act_4],[],[req_1]),
    react([req_1,act_1],[lock,act_2,act_3,act_4],[in_1,lock]),
    react([out_2],[act_2],[out_2]),
    react([out_2,act_2],[],[req_2]),
    react([req_2],[act_2],[req_2]),
    react([req_2,lock],[],[req_2]),
    react([in_2],[act_2],[in_2]),
    react([in_2,act_2],[],[out_2,done]),
    react([req_2,act_1],[],[req_2]),
    react([req_2,act_3],[],[req_2]),
    react([req_2,act_4],[],[req_2]),
    react([req_2,act_2],[lock,act_1,act_3,act_4],[in_2,lock]),
    react([out_3],[act_3],[out_3]),
    react([out_3,act_3],[],[req_3]),
    react([req_3],[act_3],[req_3]),
    react([req_3,lock],[],[req_3]),
    react([in_3],[act_3],[in_3]),
    react([in_3,act_3],[],[out_3,done]),
    react([req_3,act_1],[],[req_3]),
    react([req_3,act_2],[],[req_3]),
    react([req_3,act_4],[],[req_3]),
    react([req_3,act_3],[lock,act_1,act_2,act_4],[in_3,lock]),
    react([out_4],[act_4],[out_4]),
    react([out_4,act_4],[],[req_4]),
    react([req_4],[act_4],[req_4]),
    react([req_4,lock],[],[req_4]),
    react([in_4],[act_4],[in_4]),
    react([in_4,act_4],[],[out_4,done]),
    react([req_4,act_1],[],[req_4]),
    react([req_4,act_2],[],[req_4]),
    react([req_4,act_3],[],[req_4]),
    react([req_4,act_4],[lock,act_1,act_2,act_3],[in_4,lock]),
    react([lock],[done],[lock])
    ]).



adventities(E) :- myentities(E). % an adversary with the same entities
advreactions(Rs) :- myreactions(Rs). % an adversary with the same reactions
advcontext(K) :- mycontext(K). % an adversary with the same reactions context
myexperiment([10,10],[[a,b],[a]]).
myassert("-{c} inW").
mybhml("<-{c} inW>[-{c} inW]<-{c} inW>true").

