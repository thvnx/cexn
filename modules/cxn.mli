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

(** Complex number of expansions components. Real and imaginary expansions are
    sorted in order of {b increasing} magnitude, except that any of the component
    may be zero. *)
type cexpansion = { re : Exn.expansion; im : Exn.expansion }

val grow_expansion : cexpansion -> Complex.t -> cexpansion
val expansion_sum : cexpansion -> cexpansion -> cexpansion