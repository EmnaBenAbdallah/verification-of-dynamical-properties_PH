%This program permits to get the fix point of a PH network

% Define the sorts of PH network
sort(X) :- process(X,I).

% Hide the processes with self-hits
hiddenProcess(A,I) :- action(A,I,B,J,K), A=B ,process(A,I), process(B,J), process(B,K).

% The shown processes
showProcess(A,I) :- not hiddenProcess(A,I),process(A,I).

% Select one process from each sort
1 { fixProcess(A,I) : showProcess(A,I) } 1 :- sort(A).

% Eliminate the answer with selected processes and having an action between them
:- 1{action(A,I,B,J,K)}, fixProcess(A,I), fixProcess(B,J),A!=B.

#hide.
#show fixProcess/2.




