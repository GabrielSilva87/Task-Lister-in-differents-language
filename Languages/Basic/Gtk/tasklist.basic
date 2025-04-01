#Include "gtk/gtk.bi"

Dim As GtkWidget Ptr window, vbox, entry, button, listbox
Dim As GtkListStore Ptr store
Dim As GtkTreeIter iter

Sub on_button_clicked(widget As GtkWidget, data As gpointer)
    Dim As String tarefa
    tarefa = gtk_entry_get_text(GTK_ENTRY(entry))
    
    If tarefa <> "" Then
        gtk_list_store_append(store, @iter)
        gtk_list_store_set(store, @iter, 0, tarefa, -1)
        gtk_entry_set_text(GTK_ENTRY(entry), "")
    End If
End Sub

Sub on_destroy(widget As GtkWidget, data As gpointer)
    gtk_main_quit()
End Sub

gtk_init(0, 0)

window = gtk_window_new(GTK_WINDOW_TOPLEVEL)
gtk_window_set_title(GTK_WINDOW(window), "Listador de Tarefas")
g_signal_connect(window, "destroy", G_CALLBACK(@on_destroy), 0)

vbox = gtk_vbox_new(FALSE, 5)
gtk_container_add(GTK_CONTAINER(window), vbox)

entry = gtk_entry_new()
gtk_box_pack_start(GTK_BOX(vbox), entry, FALSE, FALSE, 0)

button = gtk_button_new_with_label("Adicionar Tarefa")
g_signal_connect(button, "clicked", G_CALLBACK(@on_button_clicked), 0)
gtk_box_pack_start(GTK_BOX(vbox), button, FALSE, FALSE, 0)

store = gtk_list_store_new(1, GTK_TYPE_STRING)
listbox = gtk_tree_view_new_with_model(GTK_TREE_MODEL(store))
Dim As GtkCellRendererPtr renderer
renderer = gtk_cell_renderer_text_new()
gtk_tree_view_insert_column_with_attributes(GTK_TREE_VIEW(listbox), -1, "Tarefas", renderer, "text", 0, NULL)
gtk_box_pack_start(GTK_BOX(vbox), listbox, TRUE, TRUE, 0)

gtk_widget_show_all(window)
gtk_main()