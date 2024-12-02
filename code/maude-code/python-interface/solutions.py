"""
Listing the paths leading to a solution for the (foxp3, gata3, tbet) state

TODO: Write a minimal command line interface
"""
import maude

def printPath(fpath):
    path = fpath()
    i = 1
    for x in path:
        if isinstance(x, maude.Term):
            tsol = tuple(x.arguments())
            if len(tsol) == 4:
                _,tin,tout,tctx = tsol
                print(f'({tin}) -> ({tout}) [ctx: ({tctx})`]')




maude.init()
maude.load('../example.maude')
modsys = maude.getModule('MySystem')
tinit = modsys.parseTerm('init')
tpattern = modsys.parseTerm('< proc: P:Process  ; input: IN:SetEntity ; output:  OUT:SetEntity ; context: C:SetEntity >  ')
ttrue = modsys.parseTerm('true')

tcondition = maude.EqualityCondition(modsys.parseTerm('(foxp3, gata3, tbet) subset OUT:SetEntity') , ttrue)


searchresult = tinit.search(maude.ANY_STEPS, tpattern,  condition = [tcondition])
nsol = 1
for x in searchresult : 
    #if nsol > 10:
    #    break

    print(f'Solution {nsol}')
    tsol, subst, fpath, steps = x
    tprog, tin, tout, tcontext = tuple(tsol.arguments())
    #print(tout)
    printPath(fpath)
    nsol += 1




#maude.ANY_STEPS
