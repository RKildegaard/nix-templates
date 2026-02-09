{
  description = "Go devshell template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # Use the default Go toolchain from nixpkgs (kept current/supported).
        go = pkgs.go;
      in
      {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = [
            go

            # Language server + debug
            pkgs.gopls
            pkgs.delve

            # Lint/format/test helpers
            pkgs.golangci-lint
            pkgs.gofumpt
            pkgs.gotestsum
            pkgs.staticcheck

            pkgs.git
            pkgs.pre-commit
          ];

          shellHook = ''
            echo "Entered Go devshell ($(${go}/bin/go version))"
            if [ ! -f go.mod ]; then
              echo "Tip: run 'go mod init <module>'"
            fi
          '';
        };
      }
    );
}
