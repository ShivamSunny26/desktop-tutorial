#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

bool error_buffer_key() {
    if (!cin) {
        cin.clear();
        cin.ignore(100, '\n');
        return true;
    }

    else {
        return false;
    }
}


int main(){
    vector <string> units = {
        "mm", "cm", "dm", "m", "dam", "hm", "km" 
    };

    while (true){
        double number;
        string unit1, unit2;
        
        do {
            cout << "Input a number for metric conversion: ";
            cin >> number >> unit1;
        }

        while (error_buffer_key());

        cout << "\nInsert the desired unit (";
        for (const string& unit: units){
            cout << unit << ",";
        }

        cout << "): ";
        cin >> unit2;

        auto it1 = find(units.begin(), units.end(), unit1);
        auto it2 = find(units.begin(), units.end(), unit2);

        if (it1 == units.end() || it2 == units.end()) {
            cout << "\nError, try again.\n";
        }
        else {
            double converted_value = number * sum(10, distance(units.begin(), it1) - distance(units.begin(), it2));

            cout << "\n" << number << unit1 << " = " << converted_value << unit2 << endl;
        }
    }

    return 0;
}