%/**
  % * Reachability verfication of components states with an iterative evolution of the system. Finding the shortest path to reach the goals
% */

	#const istop  = "SAT".
	#const imin   = 1.
	#const imax   = 50.

% *******************
% Base part
% *******************

    % inchangeable part
	#program base.

    %------------
    % FACTS
    %------------

    % Initialization of the first step; active processes at T=0
        instate(F,0) :- init(F).

    % Computing the number of sorts in the system
	getNbreSorts(X) :- X={sort(_)}.

% *******************
% Cumulative part
% *******************

    % Cumulative part with t is the number of the steps. This part will be executed for each t untill verification of the reachablity of the goals
	#program step(t).

    %-------------
    % Evolution predicates
    %-------------

    % @brief: is true if there is playable actions at that step T
    % playableAction(action(Sort, Process, Sort, Process, Process), Time)
    % {
	playable(action(A,I,B,J,K),t-1) :- action(A,I,B,J,K), instate(actifProcess(B,J),t-1), instate(actifProcess(A,I),t-1), J!=K.
    % }

    % @brief: is true if the corresponding sort can change from one level to another at the next step
    % activeFromTo(Sort, Process, Process, Time)
    % {
	0{play(Action,t-1)}1 :- playable(Action,t-1).
    % }
    
    % @brief: is true if the corresponding sort can change from one level to another at the next step
    % change(Sort, Time)
    % {
	change(B,t) :- play(action(_,_,B,J,K),t-1).
    % }

   % @brief: is true if there is a possible change at the next step
    % change(Time)
    % {
	change(t) :- change(_,t).
    % }

   % @brief: is true if there is no possible change at the next step
    % noChange(Time)
    % {
	noChange(t) :- not change(t).
    % }

    % @brief: is true if the sort change the level at the next step
    % instate(actifProcess(Sort, Process), Time)
    % {
	instate(actifProcess(B,K),t) :- play(action(_,_,B,_,K),t-1).
    % }
    
    % @brief: is true if the sort does not change the level at the next step
    % instate(actifProcess(Sort, Process), Time)
    % {
	instate(actifProcess(B,K),t) :- not change(B,t), instate(actifProcess(B,K),t-1).
    % }

    % @brief: is true if the same state of the sort appear at the 2 times
    % repeter(actifProcess(Sort, Process), Time, Time)
    % {
	repeter(F,T,t) :- instate(F,T), instate(F,t), T<t, time(T).
    % }

    % @brief: computing the number of the sorts that have the same level at the 2 times
    % getNbreRepetition(Number, Time, Time)
    % {
	getNbreRepetition(X,T,t) :- X={repeter(F,T,t) }, time(T).
    % }

    % @brief: is true if the same state of the system appear at the 2 times
    % loop(Time, Time)
    % {
	loop(t, T) :- getNbreRepetition(X,T,t), getNbreSorts(Y), X=Y.
    % }

    % @brief: is true if there is a loop between 2 times
    % noChange(Time)
    % {
	noChange(t) :- loop(t, _).
    % }

    %------------
    % Constraints
    %------------
    
    % @brief: Almost one change from one step to another (asynchronous)
    %
    % {
        :- 2{play(Action,t-1)}.
	:- 0{play(Action,t-1)}0.
    % }
    
    % @brief: no loops on the same states
    %
    % {
        :- noChange(t).
    % }

% *******************
% Check part
% *******************
    
    % " check(t) " declares the next part as a request based on the number of steps t, but does not accumulate on the successive steps. In this part the program check the reachabilty property
        
	#program check(t).
    
    % @brief: is true if the the goal is reached
    % notReached(Time)
    % {
	notReached(t) :- goal(F), not instate(F,t).
    % }
    
    %------------
    % Verification constraints
    %------------
    
    % @brief: All goals should be reached
    %
    % {
	:- notReached(t), query(t).
    % }
    
% *******************
% Output
% *******************
    
    % @brief: Get all changes that constitute the path to reach the goals

	#show play/2.
	#show change/2.	