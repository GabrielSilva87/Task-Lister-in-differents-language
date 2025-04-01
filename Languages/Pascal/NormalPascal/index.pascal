program ListadorDeTarefas;

uses crt;

const
  MAX_TAREFAS = 100;

type
  Tarefa = record
    descricao: string[100];
    concluida: boolean;
  end;

var
  tarefas: array[1..MAX_TAREFAS] of Tarefa;
  totalTarefas: integer;

procedure AdicionarTarefa(descricao: string);
begin
  if totalTarefas < MAX_TAREFAS then
  begin
    totalTarefas := totalTarefas + 1;
    tarefas[totalTarefas].descricao := descricao;
    tarefas[totalTarefas].concluida := false;
    writeln('Tarefa adicionada: ', descricao);
  end
  else
    writeln('Limite de tarefas atingido.');
end;

procedure RemoverTarefa(indice: integer);
begin
  if (indice > 0) and (indice <= totalTarefas) then
  begin
    tarefas[indice] := tarefas[totalTarefas]; // Substitui a tarefa removida pela última
    totalTarefas := totalTarefas - 1;
    writeln('Tarefa removida com sucesso.');
  end
  else
    writeln('Índice inválido.');
end;

procedure ListarTarefas;
var
  i: integer;
begin
  if totalTarefas = 0 then
  begin
    writeln('Nenhuma tarefa cadastrada.');
    exit;
  end;

  writeln('Lista de Tarefas:');
  for i := 1 to totalTarefas do
  begin
    writeln(i, ': ', tarefas[i].descricao, ' [', IfThen(tarefas[i].concluida, 'Concluída', 'Pendente'), ']');
  end;
end;

var
  opcao: integer;
  descricao: string;
  indice: integer;

begin
  totalTarefas := 0;
  repeat
    writeln('Menu:');
    writeln('1. Adicionar Tarefa');
    writeln('2. Remover Tarefa');
    writeln('3. Listar Tarefas');
    writeln('0. Sair');
    write('Escolha uma opção: ');
    readln(opcao);

    case opcao of
      1: begin
           write('Digite a descrição da tarefa: ');
           readln(descricao);
           AdicionarTarefa(descricao);
         end;
      2: begin
           write('Digite o índice da tarefa a ser removida: ');
           readln(indice);
           RemoverTarefa(indice);
         end;
      3: ListarTarefas;
      0: writeln('Saindo...');
    else
      writeln('Opção inválida. Tente novamente.');
    end;
    writeln;
  until opcao = 0;
end.