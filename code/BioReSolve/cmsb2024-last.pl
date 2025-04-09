
myentities([]).
adventities(E) :- myentities(E). % an adversary with the same entities

myreactions([
	react([hyper],[],[hyper]),
	react([afib],[],[afib]),
	react([has_fib],[],[has_fib]),
	react([heart_rate],[],[heart_rate]),
	react([consensus_acei],[],[consensus_acei]),
    react([over75],[],[over75]),
    react([below55],[],[below55]),
    react([diabete],[],[diabete]),
    react([origin],[],[origin]),
	react([doac_int],[],[doac_int]),
	react([doac],[doac_ok,doac_fail],[doac_test]),
	react([doac_ok],[doac_fail],[doac_ok]),
	react([doac_fail],[doac_ok],[doac_fail]),	
	react([hyper],[],[diseases]),
	react([diabete],[],[diseases]),
    react([get_diltiazem],[stop_cbb],[diltiazem,cbb]),
    react([diltiazem],[stop_cbb],[diltiazem,cbb]),
    react([get_verapamil],[stop_cbb],[verapamil,cbb]),
    react([verapamil],[stop_cbb],[verapamil,cbb]),
    react([diltiazem,verapamil],[stop_cbb],[alert_dup]),
    react([get_propranolol],[stop_nsbb],[propranolol,nsbb]),
    react([propranolol],[stop_nsbb],[propranolol,nsbb]),
    react([get_carvedilol],[stop_nsbb],[carvedilol,nsbb]),
    react([carvedilol],[stop_nsbb],[carvedilol,nsbb]),
    react([propranolol,carvedilol],[stop_nsbb],[alert_dup]),
    react([get_bisoprolol],[stop_sbb],[bisoprolol,sbb]),
    react([bisoprolol],[stop_sbb],[bisoprolol,sbb]),
    react([get_atenolol],[stop_sbb],[atenolol,sbb]),    
    react([atenolol],[stop_sbb],[atenolol,sbb]),    
    react([bisoprolol,atenolol],[stop_sbb],[alert_dup]),
    react([get_flecainide],[stop_flec],[flecainide]),
    react([flecainide],[stop_flec],[flecainide]),
    react([get_warfarin],[stop_warf],[warfarin]),
    react([warfarin],[stop_warf],[warfarin]),
    react([get_apixaban],[stop_doac],[apixaban,doac]),
    react([apixaban],[stop_doac],[apixaban,doac]),
    react([get_dabigatran],[stop_doac],[dabigatran,doac]),
    react([dabigatran],[stop_doac],[dabigatran,doac]),
    react([apixaban,dabigatran],[stop_doac],[alert_dup]),
    react([get_vkant],[stop_vkant],[vkant]),
    react([vkant],[stop_vkant],[vkant]),
    react([get_benazepril],[stop_acei],[benazepril,acei]),
    react([benazepril],[stop_acei],[benazepril,acei]),
    react([get_captopril],[stop_acei],[captopril,acei]),
    react([captopril],[stop_acei],[captopril,acei]),
    react([benazepril,captopril],[stop_acei],[alert_dup]),
    react([get_olmesortan],[stop_arb],[olmesortan,arb]),
    react([olmesortan],[stop_arb],[olmesortan,arb]),
    react([get_irbesartan],[stop_arb],[irbesartan,arb]),
    react([irbesartan],[stop_arb],[irbesartan,arb]),
    react([olmesortan,irbesartan],[stop_arb],[alert_dup]),
    react([get_indapamide],[stop_td],[indapamide,td]), 
    react([indapamide],[stop_td],[indapamide,td]), 
    react([get_chlorothiazide],[stop_td],[chlorothiazide,td]), 
    react([chlorothiazide],[stop_td],[chlorothiazide,td]), 
    react([indapamide,chlorothiazide],[stop_td],[alert_dup]),
    react([doac,doac_fail],[stop_doac],[doac_danger]),
    react([doac,doac_danger],[stop_doac],[danger]),
    react([get_apixaban,get_diltiazem],[stop_doac],[col_moderate,moderate]),
    react([get_apixaban,diltiazem],[stop_doac],[col_moderate,moderate]),
    react([apixaban,get_diltiazem],[stop_doac],[col_moderate,moderate]),
    react([apixaban,diltiazem],[stop_doac],[col_moderate,moderate]),
    react([get_apixaban,get_verapamil],[stop_doac],[col_moderate,moderate]),
    react([get_apixaban,verapamil],[stop_doac],[col_moderate,moderate]),
    react([apixaban,get_verapamil],[stop_doac],[col_moderate,moderate]),
    react([apixaban,verapamil],[stop_doac],[col_moderate,moderate]),
    react([get_dabigatran,get_diltiazem],[stop_doac],[col_moderate,moderate]),
    react([get_dabigatran,diltiazem],[stop_doac],[col_moderate,moderate]),
    react([dabigatran,get_diltiazem],[stop_doac],[col_moderate,moderate]),
    react([dabigatran,diltiazem],[stop_doac],[col_moderate,moderate]),
    react([get_dabigatran,get_verapamil],[stop_doac],[col_major,major]),
    react([get_dabigatran,verapamil],[stop_doac],[col_major,major]),
    react([dabigatran,get_verapamil],[stop_doac],[col_major,major]),
    react([dabigatran,verapamil],[stop_doac],[col_major,major]),
    react([get_dabigatran,get_carvedilol],[stop_doac],[col_moderate,moderate]),
    react([get_dabigatran,carvedilol],[stop_doac],[col_moderate,moderate]),
    react([dabigatran,get_carvedilol],[stop_doac],[col_moderate,moderate]),
    react([dabigatran,carvedilol],[stop_doac],[col_moderate,moderate]),
    react([get_warfarin,get_benazepril],[],[col_minor,minor]),
    react([get_warfarin,benazepril],[],[col_minor,minor]),
    react([warfarin,get_benazepril],[],[col_minor,minor]),
    react([warfarin,benazepril],[],[col_minor,minor]),
    react([get_warfarin,get_indapamide],[],[col_minor,minor]),
    react([get_warfarin,indapamide],[],[col_minor,minor]),
    react([warfarin,get_indapamide],[],[col_minor,minor]),
    react([warfarin,indapamide],[],[col_minor,minor]),
    react([get_warfarin,get_chlorothiazide],[],[col_minor,minor]),
    react([get_warfarin,chlorothiazide],[],[col_minor,minor]),
    react([warfarin,get_chlorothiazide],[],[col_minor,minor]),
    react([warfarin,chlorothiazide],[],[col_minor,minor]),
    react([get_warfarin,get_propranolol],[],[col_minor,minor]),
    react([get_warfarin,propranolol],[],[col_minor,minor]),
    react([warfarin,get_propranolol],[],[col_minor,minor]),
    react([warfarin,propranolol],[],[col_minor,minor]),
    react([get_flecainide,get_diltiazem],[],[col_major,major]),
    react([get_flecainide,diltiazem],[],[col_major,major]),
    react([flecainide,get_diltiazem],[],[col_major,major]),
    react([flecainide,diltiazem],[],[col_major,major]),
    react([get_flecainide,get_verapamil],[],[col_major,major]),
    react([get_flecainide,verapamil],[],[col_major,major]),
    react([flecainide,get_verapamil],[],[col_major,major]),
    react([flecainide,verapamil],[],[col_major,major]),
    react([get_flecainide,get_bisoprolol],[],[moderate]),
    react([get_flecainide,bisoprolol],[],[col_moderate,moderate]),
    react([flecainide,get_bisoprolol],[],[col_moderate,moderate]),
    react([flecainide,bisoprolol],[],[col_moderate,moderate]),
    react([get_flecainide,get_atenolol],[],[col_moderate,moderate]),
    react([get_flecainide,atenolol],[],[col_moderate,moderate]),
    react([flecainide,get_atenolol],[],[col_moderate,moderate]),
    react([flecainide,atenolol],[],[col_moderate,moderate]),
    react([get_flecainide,get_propranolol],[],[col_moderate,moderate]),
    react([get_flecainide,propranolol],[],[col_moderate,moderate]),
    react([flecainide,get_propranolol],[],[col_moderate,moderate]),
    react([flecainide,propranolol],[],[col_moderate,moderate]),
    react([get_flecainide,get_carvedilol],[],[col_moderate,moderate]),
    react([get_flecainide,carvedilol],[],[col_moderate,moderate]),
    react([flecainide,get_carvedilol],[],[col_moderate,moderate]),
    react([flecainide,carvedilol],[],[col_moderate,moderate]),
    react([major],[],[major]),
    react([moderate],[],[moderate]),
    react([minor],[],[minor]),
    react([alert_dup],[],[alert_dup]),
    react([danger],[],[danger]),
    react([sync1],[],[sync1]),
    react([sync2],[],[sync2])
]).
advreactions(Rs) :- myreactions(Rs). % an adversary with the same reactions


