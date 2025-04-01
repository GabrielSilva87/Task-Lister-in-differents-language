procedure TForm1.ButtonRemoveClick(Sender: TObject);
begin
  if ListBoxTasks.ItemIndex <> -1 then
  begin
    ListBoxTasks.Items.Delete(ListBoxTasks.ItemIndex);
  end;
end;