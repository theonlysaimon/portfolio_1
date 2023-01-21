import socket
import sys
s = socket.socket() #создаем сокет
s.bind(("localhost",9999)) #ip и порт
s.listen(10) # Максимум 10 подключений

# цикл получения файла от клиента
i = 1
while True:
    sc, address = s.accept()

    print (address)
    f = open('file_'+ str(i),'wb') # открываем в двоичном виде и меняем имя
    i=i+1
    while (True):
        # получаем и записываем в файл
        l = sc.recv(1024)
        f.write(l)

        if not l:
            break

    f.close()
    sc.close()
    print('файл получен')

s.close()

