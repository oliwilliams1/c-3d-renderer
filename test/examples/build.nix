{ pkgs, nozzle }:
self: super: {
    example-1 = nozzle.cpp-binary {
        name = "thing";
        source = [ ./example-1.cpp ];
    };
    example-2 = nozzle.cpp-binary {
        name = "thing";
        source = [ ./example-2.cpp ];
        dependencies = [ pkgs.fmt_9 ];
    };
    printer = nozzle.cpp-library {
        name = "printer";
        headers = [ ./printer.h ];
        dependencies = [ pkgs.fmt_9 ];
    };
    example-3 = nozzle.cpp-binary {
        name = "thing";
        source = [ ./example-3.cpp ];
        dependencies = [ super.printer ];
    };
}