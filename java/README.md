# Java devshell flake template

This template provides a Nix devshell with a JDK and common Java tooling.

## What you should put in the devshell

- A JDK version for the project (this template uses JDK 21)
- A build tool (`gradle` and/or `maven`)
- Formatting/linting/type tooling you want available everywhere (e.g. `google-java-format`, `checkstyle`)

## What you shouldn’t put in the devshell

- Project dependencies (those belong in `build.gradle(.kts)` or `pom.xml`)
- Big, project-specific stacks unless this template is dedicated to them

## Use

```bash
cd java
nix develop
```

If you use `direnv`, allow it once:

```bash
direnv allow
```

## Customization

- Change `jdk = pkgs.jdk21;` in `flake.nix` to another supported JDK.
- Remove either `gradle` or `maven` if your org standardizes on one.
