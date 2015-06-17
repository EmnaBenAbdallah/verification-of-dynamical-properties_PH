%/**
  % * Reachability verfication of components states with an iterative evolution of the system. Finding the shortest path to reach the goals
  % */

% *******************
% Base part
% *******************

    % inchangeable part
        #base.

    %------------
    % FACTS
    %------------

    % Initialization of the first step; active processes at T=0
        instate(F,0) :- init(F).

% *******************
% Cumulative part
% *******************

    % Cumulative part with t is the number of the steps. This part will be executed for each t untill verification of the reachablity of the goals
    #cumulative t.

    %-------------
    % Evolution predicates
    %-------------

    % @brief: is true if there is playable actions at that step T
    % playableAction(Sort, Process, Sort, Process, Process, Time)
    % {
        playableAction(A,I,B,J,K,t-1) :- action(A,I,B,J,K), instate(actifProcess(B,J),t-1), instate(actifProcess(A,I),t-1).
    % }

    % @brief: is true if the corresponding sort can change from one level to another at the next step
    % activeFromTo(Sort, Process, Process, Time)
    % {
        {activeFromTo(B,J,K,t-1)} :- playableAction(A,I,B,J,K,t-1), instate(actifProcess(B,J),t-1), instate(actifProcess(A,I),t-1), J!=K .
    
    % @brief: is true if the the sort change the level at the next step
    % instate(actifProcess(Sort, Process), Time)
    % {
        instate(actifProcess(B,K),t) :- activeFromTo(B,J,K,t-1).
    % }
    
    % @brief: is true if the the sort does not change the level at the next step
    % instate(actifProcess(Sort, Process), Time)
    % {
        instate(actifProcess(A,I),t) :- instate(actifProcess(A,I),t-1), activeFromTo(B,J,K,t-1), A!=B.
        
    % }
    
    %------------
    % Constraints
    %------------
    
    % @brief: Almost one change from one step to another (asynchronous)
    %
    % {
        :- 2{ activeFromTo(B,J,K,t-1)}.
        :- 0{ activeFromTo(B,J,K,t-1)}0.
    % }
    
% *******************
% Volatile part
% *******************
    
    % " #volatile " declares the next part as a request based on the number of steps t, but does not accumulate on the successive steps
        
        #volatile t.
    
    % @brief: is true if the the goal is reached
    % notSatisfaible(Time)
    % {
        notSatisfaible(t) :- goal(F), not instate(F,t).
    % }
    
    %------------
    % Verification constraints
    %------------
    
    % @brief: All goals should be reached
    %
    % {
        :- notSatisfaible(t).
    % }
    
% *******************
% Output
% *******************
    
    % @brief: Get all changes that constitute the path to reach the goals
        #base.
        #hide.
        #show activeFromTo/4.