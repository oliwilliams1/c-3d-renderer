{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
        nozzle-base.url = "github:jake-arkinstall/nozzle";
    };

    outputs = { self, nixpkgs, flake-utils, nozzle-base }:
        flake-utils.lib.eachDefaultSystem (system:
            let
                pkgs = import nixpkgs { 
                    inherit system; 
                    overlays = [
                        (self: super: { 
                            nozzle = nozzle-base.lib { inherit pkgs; }; 
                        })
                    ];
                };
                examples = pkgs.nozzle.add-subdirectory { path = ./examples; };
                project = pkgs.nozzle.add-subdirectory { path = ./src; };
            in {
                devShells = {
                    default = pkgs.mkShell { buildInputs = (with pkgs;[  ]); };
                };
                packages = {
                    default = project.main;
                    # example-1 = examples.example-1;
                    # example-2 = examples.example-2;
                } // examples;
            });
}