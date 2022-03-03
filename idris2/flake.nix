{
  description = "A simple idris2 flake.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        p = import nixpkgs {inherit system;};
        default-pkg = {
          name = "default-pkg";
          src = self;
          buildInputs = [ p.idris2 ];
        };
      in {
        devShell = p.mkShell default-pkg;
        defaultPackage = p.stdenv.mkDerivation (default-pkg);
      });
}
