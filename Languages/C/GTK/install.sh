#!/bin/bash

echo "Atualizando a lista de pacotes..."
sudo apt-get update

echo "Instalando o GTK e o GCC..."
sudo apt-get install -y libgtk-3-dev gcc

cat << 'EOF' > task_list_gui.c
#include <gtk/gtk.h>

#define MAX_TASKS 100
#define TASK_LENGTH 256

char tasks[MAX_TASKS][TASK_LENGTH];
int task_count = 0;

void add_task(GtkWidget *widget, gpointer entry) {
    const gchar *task = gtk_entry_get_text(GTK_ENTRY(entry));
    if (task_count < MAX_TASKS) {
        strcpy(tasks[task_count], task);
        task_count++;
        gtk_entry_set_text(GTK_ENTRY(entry), "");
    }
}

void show_tasks(GtkWidget *widget, gpointer label) {
    gchar task_list[1024] = "Lista de Tarefas:\n";
    for (int i = 0; i < task_count; i++) {
        g_strlcat(task_list, tasks[i], sizeof(task_list));
        g_strlcat(task_list, "\n", sizeof(task_list));
    }
    gtk_label_set_text(GTK_LABEL(label), task_list);
}

int main(int argc, char *argv[]) {
    GtkWidget *window;
    GtkWidget *vbox;
    GtkWidget *entry;
    GtkWidget *add_button;
    GtkWidget *show_button;
    GtkWidget *label;

    gtk_init(&argc, &argv);

    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Listador de Tarefas");
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_container_add(GTK_CONTAINER(window), vbox);

    entry = gtk_entry_new();
    gtk_box_pack_start(GTK_BOX(vbox), entry, FALSE, FALSE, 0);

    add_button = gtk_button_new_with_label("Adicionar Tarefa");
    g_signal_connect(add_button, "clicked", G_CALLBACK(add_task), entry);
    gtk_box_pack_start(GTK_BOX(vbox), add_button, FALSE, FALSE, 0);

    show_button = gtk_button_new_with_label("Mostrar Tarefas");
    label = gtk_label_new("");
    g_signal_connect(show_button, "clicked", G_CALLBACK(show_tasks), label);
    gtk_box_pack_start(GTK_BOX(vbox), show_button, FALSE, FALSE, 0);
    gtk_box_pack_start(GTK_BOX(vbox), label, FALSE, FALSE, 0);

    gtk_widget_show_all(window);
    gtk_main();

    return 0;
}
EOF

echo "Compilando o programa..."
gcc `pkg-config --cflags gtk+-3.0` task_list_gui.c -o task_list_gui `pkg-config --libs gtk+-3.0`

echo "Instalação e compilação concluídas!"
echo "Você pode executar o programa com ./task_list_gui"