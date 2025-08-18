#include<iostream>
using namespace std;

struct Node
{
    int data;
    Node* next;

};

//Inserting a new node at the begning off the list
void insert(Node** head, int data)
{
    Node* newNode = new Node;
    newNode ->data = data;
    newNode-> next = *head;
    *head = newNode;

}


//Print the List 
void print(Node* head)
{
    while (head!= NULL)
    {
        cout << head-> data << " " ;
        head = head-> next;
    }
}

int main()
{
    Node* head  = NULL;

    insert(&head,40);
    insert(&head, 23);
    insert(&head, 38);
    insert(&head, 23);

    cout << "The linked list is: " ;
    print(head);

    return 0;

}