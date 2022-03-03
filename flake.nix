{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {

      trivial = {
        path = ./trivial;
        description = "A very basic flake";
      };

      simpleContainer = {
        path = ./simple-container;
        description = "A NixOS container running apache-httpd";
      };
    
      python = {
        path = ./python;
        description = "Python template, using poetry2nix";
      };

      rust = {
        path = ./rust;
        description = "Rust template, using Naersk";
      };

      bash-hello = {
        path = ./bash-hello;
        description = "An over-engineered Hello World in bash";
      };

      c-hello = {
        path = ./c-hello;
        description = "An over-engineered Hello World in C";
      };

      rust-web-server = {
        path = ./rust-web-server;
        description = "A Rust web server including a NixOS module";
      };

      compat = {
        path = ./compat;
        description = "A default.nix and shell.nix for backward compatibility with Nix installations that don't support flakes";
      };

      haskell-hello = {
        path = ./haskell-hello;
        description = "A Hello World in Haskell with one dependency";
      };

      hercules-ci = {
        path = ./hercules-ci;
        description = "An example for Hercules-CI, containing only the necessary attributes for adding to your project.";
      };
      
      idris2 = {
        path = ./idris2;
        description = "Idris2 template.";
      };

    };

    defaultTemplate = self.templates.trivial;

  };
}
