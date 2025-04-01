local tasks = {}
local input = ""

function love.load()
    love.window.setTitle("Listador de Tarefas")
    love.window.setMode(400, 300)
end

function love.textinput(t)
    input = input .. t
end

function love.keypressed(key)
    if key == "return" then
        if input ~= "" then
            table.insert(tasks, input)
            input = ""
        end
    elseif key == "backspace" then
        input = input:sub(1, -2)
    end
end

function love.draw()
    love.graphics.clear(0.1, 0.1, 0.1)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Listador de Tarefas", 10, 10)
    love.graphics.print("Digite uma tarefa e pressione Enter:", 10, 40)
    love.graphics.print(input, 10, 70)

    for i, task in ipairs(tasks) do
        love.graphics.print(i .. ": " .. task, 10, 100 + (i - 1) * 30)
    end
end