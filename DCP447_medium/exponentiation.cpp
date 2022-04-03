# include <iostream>

using std::cout;
using std::endl;


int custom_pow (int base, int exp) {
    int half_exp;
    int base_portion_1;
    int base_portion_2 = base;

    // If exp == 0, we can just return 1 without wasting any time
    if (exp == 0) {
        return 1;
    }

    // Return the variables necessary to construct the representative equation
    if (exp % 2 == 0) {
        base_portion_1 = 1;
        half_exp = exp/2;
    }
    else {
        base_portion_1 = base;
        half_exp = (exp-1)/2;
    }

    // Calculate the second portion of the representative equation
    for (int i = 2; i <= half_exp; i++) {
        base_portion_2 = base_portion_2 * base;
    }

    // Calculate the full answer
    return (base_portion_1)*(base_portion_2)*(base_portion_2);
}


int main () {
    cout << "2^10 = " << custom_pow(2,10)  << endl;
    cout << "3^4 = "  << custom_pow(3,4)   << endl;
    cout << "5^0 = "  << custom_pow(5,0)   << endl;
    cout << "12^1 = " << custom_pow(12, 1) << endl;
    cout << "-3^3 = " << custom_pow(-3, 3) << endl;
    return 0;
}