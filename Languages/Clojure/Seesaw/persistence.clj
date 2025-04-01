(ns todo-app.core
  (:require [seesaw.core :as ss]
            [clojure.java.io :as io]))

(def tasks (atom []))

(defn load-tasks []
  (when (.exists (io/file "tarefas.txt"))
    (with-open [rdr (io/reader "tarefas.txt")]
      (reset! tasks (vec (line-seq rdr)))))

(defn save-tasks []
  (with-open [wrtr (io/writer "tarefas.txt")]
    (doseq [task @tasks]
      (.write wrtr (str task "\n")))))

(defn update-list [listbox]
  (ss/config! listbox :model (into-array String @tasks)))

(defn add-task [task listbox]
  (swap! tasks conj task)
  (save-tasks)
  (update-list listbox))

(defn remove-task [listbox]
  (when (seq @tasks)
    (swap! tasks pop)
    (save-tasks)
    (update-list listbox)))

(defn main []
  (load-tasks)
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