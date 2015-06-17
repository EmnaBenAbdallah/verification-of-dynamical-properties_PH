%/**
  % * Reachability verfication of components states after a known steps number
  % */

%------------
% FACTS
%------------

    %Maximum number of the steps
        time(0..25).

    % Initialization of the first step; active processes at T=0
        instate(F,0) :- init(F).

%-------------
% Evolution predicates
%-------------

    % @brief: is true if there is playable actions at that step T
    % playableAction(Sort, Process, Sort, Process, Process, Time)
    % {
        playableAction(A,I,B,J,K,TS) :- action(A,I,B,J,K), instate(actifProcess(B,J),TS), instate(actifProcess(A,I),TS),time(TS).
    % }

    % @brief: is true if the corresponding sort can change from one level to another at the next step
    % activeFromTo(Sort, Process, Process, Time)
    % {
        {actifFromTo(B,J,K,TS)} :- playableActipn(A,I,B,J,K,TS), instate(actifProcess(B,J),TS), instate(actifProcess(A,I),TS), J!=K, time(TS).
    % }

    % @brief: is true if the the sort change the level at the next step
    % instate(actifProcess(Sort, Process), Time)
    % {
        instate(actifProcess(B,K),TS+1) :- actifFromTo(B,J,K,TS), time(TS).
    % }

    % @brief: is true if the the sort does not change the level at the next step
    % instate(actifProcess(Sort, Process), Time)
    % {
        instate(actifProcess(A,I),TS+1) :- instate(actifProcess(A,I),TS), actifFromTo(B,J,K,TS), A!=B, time(TS+1).
    % }

%-------------
% Verfication predicates
%-------------

    % @brief: is true if the the goal is reached
    % satisfaible(actifProcess(Sort, Process), Time)
    % {
        satisfaible(F,TS) :- goal(F), instate(F,TS).
    % }

    % @brief: is true if all goals are reached at the same step
    % satisfaibleTot(Time)
    % {
        getNbreGoals(X) :-X={ goal(_) }.
        satisfaibleTot(TS+1) :- X={ satisfaible(F,TS+1):goal(F) },getNbreGoals(Y), X=Y, time(TS).
        satisfaibleTot :- satisfaibleTot(TS).
    % }

%------------
% Constraints
%------------

    % @brief: Almost one change from one step to another (asynchronous)
    %
    % {
        :- 2{ actifFromTo(B,J,K,T)}, time(T).
        %:- 0{ activeFromTo(B,J,K,T)}0, time(T).
    % }

    % @brief: All goals should be reached
    %
    % {
        :- not satisfaibleTot.
    % }

%------------
% Output
%------------

    % @brief: Get all changes that constitute the path to reach the goals

        #hide.
        #show activeFromTo/4.

    % DEBUG
        #show satisfaibleTot/1.

