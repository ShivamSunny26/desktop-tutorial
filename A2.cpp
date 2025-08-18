#include<iostream>
using namespace std;
class Node{
    public:
        int data;
        Node* next;
};

class Linkedlist{
    public:
        Node* head;
        Linkedlist(){
            head = NULL;
        }

        void insert(int data)
        {
            Node* newNode = new Node();
            newNode-> data = data;
            newNode->next = head;
            head = newNode;
        }

        void display(){
            Node* temp = head;
            while (temp != NULL)
            {
                cout << temp->data << " ";
                temp = temp->next;
            }
        }
};

int main()
{
    Linkedlist list;
    list.insert(5);
    list.insert(35);
    list.insert(23);
    list.insert(12);
    list.display();
    return 0;
}