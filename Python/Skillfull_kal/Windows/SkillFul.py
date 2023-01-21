# decompyle3 version 3.8.1a1
# Python bytecode 3.7.0 (3394)
# Decompiled from: Python 3.7.9 (tags/v3.7.9:13c94747c7, Aug 17 2020, 16:30:00) [MSC v.1900 64 bit (AMD64)]
# Embedded file name: SkillFul.py
# Compiled at: 2060-12-11 22:16:07
# Size of source mod 2**32: 2604546989 bytes
from tkinter import *
import math

def money_white_10(a, b, d):
    x = b + d
    if x >= 450 and x <= 500:
        x = 500
    else:
        x = b + d
    S = ((a + b) * 2 + 35) * x * 1e-06
    Sum = S * 100 + 10
    return '{:.0f}'.format(Sum)


def money_white_100(a, b, d):
    x = b + d
    if x >= 450 and x <= 500:
        x = 500
    else:
        x = b + d
    S = ((a + b) * 2 + 35) * x * 1e-06
    Sum = S * 90 + 10
    return '{:.0f}'.format(Sum)


def money_brown_10(a, b, d):
    x = b + d
    if x >= 450 and x <= 500:
        x = 500
    else:
        x = b + d
    S = ((a + b) * 2 + 35) * x * 1e-06
    Sum = S * 90 + 10
    return '{:.0f}'.format(Sum)


def money_brown_100(a, b, d):
    x = b + d
    if x >= 450 and x <= 500:
        x = 500
    else:
        x = b + d
    S = ((a + b) * 2 + 35) * x * 1e-06
    Sum = S * 80 + 10
    return '{:.0f}'.format(Sum)


def money_circulation(Money, quant):
    S = Money * quant
    return '{:.0f}'.format(float(S))


root = Tk()
root.title('Skillful 2.0')
root.attributes('-topmost', True)
#root.iconbitmap('Icon.ico')
root.config(bg='darkgray')
lb0 = Label(root, text=' ', fg='black', font='Arial 2')
lb0.config(bg='darkgray')
lb0.grid(column=0, row=0, sticky=W)
a = StringVar()
a.set('')
lb_a = Label(root, text=' Длина: ', fg='black', font='Arial 12')
lb_a.grid(column=0, row=1, sticky=W)
lb_a.config(bg='darkgray')
a_txt = Entry(root, width=6, textvariable=a, fg='black', font='Arial 12')
a_txt.grid(column=1, row=1, sticky=W)
a_txt.config(bg='darkgray')
lb_A = Label(root, text='мм', fg='black', font='Arial 12', justify=LEFT)
lb_A.grid(column=2, row=1, sticky=W)
lb_A.config(bg='darkgray')
b = StringVar()
b.set('')
lb_b = Label(root, text=' Ширина: ', fg='black', font='Arial 12')
lb_b.grid(column=0, row=2, sticky=W)
lb_b.config(bg='darkgray')
b_txt = Entry(root, width=6, textvariable=b, fg='black', font='Arial 12')
b_txt.grid(column=1, row=2, sticky=W)
b_txt.config(bg='darkgray')
lb_B = Label(root, text='мм', fg='black', font='Arial 12', justify=LEFT)
lb_B.grid(column=2, row=2, sticky=W)
lb_B.config(bg='darkgray')
d = StringVar()
d.set('')
lb_d = Label(root, text=' Высота: ', fg='black', font='Arial 12')
lb_d.grid(column=0, row=3, sticky=W)
lb_d.config(bg='darkgray')
d_txt = Entry(root, width=6, textvariable=d, fg='black', font='Arial 12')
d_txt.grid(column=1, row=3, sticky=W)
d_txt.config(bg='darkgray')
lb_D = Label(root, text='мм', fg='black', font='Arial 12', justify=LEFT)
lb_D.grid(column=2, row=3, sticky=W)
lb_D.config(bg='darkgray')
q = StringVar()
q.set('')
lb_q = Label(root, text=' Тираж: ', fg='black', font='Arial 12')
lb_q.grid(column=0, row=4, sticky=W)
lb_q.config(bg='darkgray')
q_txt = Entry(root, width=6, textvariable=q, fg='black', font='Arial 12')
q_txt.grid(column=1, row=4, sticky=W)
q_txt.config(bg='darkgray')
lb_quant = Label(root, text='шт', fg='black', font='Arial 12', justify=LEFT)
lb_quant.grid(column=2, row=4, sticky=W)
lb_quant.config(bg='darkgray')

