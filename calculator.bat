@echo off
:calculator
cls
echo Simple Calculator
echo.

set /p num1="Enter first number: "
set /p operation="Enter operation (+, -, *, /): "
set /p num2="Enter second number: "

rem Check if the operation is valid
if "%operation%"=="" (
    echo Error: No operation entered.
    goto calculator
)

rem Perform the calculation based on the operation
setlocal enabledelayedexpansion
set result=0

if "%operation%"=="+" (
    set /a result=num1+num2
) else if "%operation%"=="-" (
    set /a result=num1-num2
) else if "%operation%"=="*" (
    set /a result=num1*num2
) else if "%operation%"=="/" (
    if %num2%==0 (
        echo Error: Division by zero
        goto calculator
    ) else (
        set /a result=num1/num2
    )
) else (
    echo Error: Unsupported operation
    goto calculator
)

echo Result: !result!
echo.
pause
goto calculator
