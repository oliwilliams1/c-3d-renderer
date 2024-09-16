with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "c-3d-renderer";
  src = ./src;
  buildInputs = [ gcc glfw ];

  LD_LIBRARY_PATH="/run/opengl-driver/lib:${pkgs.glfw}/lib";

  buildPhase = "c++ -o main.app main.cpp -Wall -Wextra -pedantic -Winit-self -Wold-style-cast -Woverloaded-virtual -Wuninitialized -Wmissing-declarations -Winit-self -ansi -Wdangling-pointer -Wformat-security -lGL -lpthread -ldl";

  installPhase = ''
    mkdir -p $out/bin
    cp main.app $out/bin/
  '';
}