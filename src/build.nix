{ pkgs, nozzle }:
self: super: {
    main = nozzle.cpp-binary {
        name = "thing";
        source = [ ./main.cpp ];
        dependencies = [ pkgs.glfw pkgs.glew.dev ];
    };
}