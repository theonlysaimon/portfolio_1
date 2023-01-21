;Program_3 – Команды передачи данных, вариант 16
Data SEGMENT ;Открыть сегмент данных
    A DB ? ;Зарезервировать место
    B DB ? ;в памяти для
    C DB ? ;переменных
    D DB ? ;A, B, C, D
Data ENDS ;Закрыть сегмент данных

Ourstack SEGMENT Stack ;Открыть сегмент стека
    DB 100h DUP (?) ;Отвести под стек 256 байт
Ourstack ENDS ;Закрыть сегмент стека
ASSUME CS:Code, DS:Data, SS:Ourstack ;Назначить сегментные регистры
Code SEGMENT ;Открыть сегмент кодов
Start: 
    mov AX, Data ;Инициализировать
    mov DS, AX ;сегментный регистр DS
    mov A, 15 ;Инициализировать
    mov B, 1Ah ;переменные A, B, C, D
    mov C, 1Fh ;значениями Вашего
    mov D, 6 ;варианта
    mov AL, A
    mov AH, B
    xchg AL, AH
    mov BX, 3E10h
    mov CX, BX
    push BX
    push CX
    push AX
    lea SI, C
    mov AX, SI
    lea DI, D
    mov BX, DI
    pop AX
    pop CX
    pop BX
    mov BX, AX
    mov A, AL
    mov B, AH
    mov C, 0
    mov AX, 4C00h ;Завершить программу
    int 21h ;с помощью DOS
Code ENDS ;Закрыть сегмент кодов
    END Start ;Конец исходного модуля.
