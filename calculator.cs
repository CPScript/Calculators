using System;

class Calculator
{
    // Method to perform calculations
    static double Calculate(double num1, double num2, string operation)
    {
        switch (operation)
        {
            case "+":
                return num1 + num2;
            case "-":
                return num1 - num2;
            case "*":
                return num1 * num2;
            case "/":
                if (num2 != 0)
                {
                    return num1 / num2;
                }
                else
                {
                    throw new DivideByZeroException("Error: Division by zero");
                }
            default:
                throw new InvalidOperationException("Error: Unsupported operation");
        }
    }

    static void Main(string[] args)
    {
        Console.WriteLine("Simple Calculator");

        while (true)
        {
            try
            {
                Console.Write("Enter first number: ");
                double num1 = Convert.ToDouble(Console.ReadLine());

                Console.Write("Enter operation (+, -, *, /): ");
                string operation = Console.ReadLine();

                Console.Write("Enter second number: ");
                double num2 = Convert.ToDouble(Console.ReadLine());

                double result = Calculate(num1, num2, operation);
                Console.WriteLine($"Result: {result}");

                Console.Write("Do you want to perform another calculation? (yes/no): ");
                string continueCalc = Console.ReadLine();
                if (continueCalc.ToLower() != "yes")
                {
                    break;
                }
            }
            catch (FormatException)
            {
                Console.WriteLine("Invalid input. Please enter numeric values.");
            }
            catch (DivideByZeroException ex)
            {
                Console.WriteLine(ex.Message);
            }
            catch (InvalidOperationException ex)
            {
                Console.WriteLine(ex.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine("An unexpected error occurred: " + ex.Message);
            }
        }

        Console.WriteLine("Goodbye!");
    }
}
