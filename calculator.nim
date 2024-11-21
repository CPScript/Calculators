import strutils

proc calculate(op: char, num1, num2: float): float =
  case op:
    of '+': return num1 + num2
    of '-': return num1 - num2
    of '*': return num1 * num2
    of '/':
      if num2 != 0:
        return num1 / num2
      else:
        echo "Error: Division by zero"
        return 0.0
    else:
      echo "Error: Unsupported operation"
      return 0.0

proc main() =
  echo "Simple Calculator"
  echo "Enter first number: "
  let input1 = readLine(stdin)
  let num1 = input1.parseFloat()

  echo "Enter operation (+, -, *, /): "
  let operation = readChar(stdin)

  echo "Enter second number: "
  let input2 = readLine(stdin)
  let num2 = input2.parseFloat()

  let result = calculate(operation, num1, num2)
  echo "Result: ", result

main()
