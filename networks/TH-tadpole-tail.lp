% This file was generated from the PH model 'TH-tadpole-tail.ph'

% Process
process("D2", 0..1).
process("D3", 0..1).
process("D3T3", 0..7).
process("EG", 0..1).
process("IG", 0..1).
process("LG", 0..1).
process("T3", 0..3).
process("T3TR", 0..7).
process("T4", 0..1).
process("T4D2", 0..3).
process("T4D3", 0..3).
process("TR", 0..1).

% Actions
action("D3",0,"D3T3",4,0).
action("T3",1,"D3T3",4,5).
action("T3",2,"D3T3",4,6).
action("T3",3,"D3T3",4,7).
action("D2",0,"T3",2,1).
action("T4",0,"T3",2,1).
action("T4D2",3,"T3",2,3).
action("D3T3",1,"T3",2,3).
action("D3T3",2,"T3",2,3).
action("D3T3",3,"T3",2,3).
action("D3T3",5,"T3",2,1).
action("D3T3",6,"T3",2,1).
action("D3T3",7,"T3",2,1).
action("LG",0,"TR",0,1).
action("T3",2,"TR",0,1).
action("T3",3,"TR",0,1).
action("T3",0,"IG",1,0).
action("T3",1,"T3TR",1,3).
action("T3",2,"T3TR",1,5).
action("T3",3,"T3TR",1,7).
action("TR",0,"T3TR",1,0).
action("D3",0,"D3T3",6,2).
action("T3",0,"D3T3",6,4).
action("T3",1,"D3T3",6,5).
action("T3",3,"D3T3",6,7).
action("T3",0,"T3TR",3,1).
action("T3",2,"T3TR",3,5).
action("T3",3,"T3TR",3,7).
action("TR",0,"T3TR",3,2).
action("LG",1,"D2",1,0).
action("IG",0,"D2",1,0).
action("EG",1,"D3",1,0).
action("T3",0,"D3",1,0).
action("T4",1,"T4D2",1,3).
action("D2",0,"T4D2",1,0).
action("T4",1,"T4D3",1,3).
action("D3",0,"T4D3",1,0).
action("T3",0,"T3TR",5,1).
action("T3",1,"T3TR",5,3).
action("T3",3,"T3TR",5,7).
action("TR",0,"T3TR",5,4).
action("D3",1,"D3T3",1,5).
action("T3",0,"D3T3",1,0).
action("T3",2,"D3T3",1,2).
action("T3",3,"D3T3",1,3).
action("T4",0,"T4D2",3,1).
action("D2",0,"T4D2",3,2).
action("T4",0,"T4D3",3,1).
action("D3",0,"T4D3",3,2).
action("D2",0,"T3",1,0).
action("T4",0,"T3",1,0).
action("T4D2",3,"T3",1,2).
action("D3T3",1,"T3",1,2).
action("D3T3",2,"T3",1,2).
action("D3T3",3,"T3",1,2).
action("D3T3",5,"T3",1,0).
action("D3T3",6,"T3",1,0).
action("D3T3",7,"T3",1,0).
action("T4D3",3,"T4",1,0).
action("T3",0,"T3TR",7,1).
action("T3",1,"T3TR",7,3).
action("T3",2,"T3TR",7,5).
action("TR",0,"T3TR",7,6).
action("D3",1,"D3T3",3,7).
action("T3",0,"D3T3",3,0).
action("T3",1,"D3T3",3,1).
action("T3",2,"D3T3",3,2).
action("T3",1,"IG",0,1).
action("T3",2,"IG",0,1).
action("T3",3,"IG",0,1).
action("TR",0,"LG",1,0).
action("T3",0,"LG",1,0).
action("T3",1,"LG",1,0).
action("T3",2,"LG",1,0).
action("T3",1,"T3TR",0,2).
action("T3",2,"T3TR",0,4).
action("T3",3,"T3TR",0,6).
action("TR",1,"T3TR",0,1).
action("T3",0,"EG",1,0).
action("T3",1,"EG",1,0).
action("D3",0,"D3T3",5,1).
action("T3",0,"D3T3",5,4).
action("T3",2,"D3T3",5,6).
action("T3",3,"D3T3",5,7).
action("D2",0,"T3",3,2).
action("T4",0,"T3",3,2).
action("D3T3",5,"T3",3,2).
action("D3T3",6,"T3",3,2).
action("D3T3",7,"T3",3,2).
action("LG",0,"D2",0,1).
action("IG",1,"D2",0,1).
action("T3",0,"T3TR",2,0).
action("T3",2,"T3TR",2,4).
action("T3",3,"T3TR",2,6).
action("TR",1,"T3TR",2,3).
action("EG",0,"D3",0,1).
action("T3",1,"D3",0,1).
action("T3",2,"D3",0,1).
action("T3",3,"D3",0,1).
action("LG",1,"TR",1,0).
action("T3",0,"TR",1,0).
action("T3",1,"TR",1,0).
action("T4",1,"T4D2",0,2).
action("D2",1,"T4D2",0,1).
action("D3",0,"D3T3",7,3).
action("T3",0,"D3T3",7,4).
action("T3",1,"D3T3",7,5).
action("T3",2,"D3T3",7,6).
action("T4",1,"T4D3",0,2).
action("D3",1,"T4D3",0,1).
action("T3",0,"T3TR",4,0).
action("T3",1,"T3TR",4,2).
action("T3",3,"T3TR",4,6).
action("TR",1,"T3TR",4,5).
action("D3",1,"D3T3",0,4).
action("T3",1,"D3T3",0,1).
action("T3",2,"D3T3",0,2).
action("T3",3,"D3T3",0,3).
action("T4",0,"T4D2",2,0).
action("D2",1,"T4D2",2,3).
action("T4",0,"T4D3",2,0).
action("D3",1,"T4D3",2,3).
action("T4D2",3,"T3",0,1).
action("D3T3",1,"T3",0,1).
action("D3T3",2,"T3",0,1).
action("D3T3",3,"T3",0,1).
action("D3",0,"T4",0,1).
action("T4",0,"T4",0,1).
action("T3",0,"T3TR",6,0).
action("T3",1,"T3TR",6,2).
action("T3",2,"T3TR",6,4).
action("TR",1,"T3TR",6,7).
action("T3TR",7,"LG",0,1).
action("D3",1,"D3T3",2,6).
action("T3",0,"D3T3",2,0).
action("T3",1,"D3T3",2,1).
action("T3",3,"D3T3",2,3).
action("T3",2,"EG",0,1).
action("T3",3,"EG",0,1).

