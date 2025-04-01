(ns todo-app.core
  (:require [seesaw.core :as ss]))

(def tasks (atom []))

(defn update-list [listbox]
  (ss/config! listbox :model (into-array String @tasks)))

(defn add-task [task listbox]
  (swap! tasks conj task)
  (update-list listbox))

(defn remove-task [listbox]
  (when (seq @tasks)
    (swap! tasks pop)
    (update-list listbox)))

(defn main []
  (let [frame (ss/frame :title "Listador de Tarefas"
                        :content (ss/v-box
                                   :items [(ss/text-field :id :task-input)
                                           (ss/button :text "Adicionar"
                                                      :listen [:action
                                                               (fn [_]
                                                                 (add-task (ss/text (ss/select frame [:task-input])) (ss/select frame [:task-list]))))]
                                           (ss/button :text "Remover"
                                                      :listen [:action
                                                               (fn [_]
                                                                 (remove-task (ss/select frame [:task-list])))]
                                           (ss/listbox :id :task-list)])]
        ]
    (ss/show! frame)))

(main)