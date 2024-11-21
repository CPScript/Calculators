def calculate(op, num1, num2)
  case op
  when '+'
    num1 + num2
  when '-'
    num1 - num2
  when '*'
    num1 * num2
  when '/'
    if num2 != 0
      num1 / num2
    else
      'Error: Division by zero'
    end
  else
    'Error: Unsupported operation'
  end
end

def main
  puts "Simple Calculator"

  print "Enter first number: "
  num1 = gets.chomp.to_f

  print "Enter operation (+, -, *, /): "
  operation = gets.chomp

  print "Enter second number: "
  num2 = gets.chomp.to_f

  result = calculate(operation, num1, num2)
  puts "Result: #{result}"
end

main
