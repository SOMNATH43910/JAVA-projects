import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.time.LocalTime;
import java.util.Timer;
import java.util.TimerTask;

public class CustomizableAlarmClock {
    private static LocalTime alarmTime;
    private static boolean snoozeEnabled = false;
    private static Timer timer = new Timer();
    private static String alarmSound = "Default Sound";

    public static void main(String[] args) {
        // Create frame
        JFrame frame = new JFrame("Customizable Alarm Clock");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 300);
        frame.setLayout(new GridLayout(5, 2));

        // Create components
        JLabel timeLabel = new JLabel("Set Alarm Time (HH:mm):");
        JTextField timeField = new JTextField("07:00");
        JLabel soundLabel = new JLabel("Choose Alarm Sound:");
        JComboBox<String> soundComboBox = new JComboBox<>(new String[]{"Default Sound", "Beep", "Melody"});
        JCheckBox snoozeCheckBox = new JCheckBox("Enable Snooze");
        JButton setAlarmButton = new JButton("Set Alarm");
        JLabel statusLabel = new JLabel("Alarm Status: Not Set");

        // Add components to frame
        frame.add(timeLabel);
        frame.add(timeField);
        frame.add(soundLabel);
        frame.add(soundComboBox);
        frame.add(snoozeCheckBox);
        frame.add(setAlarmButton);
        frame.add(new JLabel()); // Empty cell
        frame.add(statusLabel);

        // Add action listeners
        setAlarmButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    alarmTime = LocalTime.parse(timeField.getText());
                    alarmSound = (String) soundComboBox.getSelectedItem();
                    snoozeEnabled = snoozeCheckBox.isSelected();
                    statusLabel.setText("Alarm set for " + alarmTime.toString() + " with sound " + alarmSound);
                    startAlarmTimer();
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(frame, "Please enter a valid time in HH:mm format.");
                }
            }
        });

        // Make the frame visible
        frame.setVisible(true);
    }

    private static void startAlarmTimer() {
        timer.cancel();
        timer = new Timer();

        TimerTask alarmTask = new TimerTask() {
            @Override
            public void run() {
                if (LocalTime.now().equals(alarmTime)) {
                    playAlarmSound();
                    if (snoozeEnabled) {
                        scheduleSnooze();
                    } else {
                        timer.cancel();
                    }
                }
            }
        };

        timer.schedule(alarmTask, 0, 1000);
    }

    private static void playAlarmSound() {
        // Simulate playing the alarm sound (replace with actual sound playing code)
        JOptionPane.showMessageDialog(null, "Alarm! Playing sound: " + alarmSound);
    }

    private static void scheduleSnooze() {
        TimerTask snoozeTask = new TimerTask() {
            @Override
            public void run() {
                playAlarmSound();
            }
        };

        // Schedule the snooze task to run after 5 minutes
        timer.schedule(snoozeTask, 5 * 60 * 1000);
    }
}