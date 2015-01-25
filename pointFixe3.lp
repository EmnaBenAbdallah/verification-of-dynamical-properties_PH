%Get the fix point of PH (du réseau directement)
#hide.
#show fixProcess/2.
#show noFixPoint/1.

%définir les sortes du fichier PH
sort(X) :- process(X,I).

%cacher les process ayant des auto-frappes
hiddenProcess(A,I) :- action(A,I,B,J,K), A=B ,process(A,I), process(B,J), process(B,K).

%Les process à montrer
showProcess(A,I) :- not hiddenProcess(A,I),process(A,I).

%avoir un seul process de chaque sort
1 { fixProcess(A,I) : showProcess(A,I) } 1 :- sort(A).

%éliminer les solutions ayant des process selectionnés avec une action entre eux
:- 1{action(A,I,B,J,K)}, fixProcess(A,I), fixProcess(B,J),A!=B.







