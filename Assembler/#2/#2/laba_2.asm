;Forma_2 – исходный модуль для создания *.com приложения laba_2
.MODEL TINY ; модель памяти ближнего типа
.CODE ; открыть сегмент кодов
ORG 100h ; отвести 256 байт под PSP
Begin: jmp Start ; безусловный переход на первую команду

Greet DB 'My name is Sumin Nikita', 13, 10, 'My group IST-93', 13, 10, '$'
Start:
    mov AH, 09h ;Вывести строку Greet
    mov DX, OFFSET Greet ;на экран с помощью
    int 21h ;DOS
    mov AL, 0 ;Завершить программу
    mov AH, 4Ch ;с помощью
    int 21h ;DOS
END Begin ; конец исходного модуля.