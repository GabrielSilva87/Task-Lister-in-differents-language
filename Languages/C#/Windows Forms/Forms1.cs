using System;
using System.Windows.Forms;

namespace ListadorDeTarefas
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

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
    }
}