import Foundation

func calculate(op: String, num1: Double, num2: Double) -> Double? {
    switch op {
    case "+":
        return num1 + num2
    case "-":
        return num1 - num2
    case "*":
        return num1 * num2
    case "/":
        return num2 != 0 ? num1 / num2 : nil
    default:
        return nil
    }
}

func main() {
    print("Simple Calculator")
    
    print("Enter first number: ", terminator: "")
    guard let input1 = readLine(), let num1 = Double(input1) else {
        print("Invalid input for the first number.")
        return
    }
    
    print("Enter operation (+, -, *, /): ", terminator: "")
    guard let operation = readLine() else {
        print("Invalid operation.")
        return
    }
    
    print("Enter second number: ", terminator: "")
    guard let input2 = readLine(), let num2 = Double(input2) else {
        print("Invalid input for the second number.")
        return
    }
    
    if let result = calculate(op: operation, num1: num1, num2: num2) {
        print("Result: \(result)")
    } else {
        print("Error: Unsupported operation or division by zero.")
    }
}

main()
