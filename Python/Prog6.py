"""
Приветствие программы
"""
print("Эта программа для вычисления\nпотенциальной энергии тела, поднятого над землей")

m = float(input("Масса тела = ")) #ввод массы тела
h = float(input("Высота, на которой находится тело = "))  #ввод высоты
g = 10

E = m*g*h #формула вычисления потенциальной энергии

print("E=", E , sep="") #печать на экран результата