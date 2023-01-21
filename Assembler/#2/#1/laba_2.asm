;Forma_1 – упрощенное оформление программ laba_2
.MODEL SMALL ;модель памяти ближнего типа
.STACK 100h ;определить стек размером 100h
.DATA ;открыть сегмент данных
Greet DB 'My name is Sumin Nikita', 13, 10, 'My group IST-93', 13, 10, '$'

.CODE ; открыть сегмент кодов
Start:
    mov AX, @Data ;Инициализировать
    mov DS, AX ;сегментный регистр DS
    mov AH, 09h ;Вывести строку Greet
    mov DX, OFFSET Greet ;на экран с помощью
    int 21h ;DOS
    mov AL, 0 ;Завершить программу
    mov AH, 4Ch ;с помощью
    int 21h ;DOS
END Start ; конец исходного модуля.