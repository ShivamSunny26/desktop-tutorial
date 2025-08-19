#include <iostream>
#include <process.h>
#include <conio.h>
using namespace std;

int main()
{
    char dir;

    while (dir != 'r')
    {
       
        cout << "\nEnter direction what you want.";
        cout<< "\nFor Sum press '+',"
            << "\nFor Subtraction press '-'," 
            << "\nFor Multiplication press '*',"
            << "\nFor Divison press '/'.\n";
        cin >> dir;

        switch (dir)
        {
        case '+':
            long long num1;
            long long num2;
            
            cout << "\nYour 1st number: ";
            cin >> num1;
            cout << "\nYour 2nd number: ";
            cin >> num2;
            cout << "\nSum: " << (num1+num2);
            break;
        case '-':
            long long num3;
            long long num4;
            cout << "\nYour 1st number: ";
            cin >> num3;
            cout << "\nYour 2nd number: ";
            cin >> num4;
            cout << "\nsubtraction: " <<(num3 - num4) ;
            break;
        case '*':
            long long num5, num6 ;
            cout << "\nYour 1st number: ";
            cin >> num5;
            cout << "\nYour 2nd number: ";
            cin >> num6;
            cout << "\nMultiplication: " << (num5* num6) ;
            break;
        case '/':
            
            {
                char choice;
                cout << "Divison in decimal or integer.";
                cout << " For Decimal type 'd',";
                cout << " or For Integer type 'i'.";
                cout << "\nEnter your choise: " ;
                cin >> choice;
                
                switch(choice)
                {
                    case 'i':
                        long long a1, a2;
                       
                        cout << "\nDividend: " ;
                        cin >> a1;
                        cout << "\nDivisor: " ;
                        cin >> a2;
                        cout << "\nQuotient: " << a1/a2;
                        cout << "\nReminder: " << a1%a2;
                        break;
                    case 'd': 
                        long double a3, a4;
                        

                        cout << "\nDividend: " ;
                        cin >> a3;
                        cout <<"\nDivisor: " ;
                        cin >> a4;
                        cout << "\nQuotient: "<< a3/a4;
                        break;
                }
            }
            break;
        }
    }
    cout << endl;
    return 0;
}