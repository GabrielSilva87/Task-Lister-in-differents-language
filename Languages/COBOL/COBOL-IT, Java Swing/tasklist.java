import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class CobolInterface {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Interface COBOL");
        JButton button = new JButton("Enviar");
        JTextField textField = new JTextField(20);
        JLabel label = new JLabel("Resultado:");

        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String input = textField.getText();
                // Aqui você chamaria a lógica COBOL
                label.setText("Resultado: " + processCobol(input));
            }
        });

        JPanel panel = new JPanel();
        panel.add(textField);
        panel.add(button);
        panel.add(label);

        frame.add(panel);
        frame.setSize(300, 150);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }

    private static String processCobol(String input) {
        // Lógica que chama o programa COBOL aqui
        return "Processado: " + input;  // Exemplo de retorno
    }
}