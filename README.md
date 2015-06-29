# verification-of-dynamical-properties_PH

#### Compilation requirements
  
  - [Clasp](http://sourceforge.net/projects/potassco/files/clasp/) is an answer set solver.
  
  - [Gringo](http://sourceforge.net/projects/potassco/files/gringo/) Version 4.
  It is a grounder. From a given input program with first-order variables, it computes an equivalent ground (variable-free) program
  
  ##### OR
  
  - [Clingo](http://sourceforge.net/projects/potassco/files/clingo/) Version 4.
  It combines both gringo and clasp into a monolithic system.

INSTRUCTIONS FOR EXECUTING

Copy scripts and examples folder to your home directory.

Using Terminal, you can execute command-line 

	$ ./clingo <name-of-script>.lp <name-of-network>.lp

for the script "evolutionToGoals.lp" you have to use the iterative version of clingo :

	$ ./clingo reachability-iterative.lp incmode-int.lp <name-of-network>.lp
