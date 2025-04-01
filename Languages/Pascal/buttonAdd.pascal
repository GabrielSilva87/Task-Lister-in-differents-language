procedure TForm1.ButtonAddClick(Sender: TObject);
begin
  if EditTask.Text <> '' then
  begin
    ListBoxTasks.Items.Add(EditTask.Text);
    EditTask.Clear;
  end;
end;