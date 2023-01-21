import math

d=1
while d>0: 
	d+=1

	try:

		what = str(input("Что делаем?\n(Сложение, Вычитание, Деление, Умножение, Корень или выходим)\nВвод:"))

		file = open("input.txt", "a")
		file.write("Ввод: " + what + "\n")
		file.close()

		if what=="выходим":
				break	

		if what == "Сложение":
			a = int(input("Введите число a:"))
			b = int(input("Введите число b(степень возведения):"))
			c = a + b
			print("Результат: " + str(c))
			
			file = open("input.txt", "a")
			file.write("Число a: " + str(a) + "\n")
			file.write("Число b: " + str(b) + "\n")
			file.close()

			file_out = open("output.txt", "a")
			file_out.write("Результат: " + str(c) + "\n")
			file_out.close()
			
		elif what == "Вычитание":
			a = int(input("Введите число a:"))
			b = int(input("Введите число b(степень возведения):"))
			c = a-b
			print("Результат: " + str(c))

			file = open("input.txt", "a")
			file.write("Число a: " + str(a) + "\n")
			file.write("Число b: " + str(b) + "\n")
			file.close()

			file_out = open("output.txt", "a")
			file_out.write("Результат: " + str(c) + "\n")
			file_out.close()

		elif what == "Деление":
			a = int(input("Введите число a:"))
			b = int(input("Введите число b(степень возведения):"))
			c = a / b
			print("Результат: " + str(c))

			file = open("input.txt", "a")
			file.write("Число a: " + str(a) + "\n")
			file.write("Число b: " + str(b) + "\n")
			file.close()

			file_out = open("output.txt", "a")
			file_out.write("Результат: " + str(c) + "\n")
			file_out.close()

		elif what == "Умножение":
			a = int(input("Введите число a:"))
			b = int(input("Введите число b(степень возведения):"))
			c = a * b
			print("Результат: " + str(c))

			file = open("input.txt", "a")
			file.write("Число a: " + str(a) + "\n")
			file.write("Число b: " + str(b) + "\n")
			file.close()

			file_out = open("output.txt", "a")
			file_out.write("Результат: " + str(c) + "\n")
			file_out.close()

		elif what == "Корень":
			a = int(input("Введите число a:"))
			b = int(input("Введите число b(степень возведения):"))
			c = math.sqrt(a)
			print("Результат: " + str(c))

			file = open("input.txt", "a")
			file.write("Число a: " + str(a) + "\n")
			file.write("Число b: " + str(b) + "\n")
			file.close()

			file_out = open("output.txt", "a")
			file_out.write("Результат: " + str(c) + "\n")
			file_out.close()

		else:
			print("Выбрана неверная операция!")

	except ValueError:
		print("Надо ввести число")
	except ZeroDivisionError:
		print("Попытка деления числа на ноль")
	except:
		print('Неизвестная ошибка')

		"""
		C://Users/Danil/AppData/Local/Programs/Python/Python37-32/Files
		"""