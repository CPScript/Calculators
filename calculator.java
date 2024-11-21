import java.util.Scanner;

public class Calculator {

    // Method to perform calculations
    public static double calculate(double num1, double num2, String operation) {
        switch (operation) {
            case "+":
                return num1 + num2;
            case "-":
                return num1 - num2;
            case "*":
                return num1 * num2;
            case "/":
                if (num2 != 0) {
                    return num1 / num2;
                } else {
                    throw new ArithmeticException("Error: Division by zero");
                }
            default:
                throw new IllegalArgumentException("Error: Unsupported operation");
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Simple Calculator");

        while (true) {
            try {
                System.out.print("Enter first number: ");
                double num1 = scanner.nextDouble();

                System.out.print("Enter operation (+, -, *, /): ");
                String operation = scanner.next();

                System.out.print("Enter second number: ");
                double num2 = scanner.nextDouble();

                double result = calculate(num1, num2, operation);
                System.out.println("Result: " + result);

                System.out.print("Do you want to perform another calculation? (yes/no): ");
                String continueCalc = scanner.next();
                if (!continueCalc.equalsIgnoreCase("yes")) {
                    break;
                }
            } catch (ArithmeticException e) {
                System.out.println(e.getMessage());
            } catch (IllegalArgumentException e) {
                System.out.println(e.getMessage());
            } catch (Exception e) {
                System.out.println("Invalid input. Please try again.");
                scanner.next(); // Clear the invalid input
            }
        }

        scanner.close();
        System.out.println("Goodbye!");
    }
}
