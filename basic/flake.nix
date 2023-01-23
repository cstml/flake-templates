{
  description = "A basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system:
  let
    overlays = [ ];

    pkgs = import nixpkgs {inherit system overlays;};

    additionalPkgs = with pkgs; [  ];

    cmake-bin = pkgs.cmake;

    buildPkgs = with pkgs; [ cmake-bin ]; 

    project = pkgs.stdenv.mkDerivation {
      name = "flake-env";
      root = self;
      buildInputs = buildPkgs;
      shellInputs = additionalPkgs;
    };
  in {
# Used by `nix build` & `nix run` (prod exe)
  defaultPackage = project;

# Used by `nix develop` (dev shell)
  devShell = project;
  });
}
