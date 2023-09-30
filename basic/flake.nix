{
  description = "A basic flake";

  inputs = {
    nixpkgs.url     = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system:
  let
    overlays       = [ ];
    pkgs           = import nixpkgs {inherit system overlays;};
    additionalPkgs = with pkgs; [  ];
    buildInputs    = with pkgs; [ cmake-bin ]; 

    project = pkgs.stdenv.mkDerivation {
      inherit buildInputs;
      name        = "flake-env";
      root        = self;
      shellInputs = additionalPkgs;
    };

  in {
  packages.default  = project; # default package
  devShells.default = project; # dev shell
  });
}
