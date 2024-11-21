#include <iostream>
#include <stdexcept>

using namespace std;

// Function to perform calculations
double calculate(double num1, double num2, char operation) {
    switch (operation) {
        case '+':
            return num1 + num2;
        case '-':
            return num1 - num2;
        case '*':
            return num1 * num2;
        case '/':
            if (num2 != 0) {
                return num1 / num2;
            } else {
                throw runtime_error("Error: Division by zero");
            }
        default:
            throw invalid_argument("Error: Unsupported operation");
    }
}

int main() {
    cout << "Simple Calculator" << endl;

    while (true) {
        try {
            double num1, num2;
            char operation;

            cout << "Enter first number: ";
            cin >> num1;

            cout << "Enter operation (+, -, *, /): ";
            cin >> operation;

            cout << "Enter second number: ";
            cin >> num2;

            double result = calculate(num1, num2, operation);
            cout << "Result: " << result << endl;

            cout << "Do you want to perform another calculation? (yes/no): ";
            string continueCalc;
            cin >> continueCalc;
            if (continueCalc != "yes") {
                break;
            }
        } catch (const runtime_error& e) {
            cout << e.what() << endl;
        } catch (const invalid_argument& e) {
            cout << e.what() << endl;
        } catch (...) {
            cout << "An unexpected error occurred." << endl;
        }
    }

    cout << "Goodbye!" << endl;
    return 0;
}
