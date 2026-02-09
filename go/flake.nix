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
        go = pkgs.go;
      in
      {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages =
            [
              go

              # Language server + debug
              pkgs.gopls
              pkgs.delve

              # Lint/format/test helpers
              pkgs.golangci-lint
              pkgs.gofumpt

              pkgs.git
              pkgs.pre-commit
              pkgs.gotestsum
            ];
        };
      }
    );
}
