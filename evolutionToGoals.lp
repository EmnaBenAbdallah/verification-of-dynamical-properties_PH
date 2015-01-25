%L'évolution exacte pour verifier les goals (le nombre minimal et fini)
#base.

%initialisation de l’état initial; les process actifs à l'état (t=0)
instate(F,0) :- init(F).

%t indique le numero d’état qui correspond aux actions joués durant l'évolution du réseau
#cumulative t.

%Les actions jouables dans l'état actuel, t commence à partir de 1 c'est pourquoi on diminue de 1 pour avoir le zero (etat initial)
actionJouable(A,I,B,J,K,t-1) :- action(A,I,B,J,K), instate(actifProcess(B,J),t-1), instate(actifProcess(A,I),t-1).

%Liste des process qui peuvent etre actifs dans l'état suivant
{activeFromTo(B,J,K,t-1)} :- actionJouable(A,I,B,J,K,t-1), instate(actifProcess(B,J),t-1), instate(actifProcess(A,I),t-1), J!=K . 

%avoir un et un seul changement dans chaque prochain état
:- 2{ activeFromTo(B,J,K,t-1)}.
:- 0{ activeFromTo(B,J,K,t-1)}0.

%Les process actifs dans l'état suivant: celui changé et les inchangés
instate(actifProcess(B,K),t) :- activeFromTo(B,J,K,t-1).
instate(actifProcess(A,I),t) :- instate(actifProcess(A,I),t-1), activeFromTo(B,J,K,t-1), A!=B.

% " #volatile " déclare la prochaine partie comme une requête en fonction du nombre de pas t, mais ne s'accumule pas sur les étapes successives
#volatile t.

%éliminer les réponses qui ne satisfont pas les goals, les process cibles sont actifs
notSatisfaible(t) :- goal(F), not instate(F,t).
:- notSatisfaible(t).

#base.
#hide.
#show activeFromTo/4.
