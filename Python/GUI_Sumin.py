from tkinter import *
import datetime
import math

f=open("GUI_Сумин.TXT","w")
data=str(datetime.date.today())
f.write(data+"\n")
f.write("Поволжский государственный университет телекоммуникаций и информатики"+"\n"+"\n"+"Контрольная работа"+"\n"+"Выполнил: студент ИСТ-93 Сумин Никита Данилович"+"\n"+"Проверил: С.Л.Гавлиевский"+"\n"+"\n")
f.write("GUI"+"\n"+"1.Вычислить гипотенузу, площадь и периметр  прямоугольного треугольника. Катеты вводит пользователь (GUI)."+"\n"+"Исходные данные - фиксированные;"+"\n"+"Результаты расчёта – фиксированные:"+"\n"+"\n"+"\n")
f.close()

def x1_kort(a,b):
	return int(math.sqrt(a*a+b*b))

def x1_list(a,b):
	mas=[]
	mas.append(str(round(math.sqrt(a*a+b*b))))
	myInt=''.join(mas)
	return int(myInt)

def S_kort(a,b): 
	return int(0.5*a*b)

def S_list(a,b):
	mas=[]
	mas.append(str(round(0.5*a*b)))
	myInt=''.join(mas)
	return int(myInt)

def P_kort(a,b,c):
	return int(a+b+c)

def P_list(a,b,c):
	mas=[]
	mas.append(str(round(a+b+c)))
	myInt=''.join(mas)
	return int(myInt)

root = Tk()
root.title('Расчёта гипотенузу, площадь и периметр  прямоугольного треугольника.')
root.geometry('550x220')

lb0=Label(root,text='Ввод исходных данных:')
lb0.grid(column=0, row=0, sticky=W)

# первый катет
a=StringVar()
a.set('5')
lb_a=Label(root,text='Первый катет: ')
lb_a.grid(column=0, row=1,sticky=W)
a_txt=Entry(root,width=10,textvariable=a)
a_txt.grid(column=1, row=1,sticky=W)


# второй катет
b=StringVar()
b.set('10')
lb_b=Label(root,text='Второй катет: ')
lb_b.grid(column=0, row=2,sticky=W)
b_txt=Entry(root,width=10,textvariable=b)
b_txt.grid(column=1, row=2,sticky=W)


