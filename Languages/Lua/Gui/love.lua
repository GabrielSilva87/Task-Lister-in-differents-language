local gui = require "love-ui"

local tasks = {}
local inputField

function love.load()
    love.window.setTitle("Listador de Tarefas")
    love.window.setMode(400, 300)

    inputField = gui.Input {
        x = 10,
        y = 10,
        width = 380,
        height = 30,
        placeholder = "Digite uma tarefa"
    }

    local addButton = gui.Button {
        x = 10,
        y = 50,
        width = 100,
        height = 30,
        text = "Adicionar",
        onClick = function()
            local task = inputField:getText()
            if task ~= "" then
                table.insert(tasks, task)
                inputField:setText("")
            end
        end
    }

    gui.add(inputField)
    gui.add(addButton)
end

function love.update(dt)
    gui.update(dt)
end

function love.draw()
    love.graphics.clear(0.1, 0.1, 0.1)
    gui.draw()

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Tarefas:", 10, 100)

    for i, task in ipairs(tasks) do
        love.graphics.print(i .. ": " .. task, 10, 100 + (i * 20))
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end