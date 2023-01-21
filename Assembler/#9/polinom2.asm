TITLE POLINOM
;Программа вычисления и построения графика функции вида
; Y=a1Xn + a2Xn-1 + …+ anX +an+1
.MODEL SMALL ;Модель памяти ближнего типа.
.STACK 256 ;Отвести под стек 256 байт.
.486 ;Используем расширенную систему команд.
.DATA ;Открыть сегмент данных.
Mas_A DW -2, 8, -5, 0, 1 ;Коэффициенты полинома.
N DW 1 ;Порядок полинома равен 4.
X DD -100.0 ;Начальное значение аргумента X.
M DD 180  ;Масштабный коэффициент.
Step DD 0.5 ;Шаг изменения аргумента X.
Number DW 0 ;Номер отсчёта для значений X.
Y DD (?) ;Результат вычисления полинома.
S_0 DB '0','$'	;Выводимые значения координат.
Y_s DB 'Y','$'	;Выводимые значения координат.
X_s DB 'X','$'	;Выводимые значения координат.
;--------------------------------------------------------
.CODE ;Открыть сегмент кодов.
;========== Инициализация графического режима =============
InitGraph PROC
pusha
mov AH, 0 ;Установить режим экрана
mov AL, 13h ;640x480
int 10h ;средствами BIOS.
popa
ret
InitGraph ENDP
;============== Закрытие графического режима ==============
CloseGraph PROC
mov AX, 3 ;Установить текстовый
int 10h ;режим 25x80 средствами BIOS.
ret
CloseGraph ENDP
;================ Очистка экрана ========================
Clear PROC
pusha
mov CX, 64000 ;Число пикселов экрана.
mov AX, 0A000h ;Адрес графической видеопамяти
mov ES, AX ;в ES.
mov AL, 00010100b
xor DI, DI
cld
rep stosb
popa
ret
Clear ENDP
;=============== Ожидание нажатия клавиши ===============
WaitKey PROC
pusha
mov AH, 01h
int 21h
popa
ret
WaitKey ENDP
;================ Рисование осей ========================
Osi PROC
pusha
mov CX, 10 ;x горизонталь
mov DX, 100 ;y
mov AL, 00000110b ;Цвет оси желтый
o1: mov AH, 12 ;Вывод точки.
int 10h ;Вызов BIOS.
inc CX ;Построить
cmp CX, 300 ;300
jne o1 ;точек.
mov CX, 160 ;x вертикаль
mov DX, 0 ;y
mov AL, 00000110b ;Цвет оси желтый.
o2: mov AH, 12 ;Вывод точки
int 10h
inc DX
cmp DX, 200
jne o2
popa
ret
Osi ENDP
;================ Рисование стрелки ========================
Strelk_1 PROC
pusha
mov CX, 100 ;x горизонталь
mov DX, 80 ;y
mov AL, 00000110b ;Цвет оси желтый
o3: mov AH, 12 ;Вывод точки.
int 10h ;Вызов BIOS.
inc CX ;Построить
cmp CX, 10 ;300
jne o3 ;точек.
popa
ret
Strelk_1 ENDP
;================ Вывод точки на экран ===================
PutPixel PROC
;ecx, edx – координаты точки
pusha
mov AL,000001b ;Цвет пиксела - зелёный
mov EDX, 100 ;Номер строки y
sub EDX, Y ;вывода
nop ;задержка
mov CX, 50 ;Номер столбца x
add CX, Number ;вывода.
nop
mov AH,12 ;Вывести пиксел
int 10h ;на экран
nop
popa
ret
PutPixel ENDP
;================ Вывод символа 0 ======================== 
Simv_1 PROC	;начало процедуры Simv
	pusha	;помещение значения в стек
	mov AH, 02	;Функция установки курсора.
	mov BH, 0	;Номер текущей страницы.
	mov DL, 21	;Номер столбца.
	mov DH, 11	;Номер строки.
	int 10h	;Установка курсора.
	lea SI, S_0	;Загрузить смещение строки в SI. 
c_2: mov AH, 0Eh	;Функция вывода символа.
	mov BL, 00000110b	;Выбор цвета символов.
	lodsb	;Переслать символ из строки DS:SI в AL.
	cmp AL, '$'	;Определить конец строки.
	je exit_pr	;Если конец строки достигнут, выход
	int 10h	;средствами BIOS.
	jmp c_2	;переход к c_2
exit_pr: popa	; восстанавление из стека значения регистров в обратном порядке
	ret 	;возврат из процедуры
Simv_1 ENDP	;конец процедуры Simv
;================ Вывод символа Y ======================== 
Simv_Y PROC	;начало процедуры Simv
	pusha	;помещение значения в стек
	mov AH, 02	;Функция установки курсора.
	mov BH, 0	;Номер текущей страницы.
	mov DL, 21	;Номер столбца.
	mov DH, 1	;Номер строки.
	int 10h	;Установка курсора.
	lea SI, Y_s	;Загрузить смещение строки в SI. 
c_2_Y: mov AH, 0Eh	;Функция вывода символа.
	mov BL, 00000110b	;Выбор цвета символов.
	lodsb	;Переслать символ из строки DS:SI в AL.
	cmp AL, '$'	;Определить конец строки.
	je exit_pr_Y	;Если конец строки достигнут, выход
	int 10h	;средствами BIOS.
	jmp c_2_Y	;переход к c_2
