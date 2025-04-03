program listador_tarefas
    implicit none
    integer :: opcao, i
    character(len=100) :: tarefas(100)
    integer :: num_tarefas

    num_tarefas = 0

    print *, "Bem-vindo ao Listador de Tarefas!"

    do
        print *, "Escolha uma opção:"
        print *, "1. Adicionar tarefa"
        print *, "2. Listar tarefas"
        print *, "3. Remover tarefa"
        print *, "4. Sair"
        read(*,*) opcao

        select case (opcao)
        case (1)
            if (num_tarefas < 100) then
                print *, "Digite a tarefa:"
                read(*,'(A)') tarefas(num_tarefas + 1)
                num_tarefas = num_tarefas + 1
            else
                print *, "Limite de tarefas atingido."
            end if
        case (2)
            if (num_tarefas == 0) then
                print *, "Nenhuma tarefa encontrada."
            else
                print *, "Tarefas:"
                do i = 1, num_tarefas
                    print *, "-", tarefas(i)
                end do
            end if
        case (3)
            if (num_tarefas == 0) then
                print *, "Nenhuma tarefa para remover."
            else
                print *, "Digite o número da tarefa a remover (1 a ", num_tarefas, "):"
                integer :: tarefa_remover
                read(*,*) tarefa_remover
                if (tarefa_remover >= 1 .and. tarefa_remover <= num_tarefas) then
                    do i = tarefa_remover, num_tarefas - 1
                        tarefas(i) = tarefas(i + 1)
                    end do
                    num_tarefas = num_tarefas - 1
                    print *, "Tarefa removida."
                else
                    print *, "Número da tarefa inválido."
                end if
            end if
        case (4)
            print *, "Saindo..."
            exit
        case default
            print *, "Opção inválida. Tente novamente."
        end select
    end do
end program listador_tarefas