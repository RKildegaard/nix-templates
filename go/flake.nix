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

        opt = attr: pkgs.lib.optionals (builtins.hasAttr attr pkgs) [ (builtins.getAttr attr pkgs) ];
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
            ]
            ++ opt "gotestsum"
            ++ opt "staticcheck";

          shellHook = ''
            echo "Entered Go devshell ($(${go}/bin/go version))"
            if [ ! -f go.mod ]; then
              echo "Tip: run 'go mod init <module>'"
            else
              echo "Tip: run 'go test ./...'"
              echo "Tip: run 'go run ./cmd/hello'"
            fi
          '';
        };
      }
    );
}
