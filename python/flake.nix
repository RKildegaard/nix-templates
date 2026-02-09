{
  description = "Python devshell template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        python = python315;
      in
      {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; 
          [
            python
            uv
            ruff
            pyright
            pre-commit
            git
            ipykernel
            jupyter
            notebook
            jupyterlab-lsp
            jedi-language-server
          ];
        };
      }
    );
}
