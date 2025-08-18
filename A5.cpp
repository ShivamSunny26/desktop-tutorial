#include<iostream> 
using namespace std;
#define MAX_SIZE 100

class Queue {
    private: 
        int arr[MAX_SIZE];
        int front;
        int rear;

    public:
        Queue()
        {
            front = -1;
            rear = -1;

        }

        bool isEmpty()
        {
            return front == -1 && rear == -1;
        }

        bool isFull()
        {
            return rear == MAX_SIZE - 1;

        }

        void enqueue(int x)
        {
            if (isFull())
            {
                cout<< "Error: Queue is Full\n";
                return;
            }

            if(isEmpty())
            {
                front = rear = 0;
            }
            else {
                rear++;
            }
            arr[rear] = x;

        }

        void dequeue() 
        {
            if (isEmpty())
            {
                cout<< "Error: Queue is empty\n";
                return;
            }
            if(front == rear)
            {
                front = rear = -1;

            }
            else {
                front ++;
            }
        }

        int getFront()
        {
            if(isEmpty())
            {
                cout << "Error: Queue is empty\n";
                return -1;
            }

            return arr[front];
        }

        void printQueue(){
            if(isEmpty())
            {
                cout << "Error: Queue is empty\n";
                return;
            }

            for (int i = front; i <= rear; i++)
            {
                cout << arr[i] << " " ;

            }
            cout << endl;
        }
};

int main()
{
    Queue q;

    q.enqueue(10);
    q.enqueue(20);
    q.enqueue(30);
    q.enqueue(40);
    q.enqueue(50);

    q.printQueue();

    q.dequeue();
    q.dequeue();

    q.printQueue();

    cout << "Front element: "<< q.getFront() << endl;

    return 0;
}