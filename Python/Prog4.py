
# 1-й способ:

a = int(input("Вводим первое число:"))
b = int(input("Вводим второе число:"))
print('a=%d; b=%d' % (a,b))
c = a
a = b
b = c
print('a=%d; b=%d' % (a,b))

# 2-й способ:

a = int(input("Вводим первое число:"))
b = int(input("Вводим второе число:"))
print('a=%d; b=%d' % (a,b))
a = a + b
b = a - b
a = a - b
print('a=%d; b=%d' % (a,b))

# 3-й способ:

a = int(input("Вводим первое число:"))
b = int(input("Вводим второе число:"))
print('a=%d; b=%d' % (a,b))
a,b = b,a
print('a=%d; b=%d' % (a,b))


print("%8.3f" % 3.141593)
print("%-8.3f число Пи" % 3.141593)

# Использование методов:

print("hello".rjust(10)+'!')
print("hello".ljust(10)+'!')
print("hello".center(10)+'!')


import math
 
print("Введите длины сторон треугольника: ")
a = int(input("a="))
b = int(input("b="))
c = int(input("c="))
p = (a+b+c)/2
s = math.sqrt(p*(p-a)*(p-b)*(p-c))
print("P=%d; S=%.2f" % (a+b+c, s))
 
print("Введите длины сторон прямоугольника: ")
a = int(input("a="))
b = int(input("b="))
print("P=%d; S=%d" % ((a+b)*2, a*b))
 
print("Введите радиус круга: ")
r = int(input("r="))
print("P=%.2f; S=%.2f" % (2*math.pi*r, math.pi*r**2))


n = input("Введите трехзначное число: ")
n = int(n)
 
d1 = n % 10
d2 = n % 100 // 10
d3 = n // 100
 
print("Сумма цифр числа:", d1 + d2 + d3)
print("Произведение цифр числа:", d1 * d2 * d3)


print("Координаты точки A(x1;y1):")
x1 = float(input("\tx1 = "))
y1 = float(input("\ty1 = "))
 
print("Координаты точки B(x2;y2):")
x2 = float(input("\tx2 = "))
y2 = float(input("\ty2 = "))
 
print("Уравнение прямой, проходящей через эти точки:")
k = (y1 - y2) / (x1 - x2)
b = y2 - k*x2
print(" y = %.2f*x + %.2f" % (k, b))

from random import random
 
m1 = int(input("Диапозон первое число:"))
m2 = int(input("Диапозон второе число:"))
n = int(random() * (m2-m1+1)) + m1
print(n)
 
m1 = float(input("Диапозон первое число:"))
m2 = float(input("Диапозон второе число:"))
n = random() * (m2-m1) + m1
print(round(n,3))
 
m1 = ord(input("Диапозон первое число:"))
m2 = ord(input("Диапозон второе число:"))
n = int(random() * (m2-m1+1)) + m1
print(chr(n))


import math
 
a = float(input("a="))
b = float(input("b="))
c = math.sqrt(a**2 + b**2)
print("c=%.2f" % c)

a = ord(input('1-я буква: '))
b = ord(input('2-я буква: '))
a = a - ord('a') + 1
b = b - ord('a') + 1
print('Позиции: %d и %d' % (a,b))
print('Между буквами символов:', abs(a-b)-1)
 
n = int(input('Номер буквы в алфавите: '))
n = ord('а') + n - 1
print('Это буква', chr(n))

amount = input("Сколько хотите взять денег: ")
amount = int(amount)
pct = input("Под какой процент вам их дают: ")
pct = int(pct)
years = input("Насколько лет берете: ")
years = float(years)
 
pct = pct / 100
month_pay = (amount * pct * (1 + pct)**years) / (12 * ((1 + pct)**years - 1))
print("Ваш месячный платеж составит: %.2f" % month_pay)
summa = month_pay * years * 12
print("За весь период вы заплатите: %.2f" % summa)
