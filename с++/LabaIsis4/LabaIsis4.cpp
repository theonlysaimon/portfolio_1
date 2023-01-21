// LabaIsis4.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.

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
    long int* ukaz = &s1;

    int per1 = 12;

    const int size_1 = 5;
    int* massiv_1 = new int[size_1];

}person;
//Создания указателя на массив
struct student ssilka;
struct student* ukazatel = &ssilka;

//структура для создания односвязного списка
struct list
{
    int field; // поле данных
    struct list* next; // указатель на следующий элемент
};
//структура для создания двусвязного списка
struct list2
{
    int field;
    list2* next, * prev;
};
//структура для создания двусвязного циклическго списка
struct ListZikl
{
    int fiel;
    ListZikl* net,* pred;
};

//функция добаления элементов односвязного списка
void input(list* link, int field) // link - звено, за которым вставляется новое
{
    list* q = new list; // 1 Выделение памяти под новое звено
    q->field = field; // 2 Ввод данных
    q->next = link->next; // 3 Проведение связи от нового звена к следующему
    link->next = q; // 4 Проведение связи от "старого" звена у новому
}
//функция добавления элементов двусвязного списка
void input2(list2* link, int field)
{
    list2* q = new list2; // 1 Выделение памяти под звено
    q->field = field; // 2 Ввод данных
    q->next = link->next; // 3 Проведение связи от нового звена вперѐд
    q->prev = link; // 4 Проведение связи от нового звена назад
    link->next = q; // 5 Проведение связи от предыдущего звена к новому
    if (q->next) // Проверка наличия следующего звена
        q->next->prev = q; // 6 Проведение связи от следующего звена к новому
}
//функция добавления элементов циклического двусвязного списка
void InputZikl(ListZikl* Pred, int data)
{
    ListZikl* Loc = new ListZikl; 
    Loc->fiel = data; 
    Loc->net = Pred->net; 
    Loc->pred = Pred; 
    Pred->net = Loc; 
    Loc->net->pred = Loc; 
}
//функция удаления элементов односвязного списка
void Delete1(list* del) // link - звено, предшествующее удаляемому
{
    list* q;
    if (del->next) // Проверка на наличие звена
    {
        q = del->next; // 1 Запоминание удаляемого звена для операции delete
        del->next = q->next; // 2 Проведение новой связи в обход удаляемого звена
        delete q; // 3 Освобождение памяти
    }
}
//функция удаления двусвязного списка
void Delete2(list2* del)
{
    list2* curr = del->next;
    if (curr != NULL)
    {
        del->next->prev = del->prev; // Обработка связи назад
        delete del; // Освобождение памяти
    }
    cout << "Двусвязный список удачно удалён!";
}
//функция удаления двусвязного циклического списка
void DeleteZikl(ListZikl* Del)
{
    Del->pred->net = Del->net; 
    Del->net->pred = Del->pred; 
    delete Del; 
    cout << "Двусвязный циклический список удачно удалён!";
}
//Функция вывода односвязного списка
void print(list* link)
{
    list* q = link->next; // Учитывается наличие "пустого" ведущего звена
        while (q)
        {
            cout << q->field <<'(' << &q << ')' << endl; // или другая операция
            q = q->next; // Переход по списку
        }
    cout << endl;
}
//Функция вывода двусвязного списка
void Print2(list2* link)
{
    list2* q = link->next; // Учитывается наличие "пустого" ведущего звена
    while (q)
    {
        cout << q->field << '(' << &q << ')' << endl; // или другая операция
        q = q->next; // Переход по списку
    }
    cout << endl;
}
//Функция вывода двусвязного циклического списка
void PrintZ(ListZikl* link)
{
    ListZikl* c = link->net; // Учитывается наличие "пустого" ведущего звена
    while (c!=link && !0)
    {
        cout << c->fiel << '(' << &c << ')' << endl; // или другая операция
        c = c->net; // Переход по списку
    }
    cout << endl;
}

int main()
{
    setlocale(LC_ALL, "Russian");
    list head3 = { 1, nullptr };//головное звено
    list head2 = { 1, &head3 };
    list head1 = { 2, &head2 };
    //добавление элементов списка
    input(&head1, 622);
    input(&head1, 123);
    input(&head1, 412);
    input(&head2, 445);
    cout << "Односвязный список после добавления: " << endl;
    print(&head1);
    //удаление элементов списка
    Delete1(&head1);
    Delete1(&head1);
    //вывод элементов списка
    cout << "Односвязный список после удаления двух элементов: " << endl;
    print(&head1);

    //головное звено
    list2* L2 = new list2;
    L2->next = NULL;
    L2->prev = NULL;
    
    //добавления элементов двусвязного списка
    input2(L2, 412);
    input2(L2, 445);
    input2(L2, 341);
    input2(L2, 124);
    //вывод двусвязного списка
    cout << endl << "Двусвязный список после добавления: " << endl;
    Print2(L2);
    //удаления двусвязного списка
    Delete2(L2);
    cout << endl;
    //головное звено
    ListZikl* Lz = new ListZikl;
    Lz->net = Lz;
    Lz->pred = Lz;
    //добавление элементов двусвязного циклического списка
    InputZikl(Lz, 23);
    InputZikl(Lz, 22);
    InputZikl(Lz, 21);
    InputZikl(Lz, 12);
    cout << endl << "Циклический список после добавления: " << endl;
    PrintZ(Lz);
    //удаление двусвязного циклического списка
    DeleteZikl(Lz);
    cout << endl;
}

