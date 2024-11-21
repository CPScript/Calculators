Option Explicit

Dim num1, num2, operation, result

Do
    ' Get the first number from the user
    num1 = InputBox("Enter the first number:", "Simple Calculator")
    
    ' Get the operation from the user
    operation = InputBox("Enter operation (+, -, *, /):", "Simple Calculator")
    
    ' Get the second number from the user
    num2 = InputBox("Enter the second number:", "Simple Calculator")
    
    ' Perform the calculation based on the operation
    Select Case operation
        Case "+"
            result = num1 + num2
        Case "-"
            result = num1 - num2
        Case "*"
            result = num1 * num2
        Case "/"
            If num2 = 0 Then
                MsgBox "Error: Division by zero", vbCritical, "Error"
                result = "undefined"
            Else
                result = num1 / num2
            End If
        Case Else
            MsgBox "Error: Unsupported operation", vbCritical, "Error"
            result = "undefined"
    End Select
    
    ' Display the result
    If result <> "undefined" Then
        MsgBox "Result: " & result, vbInformation, "Result"
    End If
    
    ' Ask the user if they want to continue
Loop While MsgBox("Do you want to perform another calculation?", vbYesNo + vbQuestion, "Continue") = vbYes
