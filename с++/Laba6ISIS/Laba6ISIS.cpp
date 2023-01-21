// Laba6ISIS.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include <iostream>

using namespace std;
using std::cout;
using std::cin;
using std::endl;

//односвязный список
struct list
{
    int chis; // поле данных
    struct list* ukaz; // указатель на следующий элемент
    list* next;
    int data;

};


//ввод данных для линейного списка
void input(list* link, int field) // link - звено, за которым вставляется новое
{
    list* q = new list; // 1 Выделение памяти под новое звено
    q->chis = field; // 2 Ввод данных
    q->ukaz = link->ukaz; // 3 Проведение связи от нового звена к следующему
    link->ukaz = q; // 4 Проведение связи от "старого" звена у новому
}


//вывод линейного списка
void print(list* link)
{
    list* q = link->ukaz; // Учитывается наличие "пустого" ведущего звена
    while (q)
    {
        cout << q->chis << '(' << &q << ')' << endl; // или другая операция
        q = q->ukaz; // Переход по списку
    }
    cout << endl;
}


//линейный поиск в массиве

int search_s1(float* item, int n, float key)
{
    for (int i = 0; i < n; i++)
        if (key == item[i])
            cout << i;
    return -1;
}

//сортировка массива
void select_sort(float* item)
{
    int a, b, c;
    int array;
    int change;
    for (a = 0; a < 5; ++a)
    {
        array = item[a]; // Текущий минимум
        c = a; // Индекс минимума
        change = 0; // Признак обмена
        for (b = a + 1; b < 5; ++b)
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

// двоичный поиск в массиве
char binary_search_in_an_array(float* item, int n, int key)
{
    int low, high, mid;
    low = 0; high = n - 1;
    while (low <= high)
    {
        mid = (low + high) / 2;
        if (key < item[mid])
            high = mid - 1;
        else
            if (key > item[mid])
                low = mid + 1;
            else
            {
                cout << mid;
                break;
            }
    }
    return -1;
}

//поиск в списке

int search_list(list* link, int field)
{
    list* q = new list;
    q->chis = field;

    for (int i = 0; i < 3; i++)
    {
        if (q->chis == field && field > 0 && field < 3)
        {
            i = q->chis - 1;
            cout << i;
        }
        q = q->next;
    }
    return -1;
}



int main()
{
    setlocale(LC_ALL, "Russian");

    float* student_surname = new float[5]; //массив

    list* spisk = new list;

    for (size_t i = 0; i < 5; i++)
    {
        cout << "[" << i+1 << "]: ";
        cin >> student_surname[i];
    }
    cout << "Вывод массива: ";
    for (size_t i = 0; i < 5; i++)
    {
        cout << student_surname[i] << " ";
    }
    cout << endl;
    

    list head3 = { 1, nullptr };//головное звено
    list head2 = { 2, &head3 };
    list head1 = { 3, &head2 };
    cout << endl;
    
    input(&head1, 1);

    cout << "Вывод списка: ";
    cout << endl;
    print(&head1);

    cout << endl;
    
    int num;
    cout << "Введите объект, который нужно найти в массиве: ";
    cin >> num;
    
    cout << "Поиск линейный в массиве: " << "[";
    search_s1(student_surname, 5, num);
    cout << "]" << " - ID данного объекта: " << num;
    cout << endl;

    select_sort(student_surname);
    cout << "Вывод массива после сортировки: ";
    for (size_t i = 0; i < 5; i++)
    {
        cout << student_surname[i] << " ";
    }
    cout << endl;

    int num2;
    cout << "Введите объект, который нужно найти в массиве после сортировки: ";
    cin >> num2;

    cout << "Поиск бинарный в массиве: " << "[";
    binary_search_in_an_array(student_surname, 10, num2);
    cout << "]" << " - ID данного объекта: " << num2;
    cout << endl;
    int num3;
    cout << "Введите объект, который нужно найти в списке: ";
    cin >> num3;
    cout << endl;

    cout << "Поиск в списке: " << "ID данного объекта: " << num3 << " = ";
    search_list(spisk, num3);

}

