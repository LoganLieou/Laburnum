open Opium

let test_endpoint _req =
  Response.of_plain_text "Hello" |> Lwt.return
;;

let db_contents _req =
  Dblib.read_all "accounts";
  Response.of_plain_text "Check console for information" |> Lwt.return
;;

let () =
  print_endline ("Hosted on port: 4000 🚀!");
  App.empty
  |> App.port 4000
  |> App.middleware (Middleware.static_unix ~local_path:"./static" ~uri_prefix:"/static" ())
  |> App.get "/" test_endpoint
  |> App.get "/content" db_contents
  |> App.run_command
;;
