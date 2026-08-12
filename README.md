# infra-gh

Manages GitHub configuration for the SGF Devs organization with OpenTofu.

## Scope

- Owns: GitHub teams and team membership declared in this repo.
- Owns: team access to repositories declared in this repo.
- Owns: repository rulesets and supported organization settings declared in this repo.
- Does not own the GitHub App used to authenticate this stack.

## Structure

- `src/tf/`: Root OpenTofu stack and GitHub provider configuration.
- `.github/workflows/`: Credential-free OpenTofu validation.

## Run

```bash
cp .envrc.example .envrc
make help
make tf-init
make tf-plan
```

Authenticated runs use `GITHUB_APP_ID`, `GITHUB_APP_INSTALLATION_ID`, and `GITHUB_APP_PEM_FILE` as shown in `.envrc.example`.
