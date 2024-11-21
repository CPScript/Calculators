-- SQL is primarily designed for managing and querying data in databases rather than performing calculations like a programming language. However, you can perform arithmetic operations using SQL queries to simulate a calculator's functionality.
-- You can execute this script using an SQL client (like MySQL Workbench, SQL Server Management Studio, or any other SQL interface)

-- The script creates a temporary table named Calculator to hold two numbers and the operation to perform.
-- You can change the values in the INSERT INTO statement to perform different calculations. For example, you can change (5, 3, '+') to (10, 2, '-') for subtraction.
-- The SELECT statement uses a CASE statement to determine which operation to perform based on the value of Operation. It handles addition, subtraction, multiplication, and division, including a check for division by zero.

-- HOW TO USE
-- Open your SQL client.
-- Paste the script into the query window.
-- Run the script.

-- Create a temporary table to hold inputs
CREATE TEMPORARY TABLE Calculator (
    Num1 DECIMAL(10, 2),
    Num2 DECIMAL(10, 2),
    Operation CHAR(1)
);

-- Insert values into the temporary table
INSERT INTO Calculator (Num1, Num2, Operation)
VALUES (5, 3, '+');  -- Change these values for different calculations

-- Perform the calculation based on the operation
SELECT 
    Num1,
    Num2,
    Operation,
    CASE 
        WHEN Operation = '+' THEN Num1 + Num2
        WHEN Operation = '-' THEN Num1 - Num2
        WHEN Operation = '*' THEN Num1 * Num2
        WHEN Operation = '/' THEN 
            CASE 
                WHEN Num2 = 0 THEN 'Error: Division by zero'
                ELSE Num1 / Num2 
            END
        ELSE 'Error: Unsupported operation'
    END AS Result
FROM Calculator;

-- Clean up: Drop the temporary table
DROP TABLE Calculator;
