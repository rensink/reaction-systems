
myentities([neg_aspirine,neg_paracetamol,neg_ibuprofen,neg_acediur,neg_norvasc,neg_alert]).
adventities(E) :- myentities(E). % an adversary with the same entities

%% simplified reactions:
%% guidelines will never provide stop_drug instructions
%% conflict arises when aspirin + acediur are present
%%    react([get_aspirine,get_acediur],[],[col_moderate,moderate]),
%%    react([aspirine,get_acediur],[],[col_moderate,moderate]),
%%    react([get_aspirine,acediur],[],[col_moderate,moderate]),
myreactions([
    react([hypertension],[],[hypertension]),
    react([headache],[],[headache]),
    react([pregnant],[],[pregnant]),
    react([asthma],[],[asthma]),
    react([neg_hypertension],[],[neg_hypertension]),
    react([neg_headache],[],[neg_headache]),
    react([neg_pregnant],[],[neg_pregnant]),
    react([neg_asthma],[],[neg_asthma]),
    react([get_aspirine],[],[aspirine]),
    react([aspirine],[],[aspirine]),
    react([neg_aspirine,neg_get_aspirine],[],[neg_aspirine]),
    react([get_paracetamol],[],[paracetamol]),
    react([paracetamol],[],[paracetamol]),
    react([neg_paracetamol,neg_get_paracetamol],[],[neg_paracetamol]),
    react([get_ibuprofen],[],[ibuprofen]),
    react([ibuprofen],[],[ibuprofen]),
    react([neg_ibuprofen,neg_get_ibuprofen],[],[neg_ibuprofen]),
    react([get_acediur],[],[acediur]),
    react([acediur],[],[acediur]),
    react([neg_acediur,neg_get_acediur],[],[neg_acediur]),
    react([get_norvasc],[],[norvasc]),
    react([norvasc],[],[norvasc]),
    react([neg_norvasc,neg_get_norvasc],[],[neg_norvasc]),
    react([aspirine,acediur],[],[alert]),
    react([alert],[],[alert]),
    react([neg_aspirine,neg_alert],[],[neg_alert]),
    react([neg_acediur,neg_alert],[],[neg_alert])
]).
advreactions(Rs) :- myreactions(Rs). % an adversary with the same reactions


mycontext("[eth1,eth2,kheadache,khypertension,kpregnant,kasthma]").
advcontext(K) :- mycontext(K). % an adversary with the same reactions context

myenvironment("[
	eth1 = ({}.eth1 
        + ?{headache},{},{}?.eheadache),
	eheadache = ({}.eheadache 
        + ?{neg_pregnant},{},{}?.easpirine
		+ ?{pregnant},{},{}?.eparacetamol
        + ?{neg_pregnant,neg_asthma},{},{}?.eibuprofen),
    easpirine = ({}.easpirine 
        + {get_aspirine}.empty),
    eparacetamol = ({}.eparacetamol 
        + {get_paracetamol}.empty),
    eibuprofen = ({}.eibuprofen 
        + {get_ibuprofen}.empty),
    eth2 = ({}.eth2 
        + ?{hypertension},{},{}?.ehypertension),
	ehypertension = ({}.ehypertension 
        + {get_acediur}.empty 
        + {get_norvasc}.empty),
    empty = {}.empty,
	kheadache = ({headache}.empty + {neg_headache}.empty),
    khypertension = ({hypertension}.empty  + {neg_hypertension}.empty),
    kpregnant = ({pregnant}.empty + {neg_pregnant}.empty),
    kasthma = ({asthma}.empty + {neg_asthma}.empty)
    ]").


myexperiment([10,10],[[a,b],[a]]).

myassert("-{c} inW").

mybhml("<-{c} inW>[-{c} inW]<-{c} inW>true").


