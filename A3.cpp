#include<iostream>
using namespace std;

int main()
{
    // Decalre an array 
    int arr[5];

    // Intialising the array
    arr[0] = 10;
    arr[1] = 20; 
    arr[2] = 30; 
    arr[3] = 40;
    arr[4]= 50;

    //Printing the array 
    for (int i = 0; i< 5; i++)
    {
        cout <<  "Index an element "<< i<< " " << arr[i] <<endl; 
    }

    return 0;
}