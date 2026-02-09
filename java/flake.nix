{
  description = "Java devshell template";

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

            # Build tools (pick one, or keep both):
            pkgs.gradle
            pkgs.maven

            # Developer tooling
            pkgs.jdt-language-server
            pkgs.google-java-format
            pkgs.checkstyle
            pkgs.git
            pkgs.pre-commit
          ];

          JAVA_HOME = "${jdk}";

          shellHook = ''
            echo "Entered Java devshell ($(${jdk}/bin/java -version 2>&1 | head -n1))"
            echo "JAVA_HOME=$JAVA_HOME"
          '';
        };
      }
    );
}
