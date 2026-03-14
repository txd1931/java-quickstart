# Java Quickstart

Minimal Java project template using Maven. All workflows are IDE-independent and driven entirely from the CLI via the Maven Wrapper.

## Requirements

- Java 21 ([Adoptium Temurin](https://adoptium.net/) recommended)
- Git

Maven is bundled via the wrapper (`mvnw` / `mvnw.cmd`) — no separate Maven installation needed.

## Build

```bash
# Unix
./mvnw package

# Windows
.\mvnw.cmd package
```

Produces `target/java-quickstart-1.0-SNAPSHOT.jar`.

## Run

```bash
java -jar target/java-quickstart-1.0-SNAPSHOT.jar
```

Or run directly without packaging:

```bash
# Unix
./mvnw exec:java

# Windows
.\mvnw.cmd exec:java
```

## Test

```bash
# Unix
./mvnw test

# Windows
.\mvnw.cmd test
```

## Code Quality

All checks run together during `verify`:

```bash
# Unix
./mvnw verify

# Windows
.\mvnw.cmd verify
```

This runs, in order:
- **Checkstyle** — Google Java Style enforcement
- **Spotless** — formatting check against the Eclipse formatter config in `config/formatting/`
- **SpotBugs** — static bug analysis

To auto-fix formatting violations:

```bash
# Unix
./mvnw spotless:apply

# Windows
.\mvnw.cmd spotless:apply
```

## Debug (CLI)

Requires two terminals.

**Terminal 1** — launch the app suspended, waiting for a debugger:

```bash
# Unix
./mvnw -Pdebug compile exec:exec

# Windows
.\mvnw.cmd -Pdebug compile exec:exec
```

**Terminal 2** — attach jdb:

```bash
jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=5005
```

Default port is `5005`. Override with `-Ddebug.port=<port>`.

## Project Structure

```
src/
  main/java/com/example/app/   # Application source
  test/java/com/example/app/   # Test source
config/
  formatting/                  # Eclipse formatter config (used by Spotless)
```