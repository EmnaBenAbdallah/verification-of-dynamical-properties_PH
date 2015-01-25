# verification-of-dynamical-properties_PH

#### Installation from sources

##### Compilation requirements
  
  - [Clasp](http://sourceforge.net/projects/potassco/files/clasp/) is an answer set solver.
  
  - [Gringo](http://sourceforge.net/projects/potassco/files/gringo/) Version 3 
  It is a grounder. From a given input program with first-order variables, it computes an equivalent ground (variable-free) program
  
  #OR
  
  - [Clingo](http://sourceforge.net/projects/potassco/files/clingo/) Version 3
  It combines both gringo and clasp into a monolithic system.

##Attention! 
The languages of Gringo 3 and 4 are not fully compatible because Gringo 4 adheres to the recent ASP language standard. For processing legacy encodings, we recommend downloading the latest version of Gringo 3 in addition to Gringo 4.

INSTRUCTIONS FOR 

Copy scripts and examples folder to your home directory.

Using Terminal, you can execute command-line 

	$ clingo <name-of-script>.lp <name-of-network>.lp

for the script "evolutionToGoals.lp" you have to use the iterative version of clingo :

	$ iclingo <name-of-script>.lp <name-of-network>.lp