mycontext("[eafib1,eafib2,eafib3,ghyper,kafib,khf,khr,kcons,kage,kdiabete,kdoacint,khyper,korigin,k_doac,ksync1,ksync2]").
advcontext(K) :- mycontext(K). % an adversary with the same reactions context

myenvironment("[
	eafib1 = (?{},{afib},{}?.eafib1 + ?{afib},{},{}?.ehr),
	ehr = (?{},{heart_rate},{}?.ehr
		+ ?{heart_rate},{},{}?.ebb),
	ebb = (?{},{sync1},{}?.ebb + e_cbb + e_nsbb + e_sbb),
	e_cbb = (?{},{verapamil},{get_diltiazem}?.empty + ?{},{diltiazem},{get_verapamil}?.empty),
	e_nsbb = (?{},{carvedilol},{get_propranolol}?.empty + ?{},{propranolol},{get_carvedilol}?.empty),
	e_sbb = (?{},{atenolol},{get_bisoprolol}?.empty + ?{},{bisoprolol},{get_atenolol}?.empty),
	eafib2 = (?{},{afib},{}?.eafib2 + ?{afib},{},{}?.ehf),
    ehf = (?{},{has_fib},{}?.ehf
    	+ ?{has_fib},{},{}?.eflec),
    eflec = (?{},{sync1},{}?.eflec + e_flec),
    e_flec = {get_flecainide}.empty,
	eafib3 = (?{},{afib},{}?.eafib3 + ?{afib},{},{}?.econs),
    econs = (?{},{heart_rate,has_fib},{}?.econs
        + ?{},{consensus_acei},{}?.econs
        + ?{consensus_acei,heart_rate},{},{}?.estroke
        + ?{consensus_acei,has_fib},{},{}?.estroke),
    estroke = (?{},{diseases,over75},{}?.ewarf
        + ?{over75},{doac_fail,doac_int},{}?.edoac
        + ?{diseases},{doac_fail,doac_int},{}?.edoac
        + ?{over75,doac_fail},{},{}?.evkant
        + ?{over75,doac_int},{},{}?.evkant
        + ?{diseases,doac_fail},{},{}?.evkant
        + ?{diseases,doac_int},{},{}?.evkant),
    ewarf = (?{},{sync1},{}?.ewarf + e_warf),
    e_warf = {get_warfarin}.empty,
    edoac = (?{},{sync1},{}?.edoac + e_doac),
    e_doac = (?{},{dabigatran},{get_apixaban}?.e_doacfail + ?{},{apixaban},{get_dabigatran}?.e_doacfail),
    e_doacfail = (?{doac_fail},{},{stop_doac}?.evkant
	              + ?{},{doac_fail},{}?.e_doacfail),
    evkant = (?{},{sync1},{}?.evkant + e_vkant),
    e_vkant = {get_vkant}.empty,	
    ghyper = (?{},{hyper},{}?.ghyper + ?{hyper},{},{}?.g1),
    g1 = (?{diabete},{},{}?.g2
    	+ ?{below55},{diabete,origin},{}?.g2
    	+ ?{},{below55,diabete},{}?.g3
    	+ ?{origin},{diabete},{}?.g3),
    g2 = (?{},{sync2},{}?.g2 + <1,e_acei>.g4 + <1,e_arb>.g5),
    g3 = (?{},{sync2},{}?.g3 + <1,e_cbb>.g6),
    g4 = (?{},{sync2},{}?.g4 + <1,e_cbb>.g7 + <1,e_td>.g8),
    g5 = (?{},{sync2},{}?.g5 + <1,e_cbb>.g9 + <1,e_td>.g10),
    g6 = (?{},{sync2},{}?.g6 + <1,e_acei>.g7 + <1,e_arb>.g9 + <1,e_td>.g11),
    g7 = (?{},{sync2},{}?.g7 + <1,e_arb>.etd + <1,e_td>.earb),
    g8 = (?{},{sync2},{}?.g8 + <1,e_arb>.ecbb + <1,e_cbb>.earb),
    g9 = (?{},{sync2},{}?.g9 + <1,e_acei>.etd + <1,e_td>.eacei),
    g10 = (?{},{sync2},{}?.g10 + <1,e_acei>.ecbb + <1,e_cbb>.eacei),
    g11 = (?{},{sync2},{}?.g11 + <1,e_acei>.earb + <1,e_arb>.eacei),
    ecbb = (?{},{sync2},{}?.ecbb + e_cbb),
    eacei = (?{},{sync2},{}?.eacei + e_acei),
    e_acei = (?{},{captopril},{get_benazepril}?.empty + ?{},{benazepril},{get_captopril}?.empty),
    earb = (?{},{sync2},{}?.earb + e_arb),
    e_arb = (?{},{irbesartan},{get_olmesortan}?.empty + ?{},{olmesortan},{get_irbesartan}?.empty),
    etd = (?{},{sync2},{}?.etd + e_td),
    e_td = (?{},{chlorothiazide},{get_indapamide}?.empty + ?{},{indapamide},{get_chlorothiazide}?.empty),
    k_doac = (?{doac_test},{},{doac_ok}?.empty
        + ?{doac_test},{},{doac_fail}?.empty
        + ?{},{doac_test},{}?.k_doac),
    empty = {}.empty,
    kafib = {afib}.empty,
    khf = {has_fib}.empty,
    khr = empty,
    kcons = empty,
    kage = {over75}.empty,
    kdiabete = {diabete}.empty,
    kdoacint = empty,
    khyper = {hyper}.empty,
    korigin = empty,
    ksync1 = empty,
    ksync2 = empty
    ]").


