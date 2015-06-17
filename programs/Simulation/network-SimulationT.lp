%/**
% * Simulation of the Process Hitting network
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

%------------
% Constraints
%------------

    % @brief: Almost one change from one step to another (asynchronous)
    %
    % {
        :- 2{ actifFromTo(B,J,K,T)}, time(T).
        %:- 0{ activeFromTo(B,J,K,T)}0, time(T).
    % }

%------------
% Output
%------------

    % @brief: Get all changes that constitute the paths after N steps

        #hide.
        #show activeFromTo/4.
