       IDENTIFICATION DIVISION.
       PROGRAM-ID. SimpleGUI.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. GnuCOBOL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  window-handle    POINTER.
       01  button-handle    POINTER.

       PROCEDURE DIVISION.
           CALL 'gtk_init' USING 0, 0.

           CALL 'gtk_window_new' USING 'GTK_WINDOW_TOPLEVEL'
              RETURNING window-handle.

           CALL 'gtk_window_set_title' USING window-handle, "Meu Programa COBOL".
           CALL 'gtk_window_set_default_size' USING window-handle, 300, 200.

           CALL 'gtk_button_new_with_label' USING "Clique Aqui"
              RETURNING button-handle.

           CALL 'gtk_container_add' USING window-handle, button-handle.
           
           CALL 'g_signal_connect' USING window-handle, "destroy", "gtk_main_quit".
           CALL 'g_signal_connect' USING button-handle, "clicked", "on_button_click".

           CALL 'gtk_widget_show_all' USING window-handle.
           CALL 'gtk_main'.

           STOP RUN.

       PROCEDURE DIVISION.
       on_button_click.
           DISPLAY "Botão clicado!".
           EXIT PROGRAM.