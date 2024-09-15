with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "c-3d-renderer";
  src = ./src;
  buildInputs = [ gcc glfw ];
  buildPhase = "c++ -o main.app main.cpp -Wall -Wextra -pedantic -Winit-self -Wold-style-cast -Woverloaded-virtual -Wuninitialized -Wmissing-declarations -Winit-self -ansi -Wdangling-pointer -Wformat-security -lGL -lpthread -ldl -isystem /home/adam/Programming/c-3d-renderer/include";

  installPhase = ''
    mkdir -p $out/bin
    cp main.app $out/bin/
    echo ${pkgs.glfw}
  '';
}
