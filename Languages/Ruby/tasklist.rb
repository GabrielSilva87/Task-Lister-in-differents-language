class TaskList
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
    puts "Tarefa adicionada: '#{task}'"
  end

  def list_tasks
    if @tasks.empty?
      puts "Nenhuma tarefa cadastrada."
    else
      puts "Tarefas:"
      @tasks.each_with_index do |task, index|
        puts "#{index + 1}: #{task}"
      end
    end
  end

  def remove_task(index)
    if index.between?(1, @tasks.length)
      removed_task = @tasks.delete_at(index - 1)
      puts "Tarefa removida: '#{removed_task}'"
    else
      puts "Índice inválido."
    end
  end
end

def menu
  puts "\nListador de Tarefas"
  puts "1. Adicionar tarefa"
  puts "2. Listar tarefas"
  puts "3. Remover tarefa"
  puts "4. Sair"
  print "Escolha uma opção: "
end

task_list = TaskList.new

loop do
  menu
  option = gets.chomp.to_i

  case option
  when 1
    print "Digite a descrição da tarefa: "
    task = gets.chomp
    task_list.add_task(task)
  when 2
    task_list.list_tasks
  when 3
    task_list.list_tasks
    print "Digite o número da tarefa a ser removida: "
    index = gets.chomp.to_i
    task_list.remove_task(index)
  when 4
    puts "Saindo..."
    break
  else
    puts "Opção inválida. Tente novamente."
  end
end