# Go devshell template

Includes a Nix devshell with:

- Go (prefers `go_1_23` if available)
- `gopls` + `dlv`
- `golangci-lint`, `staticcheck`, `gofumpt`, `gotestsum`

## Use

```bash
cd go
nix develop
```

If you use `direnv`:

```bash
direnv allow
```

## Try the example

```bash
go test ./...

go run ./cmd/hello
```
