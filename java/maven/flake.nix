{
  description = "Java (Maven) devshell template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        jdk = pkgs.jdk21;
      in
      {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = [
            jdk
            pkgs.maven

            pkgs.jdt-language-server
            pkgs.google-java-format
            pkgs.checkstyle
            pkgs.git
            pkgs.pre-commit
          ];

          JAVA_HOME = "${jdk}";

          shellHook = ''
            echo "Entered Java (Maven) devshell ($(${jdk}/bin/java -version 2>&1 | head -n1))"
            echo "Tip: run 'mvn test'"
          '';
        };
      }
    );
}
