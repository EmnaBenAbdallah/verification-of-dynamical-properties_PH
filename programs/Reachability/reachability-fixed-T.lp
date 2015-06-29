%/**
  % * Reachability verfication of components states after a known steps number
  % */

%------------
% FACTS
%------------

    %Maximum number of the steps
        time(0..20).

    % Initialization of the first step; active processes at T=0
        instate(F,0) :- init(F).

%-------------
% Evolution predicates
%-------------

    % @brief: is true if there is playable actions at that step T
    % playableAction(action(Sort, Process, Sort, Process, Process), Time)
    % {
	playable(action(A,I,B,J,K),T) :- action(A,I,B,J,K), instate(actifProcess(B,J),T), instate(actifProcess(A,I),T), J!=K, time(T).
    % }

    % @brief: is true if the corresponding sort can change from one level to another at the next step
    % activeFromTo(Sort, Process, Process, Time)
    % {
	0{play(A,T)}1 :- playable(A,T), time(T).
    % }

    % @brief: is true if the corresponding sort can change from one level to another at the next step
    % change(Sort, Time)
    % {
	change(B,T+1) :- play(action(_,_,B,J,K),T), time(T).
    % }

   % @brief: is true if there is a possible change at the next step
    % change(Time)
    % {
	change(T) :- change(_,T), time(T).
    % }

   % @brief: is true if there is no possible change at the next step
    % noChange(Time)
    % {
	noChange(T) :- not change(T), time(T).
    % }

    % @brief: is true if the sort change the level at the next step
    % instate(actifProcess(Sort, Process), Time)
    % {
	instate(actifProcess(B,K),T+1) :- play(action(_,_,B,_,K),T), time(T).
    % }
    
    % @brief: is true if the sort does not change the level at the next step
    % instate(actifProcess(Sort, Process), Time)
    % {
	instate(actifProcess(B,K),T+1) :- not change(B,T+1), instate(actifProcess(B,K),T), time(T).
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
        :- 2{play(A,T)}, time(T).
	:- 0{play(A,T)}0, time(T).
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

        #show play/2.
	#show change/2.	

    % DEBUG
        #show satisfaibleTot/1.