def Enter():
	lbRes.configure(text='')
	try:


		a = int(a_txt.get())
		b = int(b_txt.get())

		if pos_Radiobutton_reg_rab.get()==0 and pos_return.get()==0:


			c = x1_kort(a,b)

			s = S_kort(a,b)

			p = P_kort(a,b,c)

			round(c, 1)
			round(s, 1)
			round(p, 1)

			lbRes.configure(text='Ответ: Гипотенуза = '+ str(c) + '; S= '+ str(s)+ '; P= '+ str(p), fg='black')

			f=open("Билет_Сумин.TXT","a")
			f.write("Фиксированные данные:"+"\n"+"Катет a = "+str(a)+"\n"+"Катет b = "+str(b)+"\n"+"Гипотенуза = "+str(c)+"\n"+"Площадь = "+str(s)+'\n'+"Периметр = "+str(p)+'\n'+'\n')
			f.close()

		elif pos_Radiobutton_reg_rab.get()==1 and pos_return.get()==0:

			c = x1_kort(a=a,b=b)

			s = S_kort(a=a,b=b)

			p = P_kort(a=a,b=b,c=c)

			round(c, 1)
			round(s, 1)
			round(p, 1)

			lbRes.configure(text='Ответ: Гипотенуза = '+ str(c) + '; S= '+ str(s)+ '; P= '+ str(p), fg='black')
			f=open("Билет_Сумин.TXT","a")
			f.write("Фиксированные данные:"+"\n"+"Катет a = "+str(a)+"\n"+"Катет b = "+str(b)+"\n"+"Гипотенуза = "+str(c)+"\n"+"Площадь = "+str(s)+'\n'+"Периметр = "+str(p)+'\n'+'\n')
			f.close()

		elif pos_Radiobutton_reg_rab.get()==2 and pos_return.get()==0:


			c = x1_kort(a,b=b)

			s = S_kort(a,b=b)

			p = P_kort(a,b=b,c=c)

			round(c, 1)
			round(s, 1)
			round(p, 1)

			lbRes.configure(text='Ответ: Гипотенуза = '+ str(c) + '; S= '+ str(s)+ '; P= '+ str(p), fg='black')
			f=open("Билет_Сумин.TXT","a")
			f.write("Фиксированные данные:"+"\n"+"Катет a = "+str(a)+"\n"+"Катет b = "+str(b)+"\n"+"Гипотенуза = "+str(c)+"\n"+"Площадь = "+str(s)+'\n'+"Периметр = "+str(p)+'\n'+'\n')
			f.close()


		elif pos_Radiobutton_reg_rab.get()==2 and pos_return.get()==1:


			c = x1_list(a,b=b)

			s = S_list(a,b=b)

			p = P_list(a,b=b,c=c)

			round(c, 1)
			round(s, 1)
			round(p, 1)

			lbRes.configure(text='Ответ: Гипотенуза = '+ str(c) + '; S= '+ str(s)+ '; P= '+ str(p), fg='black')
			f=open("Билет_Сумин.TXT","a")
			f.write("Фиксированные данные:"+"\n"+"Катет a = "+str(a)+"\n"+"Катет b = "+str(b)+"\n"+"Гипотенуза = "+str(c)+"\n"+"Площадь = "+str(s)+'\n'+"Периметр = "+str(p)+'\n'+'\n')
			f.close()


		elif pos_Radiobutton_reg_rab.get()==0 and pos_return.get()==1:


			c = x1_list(a,b)

			s = S_list(a,b)

			p = P_list(a,b,c)

			round(c, 1)
			round(s, 1)
			round(p, 1)

			lbRes.configure(text='Ответ: Гипотенуза = '+ str(c) + '; S= '+ str(s)+ '; P= '+ str(p), fg='black')
			f=open("Билет_Сумин.TXT","a")
			f.write("Фиксированные данные:"+"\n"+"Катет a = "+str(a)+"\n"+"Катет b = "+str(b)+"\n"+"Гипотенуза = "+str(c)+"\n"+"Площадь = "+str(s)+'\n'+"Периметр = "+str(p)+'\n'+'\n')
			f.close()


		elif pos_Radiobutton_reg_rab.get()==1 and pos_return.get()==1:


			c = x1_list(a=a,b=b)

			s = S_list(a=a,b=b)

			p = P_list(a=a,b=b,c=c)

			round(c, 1)
			round(s, 1)
			round(p, 1)

			lbRes.configure(text='Ответ: Гипотенуза = '+ str(c) + '; S= '+ str(s)+ '; P= '+ str(p), fg='black')
			f=open("Билет_Сумин.TXT","a")
			f.write("Фиксированные данные:"+"\n"+"Катет a = "+str(a)+"\n"+"Катет b = "+str(b)+"\n"+"Гипотенуза = "+str(c)+"\n"+"Площадь = "+str(s)+'\n'+"Периметр = "+str(p)+'\n'+'\n')
			f.close()

		else:
			lbRes.configure(text='ЭТА ВЕТКА ПРОГРАММЫ ПОКА НЕ РЕАЛИЗОВАНА')

	except ValueError:
		lbRes.configure(text='Ошибка ввода', fg='red')
	except ZeroDivisionError:
		lbRes.configure(text='Деление на ноль невозможно', fg='red')



#Позиция выбора режима работы
lb1=Label(root,text='Выбор вызова функции:')
lb1.grid(column=0, row=6)

pos_Radiobutton_reg_rab = IntVar()# Выбор режима работы программы
pos_Radiobutton_reg_rab.set(0)
Rbtn_1 = Radiobutton(text="Контрольный пример", variable=pos_Radiobutton_reg_rab, value=0)
Rbtn_2 = Radiobutton(text="Все данные фиксированные", variable=pos_Radiobutton_reg_rab, value=1)
Rbtn_3 = Radiobutton(text="Данные можно менять в диапазоне", variable=pos_Radiobutton_reg_rab, value=2)
Rbtn_1.grid(column=0, row=7,sticky=W)
Rbtn_2.grid(column=0, row=8,sticky=W)
Rbtn_3.grid(column=0, row=9,sticky=W)


#Позиция выбора return
lb2=Label(root,text='Возвращаем:')
lb2.grid(column=4, row=6)

pos_return = IntVar()##Позиция выбора return
pos_return.set(0)
Rbtn_4 = Radiobutton(text="Список", variable=pos_return, value=0)
Rbtn_5 = Radiobutton(text="Кортеж", variable=pos_return, value=1)
Rbtn_4.grid(column=4, row=7,sticky=W)
Rbtn_5.grid(column=4, row=8,sticky=W)


button = Button(text="Посчитать",fg='blue', command=Enter)
label = Label(width=20, height=10)
button.grid(column=1, row=10,sticky=W)
label.grid(column=1, row=11,sticky=W )




lbRes=Label(root, text='')
lbRes.grid(column=0, row=4,sticky=W )

root.mainloop()