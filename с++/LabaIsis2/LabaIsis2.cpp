// LabaIsis2.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include <iostream>
#include <map>
#include <string>

using std::endl;
using std::cout;
using std::cin;

struct student //создания структуры и присваивания перменных и создание массивов
{ 
    
    const int size = 12;
    char* student_name = new char[size];

    long int s1 = 17042001;
    long int *ukaz = &s1;

    int per1 = 12;
    
    const int size_1 = 5;
    int* massiv_1 = new int[size_1];

}person;
//Создания указателя на массив
struct student ssilka;
struct student* ukazatel = &ssilka;

//2.1 инициализация структуры через функцию
void print_1(struct student* ukazatel, student obj)
{
    *ukazatel->massiv_1;

    cout << "Ваш массив до заполнения: " << endl;

    for (char i = 0; i < 5; ++i)
    {
        cout << obj.massiv_1[i] << " ";
    }
    cout << endl;

    cout << "Введите массив: " << endl;

    for (char i = 0; i < 5; ++i)
    {
        cout << "[" << i + 1 << "]" << ": ";
        cin >> obj.massiv_1[i];
    }

    cout << "Ваш массив: " << endl;

    for (char i = 0; i < 5; ++i)
    {
        cout << obj.massiv_1[i] << " ";
    }
    cout << endl;
}
//2.3 Вывод значений массива
void print_2(struct student* ukazatel, student obj) //создаем функцию, которая принимает структуру, как параметр
{
    *ukazatel->massiv_1;
    cout << "Ваш массив: " << endl;
    for (int i = 0; i < 5; ++i)
    {
        cout << obj.massiv_1[i] << " ";
    }
    cout << endl;
}

//2.2 Заполнение массива чисел
void numbers_input(struct student* ukazatel, student obj)
{
    *ukazatel->massiv_1;
    cout << "Введите массив чисел int " << endl;
    for (int i = 0; i < 5; i++)
    {
        cout << "[" << i + 1 << "]" << ": ";
        cin >> obj.massiv_1[i];
    }
}

//2.4 ввод информации во все поля 
void Field_entry(student obj, struct student &ssilka)
{
    //name
    cout << "Введите имя студента и фамилия" << endl;
    for (size_t i = 0; i < 12; i++)
    {
        cin >> ssilka.student_name[i];
    }

}

//2.5 Вывод всех объектов структуры, кроме массива целых чисел
void print_all(student obj, struct student& ssilka)
{
    cout << "Массив динамический типа char (Имя студента): ";
    for (size_t i = 0; i < 12; i++)
    {
        cout << ssilka.student_name[i] << "";
    }
    cout << endl;

    cout << "Переменная типа long int: " << ssilka.s1 << endl;
    cout << "Указатель на перменную типа long int: " << ssilka.ukaz << endl;
    cout << "Переменная типа int: " << ssilka.per1 << endl;

}
//Очистка памяти объектов структуры
void Delete(student obj, struct student& ssilka)
{
    delete[] ssilka.massiv_1;
    delete[] ssilka.student_name;
    cout << "Данные успешно отчищены" << endl;
}
//Вызов всех функций пункт 3
int main()
{
    setlocale(LC_ALL, "Russian");
    student api;
    //иницилизация структуры
    print_1(ukazatel, api);
    //Ввод массива целых чисел
    numbers_input(ukazatel, api);
    //Вывод массива целых чисел
    print_2(ukazatel, api);
    //Ввод имени студент
    Field_entry(api, *ukazatel);
    cout << endl; 
    //Вывод всех значений на экран кроме массива целых чисел
    print_all(api, *ukazatel);
    //Очистка памяти
    system("pause");
    Delete(api, *ukazatel);

    system("pause");
}
