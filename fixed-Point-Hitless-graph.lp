% This program permits to get the fix point of a PH network (from the corresponding hitless graph)

% Define the sorts of PH network
sort(X) :- process(X,I).

% The hits of the actions
hit(A,I,B,J) :- action(A,I,B,J,B,K).

% Hide the processes with self-hits
hiddenProcess(A,I) :- action(A,I,B,J,B,K), A=B ,process(A,I), process(B,J), process(B,K).

% The shown processes
showProcess(A,I) :- not hiddenProcess(A,I),process(A,I).

% Construction of the hitless graph: if there is no action between 2 processes, rely them
noAction(B,J,A,I) :- not hit(A,I,B,J),not hit(B,J,A,I), A!=B, showProcess(A,I), showProcess(B,J).

% Select one process from each sort
1 { selectProcess(A,I) : showProcess(A,I) } 1 :- sort(A).

%avoir les  hit (les nofrappes) seulement ceux qui lient les process séléctionnés (1 de chaque sort)
% "nofrappe" is only between 2 selected processes
nofrappe(A,I,B,J) :-  noAction(A,I,B,J),selectProcess(A,I),selectProcess(B,J),A!=B.

% Eliminate the answer with selected processes and having an action between them
:- 0{nofrappe(A,I,B,J)}0, selectProcess(A,I), selectProcess(B,J),A!=B.

% The processes of the fixed point
fixProcess(A,I) :- selectProcess(A,I).

#hide.
#show fixProcess/2.




