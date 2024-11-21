-- Function to perform calculations
function calculate(num1, num2, operation)
    if operation == "+" then
        return num1 + num2
    elseif operation == "-" then
        return num1 - num2
    elseif operation == "*" then
        return num1 * num2
    elseif operation == "/" then
        if num2 ~= 0 then
            return num1 / num2
        else
            return "Error: Division by zero"
        end
    else
        return "Error: Unsupported operation"
    end
end

-- Main program loop
while true do
    print("Simple Calculator")
    
    io.write("Enter first number: ")
    local num1 = tonumber(io.read())
    
    io.write("Enter operation (+, -, *, /): ")
    local operation = io.read()
    
    io.write("Enter second number: ")
    local num2 = tonumber(io.read())
    
    local result = calculate(num1, num2, operation)
    print("Result: " .. tostring(result))
    
    print("Press Enter to continue or type 'exit' to quit.")
    local input = io.read()
    if input == "exit" then
        break
    end
end
