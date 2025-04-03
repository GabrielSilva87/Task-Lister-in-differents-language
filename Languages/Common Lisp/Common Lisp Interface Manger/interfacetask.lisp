(ql:quickload "bodge-ui-window")

(defpackage :task-list-gui
  (:use :cl :bodge-ui :bodge-host))

(in-package :task-list-gui)

(defparameter *tarefas* '() "Lista de tarefas.")

(defun adicionar-tarefa (tarefa)
  (push tarefa *tarefas*)
  (format t "Tarefa '~A' adicionada.~%" tarefa))

(defun listar-tarefas ()
  (if (null *tarefas)
      (with-output-to-string (stream)
        (format stream "Tarefas:~%")
        (loop for tarefa in *tarefas*
              do (format stream "- ~A~%" tarefa)))))

(defun remover-tarefa (tarefa)
  (if (member tarefa *tarefas*)
      (progn
        (setf *tarefas* (remove tarefa *tarefas*))
        (format t "Tarefa '~A' removida.~%" tarefa))
      (format t "Tarefa '~A' não encontrada.~%" tarefa)))

(defpanel (main-panel
  (:title "Listador de Tarefas")
  (:origin 200 50)
  (:width 400) (:height 300)
  (:options :movable :resizable :closable))
  
  (label :text "Digite a tarefa:")
  (defparameter *tarefa-input* (text-input :width 300))
  
  (button :label "Adicionar"
          :action (lambda ()
                    (adicionar-tarefa (bodge-ui:attribute *tarefa-input* :text))
                    (setf (bodge-ui:attribute *tarefa-input* :text) "")))
  
  (button :label "Listar"
          :action (lambda ()
                    (let ((tarefas (listar-tarefas)))
                      (bodge-ui:message "Tarefas" tarefas))))
  
  (button :label "Remover"
          :action (lambda ()
                    (remover-tarefa (bodge-ui:attribute *tarefa-input* :text))
                    (setf (bodge-ui:attribute *tarefa-input* :text) ""))))

(defclass main-window (bodge-ui-window:ui-window) ()
  (:default-initargs
   :title "Listador de Tarefas"
   :width 400
   :height 300
   :panels '(main-panel)
   :floating t))

(defun run ()
  (bodge-host:open-window (make-instance 'main-window)))

(run)
