(ns todo-app.core
  (:require [seesaw.core :as ss]))

(def tasks (atom []))

(defn add-task [task]
  (swap! tasks conj task)
  (ss/config! task-list :model (into-array String @tasks)))

(defn main []
  (let [frame (ss/frame :title "Listador de Tarefas"
                        :content (ss/v-box
                                   :items [(ss/text-field :id :task-input)
                                           (ss/button :text "Adicionar"
                                                      :listen [:action
                                                               (fn [_]
                                                                 (add-task (ss/text (ss/select frame [:task-input])))))]
                                           (ss/listbox :id :task-list)])]
        ]
    (ss/show! frame)))

(main)