% A MODIFIER 

% initialisation des process actifs
init(actifProcess("D2",0 )).
init(actifProcess("D3",1 )).
init(actifProcess("D3T3",4 )).
init(actifProcess("EG",0 )).
init(actifProcess("IG",0 )).
init(actifProcess("LG",0 )).
init(actifProcess("T3",0 )).
init(actifProcess("T3TR",0 )).
init(actifProcess("T4",0 )).
init(actifProcess("T4D2",0 )).
init(actifProcess("T4D3",1 )).
init(actifProcess("TR",0 )).

%% D2(1) D3(1) D3T3(7) EG(1) IG(1) LG(1) T3(3) T3TR(7) T4(1) T4D2(3) T4D3(3) TR(1)
%:- not eF(goal,"014000000010").
% (T4=0 & T3=0 & D2=0 & D3=1 & GI=0 & GP=0 & TR=0 & GT=0) 
% --> EF (T3=3 & T4=1 & D2=1 & D3=0 & GI=1 & GP=1 & TR=1 & GT=0) 

%T3 3 T4 1 D2 1 D3 0 IG 1 EG 1 TR 1
% Liste des process à atteindre 
goal(actifProcess("D2", 1 )).
goal(actifProcess("D3", 0 )).
goal(actifProcess("EG", 1 )).
goal(actifProcess("IG", 1 )).
goal(actifProcess("LG", 0 )).
goal(actifProcess("T3", 3 )).
goal(actifProcess("T4", 1 )).
goal(actifProcess("TR", 1 )).

%Path answer set:
%%actifFromTo("T4",0,1,0) actifFromTo("T4D2",0,2,1) actifFromTo("D2",0,1,2) actifFromTo("TR",0,1,3) actifFromTo("T4D2",2,3,4) actifFromTo("T3",0,1,5) actifFromTo("IG",0,1,6) actifFromTo("T3",1,2,7) actifFromTo("EG",0,1,8) actifFromTo("D3",1,0,9) actifFromTo("T3",2,3,10) 
%%

