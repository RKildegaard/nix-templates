# Java + Maven template

Includes:

- JDK 21 devshell
- Maven build with JUnit 5
- Example app + test

## Use

Run tests:

```bash
mvn test
```

Run the app:

```bash
mvn -q exec:java -Dexec.mainClass=example.App
```
