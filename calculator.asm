; using bash execute this command to copile and run the script:
; nasm -f elf32 calculator.asm -o calculator.o ld -m elf_i386 calculator.o -o calculator ./calculator

section .data
    prompt db "Enter operation (+, -, *, /): ", 0
    input db 0
    num1 db "Enter first number: ", 0
    num2 db "Enter second number: ", 0
    resultMsg db "Result: ", 0
    newline db 10, 0

section .bss
    res resb 10

section .text
    global _start

_start:
    ; Prompt for operation
    mov eax, 4          ; syscall: write
    mov ebx, 1          ; file descriptor: stdout
    mov ecx, prompt     ; message to write
    mov edx, 30         ; message length
    int 0x80

    ; Read operation
    mov eax, 3          ; syscall: read
    mov ebx, 0          ; file descriptor: stdin
    mov ecx, input      ; buffer to store input
    mov edx, 1          ; number of bytes to read
    int 0x80

    ; Prompt for first number
    mov eax, 4
    mov ebx, 1
    mov ecx, num1
    mov edx, 21
    int 0x80

    ; Read first number
    mov eax, 3
    mov ebx, 0
    mov ecx, res
    mov edx, 10
    int 0x80
    movzx eax, byte [res] ; get first byte (ASCII)
    sub eax, '0'          ; convert ASCII to integer
    mov ebx, eax          ; store first number in ebx

    ; Prompt for second number
    mov eax, 4
    mov ebx, 1
    mov ecx, num2
    mov edx, 22
    int 0x80

    ; Read second number
    mov eax, 3
    mov ebx, 0
    mov ecx, res
    mov edx, 10
    int 0x80
    movzx eax, byte [res] ; get first byte (ASCII)
    sub eax, '0'          ; convert ASCII to integer
    mov ecx, eax          ; store second number in ecx

    ; Perform the operation
    mov al, [input]       ; load operation
    cmp al, '+'           ; check for addition
    je add
    cmp al, '-'           ; check for subtraction
    je sub
    cmp al, '*'           ; check for multiplication
    je mul
    cmp al, '/'           ; check for division
    je div

    jmp end_program

add:
    add ebx, ecx          ; ebx = num1 + num2
    jmp print_result

sub:
    sub ebx, ecx          ; ebx = num1 - num2
    jmp print_result

mul:
    imul ebx, ecx         ; ebx = num1 * num2
    jmp print_result

div:
    xor edx, edx          ; clear edx for division
    div ecx               ; eax = num1 / num2
    mov ebx, eax          ; move result to ebx
    jmp print_result

print_result:
    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, resultMsg
    mov edx, 8
    int 0x80

    ; Convert result to string
    add ebx, '0'          ; convert integer to ASCII
    mov [res], bl         ; store result in buffer

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

end_program:
    ; Exit
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; exit code 0
    int 0x80
