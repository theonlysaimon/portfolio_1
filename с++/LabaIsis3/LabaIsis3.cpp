// LabaIsis3.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//
#include <conio.h> // подключам getch
#include <iostream>
#include <fstream>
#include <locale>
#include <istream>

using namespace std;

using std::endl;
using std::cout;
using std::cin;

//создание указатель на тип FILE
FILE* f;
ofstream file_of;

struct massiv_1_2_3 //создания структуры и присваивания перменных и создание массивов
{
    
    const int size_1 = 4;
    char* massiv_1 = new char[size_1];

    const int size_txt = 4;
    int* massiv_txt = new int[size_txt];

    const int size_bin = 4;
    int* massiv_bin = new int[size_bin];

}person;

//заполнение 1-го динамического массива (функция)
void input_1(massiv_1_2_3 obj, struct massiv_1_2_3& ssilka)
{
    cout << "Введите массив #1" << endl;
    cout << "Ввод" << ": ";

    for (int i = 0; i < ssilka.size_1; i++)
    {
        cin >> ssilka.massiv_1[i];
    }
}
//запись  1-го массива в текстовый файл (функция)
void print_mas_1_txt(massiv_1_2_3 obj, struct massiv_1_2_3& ssilka, FILE *f)
{
    file_of.open("mas_1_txt.txt");

    for (size_t i = 0; i < ssilka.size_1; i++)
    {
        file_of << ssilka.massiv_1[i];
    }
    cout << endl;
    file_of.close();
}
//запись  1-го массива в бианрный файл
void print_mas_1_bin(massiv_1_2_3 obj, struct massiv_1_2_3& ssilka, FILE* f)
{
    file_of.open("mas_1_bin.dat", ios::binary);
    for (size_t i = 0; i < 4; i++)
    {
        file_of << ssilka.massiv_1[i];
    }
    file_of.close();
    
}
//функция обращается к массиву 1-му и записывает по элементно в текстовый файл
void input_mas_2_txt(massiv_1_2_3 obj, struct massiv_1_2_3& ssilka, FILE* f)
{
    ifstream fin;
    fin.open("mas_1_txt.txt");
    
    char ch;
    int i = 0;
    while (fin.get(ch))
    {
        char bin = char(ch);
        ssilka.massiv_txt[i] = bin;
        i++;
    }
    fin.close();
}
//функция обращается к массиву 1-му и записывает по элементно в бинарный файл
void input_mas_3_bin(massiv_1_2_3 obj, struct massiv_1_2_3& ssilka, FILE* f)
{
    ifstream fin;
    fin.open("mas_1_bin.dat");

    char ch;
    int i = 0;
    while (fin.get(ch))
    {
        char al = char(ch);
        ssilka.massiv_bin[i] = al;
        i++;
    }
    fin.close();
}
//функция выводит значения который принял значения первого массива из текстового файла
void print_mas_2_txt(massiv_1_2_3 obj, struct massiv_1_2_3& ssilka, FILE* f)
{
    cout << "Массив #2: ";
    for (size_t i = 0; i < ssilka.size_txt; i++)
    {
        cout << char(ssilka.massiv_txt[i]) << "";
    }
    cout << endl;
}
//функция выводит значения который принял значения первого массива из бинарного файла
void print_mas_3_bin(massiv_1_2_3 obj, struct massiv_1_2_3& ssilka, FILE* f)
{
    cout << "Массив #3: ";
    for (size_t i = 0; i < ssilka.size_bin; i++)
    {
        cout << char(ssilka.massiv_bin[i]) << "";
    }
    cout << endl;
}
// мэйн где мы вызваем все выше указанные и определенные функции
int main()
{
    setlocale(LC_ALL, "Russian");
    
    //Создания указателя на массив
    struct massiv_1_2_3 ssilka;
    struct massiv_1_2_3* ukazatel = &ssilka;

    massiv_1_2_3 api;
    //ввод массива символьного типа
    input_1(api, *ukazatel);
    //ввод массива в бинарный и текстовый файл
    print_mas_1_bin(api, *ukazatel, f);
    print_mas_1_txt(api, *ukazatel, f);

    //считывания из текстовго файла в массив txt и вывод на экран значений
    input_mas_2_txt(api, *ukazatel, f);
    print_mas_2_txt(api, *ukazatel, f);

    //считывания из ,бинарного файла в массив bin и вывод на экран значений
    input_mas_3_bin(api, *ukazatel, f);
    print_mas_3_bin(api, *ukazatel, f);
}
