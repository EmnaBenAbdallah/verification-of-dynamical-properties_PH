
(** Bibliothèque standard de Pint **)
open Ph_types;;

(** Fichier d'entrée = premier argument **)
let nom_fichier_entree = Array.get Sys.argv 1 ;;
let fichier_entree = open_in nom_fichier_entree ;;

(** Lecture du PH et stockage du modèle dans ph et de l'état initial dans ctx **)
let ph, ctx = Ph_util.parse fichier_entree ;;

(** Conversion **)
let asp_of_ph (ps, hits) =
  "% This file was generated from the PH model '" ^ nom_fichier_entree ^ "'\n"
  (*** Process ***)
  ^ "\n% Process\n"
  ^ (String.concat "" (List.map (fun sort -> 
        "process(\"" ^ (fst sort) ^ "\", 0.." ^ (string_of_int (snd sort)) ^ ").\n") ps))

  (*** Actions ***)
  ^ "\n% Actions\n"
  ^ Hashtbl.fold (fun target value buf -> let ((hit, _), bounce) = value in
      buf ^ ("action(\"" ^ (fst hit) ^ "\"," ^ (string_of_int (snd hit)) ^ "," ^
      "\"" ^ (fst target) ^ "\"," ^ (string_of_int (snd target)) ^ "," ^ (string_of_int bounce) ^
      ").\n")) hits ""

  ^ "\n% A MODIFIER \n"

 (*** initialisation des process actifs ***)
  ^ "\n% initialisation des process actifs\n"
  ^ (String.concat "" (List.map (fun sort -> 
        "init(actifProcess(\"" ^ (fst sort) ^ "\",0 )).\n") ps))

 (*** process goals ***)
  ^ "\n% Liste des process à atteindre \n"
  ^ (String.concat "" (List.map (fun sort -> 
        "%goal(actifProcess(\"" ^ (fst sort) ^ "\", xx )).\n") ps))
;;

(** Appel à la conversion **)
print_endline (asp_of_ph ph) ;;

