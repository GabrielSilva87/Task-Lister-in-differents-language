(defparameter *tarefas* '() "Lista de tarefas.")

(defun adicionar-tarefa (tarefa)
  (push tarefa *tarefas*)
  (format t "Tarefa '~A' adicionada.~%" tarefa))

(defun listar-tarefas ()
  (if (null *tarefas*)
      (format t "Nenhuma tarefa encontrada.~%")
      (progn
        (format t "Tarefas:~%")
        (loop for tarefa in *tarefas*
              do (format t "- ~A~%" tarefa)))))

(defun remover-tarefa (tarefa)
  (if (member tarefa *tarefas*)
      (progn
        (setf *tarefas* (remove tarefa *tarefas*))
        (format t "Tarefa '~A' removida.~%" tarefa))
      (format t "Tarefa '~A' não encontrada.~%" tarefa)))

(defun menu ()
  (loop
    (format t "Escolha uma opção:~%")
    (format t "1. Adicionar tarefa~%")
    (format t "2. Listar tarefas~%")
    (format t "3. Remover tarefa~%")
    (format t "4. Sair~%")
    (let ((opcao (read)))
      (cond
        ((= opcao 1)
         (format t "Digite a tarefa: ")
         (let ((tarefa (read-line)))
           (adicionar-tarefa tarefa)))
        ((= opcao 2)
         (listar-tarefas))
        ((= opcao 3)
         (format t "Digite a tarefa a remover: ")
         (let ((tarefa (read-line)))
           (remover-tarefa tarefa)))
        ((= opcao 4)
         (format t "Saindo...~%")
         (return))
        (t (format t "Opção inválida. Tente novamente.~%"))))))

(defun iniciar ()
  (menu))

(iniciar)