/* AFIB-HYP-4patients.dot (26 stati)
    kafib = {afib}.empty,
    khf = empty,
    khr = ({heart_rate}.empty + empty),
    kcons = empty,
    kage = {below55}.empty,
    kdiabete = ({diabete}.empty + empty),
    kdoacint = {doac_int}.empty,
    khyper = empty,
    korigin = empty,
*/

/* AFIB-HYP-SMALL-2.dot (10 states)
    kafib = {afib}.empty,
    khf = empty,
    khr = {heart_rate}.empty,
    kcons = empty,
    kage = {below55}.empty,
    kdiabete = empty,
    kdoacint = {doac_int}.empty,
    khyper = empty,
    korigin = empty,
*/

/* AFIB-HYP-SMALL-1.dot (141 states)
    kafib = {afib}.empty,
    khf = {has_fib}.empty,
    khr = empty,
    kcons = empty,
    kage = {over75}.empty,
    kdiabete = {diabete}.empty,
    kdoacint = empty,
    khyper = {hyper}.empty,
    korigin = empty,
*/

/* AFIB-HYP-YESall-over75.dot (1920 states)
    kafib = {afib}.empty,
    khf = {has_fib}.empty,
    khr = {heart_rate}.empty,
    kcons = {consensus_acei}.empty,
    kage = {over75}.empty,
    kdiabete = {diabete}.empty,
    kdoacint = {doac_int}.empty,
    khyper = {hyper}.empty,
    korigin = {origin}.empty,
*/

