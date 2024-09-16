{ pkgs, nozzle }:
self: super: {
    example-1 = nozzle.cpp-binary {
        name = "example-1";
        source = [ ./example-1.cpp ];
    };
}