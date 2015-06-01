% System evolution after a known number of steps fixed in the predicate "time", and verification of the reachability of the goals

time(0..26).

% Initialization of the first step; active processes at TS=0
instate(F,0) :- init(F).

% Playable actions at each step. The number of the step is represented by "TS"
playableAction(A,I,B,J,K,TS) :- action(A,I,B,J,K), instate(actifProcess(B,J),TS), instate(actifProcess(A,I),TS),time(TS).

% List of processes that can be active at the next step
{activeFromTo(B,J,K,TS)} :- playableAction(A,I,B,J,K,TS), instate(actifProcess(B,J),TS), instate(actifProcess(A,I),TS), J!=K, time(TS).

% Constraints allowing only one change at each step (asynchronous)
:- 2{ activeFromTo(B,J,K,TS)}, time(TS).
%:- 0{ activeFromTo(B,J,K,TS)}0, time(TS).

% Computing the next state : list of actif processes (changed one and all no changed ones)
instate(actifProcess(B,K),TS+1) :- activeFromTo(B,J,K,TS), time(TS).
instate(actifProcess(A,I),TS+1) :- instate(actifProcess(A,I),TS), activeFromTo(B,J,K,TS), A!=B, time(TS+1).

% Verify if the goal is active at one step
satisfaible(F,TS) :- goal(F), instate(F,TS).

% Verify if all the goals are active at the same step
getNbreGoals(X) :-X={ goal(_) }.
satisfaibleTot(TS+1) :- X={ satisfaible(F,TS+1):goal(F) },getNbreGoals(Y), X=Y, time(TS).

% If all the goals are reached at the same step
satisfaibleTot :- satisfaibleTot(TS).

% Eliminate the answers were some goals are not reached
:- not satisfaibleTot.

#hide.
#show activeFromTo/4.
#show satisfaibleTot/1.

