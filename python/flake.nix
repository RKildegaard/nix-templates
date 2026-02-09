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
        python = pkgs.python315;
        pythonEnv = python.withPackages (ps: with ps; [
          ipykernel
          jupyter
          notebook
          jupyterlab
          jupyterlab-lsp
          jedi-language-server
        ]);
      in
      {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = [
            pythonEnv
            pkgs.uv
            pkgs.ruff
            pkgs.pyright
            pkgs.pre-commit
            pkgs.git
          ];
        };
      }
    );
}
