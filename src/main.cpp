#include <iostream>
#include <GLFW/glfw3.h>
#include <glad/glad.h> 

using namespace std;

int main() {
    string food = "Pizza";
    string* ptr = &food;
    std::cout << ptr << std::endl;
    return 0;
}
