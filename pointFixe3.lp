%Get the fix point of PH (du reseau directement)
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

%eliminer les solutions ayant des process séléctionnés avec une action entre eux
:- 1{action(A,I,B,J,K)}, fixProcess(A,I), fixProcess(B,J),A!=B.


%Commande à éxécuter: 
%
% clingo 0 reseauPH.lp pointFixe3.lp
%
% Comparer à la commande du fichier PH:
%
% ph-stable -i <fichier.ph>
% Le nombre de solution
% ph-stable -i <fichier.ph>| wc -l





