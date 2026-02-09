# Go devshell template

Includes a Nix devshell with:

- `gopls` + `dlv`
- `golangci-lint`, `staticcheck`, `gofumpt`, `gotestsum`

## Use

If you use `direnv`:

```bash
direnv allow
```

## Try the example

```bash
go test ./...

go run ./cmd/hello
```
