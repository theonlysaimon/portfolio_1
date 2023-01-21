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
