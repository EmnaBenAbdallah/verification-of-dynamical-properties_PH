%L'évolution exacte pour verifier les goals (le nombre minimal et fini)
% Iterative evolution of the system and simultanious verification of the reachability property (number of steps is minimal)
#base.

% Initialization of the first step; active processes at TS=0
instate(F,0) :- init(F).

% t is the number of the current step
#cumulative t.

% Playable actions at each step t. t starts from 1
playableAction(A,I,B,J,K,t-1) :- action(A,I,B,J,K), instate(actifProcess(B,J),t-1), instate(actifProcess(A,I),t-1).

%Liste des process qui peuvent etre actifs dans l'état suivant
{activeFromTo(B,J,K,t-1)} :- playableAction(A,I,B,J,K,t-1), instate(actifProcess(B,J),t-1), instate(actifProcess(A,I),t-1), J!=K .

% Constraints allowing only one change at each step (asynchronous)
:- 2{ activeFromTo(B,J,K,t-1)}.
:- 0{ activeFromTo(B,J,K,t-1)}0.

% Computing the next state : list of actif processes (changed one and all no changed ones)
instate(actifProcess(B,K),t) :- activeFromTo(B,J,K,t-1).
instate(actifProcess(A,I),t) :- instate(actifProcess(A,I),t-1), activeFromTo(B,J,K,t-1), A!=B.

% " #volatile " declares the next part as a request based on the number of steps t, but does not accumulate on the successive steps
#volatile t.

% Eliminate the answers were some goals are not reached
notSatisfaible(t) :- goal(F), not instate(F,t).
:- notSatisfaible(t).

#base.
#hide.
#show activeFromTo/4.
