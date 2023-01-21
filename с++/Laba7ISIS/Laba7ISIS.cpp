// Laba7ISIS.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
#include<iostream>
#include<stdlib.h>
#include<conio.h>

using namespace std;

struct student
{
    const int size = 20;

    char student_name[20];

    char* student_surname = new char[size];

    int chislo = 5;
    int* ukazetel = &chislo;
    float peremennaya;
    char key;

    int data;
    student* left;
    student* right;
};

student* FindMin(student* node)
{
    if (node == NULL)
    {
        return NULL;
    }
    if (node->left)
        return FindMin(node->left);
    else
        return node;
}
student* FindMax(student* node)
{
    if (node == NULL)
    {
        return NULL;
    }
    if (node->right)
        return(FindMax(node->right));
    else
        return node;
}
student* Insert(student* node, int data)
{
    if (node == NULL)
    {
        student* temp;
        temp = new student;
        temp = (student*)malloc(sizeof(student));
        temp->data = data;
        temp->left = temp->right = NULL;
        return temp;
    }
    if (data >= (node->data))
    {
        node->right = Insert(node->right, data);
    }
    else if (data <= (node->data))
    {
        node->left = Insert(node->left, data);
    }
    return node;
}
student* Delet(student* node, int data)
{
    student* temp;
    if (node == NULL)
    {
        cout << "Элемент не найден";
    }
    else if (data < node->data)
    {
        node->left = Delet(node->left, data);
    }
    else if (data > node->data)
    {
        node->right = Delet(node->right, data);
    }
    else
    {
        if (node->right && node->left)
        {
            temp = FindMin(node->right);
            node->data = temp->data;
            node->right = Delet(node->right, temp->data);
        }
        else
        {
            temp = node;
            if (node->left == NULL)
                node = node->right;
            else if (node->right == NULL)
                node = node->left;
            free(temp);
        }
    }
    return node;
}
student* Find(student* node, int data)
{
    if (node == NULL)
    {
        return NULL;
    }
    if (data > node->data)
    {
        return Find(node->right, data);
    }
    else if (data < node->data)
    {
        return Find(node->left, data);
    }
    else
    {
        return node;
    }
}

void Inorder(student* node)//последовательный просмотр
{
    if (node == NULL)
    {
        return;
    }
    if (node == NULL) return;
    Inorder(node->left);
    cout << node->data << " ";
    Inorder(node->right);
}
void preorder(student* node)//нисходящий просмотр
{
    if (node == NULL)
    {
        return;
    }
    cout << node->data << " ";
    preorder(node->left);
    preorder(node->right);
}
void postorder(student* node)//восходящий просмотр
{
    if (!node) return;
    postorder(node->left);
    postorder(node->right);
    cout << node->data << " ";
}

student* Tree(int n, student* node)//сбалансированное дерево
{
    student* r;
    int nl, nr;
    if (n == 0) { node = NULL; return node; }
    nl = n / 2;
    nr = n - nl - 1;
    r = new student;
    cout << "["<< "элемент" <<"]: ";
    cin >> r->data;
    r->left = Tree(nl, r->left);
    r->right = Tree(nr, r->right);
    node = r;
    return node;
}
void Run(student* node, int level)
{
    if (node)
    {
        Run(node->left, level + 1);
        for (int i = 0; i < level; i++) cout << "  ";
        cout << node->data << endl;
        Run(node->right, level + 1);
    }
}


int main()
{
    setlocale(LC_ALL, "russian");

    student* root = NULL, * temp;
    int ch;
    int ch_1;
    student* p = 0;

    while (1)
    {
        cout << "\n1.Вставка\n2.Элементы в последовательном прохождении\n3.Эллементы в нисходящий прохождении\n4.Эллементы в восходящем прохождении\n5.Удаление элемента\n6.Поиск элемента\n7.Cоздание сбалансированного дерева\n8.Вывод дерева\n10.Выход";
        cout << endl;
        cout << "\nВведите пункт меню:";
        cin >> ch;
        switch (ch)
        {
        case 1:
            
            cout << "\nВведите эллемент для вставки:";
            cin >> ch;
            root = Insert(root, ch);
            
            break;
        case 2:
            
            cout << "\nЭллементы в последовательном прохождении:";
            Inorder(root);
            
            break;
        case 3:
            
            cout << "\nЭллементы в нисходящем прохождении:";
            preorder(root);
            
            break;
        case 4:
            
            cout << "\nЭллементы в восходящем прохождении:";
            postorder(root);
            
            break;
        case 5:
            
            cout << "\nУдаление элемента:";
            cin >> ch;
            root = Delet(root, ch);
            
            break;
        case 7:
            
            cout << "Введите количество элементов для создания сбалансированного дерева: ";
            cin >> ch;
            root = Tree(ch, p);
            
            break;
        case 6:
            
            cout << "\nПоиск элемента:";
            cin >> ch;
            root = Find(root, ch);

        case 8:
            
            cout << "\nВведите количество элементов:";
            cin >> ch;
            Run(root, ch);

            break;
        case 10:
            exit(0);
            break;
        default:
            cout << "\nНеверный пункт меню , введите ищё раз :";
            break;
        }
    }
    return 0;
}
