users = {
    "Никита": {
        "телефон": "89277743119",
        "email": "nik22@gmail.com",
        "skype": "kita2019"
    },
    "Карина": {
        "телефон": "89608300686",
        "email": "kar@gmail.com",
        "skype": "karina2016"
    },
    "Наталья":{
    	"телефон":"89272104090",
    	"email":"nat1975@gmail.ru",
    	"skype":"nata75"
    }
}
for key, value in users.items():
    print(key, ":", value, sep="")

print("Размер словаря:",len(users))

d=1
while d>0: 
	d+=1
	try:
		b=str(input("Что делаем? (присутствует, ищим, добавляем, удаляем)/(выходим)\nВвод: "))

		if b=="выходим":
			break

		elif b=="присутствует":

			x=str(input("Есть ли в списке: "))
			a=x in users

			if a == True:
				print("Есть в списке")
			else:
				print("Нет в всписке")

		elif b=="ищим":
			x=str(input("Раздел: "))
			y=str(input("Подраздел: "))
			find=users[x][y]
			print(find)

		elif b=="добавляем":
			x=str(input("Раздел: "))
			y=str(input("Подраздел: "))
			z=str(input("Элемент: "))
			users[x][y]=z

			for key, value in users.items():
				print(key, ":", value, sep="")

		elif b=="удаляем":
			x=str(input("Раздел: "))
			y=str(input("Подраздел: "))

			del users[x][y]

			for key, value in users.items():
				print(key, ":", value, sep="")
		else:
			print("Выбранна неверная операция!(ОШИБКА)")

	except KeyError:
		print("Неправильный адрес!(ОШИБКА)")
	except ValueError:
		print("Нужно вводить строки!(ОШИБКА)")
				

