pkg load gui;

function listador_tarefas()
    f = figure('Position', [300, 300, 400, 300], 'MenuBar', 'none', 'Name', 'Listador de Tarefas', 'NumberTitle', 'off', 'Resize', 'off');
    task_panel = uipanel('Parent', f, 'Position', [0.1, 0.2, 0.8, 0.7]);
    task_list = uicontrol('Style', 'listbox', 'Parent', task_panel, 'Position', [10, 10, 360, 150], 'String', {}, 'Max', 2);
    task_input = uicontrol('Style', 'edit', 'Parent', f, 'Position', [10, 220, 280, 30]);
    add_button = uicontrol('Style', 'pushbutton', 'Parent', f, 'Position', [300, 220, 70, 30], 'String', 'Adicionar', 'Callback', @(src, event) add_task(task_input, task_list));
    remove_button = uicontrol('Style', 'pushbutton', 'Parent', f, 'Position', [10, 260, 70, 30], 'String', 'Remover', 'Callback', @(src, event) remove_task(task_list));
    exit_button = uicontrol('Style', 'pushbutton', 'Parent', f, 'Position', [300, 260, 70, 30], 'String', 'Sair', 'Callback', @(src, event) close(f));
end

function add_task(task_input, task_list)
    new_task = get(task_input, 'String');
    if ~isempty(new_task)
        current_tasks = get(task_list, 'String');
        set(task_list, 'String', [current_tasks; {new_task}]);
        set(task_input, 'String', '');
    end
end

function remove_task(task_list)
    selected_index = get(task_list, 'Value');
    current_tasks = get(task_list, 'String');
    if ~isempty(current_tasks) && selected_index > 0
        current_tasks(selected_index) = [];
        set(task_list, 'String', current_tasks);
        if selected_index > length(current_tasks)
            set(task_list, 'Value', length(current_tasks));
        end
    end
end

listador_tarefas();