TITLE SPIRAL02
;Программа построения спирали Архимеда

include pixels.inc ;подключить макросы вывода точки, осей и символа

.model small

.stack 100h

.data
	fi dd 0.0 		;Начальное значение переменной угла.
	delta dd -0.001 	;Шаг изменения угла.
	xdiv2 dw 320 	;Координаты центра экрана по X.
	ydiv2 dw 240	;Координаты центра экрана по Y.
	K dd 4.0 		;Коэффициент шага спирали.
	xr dw 0			;Координата выводимой точки по X.
	yr dw 0 		;Координата выводимой точки по Y.
	forcolor DB 09h ;Цвет спирали (голубой).
	Variant db 'Spiral_06_6_vitka', '$' ;Поясняющая надпись.

	fi_1 dd 0.0 		;Начальное значение переменной угла.
	delta_1 dd 0.001 	;Шаг изменения угла.
	xdiv2_1 dw 355 	;Координаты центра экрана по X.
	ydiv2_1 dw 240	;Координаты центра экрана по Y.
	K_1 dd 4.0 		;Коэффициент шага спирали.
	xr_1 dw 0			;Координата выводимой точки по X.
	yr_1 dw 0 		;Координата выводимой точки по Y.
	forcolor_1 DB 04h ;Цвет спирали (красный).

.code
.486 ;Используем расширенную систему команд
;---------------Вывод пиксела---------------------------------------------
;CX-координата X (столбец), DX-координата Y (строка),
;AL-цвет пиксела
POINT PROC 
	pusha	;помещение регистров в стек
	mov CX,xr ;Вычисляем координату х
	add CX, xdiv2 ;в регистре CX.
	mov DX, ydiv2 ;Вычисляем координату y
	sub DX, yr ;в регистре DX.
	mov AL, forcolor ;Задать цвет спирали.
	mov BH, 0	;страница 0
	mov AH,12 ;Вывести пиксел 
	int 10h ;средствами BIOS.
	popa	;команда обратная pusha
	ret		;выход из процедуры
POINT ENDP
POINT_1 PROC 
	pusha	;помещение регистров в стек
	mov CX,xr_1 ;Вычисляем координату х
	add CX, xdiv2_1 ;в регистре CX.
	mov DX, ydiv2_1 ;Вычисляем координату y
	sub DX, yr_1 ;в регистре DX.
	mov AL, forcolor_1 ;Задать цвет спирали.
	mov BH, 0	;страница 0
	mov AH,12 ;Вывести пиксел 
	int 10h ;средствами BIOS.
	popa	;команда обратная pusha
	ret		;выход из процедуры
POINT_1 ENDP
;-----------Закрашивание экрана цветом фона---------------------
;CX-координата X (столбец), DX-координата Y (строка),
;AL-цвет пиксела
FON PROC
	pusha		;помещение регистров в стек
	mov CX, 0	;столбец
	mov DX, 0	;строка
	mov AL, 0Eh ;Цвет фона.
	mov BH, 0 	;Номер страницы.
c_1: 
	mov AH, 12 	;Вывести пиксел
	int 10h 	;средствами BIOS.
	inc CX 		;cx + 1
	cmp CX, 639	;ставнение cx с 319
	jne c_1 	;cx != 319
	xor CX, CX 	;очистка cx
	inc DX		;dx + 1
	cmp DX, 479 ; ставнение dx с 199
	jne c_1		;dx != 199
	popa 		;команда обратная pusha
	ret			;выход из процедуры
FON ENDP
;===========Основная программа====================
start:
	mov ax,@DATA	;инициализация 
	mov ds,ax 		;сегмента данных
	xor ax,ax		;очистка ax
	mov CX, 12520 ;Количество итераций цикла
;(определяет число витков).
;----------------------------------------------------------------------------------
	mov ah,0h 	;Инициализация графического
	mov al,12h 	;режима 640x480.
	int 10h		;с помощью BIOS
	call FON 	;Вызов процедуры закрашивания фона.
;-------Вывод строки Variant-------------------------------------------------
	pusha		;помещение регистров в стек
	mov cx,17	;строка 17
	mov bx,0	;столбец 0
