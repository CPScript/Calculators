DIM num1 AS SINGLE
DIM num2 AS SINGLE
DIM result AS SINGLE
DIM operation AS STRING
DIM continueCalc AS STRING

PRINT "Simple Calculator"

DO
    PRINT "Enter first number: ";
    INPUT num1

    PRINT "Enter operation (+, -, *, /): ";
    INPUT operation

    PRINT "Enter second number: ";
    INPUT num2

    SELECT CASE operation
        CASE "+"
            result = num1 + num2
        CASE "-"
            result = num1 - num2
        CASE "*"
            result = num1 * num2
        CASE "/"
            IF num2 = 0 THEN
                PRINT "Error: Division by zero"
                CONTINUE DO
            END IF
            result = num1 / num2
        CASE ELSE
            PRINT "Error: Unsupported operation"
            CONTINUE DO
    END SELECT

    PRINT "Result: "; result

    PRINT "Do you want to perform another calculation? (y/n): ";
    INPUT continueCalc
LOOP WHILE UCASE$(continueCalc) = "Y"

PRINT "Goodbye!"
