// Laba5Isis.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.

#include <iostream>
#include <cstdlib>

using namespace std;
using std::cout;
using std::cin;
using std::endl;

//Функция метода отбора
void select_sort(float* item, int n)
{
    int a, b, c;
    char array;
    int change;
    for (a = 0; a < n - 1; ++a)
    {
        array = item[a]; // Текущий минимум
        c = a; // Индекс минимума
        change = 0; // Признак обмена
        for (b = a + 1; b < n; ++b)
            if (item[b] < array)
            {
                array = item[b]; // Начало обмена
                c = b; // Новый минимум
                change = 1; // Признак обмена
            }
        if (change)
        {
            item[c] = item[a]; // Продолжение обмена
            item[a] = array;
        }
    }
}
//Функция быстрой сортировки
void fast_sort(float* item, int left, int right)
{
    int i, j;
    char comp, buf;
    i = left; 
    j = right;
    comp = item[(left + right) / 2]; // Компаранд
    do {
        while (item[i] < comp && i < right)
            i++;
        while (comp < item[j] && j > left)
            j--;
        if (i <= j)
        {
            buf = item[i]; // Обмен
            item[i] = item[j];
            item[j] = buf;
            i++;
            j--;
        }
    } while (i <= j);
    if (left < j)
        fast_sort(item, left, j);
    if (i < right)
        fast_sort(item, i, right);
   
}
//сортировка в обратном порядке
void reverse(float a[], size_t n)
{
    for (size_t i = 0; i < n / 2; i++)
    {
        int tmp = a[i];
        a[i] = a[n - i - 1];
        a[n - i - 1] = tmp;
    }
}


int main()
{
    setlocale(LC_ALL, "Russian");
    //размер массива
    const int size = 5;
    //создание массива типа float
    float* massiv = new float[size];

    cout << "Ваш массив: " << endl;
    //Заполнение массива рандомными числами
    for (int i = 0; i < size; i++) {
        massiv[i] = rand();
        cout << massiv[i] << " ";
    }
    cout << endl;
    //Заполение массива пользователем
    cout << "Заполните массив: " << endl;
    for (size_t i = 0; i < size; i++)
    {
        cout << "[" << i + 1 << "]: ";
        cin >> massiv[i];
    }
    cout << endl;
    //Вызов функции в обратном порядке
    cout << "Ваш массив после ревёрса: " << endl;
    reverse(massiv, size);
    //вывод массива
    for (size_t i = 0; i < 5; i++)
    {
        cout << massiv[i] << " ";
    }
    cout << endl;
    //Вызов функции отбора
    cout << "Ваш массив после отбора: " << endl;
    select_sort(massiv, size);
    //вывод массива
    for (size_t i = 0; i < 5; i++)
    {
        cout << massiv[i] << " ";
    }
    cout << endl;
    //Вызов функции быстрой сортировки
    cout << "Ваш массив после быстрой сортировки: " << endl;
    fast_sort(massiv, size, size);
    //вывод массива
    for (size_t i = 0; i < size; i++)
    {
        cout << massiv[i] << " ";
    }
}
