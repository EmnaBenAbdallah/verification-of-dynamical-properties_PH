%Get the fix point of PH (à partir du reseau sans frappe)
#hide.
#show fixProcess/2.

%définir les sortes du fichier PH
sort(X) :- process(X,I).

%les hits des actions
hit(A,I,B,J) :- action(A,I,B,J,B,K).

%cacher les process ayant des auto-frappes
hiddenProcess(A,I) :- action(A,I,B,J,B,K), A=B ,process(A,I), process(B,J), process(B,K).

%Les process à montrer
showProcess(A,I) :- not hiddenProcess(A,I),process(A,I).

%s'il n'existe pas de hit entre deux process alors on ajoute un nouveau arc entre eux pour le graphe sans frappe
noAction(B,J,A,I) :- not hit(A,I,B,J),not hit(B,J,A,I), A!=B, showProcess(A,I), showProcess(B,J).

%avoir un seul process de chaque sort
1 { selectProcess(A,I) : showProcess(A,I) } 1 :- sort(A).

%avoir les  hit (les nofrappes) seulement ceux qui lient les process séléctionnés (1 de chaque sort)
nofrappe(A,I,B,J) :-  noAction(A,I,B,J),selectProcess(A,I),selectProcess(B,J),A!=B.

%eliminer les solutions ayant des process séléctionnés avec une action entre eux cad aucune nofrappe
:- 0{nofrappe(A,I,B,J)}0, selectProcess(A,I), selectProcess(B,J),A!=B.

%les process du point fixe
fixProcess(A,I) :- selectProcess(A,I).





