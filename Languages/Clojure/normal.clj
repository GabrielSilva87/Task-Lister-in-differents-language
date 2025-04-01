(ns normal.clj)

(defn adicionar-tarefa [lista tarefa]
  (conj lista tarefa))

(defn remover-tarefa [lista tarefa]
  (remove #(= % tarefa) lista))

(defn listar-tarefas [lista]
  (println "Tarefas:")
  (doseq [t lista]
    (println "- " t)))

(defn menu []
  (let [tarefas (atom [])]
    (loop []
      (println "\nMenu:")
      (println "1. Adicionar tarefa")
      (println "2. Remover tarefa")
      (println "3. Listar tarefas")
      (println "4. Sair")
      (let [opcao (read-line)]
        (cond
          (= opcao "1") (do
                          (println "Digite a tarefa:")
                          (let [tarefa (read-line)]
                            (swap! tarefas adicionar-tarefa tarefa))
                          (recur))

          (= opcao "2") (do
                          (println "Digite a tarefa a ser removida:")
                          (let [tarefa (read-line)]
                            (swap! tarefas remover-tarefa tarefa))
                          (recur))

          (= opcao "3") (do
                          (listar-tarefas @tarefas)
                          (recur))

          (= opcao "4") (println "Saindo...")

          :else (do
                  (println "Opção inválida.")
                  (recur)))))))

(defn -main []
  (menu))