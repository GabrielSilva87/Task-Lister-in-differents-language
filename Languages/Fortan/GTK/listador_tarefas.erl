program listador_tarefas_gui
    use iso_c_binding
    implicit none

    interface
        subroutine gtk_init(argc, argv) bind(C, name="gtk_init")
            import :: iso_c_binding
            integer(c_int) :: argc
            type(c_ptr) :: argv
        end subroutine gtk_init

        function gtk_window_new(type) bind(C, name="gtk_window_new")
            import :: iso_c_binding
            integer(c_int) :: type
            type(c_ptr) :: gtk_window_new
        end function gtk_window_new

        subroutine gtk_widget_show(widget) bind(C, name="gtk_widget_show")
            import :: iso_c_binding
            type(c_ptr) :: widget
        end subroutine gtk_widget_show

        subroutine gtk_main() bind(C, name="gtk_main")
        end subroutine gtk_main

        subroutine gtk_main_quit() bind(C, name="gtk_main_quit")
        end subroutine gtk_main_quit

        subroutine gtk_button_new_with_label(label) bind(C, name="gtk_button_new_with_label")
            import :: iso_c_binding
            character(len=*) :: label
            type(c_ptr) :: gtk_button_new_with_label
        end subroutine gtk_button_new_with_label

        subroutine gtk_container_add(container, widget) bind(C, name="gtk_container_add")
            import :: iso_c_binding
            type(c_ptr) :: container, widget
        end subroutine gtk_container_add

        subroutine g_signal_connect(obj, signal, handler, data) bind(C, name="g_signal_connect")
            import :: iso_c_binding
            type(c_ptr) :: obj, signal, handler, data
        end subroutine g_signal_connect

        subroutine gtk_entry_get_text(entry, text) bind(C, name="gtk_entry_get_text")
            import :: iso_c_binding
            type(c_ptr) :: entry
            character(len=100) :: text
        end subroutine gtk_entry_get_text

        subroutine gtk_entry_set_text(entry, text) bind(C, name="gtk_entry_set_text")
            import :: iso_c_binding
            type(c_ptr) :: entry
            character(len=*) :: text
        end subroutine gtk_entry_set_text

        subroutine gtk_list_box_insert(listbox, widget, position) bind(C, name="gtk_list_box_insert")
            import :: iso_c_binding
            type(c_ptr) :: listbox, widget
            integer(c_int) :: position
        end subroutine gtk_list_box_insert
    end interface

    type(c_ptr) :: window, button, entry, listbox
    character(len=100) :: task
    integer :: argc
    type(c_ptr) :: argv

    argc = 0
    argv = c_null_ptr
    call gtk_init(argc, argv)

    window = gtk_window_new(0)
    call gtk_widget_show(window)

    entry = gtk_entry_new()
    button = gtk_button_new_with_label("Adicionar Tarefa")
    listbox = gtk_list_box_new()

    call gtk_container_add(window, entry)
    call gtk_container_add(window, button)
    call gtk_container_add(window, listbox)

    call g_signal_connect(button, "clicked", c_funloc(add_task), listbox)

    call gtk_widget_show_all(window)

    call gtk_main()

contains

    subroutine add_task(listbox)
        type(c_ptr) :: listbox
        character(len=100) :: task

        call gtk_entry_get_text(entry, task)
        call gtk_list_box_insert(listbox, task, -1)
        call gtk_entry_set_text(entry, "")
    end subroutine add_task

end program listador_tarefas_gui