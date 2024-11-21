section .data
    prompt1 db "Enter first number: ", 0
    prompt2 db "Enter operation (+, -, *, /): ", 0
    prompt3 db "Enter second number: ", 0
    result_msg db "Result: ", 0
    error_msg db "Error: Invalid operation", 0
    newline db 10, 0
    buffer db 10 dup(0)  ; Buffer for user input

section .bss
    num1 resd 1          ; Reserve space for first number
    num2 resd 1          ; Reserve space for second number
    result resd 1        ; Reserve space for result

section .text
    global _start

_start:
    ; Prompt for first number
    mov eax, 4          ; syscall: write
    mov ebx, 1          ; file descriptor: stdout
    mov ecx, prompt1    ; message to write
    mov edx, 20         ; message length
    int 0x80            ; call kernel

    ; Read first number
    call read_input
    call str_to_int
    mov [num1], eax     ; Store first number

    ; Prompt for operation
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 30
    int 0x80

    ; Read operation
    call read_input
    movzx ebx, byte [buffer] ; Load operation character

    ; Prompt for second number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt3
    mov edx, 20
    int 0x80

    ; Read second number
    call read_input
    call str_to_int
    mov [num2], eax     ; Store second number

    ; Perform calculation based on operation
    mov eax, [num1]     ; Load first number
    mov ecx, [num2]     ; Load second number

    cmp ebx, '+'        ; Check for addition
    je add_numbers

    cmp ebx, '-'        ; Check for subtraction
    je subtract_numbers

    cmp ebx, '*'        ; Check for multiplication
    je multiply_numbers

    cmp ebx, '/'        ; Check for division
    je divide_numbers

    ; If operation is invalid
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, 30
    int 0x80
    jmp exit_program

add_numbers:
    add eax, ecx        ; Perform addition
    jmp print_result

subtract_numbers:
    sub eax, ecx        ; Perform subtraction
    jmp print_result

multiply_numbers:
    imul eax, ecx       ; Perform multiplication
    jmp print_result

divide_numbers:
    cmp ecx, 0         ; Check for division by zero
    je division_error
    xor edx, edx       ; Clear edx before division
    div ecx             ; Perform division
    jmp print_result

division_error:
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, 30
    int 0x80
    jmp exit_program

print_result:
    ; Print result
    mov [result], eax   ; Store result
    call int_to_str     ; Convert integer to string
    mov eax, 4
    mov ebx, 1
    mov ecx, result     ; Point to result string
    mov edx, 10         ; Length of result string (max 10 digits)
    int 0x80
    jmp exit_program

exit_program:
    ; Exit program
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; exit code 0
    int 0x80

read_input:
    ; Read user input
    mov eax, 3          ; syscall: read
    mov ebx, 0          ; file descriptor: stdin
    mov ecx, buffer     ; buffer to store input
    mov edx, 10         ; max number of bytes to read
    int 0x80
    mov byte [ buffer + eax - 1], 0  ; Null-terminate the string
    ret

str_to_int:
    ; Convert string in buffer to integer
    xor eax, eax        ; Clear eax
    xor ebx, ebx        ; Clear ebx
    mov ecx, buffer     ; Point to the buffer
.next_digit:
    movzx edx, byte [ecx] ; Load next byte
    cmp edx, 0          ; Check for null terminator
    je .done            ; If null, we're done
    sub edx, '0'        ; Convert ASCII to integer
    imul eax, eax, 10   ; Multiply current result by 10
    add eax, edx        ; Add the new digit
    inc ecx             ; Move to the next character
    jmp .next_digit
.done:
    ret

int_to_str:
    ; Convert integer in eax to string in result
    mov ecx, 10         ; Divisor for decimal conversion
    mov ebx, result     ; Point to result buffer
    add ebx, 10         ; Move to the end of the buffer
    mov byte [ebx], 0   ; Null-terminate the string
.reverse_loop:
    dec ebx             ; Move backwards in the buffer
    xor edx, edx        ; Clear edx for division
    div ecx             ; Divide eax by 10
    add dl, '0'         ; Convert remainder to ASCII
    mov [ebx], dl       ; Store character in buffer
    test eax, eax       ; Check if quotient is zero
    jnz .reverse_loop    ; If not, continue
    mov eax, ebx        ; Move pointer to the start of the string
    ret
