;Program_4 – Арифметические операции, вариант …
Data SEGMENT ;Открыть сегмент данных
A DB -5 ;Инициализировать
B DB 31 ;переменные A, B, C, D, X
C DB ?
F DB ?
D DB 1
X DW ?
Data ENDS ;Закрыть сегмент данных
Ourstack SEGMENT Stack ;Открыть сегмент стека
DB 100h DUP (?) ;Отвести под стек 256 байт
Ourstack ENDS ;Закрыть сегмент стека
ASSUME CS:Code, DS:Data, SS:Ourstack ;Назначить сегментные ;регистры
Code SEGMENT ;Открыть сегмент кодов
Start: 
    mov AX, Data ;Инициализировать
    mov DS, AX ;сегментный регистр DS
    xor AX, AX ;Очистить регистр AX 
    xor BX, BX
    xor CX, CX

    mov AL, B
    ADD D, AL

    mov AL, D 
    MUL D ; AX

    mov CX, AX
    xor AX, AX

    mov AL, 25
    SUB B, AL

    mov AL, B
    MUL B ;AX
    
    mov BL, A
    ADD BL, 1
        
    ; работает с AX
    IDIV BL ;AL

    neg AL
    SUB CX, AX
    mov X, CX

    mov AX, 4C00h ;Завершить программу
    int 21h ;с помощью DOS
Code ENDS ;Закрыть сегмент кодов
    END Start ;Конец исходного модуля.