package ArithmaticChall;

import java.util.Scanner;

public class Arithmtic {

    public static void main(String[] args) {
        //user input Section
        Scanner input=new Scanner(System.in);
        System.out.println("Welcome to Arithmatic Calculator:\n");
        // user input First Section
        System.out.print("Enter The First Number:");
        int first=input.nextInt();
        //User input Second Section
        System.out.println("Enter The Second Number:");
        int second=input.nextInt();
        // Calculation Part
        int add = first + second;
        int sub = first-second;
        int mul = first * second;
        int div = first / second;
        int mod = first%second;
        // out put Section
        System.out.println("Addition is :" +add);
        System.out.println("Subtraction is :" + sub);
        System.out.println("Multiplication is :" + mul);
        System.out.println("Division  is :" + div);
        System.out.println("Modulation is :" + mod);





    }
}
