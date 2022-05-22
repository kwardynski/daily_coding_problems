#include <iostream>
using namespace std;


int find_probability_index(float random_number, float probabilities[], int size) {
    
    // Initialize our "range" variables
    float prob_floor = 0.0;
    float prob_ciel;
    
    // Loop to find our probability "index"
    for (int i = 0; i < size; i++) {
        
        // Define our range upper bound
        prob_ciel = prob_floor + probabilities[i];
        
        // If random number within our defined range, return i
        if (prob_floor <= random_number && random_number < prob_ciel) {
            return i;
        }
        
        // If not, update range lower bound and move on
        else {
            prob_floor = prob_ciel;
        }
    }
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
