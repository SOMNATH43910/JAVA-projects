import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SmartHomeController {

    private static boolean lightStatus = false;  // false = off, true = on
    private static int thermostatTemperature = 20; // default temperature

    public static void main(String[] args) {
        // Create frame
        JFrame frame = new JFrame("Smart Home Controller");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 200);
        frame.setLayout(new GridLayout(3, 2));

        // Create components
        JLabel lightLabel = new JLabel("Light:");
        JButton lightButton = new JButton("Turn On");

        JLabel thermostatLabel = new JLabel("Thermostat Temperature:");
        JTextField thermostatField = new JTextField(String.valueOf(thermostatTemperature));
        JButton setTemperatureButton = new JButton("Set Temperature");

        // Add components to frame
        frame.add(lightLabel);
        frame.add(lightButton);
        frame.add(thermostatLabel);
        frame.add(thermostatField);
        frame.add(setTemperatureButton);

        // Add action listeners
        lightButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                lightStatus = !lightStatus;
                lightButton.setText(lightStatus ? "Turn Off" : "Turn On");
                JOptionPane.showMessageDialog(frame, "Light is " + (lightStatus ? "On" : "Off"));
            }
        });

        setTemperatureButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    thermostatTemperature = Integer.parseInt(thermostatField.getText());
                    JOptionPane.showMessageDialog(frame, "Thermostat set to " + thermostatTemperature + "°C");
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(frame, "Please enter a valid temperature");
                }
            }
        });

        // Make the frame visible
        frame.setVisible(true);
    }
}