/* ALL PROFILES
    kafib = ({afib}.empty + empty),
    khf = ({has_fib}.empty + empty),
    khr = ({heart_rate}.empty + empty),
    kcons = ({consensus_acei}.empty + empty),
    kage = ({over75}.empty + {below55}.empty + empty),
    kdiabete = ({diabete}.empty + empty),
    kdoacint = ({doac_int}.empty + empty),
    khyper = ({hyper}.empty + empty),
    korigin = ({origin}.empty + empty),
*/


/* PATIENT Y
    kafib = {afib}.empty,
    khf = empty,
    khr = {heart_rate}.empty,
    kcons = {consensus_acei}.empty,
    kage = empty,
    kdiabete = empty,
    kdoacint = empty,
    khyper = {hyper}.empty,
    korigin = empty,
    ksync1 = {sync1}.empty,
    ksync2 = {sync2}.empty
*/

/* PATIENT X
    kafib = {afib}.empty,
    khf = empty,
    khr = {heart_rate}.empty,
    kcons = {consensus_acei}.empty,
    kage = {over75}.empty,
    kdiabete = {diabete}.empty,
    kdoacint = empty,
    khyper = {hyper}.empty,
    korigin = empty
    ksync1 = {sync1}.empty,
    ksync2 = empty
*/

/*
    kafib = ({afib}.empty + empty),
    khf = ({has_fib}.empty + empty),
    khr = ({heart_rate}.empty + empty),
    kcons = ({consensus_acei}.empty + empty),
    kage = ({over75}.empty + {below55}.empty + empty),
    kdiabete = ({diabete}.empty + empty),
    kdoacint = ({doac_int}.empty + empty),
    khyper = ({hyper}.empty + empty),
    korigin = ({origin}.empty + empty),
    ksync1 = ({sync1}.empty + empty),
    ksync2 = ({sync2}.empty + empty)
*/
myexperiment([10,10],[[a,b],[a]]).

myassert("-{c} inW").

mybhml("<-{c} inW>[-{c} inW]<-{c} inW>true").


