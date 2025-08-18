#include<iostream>
using namespace std;

long fact(int n)
{
    if(n==0 || n==1)
        return 1;
    else
        return n * fact(n-1);
}

int main()
{
    long num;
    char ch;

    do
    {

        cout << "Enter a number: ";
        cin >> num;

        cout << "Factorial of " << num << " is " << fact(num) << endl;

        cout << "\nDo another (y/n): " ;
        cin >> ch;

    }

    while(ch!= 'n');
    return 0;
}