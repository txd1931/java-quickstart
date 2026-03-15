# Java Quickstart

Minimal Java project template using Maven.

Core workflows — build, test, debug, and code quality — are IDE-agnostic and driven entirely from the CLI via the Maven Wrapper. They work the same regardless of which editor you use. [VS Code](https://code.visualstudio.com/) is the recommended editor and is required for workflows that depend on editor-level integration, such as format-on-save and workspace-level Java configuration.

## Philosophy

This template is designed for fast solo project bootstrap while remaining practical for team use.

- **Clone-and-go setup**: the goal is to remove startup friction so a project can begin with working tooling before writing application code.
- **CLI-first workflows**: build, test, debug, and quality checks are executed through Maven Wrapper commands so behavior is consistent across environments.
- **IDE-agnostic core with VS Code recommendation**: the build pipeline does not depend on a specific IDE, while VS Code settings are provided as a practical, real-world default for editor integration.
- **Maven by industry convention**: Maven is used as the standard, predictable project contract in many Java codebases.
- **Quality tools enabled by default**: Checkstyle, Spotless, and SpotBugs are part of the default workflow to provide clear, explicit feedback from the CLI rather than relying on a heavily customized IDE.
- **Lightweight environment by design**: one main advantage of this template is keeping the development environment lean, with sensible defaults and wrapper-based commands instead of a heavy IDE-centric setup.

## Requirements

**Required**
- Java 21 ([Adoptium Temurin](https://adoptium.net/) recommended)
- Git

**Required for editor workflows**
- [VS Code](https://code.visualstudio.com/) with the [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)

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