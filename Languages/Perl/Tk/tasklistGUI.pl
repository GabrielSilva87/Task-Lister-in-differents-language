use strict;
use warnings;
use Tk;

my $mw = MainWindow->new;
$mw->title("Listador de Tarefas");

my @tarefas;

my $listbox = $mw->Listbox()->pack(-fill => 'both', -expand => 1);
my $entry = $mw->Entry()->pack(-fill => 'x');
my $add_button = $mw->Button(-text => "Adicionar", -command => \&adicionar_tarefa)->pack(-side => 'left');
my $remove_button = $mw->Button(-text => "Remover", -command => \&remover_tarefa)->pack(-side => 'left');
my $exit_button = $mw->Button(-text => "Sair", -command => sub { exit })->pack(-side => 'right');

sub adicionar_tarefa {
    my $descricao = $entry->get();
    if ($descricao) {
        push @tarefas, $descricao;
        atualizar_lista();
        $entry->delete(0, 'end');
    }
}

sub remover_tarefa {
    my $indice = $listbox->curselection();
    if (defined $indice) {
        splice @tarefas, $indice, 1;
        atualizar_lista();
    }
}

sub atualizar_lista {
    $listbox->delete(0, 'end');
    $listbox->insert('end', @tarefas);
}

MainLoop;