import socket
import sys
import datetime

s = socket.socket() #создаем сокет
s.bind(("localhost",9999)) #ip и порт
s.listen(10) # Максимум 10 подключений
print("Сервер для передачи файлов запущен!\n")

# цикл получения файла от клиента
print("\/ Получение файлов \/\n")

i = 1
while True:
    sc, adress = s.accept()
    print (adress)

    now = datetime.datetime.now()
    str_time = str(str(now.year) + "_" + str(now.month) + "_" + str(now.day))
    
    f = open('file_' + str_time + '.txt','wb') # открываем в двоичном виде и меняем имя
    i=i+1
    while (True):       
        # получаем и записываем в файл
        l = sc.recv(1024)
        f.write(l)
        if not l:
            break
    f.close()
    sc.close()
    print('Файл получен!')

s.close()

