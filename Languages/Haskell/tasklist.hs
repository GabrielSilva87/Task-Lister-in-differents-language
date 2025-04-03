import System.IO

data Task = Task String deriving (Show)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn "Listador de Tarefas"
    loop []

loop :: [Task] -> IO ()
loop tasks = do
    putStrLn "\nEscolha uma opção:"
    putStrLn "1. Adicionar tarefa"
    putStrLn "2. Listar tarefas"
    putStrLn "3. Remover tarefa"
    putStrLn "4. Sair"
    choice <- getLine
    case choice of
        "1" -> do
            putStrLn "Digite a descrição da tarefa:"
            description <- getLine
            let newTask = Task description
            loop (newTask : tasks)
        "2" -> do
            putStrLn "Tarefas:"
            mapM_ (putStrLn . show) (zip [1..] tasks)
            loop tasks
        "3" -> do
            putStrLn "Digite o número da tarefa a ser removida:"
            indexStr <- getLine
            let index = read indexStr - 1
            if index >= 0 && index < length tasks
                then do
                    let updatedTasks = take index tasks ++ drop (index + 1) tasks
                    putStrLn "Tarefa removida."
                    loop updatedTasks
                else do
                    putStrLn "Índice inválido!"
                    loop tasks
        "4" -> putStrLn "Saindo..."
        _   -> do
            putStrLn "Opção inválida. Tente novamente."
            loop tasks