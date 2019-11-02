(* This file is part of mlexn.

   mlexn is free software: you can redistribute it and/or modify it under the
   terms of the GNU General Public License as published by the Free Software
   Foundation, either version 3 of the License, or (at your option) any later
   version.

   mlexn is distributed in the hope that it will be useful, but WITHOUT ANY
   WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
   FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
   details.

   You should have received a copy of the GNU General Public License along with
   mlexn.  If not, see <http://www.gnu.org/licenses/>. *)

(** Nonoverlapping expansion of float components sorted in order of {b
    increasing} magnitude, except that any of the component may be zero. *)
type expansion = float list

(** {2 Conversion functions} *)

(** Create an expansion of length one from a float. *)
val of_float : float -> expansion

(** Convert an expansion back to a float. The expansion is compressed,
    see {!val:compress}, then the most significant component is returned. *)
val to_float : expansion -> float

(** Convert to a string with component separator [sep] (default is [" "]). By
    default the expansion is [comp]ressed (see {!val:compress}). Components are
    printed in order of {b decreasing} magnitude. *)
val to_string : ?comp:bool -> ?sep:string -> expansion -> string

(** {2 Expansions} *)

(** Add a single float to an expansion. *)
val grow_expansion : expansion -> float -> expansion

(** Add an expansion to another one. *)
val expansion_sum : expansion -> expansion -> expansion

(** Add an expansion to another one. May be faster. *)
val fast_expansion_sum : expansion -> expansion -> expansion

(** Multiply an expansion by a float value. *)
val scale_expansion : expansion -> float -> expansion

(** Multiply two expansions. [expansion_product] uses {!val:scale_expansion} and
    a distillation tree. *)
val expansion_product : expansion -> expansion -> expansion

(** {2 Cleanup functions} *)

(** Eliminate zeros from one expansion. *)
val zero_elimination : expansion -> expansion

(** Find a compact form for an expansion. It guarantees that the largest
    component is a good approximation to the whole expansion. *)
val compress : expansion -> expansion
