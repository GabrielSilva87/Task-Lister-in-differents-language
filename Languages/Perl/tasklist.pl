use strict;
use warnings;

my @tarefas;

while (1) {
    print "\nListador de Tarefas\n";
    print "1. Adicionar tarefa\n";
    print "2. Listar tarefas\n";
    print "3. Remover tarefa\n";
    print "4. Sair\n";
    print "Escolha uma opção: ";

    my $opcao = <STDIN>;
    chomp($opcao);

    if ($opcao == 1) {
        print "Digite a descrição da tarefa: ";
        my $descricao = <STDIN>;
        chomp($descricao);
        push @tarefas, $descricao;
        print "Tarefa adicionada.\n";
    } elsif ($opcao == 2) {
        if (@tarefas) {
            print "Tarefas:\n";
            for my $i (0 .. $#tarefas) {
                print "$i: $tarefas[$i]\n";
            }
        } else {
            print "Nenhuma tarefa cadastrada.\n";
        }
    } elsif ($opcao == 3) {
        if (@tarefas) {
            print "Digite o número da tarefa a ser removida: ";
            my $indice = <STDIN>;
            chomp($indice);
            if ($indice >= 0 && $indice < @tarefas) {
                splice(@tarefas, $indice, 1);
                print "Tarefa removida.\n";
            } else {
                print "Índice inválido.\n";
            }
        } else {
            print "Nenhuma tarefa para remover.\n";
        }
    } elsif ($opcao == 4) {
        print "Saindo...\n";
        last;
    } else {
        print "Opção inválida. Tente novamente.\n";
    }
}