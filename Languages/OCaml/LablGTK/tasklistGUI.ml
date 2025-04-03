open GMain
open GdkKeysyms

type tarefa = {
  descricao : string;
  concluida : bool;
}

type lista_tarefas = tarefa list

let tarefas = ref []

let adicionar_tarefa descricao =
  tarefas := { descricao; concluida = false } :: !tarefas

let listar_tarefas text_view =
  let buffer = Text.buffer () in
  List.iter (fun tarefa ->
    let status = if tarefa.concluida then "[X] " else "[ ] " in
    Text.buffer_add_text buffer (status ^ tarefa.descricao ^ "\n")
  ) !tarefas;
  Text.view_set_buffer text_view buffer

let concluir_tarefa indice =
  if indice >= 0 && indice < List.length !tarefas then
    let tarefa = List.nth !tarefas indice in
    tarefas := List.mapi (fun i t -> if i = indice then { t with concluida = true } else t) !tarefas

let remover_tarefa indice =
  if indice >= 0 && indice < List.length !tarefas then
    tarefas := List.filteri (fun i _ -> i <> indice) !tarefas

let on_adicionar_button_clicked entry text_view =
  let descricao = Entry.get_text entry in
  if descricao <> "" then (
    adicionar_tarefa descricao;
    listar_tarefas text_view;
    Entry.set_text entry ""
  )

let on_concluir_button_clicked entry text_view =
  let indice = int_of_string (Entry.get_text entry) - 1 in
  concluir_tarefa indice;
  listar_tarefas text_view;
  Entry.set_text entry ""

let on_remover_button_clicked entry text_view =
  let indice = int_of_string (Entry.get_text entry) - 1 in
  remover_tarefa indice;
  listar_tarefas text_view;
  Entry.set_text entry ""

let main () =
  let _ = GMain.init () in
  let window = GWindow.window ~title:"Listador de Tarefas" ~border_width:10 () in
  let vbox = GPack.vbox ~packing:window#add () in

  let entry = GEdit.entry ~packing:vbox#pack () in
  let adicionar_button = GButton.button ~label:"Adicionar Tarefa" ~packing:vbox#pack () in
  let concluir_button = GButton.button ~label:"Concluir Tarefa" ~packing:vbox#pack () in
  let remover_button = GButton.button ~label:"Remover Tarefa" ~packing:vbox#pack () in
  let text_view = GText.view ~packing:vbox#pack () in

  adicionar_button#connect#clicked ~callback:(fun () -> on_adicionar_button_clicked entry text_view);
  concluir_button#connect#clicked ~callback:(fun () -> on_concluir_button_clicked entry text_view);
  remover_button#connect#clicked ~callback:(fun () -> on_remover_button_clicked entry text_view);

  window#connect#destroy ~callback:GMain.quit;
  window#show ();
  GMain.main ()

let () = main ()