;Program Hello_1– Ваша первая программа
Data SEGMENT
Greet DB 'My name is Sumin Nikita', 13, 10, 'My group IST-93', 13, 10, '$'
Data ENDS ;Закрыть сегмент данных
Ourstack SEGMENT Stack ;Открыть сегмент стека
DB 100h DUP (?) ;Отвести под стек 256 байт
Ourstack ENDS ;Закрыть сегмент стека
ASSUME CS:Code, DS:Data, SS:Ourstack ;Назначить сегментные ;регистры

Code SEGMENT ;Открыть сегмент кодов
Start: 
    mov AX, Data ;Инициализировать
    mov DS, AX ;сегментный регистр DS
    mov AH, 09h ;Вывести строку Greet
    mov DX, OFFSET Greet ;на экран с помощью
    int 21h ;DOS
    mov AL, 0 ;Завершить программу
    mov AH, 4Ch ;с помощью
    int 21h ;DOS
Code ENDS ;Закрыть сегмент кодов
    END Start ;Конец исходного модуля