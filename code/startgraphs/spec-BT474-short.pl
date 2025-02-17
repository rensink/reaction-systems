% Short-term network for BT474
%
% 1. search for steady state with akt for !(hrg, egf, e, t)
% the presence/absence of the attractor AKT in steady states of the BT747 cell line
%
% mycontext("[k,ket]").
%
% 3. For instance, in order to observe the interactions when either erlotinib or pertuzumab are supplied, 
% it suffices to consider the process {(hrg,egf,e)}.(rec ’X . ({e} .’X) + ({p} .’X)). 
% For this process, Maude reports that there Exists at least one path where that treatment is successful,
% but not All paths avoid a steady state where AKT is present.
%
% mycontext("[k,korep]").
%
% 2. regardless the drug used, once PDK1 is present, inevitably the steady state includes AKT; and (ii) PDK1 never appears before ErbB-1 is produced (which basically means that PDK1 is a product of the acti- vation of the ErbB-1 receptor).
% ! (hrg, egf)) || (rec ’X . ( ({e} . ’X) + ({ p } . ’X) + ({ t } . ’X) )))
%
% mycontext("[k,korept]").
%
% 3. The results for the short-term experiments in [27] show that by permanently providing the drug erlotinib and the stimulus (EGF and HRG), the attractor AKT is never produced. By using ccReact conditional prefixes we can ask whether the drug needs to be provided in all the time-instants or can be provided only when an EGF receptor is activated. For that, consider the following process:
% rec ’X . ([ erbb1   or  erbb2   --> { e } ]     . ’X) +
%          ([ erbb1 ^ and erbb2 ^ --> { empty } ] . ’X)
% Maude checks that the production of AKT can be also inhibited by providing erlotinib only when receptor ErbB-1 and ErbB-2 are active.
%
% mycontext("[k,kge]").

myentities([]). % empty
adventities(E) :- myentities(E). % an adversary with the same entities

myreactions([
react([akt],[],[akt]),
react([erbb3],[],[akt]),
react([mtor],[],[akt]),
react([pdk1],[],[akt]),
react([erbb1],[e,p],[erbb1]),
react([egf],[e,p],[erbb1]),
react([plcg],[e,p],[erbb1]),
react([erbb2],[e,t,p],[erbb2]),
react([egf],[e,t,p],[erbb2]),
react([erbb3],[e,t,p],[erbb2]),
react([erbb3],[e,p],[erbb3]),
react([hrg],[e,p],[erbb3]),
react([erk12],[],[erk12]),
react([egf],[],[erk12]),
react([p],[],[erk12]),
react([mek12],[],[erk12]),
react([mek12],[],[mek12]),
react([erbb1],[],[mek12]),
react([erbb2],[],[mek12]),
react([erbb3],[],[mek12]),
react([mtor],[],[mtor]),
react([p],[],[mtor]),
react([akt],[],[mtor]),
react([p70s6k],[],[p70s6k]),
react([akt],[],[p70s6k]),
react([mtor],[],[p70s6k]),
react([erk12],[],[p70s6k]),
react([pdk1],[],[pdk1]),
react([erbb1],[],[pdk1]),
react([erbb2],[],[pdk1]),
react([erbb3],[],[pdk1]),
react([mek12],[],[pdk1]),
react([pkca],[],[pkca]),
react([plcg],[],[pkca]),
react([plcg],[],[plcg]),
react([egf],[],[plcg]),
react([erbb1],[],[plcg]),
react([erbb2],[],[plcg]),
react([erbb3],[],[plcg])
]).
advreactions(Rs) :- myreactions(Rs). % an adversary with the same reactions


% mycontext("[k,ket]").
% mycontext("[k,korep]").
mycontext("[k,korept]").
% mycontext("[k,kge]").
advcontext(K) :- mycontext(K). % an adversary with the same reactions context

myenvironment("[
    k = {egf,hrg}.k,
    ket = {e,t}.ket,
    korep = ({e}.korep + {p}.korep),
    korept = ({e}.korept + {p}.korept + {t}.korept),
    kge = (?{erbb1},{},{e}?.kge + ?{erbb2},{},{e}?.kge + ?{},{erbb1,erbb2},{}?.kge)
    ]").

myexperiment([10,10],[[a,b],[a]]).
myassert("true").
mybhml("true").

/*
(akt, , akt)
(erbb3, , akt)
(mtor, , akt)
(pdk1 , , akt)
 
(erbb1, e p, erbb1)
(egf, e p , erbb1)
(plcg, e p , erbb1)

(erbb2, e t p, erbb2)
(egf, e t p, erbb2)
(erbb3, e t p, erbb2)

(erbb3, e p , erbb3)
(hrg, e p , erbb3)

(erk12,  ,erk12)
(egf,  ,erk12)
(p,  ,erk12)
(mek12,  ,erk12)

(mek12, ,mek12)
(erbb1, ,mek12)
(erbb2, ,mek12)
(erbb3, ,mek12)

(mtor, ,mtor)
(p, ,mtor)
(akt, ,mtor)

(p70s6k, ,p70s6k)
(akt, ,p70s6k)
(mtor, ,p70s6k)
(erk12, ,p70s6k)

(pdk1, , pdk1)
(erbb1, , pdk1)
(erbb2, , pdk1)
(erbb3, , pdk1)
(mek12, , pdk1)

(pkca, , pkca)
(plcg, , pkca)

(plcg, , plcg)
(egf, , plcg)
(erbb1, , plcg)
(erbb2, , plcg)
(erbb3, , plcg)
*/