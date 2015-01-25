%L'évolution du systéme aprés un nombre d'étapes fixé dans le predicat 'time' vérifiant les goals
time(0..26).

%initialistion de l'etat initial; les process actifs à l'état (t=0)
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
instate(actifProcess(A,I),TS+1) :- instate(actifProcess(A,I),TS), actifFromTo(B,J,K,TS), A!=B, time(TS+1).

%Vérifier si les process du goal sont actifs au meme instant aprés un certain nombre d'actions

satisfaible(F,TS) :- goal(F), instate(F,TS).

%il faut que tous les goals soient atteints 
getNbreGoals(X) :-X={ goal(_) }.
satisfaibleTot(TS+1) :- X={ satisfaible(F,TS+1):goal(F) },getNbreGoals(Y), X=Y, time(TS).

%Tous les goals sont satisfaits
satisfaibleTot :- satisfaibleTot(TS).

%éliminer les réponses qui ne satisfait pas tous les goals
:- not satisfaibleTot.

#hide.
#show actifFromTo/4.
#show satisfaibleTot/1.