def Enter():
    lbRes.configure(text='')
    try:
        a = int(a_txt.get())
        b = int(b_txt.get())
        d = int(d_txt.get())
        if pos_Radiobutton_reg_rab.get() == 0 and pos_return.get() == 0 and q.get() == '-':
            Money = money_white_10(a, b, d)
            lbRes.configure(text=(' Цена коробки: ' + str(Money) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
            lbCir.configure(text=' Тираж не указан.', bg='darkgray', fg='cyan', font='Arial 12', justify=LEFT)
        elif pos_Radiobutton_reg_rab.get() == 0 and pos_return.get() == 0 and len(q.get()) != 0:
            quant = int(q_txt.get())
            Money = money_white_10(a, b, d)
            Vseg = money_circulation(int(Money), quant)
            lbRes.configure(text=(' Цена коробки: ' + str(Money) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
            lbCir.configure(text=(' Цена тиража: ' + str(Vseg) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
        elif pos_Radiobutton_reg_rab.get() == 1 and pos_return.get() == 0 and q.get() == '-':
            Money = money_brown_10(a, b, d)
            lbRes.configure(text=(' Цена коробки: ' + str(Money) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
            lbCir.configure(text=' Тираж не указан.', bg='darkgray', fg='cyan', font='Arial 12', justify=LEFT)
        elif pos_Radiobutton_reg_rab.get() == 1 and pos_return.get() == 0 and len(q.get()) != 0:
            quant = int(q_txt.get())
            Money = money_brown_10(a, b, d)
            Vseg = money_circulation(int(Money), quant)
            lbRes.configure(text=(' Цена коробки: ' + str(Money) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
            lbCir.configure(text=(' Цена тиража: ' + str(Vseg) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
        elif pos_Radiobutton_reg_rab.get() == 0 and pos_return.get() == 1 and q.get() == '-':
            Money = money_white_100(a, b, d)
            lbRes.configure(text=(' Цена коробки: ' + str(Money) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
            lbCir.configure(text=' Тираж не указан.', bg='darkgray', fg='cyan', font='Arial 12', justify=LEFT)
        elif pos_Radiobutton_reg_rab.get() == 0 and pos_return.get() == 1 and len(q.get()) != 0:
            quant = int(q_txt.get())
            Money = money_white_100(a, b, d)
            Vseg = money_circulation(int(Money), quant)
            lbRes.configure(text=(' Цена коробки: ' + str(Money) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
            lbCir.configure(text=(' Цена тиража: ' + str(Vseg) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
        elif pos_Radiobutton_reg_rab.get() == 1 and pos_return.get() == 1 and q.get() == '-':
            Money = money_brown_100(a, b, d)
            lbRes.configure(text=(' Цена коробки: ' + str(Money) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
            lbCir.configure(text=' Тираж не указан.', bg='darkgray', fg='cyan', font='Arial 12', justify=LEFT)
        elif pos_Radiobutton_reg_rab.get() == 1 and pos_return.get() == 1 and len(q.get()) != 0:
            quant = int(q_txt.get())
            Money = money_brown_100(a, b, d)
            Vseg = money_circulation(int(Money), quant)
            lbRes.configure(text=(' Цена коробки: ' + str(Money) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
            lbCir.configure(text=(' Цена тиража: ' + str(Vseg) + ' руб.'), bg='darkgray', fg='gold', font='Arial 12', justify=LEFT)
        else:
            lbRes.configure(text=' Данная ветка не работает', bg='darkgray', fg='red', font='Arial 12')
    except ValueError:
        lbRes.configure(text=' Ошибка ввода', fg='red', font='Arial 12')
    except ZeroDivisionError:
        lbRes.configure(text=' Деление на ноль невозможно', fg='red', font='Arial 12')


lb1 = Label(root, text=' Тип гофрокартона:', font='Arial 12', fg='black')
lb1.grid(column=0, row=7, sticky=W)
lb1.config(bg='darkgray')
pos_Radiobutton_reg_rab = IntVar()
pos_Radiobutton_reg_rab.set(0)
Rbtn_1 = Radiobutton(text=' Белёный', variable=pos_Radiobutton_reg_rab, value=0, font='Arial 12')
Rbtn_2 = Radiobutton(text=' Бурый', variable=pos_Radiobutton_reg_rab, value=1, font='Arial 12')
Rbtn_1.grid(column=0, row=8, sticky=W)
Rbtn_2.grid(column=0, row=9, sticky=W)
Rbtn_1.config(bg='darkgray', fg='black')
Rbtn_2.config(bg='darkgray', fg='black')
lb2 = Label(root, text=' Тираж:', font='Arial 12')
lb2.grid(column=0, row=13, sticky=W)
lb2.config(bg='darkgray')
pos_return = IntVar()
pos_return.set(0)
Rbtn_4 = Radiobutton(text=' До 10 штук', variable=pos_return, value=0, font='Arial 12')
Rbtn_5 = Radiobutton(text=' До 100 штук', variable=pos_return, value=1, font='Arial 12')
Rbtn_4.grid(column=0, row=14, sticky=W)
Rbtn_5.grid(column=0, row=15, sticky=W)
Rbtn_4.config(bg='darkgray', fg='black')
Rbtn_5.config(bg='darkgray', fg='black')
lb0 = Label(root, text=' ', fg='black', font='Arial 2')
lb0.config(bg='darkgray')
lb0.grid(column=0, row=16, sticky=W)
button = Button(text='Посчитать', fg='blue', command=Enter, font='Arial 12')
label = Label(width=1, height=1)
button.grid(column=0, row=17, sticky=E)
label.grid(column=0, row=18, sticky=E)
label.config(bg='darkgray', fg='black')
button.config(bg='darkgray', fg='black')
lbRes = Label(root, text=' Расчетов пока нет.', bg='darkgray', fg='cyan', font='Arial 12')
lbRes.grid(column=0, row=5, sticky=W)
lbCir = Label(root, text=' Тираж не указан.', bg='darkgray', fg='cyan', font='Arial 12')
lbCir.grid(column=0, row=6, sticky=W)
root.mainloop()