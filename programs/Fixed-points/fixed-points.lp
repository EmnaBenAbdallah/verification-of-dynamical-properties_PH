%/**
% * fixed points saerching: Infering a Process Hitting network by searching the fixed points
% */

%------------
% FACTS
%------------

    % Define the sorts of PH network
    sort(Sort) :- process(Sort,Process).

%------------
% Predicates
%------------

    % @brief: is true if a process has a self-action so it should be hidden
    % hiddenProcess(Sort, Process)
    % {
        hiddenProcess(Sort,Process) :- action(Sort,Process,Sort_,Process_,K), Sort=Sort_ ,process(Sort,Process), process(Sort_,Process_), process(Sort_,Process_).
    % }

    % @brief: is true if a process is not a hidden process
    % shownProcess(Sort, Process)
    % {
        shownProcess(Sort,Process) :- not hiddenProcess(Sort,Process), process(Sort,Process).
    % }

    % @brief: is true if it  is possible to select only one process from the shown processes of one Sort. It constitues a candidate for the processes of the searching fixed points
    % fixProcess(Sort, Process)
    % {
        1 { fixProcess(Sort,Process) : shownProcess(Sort,Process) } 1 :- sort(Sort).
    % }

%------------
% Constraints
%------------

    % @brief: there is no action between selected processes
    %
    % {
        :- 1 {action(Sort,Process,Sort_,Process_,K)}, fixProcess(Sort,Process), fixProcess(Sort_,Process_), Sort!=Sort_.
    % }

%------------
% Output
%------------

    % @brief: all selected processes corresponding to each fixed point
    #hide.
    #show fixProcess/2.




