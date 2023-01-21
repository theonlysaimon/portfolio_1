from tkinter import *
import socket
import sys

root = Tk()
root.title('Отправка файла на сервер')
#root.geometry('250x120')
root.config(bg="gainsboro")

lb_left = Label(root, text=' ', font='Arial 2')
lb_left.grid(column=0, row=1, sticky=W)
lb_left.config(bg="gainsboro")

lb_up = Label(root, text=' ', font='Arial 2')
lb_up.grid(column=0, row=1, sticky=W)
lb_up.config(bg="gainsboro")

lb_right = Label(root, text=' ', font='Arial 2')
lb_right.grid(column=2, row=1, sticky=W)
lb_right.config(bg="gainsboro")

lb_douwn = Label(root, text=' ', font='Arial 2')
lb_douwn.grid(column=1, row=4, sticky=W)
lb_douwn.config(bg="gainsboro")

с= StringVar()
с.set('')
lb_с = Label(root, text='Введите имя файла:', font='Arial 14')
lb_с.grid(column=1, row=2, sticky=N)
lb_с.config(bg="gainsboro")

с_txt = Entry(root, width=20, textvariable=с, font='Arial 14')
с_txt.grid(column=1, row=3, sticky=W)
с_txt.config(bg="gainsboro")

# функция отправки файла
def Enter():
    try:
        s = socket.socket()
        s.connect(("localhost", 9999))
        file = str(с_txt.get())
        f = open ( file, "rb")
        l = f.read(1024)
        while (l):
            s.send(l)
            l = f.read(1024)
        lbRes.configure(text='Файл отправлен на сервер', fg='black', font='Arial 14' )
        s.close()
    except FileNotFoundError:
        lbRes.configure(text='Файл не найден', fg='black', font='Arial 14' )

lbRes = Label(root, text='', font='Arial 14' )
lbRes.grid(column=1, row=6)
lbRes.config(bg="gainsboro")

button = Button(text="Отправить", command=Enter, font='Arial 14' )
button.grid(column=1, row=5)
button.config(bg="green2",fg='black')

root.mainloop()

