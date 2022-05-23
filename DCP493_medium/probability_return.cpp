#include <iostream>
using namespace std;


int find_probability_index(float random_number, float probabilities[], int size) {
    
    // Initialize our "range" variables
    float prob_floor = 0.0;
    
    // Loop to find our probability "index" to check if our random number has surpassed
    // the probability range it exists in
    int i;
    for (i = 0; i < size; i++) {
        
        // If we've exceeded the range, return the previous value of i
        if (random_number < prob_floor) {
            return i - 1;
        }
        // If not, increase prob_floor accordingly and try again
        else {
            prob_floor = prob_floor + probabilities[i];
        }
    }
    return i-1;
}



int main()
{

    // Testing variables given by the problem    
    int numbers[] = {1,2,3,4};
    float probabilities[] = {0.1, 0.5, 0.2, 0.2};
    int probability_index, result;
    
    // Generate our random number
    srand((unsigned) time(NULL));
    float random_number = (float) rand()/RAND_MAX;
    
    // Obtain result    
    probability_index = find_probability_index(random_number, probabilities, sizeof(probabilities)/sizeof(probabilities[0]));
    result = numbers[probability_index];
    
    // Display result
    cout << random_number << " | " << result << endl;
    return 0;
}
