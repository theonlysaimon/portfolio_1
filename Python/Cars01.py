d=1
while d>0: 
	d+=1
	try:
		print("Программа для расчёта")

		y=str(input("Что делаем? (считаем, выходим): "))

		if y=="выходим":
			break

		elif y=="считаем":

			a=int(input("Введите километры до пункта назначения(считает туда и обратно): "))
			b=int(input("Введите цену бензина за 1 литр: "))
			c=int(input("Введите расход на 100 км: "))

			x=((a*2)*(100/c))*b

			print( "Цена бензина равна: ", x,"\n")
 
		else:
			print("Выбранна неверная операция!(ОШИБКА)")

	except ValueError:
		print("Скорее всего нужно вводить цыфры!(ОШИБКА)")
"""
package com.javacourse.se.cars;

import org.w3c.dom.ls.LSOutput;

import java.util.Scanner;

public class OilOperat {
    public void foo() {

        Scanner input = new Scanner(System.in);

        System.out.print("Введите километры до пункта назначения(считает туда и обратно): ");
        double a = input.nextDouble();

        System.out.print("Введите цену бензина за 1 литр: ");
        double b = input.nextDouble();

        System.out.print("Введите расход на 100 км: ");
        double c = input.nextDouble();

        double x = ((a * 2) * (100 / c)) * b;

        // Отображение результата
        System.out.println("Цена бензина равна: " + x);
    }
}
"""