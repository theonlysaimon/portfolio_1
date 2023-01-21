from random import randint

name = "Иванушка"
name_pol = input("Как тебя зовут? \n")
print("Привет, я бот "+ name +", который угадет число! Очень приятно, " + name_pol + ", хорошего дня вам.")


print('Загадай число от 1 до 10')
succ = ''
mass = [1, 10]
count = 0
rnd = randint(1, 10)
while succ != 'д':
    succ = input(f'Может быть это {rnd}? (д/н): ')
    count += 1
    if  count <= 5:
        if succ == 'н':
            if input('Больше или меньше (б/м): ') == 'б':
                mass[0] = rnd
                rnd = (mass[0]+mass[1])//2
                print(rnd)
            else:
                mass[1] = rnd
                rnd = (mass[0]+mass[1])//2
                print(rnd)
    else:
        print("Что-то пошло не так!" + name_pol  + ", вы ошибаетесь...")
        break

