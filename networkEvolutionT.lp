%L'évolution du système après un nombre d'étapes fixé dans le prédicat 'time'
time(0..18).

%initialisation de l’état initial; les process actifs à l'état (TS=0)
instate(F,0) :- init(F).

%Les actions jouables dans l'état actuel

playableAction(A,I,B,J,K,TS) :- action(A,I,B,J,K), instate(actifProcess(B,J),TS), instate(actifProcess(A,I),TS),time(TS).

%Liste des process qui peuvent être actifs dans l'état suivant
{activeFromTo(B,J,K,TS)} :- playableAction(A,I,B,J,K,TS), instate(actifProcess(B,J),TS), instate(actifProcess(A,I),TS), J!=K, time(TS). 

%avoir un et un seul changement dans chaque prochain état
:- 2{ activeFromTo(B,J,K,TS)}, time(TS).
%:- 0{ activeFromTo(B,J,K,TS)}0, time(TS).

%Les process actifs dans l'état suivant: celui changé et les inchangés
instate(actifProcess(B,K),TS+1) :- activeFromTo(B,J,K,TS), time(TS).
instate(actifProcess(A,I),TS+1) :- instate(actifProcess(A,I),TS), activeFromTo(B,J,K,TS), A!=B, time(TS).

#hide.
#show activeFromTo/4.
