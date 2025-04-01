private void btnAdd_Click(object sender, EventArgs e)
{
    string task = txtTask.Text.Trim();
    if (!string.IsNullOrEmpty(task))
    {
        lstTasks.Items.Add(task);
        txtTask.Clear();
    }
    else
    {
        MessageBox.Show("Por favor, digite uma tarefa válida.", "Tarefa Inválida", MessageBoxButtons.OK, MessageBoxIcon.Warning);
    }
}