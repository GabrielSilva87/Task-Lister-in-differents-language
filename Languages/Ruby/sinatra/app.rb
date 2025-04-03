require 'sinatra'
require 'json'

set :tasks, []

get '/' do
  erb :index
end

post '/add' do
  task = params[:task]
  settings.tasks << task unless task.empty?
  redirect '/'
end

post '/remove' do
  task = params[:task]
  settings.tasks.delete(task)
  redirect '/'
end

get '/tasks' do
  content_type :json
  settings.tasks.to_json
end

__END__

@@index
<!DOCTYPE html>
<html>
<head>
  <title>Listador de Tarefas</title>
</head>
<body>
  <h1>Listador de Tarefas</h1>
  <form action="/add" method="post">
    <input type="text" name="task" placeholder="Digite a tarefa" required>
    <input type="submit" value="Adicionar Tarefa">
  </form>
  <h3>Tarefas:</h3>
  <ul>
    <% settings.tasks.each do |task| %>
      <li>
        <%= task %>
        <form action="/remove" method="post" style="display:inline;">
          <input type="hidden" name="task" value="<%= task %>">
          <input type="submit" value="Remover">
        </form>
      </li>
    <% end %>
  </ul>
</body>
</html>