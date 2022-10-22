open Sqlite3

(* you can change name of database but for now call test.db *)
let conn: db = db_open "test.db";;

(* curd api *)
type query
  = Create
  | Update
  | Read
  | Delete
;;

(* pass something like Insert [structured data] *)
(* create table with name _ and values _ *)
(* all values can be passed as implicit? *)
(* TODO creation *)
(*
let create (table_name: string) (values: string list) = 
  "CREATE TABLE " ^ table_name ^ "(...)"
;;: string
*)

let show (r: row) _ =
  Array.iter (fun x -> match x with
  | Some x -> print_string (x ^ "|")
  | None -> print_string "") r;
  print_endline ""
;;

let read_all (table_name: string): unit = 
  let q = "SELECT * FROM " ^ table_name ^ ";" in
  match exec conn q ~cb:show with
    | Rc.ERROR -> print_endline "there has been a massive fatal error"
    | _ -> print_endline "success"
;;

let read_cond (table_name: string) (condition: string): unit =
  let q = "SELECT * FROM " ^ table_name ^ " WHERE " ^ condition ^ ";" in
  match exec conn q with
    | Rc.ERROR -> print_endline "there has been a massive fatal error"
    | _ -> print_endline "success"
;;

(* TODO complete this update function *)
let update (table_name: string) (new_values: string list) (condition: string option): unit =
  match condition with
  | Some condition ->
      print_string condition
  | None ->
      print_string table_name; List.iter (print_string) new_values
;;











