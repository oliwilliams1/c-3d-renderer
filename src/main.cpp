#include <iostream>
#include <vector>

int main() {
    // Variable shadowing
    int x = 10;
    {
        int x = 20;
        std::cout << x << std::endl;
    }
    std::cout << x << std::endl;

    // Uninitialized variable
    int y;
    std::cout << y << std::endl;

    // Potential conversion issues
    float z = 3.14;
    int i = z;
    std::cout << i << std::endl;

    // Array out of bounds
    int arr[5] = { 1, 2, 3, 4, 5 };
    arr[5] = 6;

    // Unused variable
    int unused = 10;

    // Possible memory leak
    std::vector<int> vec;
    vec.push_back(1);
    vec.push_back(2);

    return 0;
}