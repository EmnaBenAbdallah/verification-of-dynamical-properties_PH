%L'évolution du systéme aprés un nombre d'étapes fixé dans le predicat 'time'
time(0..18).

%initialistion de l'etat initial; les process actifs à l'état (TS=0)
instate(F,0) :- init(F).

%Les actions jouables dans l'état actuel

actionJouable(A,I,B,J,K,TS) :- action(A,I,B,J,K), instate(actifProcess(B,J),TS), instate(actifProcess(A,I),TS),time(TS).

%Liste des process qui peuvent etre actifs dans l'état suivant
{actifFromTo(B,J,K,TS)} :- actionJouable(A,I,B,J,K,TS), instate(actifProcess(B,J),TS), instate(actifProcess(A,I),TS), J!=K, time(TS). 

%avoir un et un seul changement dans chaque prochain état
:- 2{ actifFromTo(B,J,K,TS)}, time(TS).
%:- 0{ actifFromTo(B,J,K,TS)}0, time(TS).

%Les process actifs dans l'état suivant: celui changé et les inchangés
instate(actifProcess(B,K),TS+1) :- actifFromTo(B,J,K,TS), time(TS).
instate(actifProcess(A,I),TS+1) :- instate(actifProcess(A,I),TS), actifFromTo(B,J,K,TS), A!=B, time(TS).

#hide.
#show actifFromTo/4.