exit_pr_Y: popa	; восстанавление из стека значения регистров в обратном порядке
	ret 	;возврат из процедуры
Simv_Y ENDP	;конец процедуры Simv
;================ Вывод символа Y ======================== 
Simv_X PROC	;начало процедуры Simv
	pusha	;помещение значения в стек
	mov AH, 02	;Функция установки курсора.
	mov BH, 0	;Номер текущей страницы.
	mov DL, 37	;Номер столбца.
	mov DH, 11	;Номер строки.
	int 10h	;Установка курсора.
	lea SI, X_s	;Загрузить смещение строки в SI. 
c_2_X: mov AH, 0Eh	;Функция вывода символа.
	mov BL, 00000110b	;Выбор цвета символов.
	lodsb	;Переслать символ из строки DS:SI в AL.
	cmp AL, '$'	;Определить конец строки.
	je exit_pr_X	;Если конец строки достигнут, выход
	int 10h	;средствами BIOS.
	jmp c_2_X	;переход к c_2
exit_pr_X: popa	; восстанавление из стека значения регистров в обратном порядке
	ret 	;возврат из процедуры
Simv_X ENDP	;конец процедуры Simv
;===================отрисовка стрелок (вверх)=====================
Arrows PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 159	;x
	mov dx, 3   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows ENDP
Arrows_1 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 158	;x
	mov dx, 3   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_1 ENDP
Arrows_2 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 157	;x
	mov dx, 3   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_2 ENDP
Arrows_3 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 161	;x
	mov dx, 3   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_3 ENDP
Arrows_4 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 162	;x
	mov dx, 3   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_4 ENDP
Arrows_5 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 163	;x
	mov dx, 3   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_5 ENDP
Arrows_6 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 159	;x
	mov dx, 2   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_6 ENDP
Arrows_7 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 158	;x
	mov dx, 2   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_7 ENDP
Arrows_8 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 161	;x
	mov dx, 2   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_8 ENDP
Arrows_9 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 162	;x
	mov dx, 2   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_9 ENDP
Arrows_10 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 161	;x
	mov dx, 1   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_10 ENDP
Arrows_12 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 159	;x
	mov dx, 1   ;y
	mov ah, 12
	int 10h
popa
ret
Arrows_12 ENDP
;============================отрисовка стрелок (справа)=====================
Arr PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 297	;x
	mov dx, 101   ;y
	mov ah, 12
	int 10h
popa
ret
Arr ENDP
Arr_1 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 297	;x
	mov dx, 102   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_1 ENDP
Arr_2 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 297	;x
	mov dx, 103   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_2 ENDP
Arr_3 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 297	;x
	mov dx, 99   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_3 ENDP
Arr_4 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 297	;x
	mov dx, 98   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_4 ENDP
Arr_5 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 297	;x
	mov dx, 97   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_5 ENDP
Arr_6 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 298	;x
	mov dx, 101   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_6 ENDP
Arr_7 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 298	;x
	mov dx, 102   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_7 ENDP
Arr_8 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 298	;x
	mov dx, 99   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_8 ENDP
Arr_9 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 298	;x
	mov dx, 98   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_9 ENDP
Arr_10 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 299	;x
	mov dx, 99   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_10 ENDP
Arr_11 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 299	;x
	mov dx, 101   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_11 ENDP
Arr_12 PROC
pusha
	mov al, 00000110b ;цвет оси
	mov cx, 300	;x
	mov dx, 100   ;y
	mov ah, 12
	int 10h
popa
ret
Arr_12 ENDP
;--------------------------------------------------------------
;--------------------------------------------------------------
Start: mov AX, @Data
mov DS, AX
call Clear ;очистка журнала
call InitGraph ;инициализация графического режима
call Osi ;построение осей графика
call Simv_1
call Simv_Y
call Simv_X
call Arrows
call Arrows_1
call Arrows_2
call Arrows_3
call Arrows_4
call Arrows_5
call Arrows_6
call Arrows_7
call Arrows_8
call Arrows_9
call Arrows_10
call Arrows_12

call Arr
call Arr_1
call Arr_2
call Arr_3
call Arr_4
call Arr_5
call Arr_6
call Arr_7
call Arr_8
call Arr_9
call Arr_10
call Arr_11
call Arr_12
;call Strelk_1
call WaitKey ;Ожидание нажатия клавиши

@2:  mov CX, N ;Загрузить счетчик циклов.
xor SI,SI ;если сравниваемые биты отличаются (не равны) =1
finit ;Инициализировать сопроцессор
fld X ;Загрузить X в st(0).

fcos ;Перемножть st(0):=(st(0))*(st(1)).

;fidiv M ;Разделить на масштабный коэффициент.
;frndint ;Округлить до целого.
fistp Y ;Переслать (st(0)) в Y.

call PutPixel ;Вывести полученное значение на график.

fadd Step ;Увеличить на шаг st(0):=(st(0))+0.1.
fstp X ;Сохранить st(0)+0.1 в память Z.

inc Number ;Перейти к следующему отсчету по X.
cmp Number,199 ;Повторить еще 199 раз.

jnz @2 ;если не равно 0 то
call WaitKey ;Ожидание нажатия клавиши
call CloseGraph ;Закрыть графический режим
mov AX, 4C00h ;и выйти
int 21h ;в DOS.
END Start