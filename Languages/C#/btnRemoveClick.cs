private void btnRemove_Click(object sender, EventArgs e)
{
    if (lstTasks.SelectedItem != null)
    {
        lstTasks.Items.Remove(lstTasks.SelectedItem);
    }
    else
    {
        MessageBox.Show("Por favor, selecione uma tarefa para remover.", "Seleção Inválida", MessageBoxButtons.OK, MessageBoxIcon.Warning);
    }
}