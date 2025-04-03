defmodule ListadorTarefas do
  def start do
    loop([])
  end

  defp loop(tarefas) do
    IO.puts("Escolha uma opção:")
    IO.puts("1. Adicionar tarefa")
    IO.puts("2. Listar tarefas")
    IO.puts("3. Remover tarefa")
    IO.puts("4. Sair")

    case IO.gets("> ") |> String.trim() do
      "1" -> 
        tarefas = adicionar_tarefa(tarefas)
        loop(tarefas)

      "2" -> 
        listar_tarefas(tarefas)
        loop(tarefas)

      "3" -> 
        tarefas = remover_tarefa(tarefas)
        loop(tarefas)

      "4" -> 
        IO.puts("Saindo...")
      
      _ -> 
        IO.puts("Opção inválida. Tente novamente.")
        loop(tarefas)
    end
  end

  defp adicionar_tarefa(tarefas) do
    IO.puts("Digite a tarefa:")
    tarefa = IO.gets("> ") |> String.trim()
    [tarefa | tarefas]
  end

  defp listar_tarefas(tarefas) do
    if tarefas == [] do
      IO.puts("Nenhuma tarefa encontrada.")
    else
      IO.puts("Tarefas:")
      Enum.each(tarefas, &IO.puts("- #{&1}"))
    end
  end

  defp remover_tarefa(tarefas) do
    IO.puts("Digite a tarefa a remover:")
    tarefa_remover = IO.gets("> ") |> String.trim()

    if tarefa_remover in tarefas do
      tarefas -- [tarefa_remover]
      IO.puts("Tarefa '#{tarefa_remover}' removida.")
    else
      IO.puts("Tarefa '#{tarefa_remover}' não encontrada.")
    end

    tarefas
  end
end