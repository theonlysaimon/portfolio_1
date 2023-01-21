.MODEL SMALL
.Stack 200h
.Data ;Открыть сегмент данных
var_1 DB 05 ;определить переменную var_1 размером байт для хранения числа 5
M1 DB 07, 05, 28, 46, 39, 31, 21, 25, 25, 65, 67, 84, 85, 90, 95, 99, 17, 18, 19, 20 ;определить массив с именем M1 состоящий из 20 числовых элементов размером байт
M2 DB 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01 ;определить массив с именем M2 состоящий из 20 числовых элементов размером байт для запись частного
M3 DB 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01 ;определить массив с именем M2 состоящий из 20 числовых элементов размером байт для запись остатка
mas_1 DB '    Array:', '$' ;переменные 
mas_2 DB ' Quotient:', '$' ;для выводы 
mas_3 DB 'Remainder:', '$' ;пояснительной 
Rasd DB ' ', 13, 10, '$'   ;надписи
Y_Asc DB 7 DUP(?) ;Переменная для хранения символов ASCII.

cikl DW (?)   ;переменные решающие проблему
mas DW (?) ;потери регистров при переходе в процедуру перобразования
Sign DB (?) ;Переменная для хранения знака числа.

.Code ;Открыть сегмент кодов

PREOBR PROC ;Начать процедуру с именем PREOBR.
    mov Sign, ' ' ;Поместить в переменную знака символ пробела (знак +).
    cmp AX, 0; ;Сравнить число с нулем.
    jnc M_1; ;Если больше или равно 0, перейтина метку М_1,
M_1: 
    xor CX, CX ;Очистить CX.
    mov BX, 10 ;Поместить в ВХ делитель равный 10.
M_2: 
    xor DX, DX ;очистить DX
    div BX ;деление AX на BX
    push DX ;Сохранить остаток в стеке.
    inc CX ;СX +1
    cmp AX, 0 ;проверка AX >= 0
    jne M_2 ;Если (АХ) не равно 0, повторить деление.
    xor SI, SI ;Очистить SI.
    mov AL, Sign ;Загрузить в AL знак числа.
    mov Y_Asc[SI], AL ;Переслать знак в Y_ASCII.
    inc SI
M_3: 
    pop AX ;Извлечь содержимое стека в AX.
    add AL, 30h ;Вычислить ASCII код для цифры.
    mov Y_Asc[SI] ,AL ;Переслать ASCII код в Y_ASCII.
    inc SI ;SI +1
    loop M_3 ;Если содержимое СХ не 0, повторить цикл.
    mov Y_Asc[SI], '$' ;Поместить символ конца строки в Y_ASCII..
RET ;Возврат из процедуры.
PREOBR ENDP ;Завершить процедуру с именем PREOBR.

CLEAR_1 PROC
    xor DX, DX ;очистка dx
    xor AX, AX ;очистка ax
    xor BX, BX ;очистка bx
    xor SI, SI ;очистка si
    xor DI, DI ;очистка di
    xor CX, CX ;очистка cx
RET
CLEAR_1 ENDP

CLEAR_2 PROC
    xor DX, DX ;очистка dx
    xor AX, AX ;очистка ax
RET
CLEAR_2 ENDP

MASSIV PROC
    F_2:
        mov AL, [SI] ;помещаем эемент массива в AL для преобразования в ASCII
        mov cikl, CX ;помещаем значения цикал в cikl, чтобы не потерять
        mov mas, SI ;помещаем номер массива в si_mas, чтобы не потерять
        CALL PREOBR ;Вызов процедуры преобразования
        mov SI, mas ;возвращаем SI
        mov CX, cikl ;возвращаем CX
        mov DX, offset Y_Asc ;Вывод сообщения
        mov AH, 09 ;на
        int 21h ;экран
        inc SI ;смещаемся по массиву на 1
        xor AX, AX ;очистка ax
        loop F_2 ;переходим в метку F_2
RET
MASSIV ENDP

PRINT PROC
    mov AH, 09 ;на
    int 21h ;экран.
RET
PRINT ENDP

Start: 
    mov AX, @Data ;Инициализировать
    mov DS, AX ;сегментный регистр DS
    xor AX, AX ;Очистить регистр AX 
    mov CX, 20 ; количесвто прохлждения цикла

    lea SI, M1 ; помещаем адрес начала массива M1
    lea DI, M2 ; помещаем адрес начала массива M2
    lea BX, M3 ; помещаем адрес начала массива M3

    mov DL, var_1 ; помещаем делитель в BL

    F_1: 
        xor AX, AX ; очищаем AX
        mov AL, [SI] ;помещаем первый элемент в AL
        div DL ;делим
        mov [BX], AH ; заносим результат остатка
        mov [DI], AL ; заносим результат частного
        inc SI ; смещение к следующим элементам массива M1
        inc DI ; смещение к следующим элементам массива M2
        inc BX ; смещение к следующим элементам массива M3
        loop F_1 ;возвращение к M_1 до тех пор пока CX != 0

    CALL CLEAR_1    

    lea SI, M1 ; помещаем адрес начала массива M1
    mov CX, 20 ; количесвто прохлждения цикла

    mov DX, offset mas_1 ;Вывод сообщения
    CALL PRINT
    CALL CLEAR_2
    
    CALL MASSIV
    CALL CLEAR_1

    lea SI, M2 ; помещаем адрес начала массива M2
    mov CX, 20 ; количесвто прохлждения цикла

    mov DX, offset Rasd ;Вывод сообщения
    CALL PRINT
    CALL CLEAR_2

    mov DX, offset mas_2 ;Вывод сообщения
    CALL PRINT
    CALL CLEAR_2

    CALL MASSIV
    CALL CLEAR_1

    lea SI, M3 ; помещаем адрес начала массива M3
    mov CX, 20 ; количесвто прохлждения цикла

    mov DX, offset Rasd ;Вывод сообщения
    CALL PRINT
    CALL CLEAR_2

    mov DX, offset mas_3 ;Вывод сообщения
    CALL PRINT
    CALL CLEAR_2

    CALL MASSIV
    
    mov AL, 0 ;пересылка в AL значение 0
    mov AH, 4Ch ;функция DOS завершения программы
    int 21h ;завершить программу

END Start ;Конец исходного модуля.