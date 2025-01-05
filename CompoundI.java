package Compound;

import java.util.Scanner;

public class CompoundI {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Welcome to Compound Calculation Interest:\n");
        //Enter Your Actual principle Loan Amount get in a BANK
        System.out.print("pls Enter your Principle OF  Amount Rupees: ");
        int prin = input.nextInt();
        // Enter your interest Loan RATE
        System.out.print("pls Enter your RATE OF  Amount Rupees: ");
        float rate = input.nextFloat();
        //Enter Your year to Loan
        System.out.print("Now tell me for how many years are you borrow: ");
        float years = input.nextFloat();

        // Compound interest Formula : and Method Call to match function
        double comInt = prin * Math.pow ( (1+rate/100),years) ;
        System.out.println("your Compound Interest is Rupees:" + comInt +"Only");
    }
}
