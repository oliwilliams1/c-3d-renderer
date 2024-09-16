with import <nixpkgs> {};
let mcc-env = (callPackage /home/adam/mini_compile_commands {}).wrap stdenv;
in (mkShell.override {stdenv = mcc-env;}) {
   buildInputs = [ cmake gtest ];
}