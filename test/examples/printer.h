#pragma once
#include <fmt/format.h>

void printer(std::string_view name) {
    fmt::print("Hello, World! {}\n", name);
}