l3:
	mov al,Variant[bx]	;al = адрес переменной Variant
	inc bx				;bx + 1
	OutCharG bl, 02h, 03h, al ;Вызов макроса. 
	loop l3				;цикл
	popa		;команда обратная pusha
;---------рисуем оси-----------------------------------------------------------
	AxleX ;Вызов макроса.
	AxleY ;Вызов макроса.
;------Вычисляем формулу x=round(fi*K*cos(fi))----------------------
	finit 				;Инициализация сопроцессора. 
l1:
	fld fi 				;Загрузить угол fi в стек FPU.
	fcos 				;Вычислить cos(fi).
	fld fi 				;Загрузить угол fi в стек FPU. 
	fmul K 				;ST(0):=K*(ST(0))
	fmul 				;ST()):=(ST(0))*(ST(1))
	frndint 			;ST(0):=round(ST(0)) 
	fistp word ptr xr 	;Заносим X в переменную для вывода 
						;на экран
;------Вычисляем формулу y=round(fi*K*sin(fi))-----------------------
	fld fi		;Загрузить угол fi в стек FPU. 	
	fsin		;Вычислить sin(fi).	
	fld fi		;Загрузить угол fi в стек FPU. 
	fmul K		;ST(0):=K*(ST(0))
	fmul 		;ST()):=(ST(0))*(ST(1))			
	frndint		;ST(0):=round(ST(0)) 
	fistp word ptr yr 	;Заносим Y в переменную для вывода 
						;на экран. 
	call POINT	;перейти к процедуре POINT
;---------Вычисляем новое значение угла fi----------------------------- 
	fld delta	;Загрузить угол delta в стек FPU. 
	fld fi		;Загрузить угол fi в стек FPU. 
	fadd		;Добавляем два операнда с плавающей запятой и помещает результат в регистр с плавающей запятой.
	fstp fi		;Сохранить значение с плавающей запятой
	loop l1 	;Повторить цикл пока (СХ) не равно 0.
;-----------------------------------------------------------------------------------
	mov ah,1h ;Ожидание нажатия клавиши. 
	int 21h	
	xor ax,ax		;очистка ax
	xor cx,cx
	mov CX, 12540 ;Количество итераций цикла
;------Вычисляем формулу x=round(fi*K*cos(fi))----------------------
	finit 				;Инициализация сопроцессора. 
l1_1:
	fld fi_1 				;Загрузить угол fi в стек FPU.
	fcos 				;Вычислить cos(fi).
	fld fi_1 				;Загрузить угол fi в стек FPU. 
	fmul K_1 				;ST(0):=K*(ST(0))
	fmul 				;ST()):=(ST(0))*(ST(1))
	frndint 			;ST(0):=round(ST(0)) 
	fistp word ptr xr_1 	;Заносим X в переменную для вывода 
						;на экран
;------Вычисляем формулу y=round(fi*K*sin(fi))-----------------------
	fld fi_1		;Загрузить угол fi в стек FPU. 	
	fsin		;Вычислить sin(fi).	
	fld fi_1		;Загрузить угол fi в стек FPU. 
	fmul K_1		;ST(0):=K*(ST(0))
	fmul 		;ST()):=(ST(0))*(ST(1))			
	frndint		;ST(0):=round(ST(0)) 
	fistp word ptr yr_1 	;Заносим Y в переменную для вывода 
						;на экран. 
	call POINT_1	;перейти к процедуре POINT
;---------Вычисляем новое значение угла fi----------------------------- 
	fld delta_1	;Загрузить угол delta в стек FPU. 
	fld fi_1		;Загрузить угол fi в стек FPU. 
	fadd		;Добавляем два операнда с плавающей запятой и помещает результат в регистр с плавающей запятой.
	fstp fi_1		;Сохранить значение с плавающей запятой
	loop l1_1 	;Повторить цикл пока (СХ) не равно 0.

;-----------------------------------------------------------------------------------
	mov ah,1h ;Ожидание нажатия клавиши. 
	int 21h	
;-----------------------------------------------------------------------------------
	mov ah,0h 	;Перевод в Text Mode.
	mov al,03h	;номер режима
	int 10h		;с помощью BIOS
;-----------------------------------------------------------------------------------
exit:
	mov ax,4C00h ;Стандартный выход.
	int 21h 
END start