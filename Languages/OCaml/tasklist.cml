let salvar_tarefas (lista : lista_tarefas) (nome_arquivo : string) =
  let oc = open_out nome_arquivo in
  List.iter (fun tarefa ->
    Printf.fprintf oc "%s;%b\n" tarefa.descricao tarefa.concluida
  ) lista;
  close_out oc

let carregar_tarefas (nome_arquivo : string) : lista_tarefas =
  let ic = open_in nome_arquivo in
  let rec aux acc =
    try
      let linha = input_line ic in
      let partes = String.split_on_char ';' linha in
      let descricao = List.nth partes 0 in
      let concluida = bool_of_string (List.nth partes 1) in
      aux ({ descricao; concluida } :: acc)
    with End_of_file -> 
      close_in ic; List.rev acc
  in
  aux []

let rec menu (lista : lista_tarefas) =
  Printf.printf "\nListador de Tarefas\n";
  Printf.printf "1. Adicionar tarefa\n";
  Printf.printf "2. Listar tarefas\n";
  Printf.printf "3. Concluir tarefa\n";
  Printf.printf "4. Remover tarefa\n";
  Printf.printf "5. Salvar tarefas\n";
  Printf.printf "6. Carregar tarefas\n";
  Printf.printf "7. Sair\n";
  Printf.printf "Escolha uma opção: ";
  let opcao = read_int () in
  match opcao with
  | 1 ->
    Printf.printf "Digite a descrição da tarefa: ";
    let descricao = read_line () in
    let nova_lista = adicionar_tarefa descricao lista in
    menu nova_lista
  | 2 ->
    listar_tarefas lista;
    menu lista
  | 3 ->
    Printf.printf "Digite o número da tarefa a ser concluída: ";
    let indice = read_int () - 1 in
    let nova_lista = concluir_tarefa indice lista in
    menu nova_lista
  | 4 ->
    Printf.printf "Digite o número da tarefa a ser removida: ";
    let indice = read_int () - 1 in
    let nova_lista = remover_tarefa indice lista in
    menu nova_lista
  | 5 ->
    Printf.printf "Digite o nome do arquivo para salvar: ";
    let nome_arquivo = read_line () in
    salvar_tarefas lista nome_arquivo;
    Printf.printf "Tarefas salvas em %s\n" nome_arquivo;
    menu lista
  | 6 ->
    Printf.printf "Digite o nome do arquivo para carregar: ";
    let nome_arquivo = read_line () in
    let nova_lista = carregar_tarefas nome_arquivo in
    Printf.printf "Tarefas carregadas de %s\n" nome_arquivo;
    menu nova_lista
  | 7 -> Printf.printf "Saindo...\n"
  | _ ->
    Printf.printf "Opção inválida. Tente novamente.\n";
    menu lista

let () =
  let lista_inicial = [] in
  menu lista_inicial