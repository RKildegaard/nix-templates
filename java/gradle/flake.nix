{
  description = "Java (Gradle) devshell template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        jdk = pkgs.jdk25;
      in
      {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = [
            jdk
            pkgs.gradle

            pkgs.jdt-language-server
            pkgs.google-java-format
            pkgs.checkstyle
            pkgs.git
            pkgs.pre-commit
          ];

          JAVA_HOME = "${jdk}";
        };
      }
    );
}
