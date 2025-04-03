-module(listador_tarefas).
-export([start/0, init/0, add_task/1, remove_task/1]).

start() ->
    wx:new(),
    Frame = wxFrame:new(wx:null(), -1, "Listador de Tarefas", wxDefaultPosition, {400, 300}),
    Panel = wxPanel:new(Frame),
    VBox = wxBoxSizer:new(wxVERTICAL),

    TaskInput = wxTextCtrl:new(Panel, wxID_ANY, "", wxDefaultPosition, {300, -1}),
    AddButton = wxButton:new(Panel, wxID_ANY, "Adicionar"),
    TaskList = wxListBox:new(Panel, wxID_ANY, wxDefaultPosition, {300, 200}),

    wxSizer:add(VBox, TaskInput, 0, wxEXPAND || wxALL, 5),
    wxSizer:add(VBox, AddButton, 0, wxALIGN_CENTER || wxALL, 5),
    wxSizer:add(VBox, TaskList, 1, wxEXPAND || wxALL, 5),

    wxPanel:setSizer(Panel, VBox),
    wxFrame:show(Frame),

    wxButton:connect(AddButton, wxEVT_COMMAND_BUTTON_CLICKED, fun() -> add_task(TaskInput, TaskList) end),
    wx:getApp():mainLoop().

add_task(TaskInput, TaskList) ->
    Task = wxTextCtrl:getValue(TaskInput),
    if
        Task =/= "" ->
            wxListBox:append(TaskList, Task),
            wxTextCtrl:setValue(TaskInput, "")
        ;
        true ->
            ok
    end.
