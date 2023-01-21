import math
 
print("Введите длины сторон треугольника: ")
a = int(input("a="))
b = int(input("b="))
c = int(input("c="))
p = (a+b+c)/2
s = math.sqrt(p*(p-a)*(p-b)*(p-c))
print("P=%d; S=%.2f" % (a+b+c, s))
