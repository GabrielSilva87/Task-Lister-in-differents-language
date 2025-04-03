defmodule ListadorTarefasGUI do
  use Wx

  def start do
    :wx.new()
    frame = Wx.Frame.new(nil, title: "Listador de Tarefas", size: {400, 300})

    panel = Wx.Panel.new(frame)
    vbox = Wx.BoxSizer.new(:vertical)

    @task_input = Wx.TextCtrl.new(panel, style: wxTE_PROCESS_ENTER)
    add_button = Wx.Button.new(panel, label: "Adicionar")
    list_box = Wx.ListBox.new(panel)

    add_button_event = fn _ ->
      task = Wx.TextCtrl.get_value(@task_input)
      if task != "" do
        Wx.ListBox.append(list_box, task)
        Wx.TextCtrl.set_value(@task_input, "")
      end
    end

    Wx.EvtButton.connect(add_button, wxEVT_COMMAND_BUTTON_CLICKED, add_button_event)

    vbox.add(@task_input, 0, wxEXPAND | wxALL, 5)
    vbox.add(add_button, 0, wxALIGN_CENTER | wxALL, 5)
    vbox.add(list_box, 1, wxEXPAND | wxALL, 5)

    Wx.Panel.set_sizer(panel, vbox)
    Wx.Frame.show(frame)
    :wx.get_app().main_loop()
  end
end