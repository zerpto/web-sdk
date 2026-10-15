# How to use @zerpto/sdk

## Install

The package builds itself on install (`"prepare": "pnpm build"`, so `pnpm` must be available when installing).

```bash
# from GitHub
pnpm add github:zerpto/sdk-ts

# or from a local path
pnpm add /work/zerpto/sdk-ts
```

### Pinning a version

pnpm accepts any git ref after the `#`:

```bash
pnpm add github:zerpto/sdk-ts#<full-commit-hash>   # immutable, recommended until tags exist
pnpm add github:zerpto/sdk-ts#v1.0.0               # tag, once released
pnpm add github:zerpto/sdk-ts#main                 # branch; moves over time (same as no ref)
```

A commit hash always gives the same code. Get the current one with `git rev-parse HEAD`. Prefer the full 40-character hash.

### Getting updates

A consuming project does not learn about new commits by itself. The lockfile (`pnpm-lock.yaml`) records the exact commit it installed, and that commit is used until someone updates it.

- Hash or tag: change the ref in `package.json` (or re-run `pnpm add github:zerpto/sdk-ts#<new-ref>`), then commit the lockfile.
- Branch: run `pnpm update @zerpto/sdk` to move to the latest commit, then commit the lockfile.

To release a version, bump `version` in `package.json`, commit, then create a tag (`git tag v1.1.0`). Consumers can then install `#v1.1.0`.

## Use

```ts
import { Configuration, APIKeysApi } from "@zerpto/sdk";

const config = new Configuration({
  basePath: "https://api.zerpto.com",       // default, can be omitted
  accessToken: process.env.ZERPTO_API_KEY,  // sent as Authorization: Bearer
});

const api = new APIKeysApi(config);
const usage = await api.getUsage();         // responses are { data, meta }
```

Every API class and method is listed in the table in [README.md](README.md) and documented in [docs/](docs/).

## Notes

- **Auth:** the generated README example sets `accessToken` twice, once for `ApiKeyAuth` and once for `UserJWT`. Use only one. Public API clients use the tenant API key.
- **Internal operations:** the SDK is generated from the full spec, so operations marked `x-visibility: internal` (web app only) are included. Public API clients should not use them.
- **Idempotency:** POST endpoints that create or post financial records expect an `Idempotency-Key` header. Pass it through `initOverrides` or a middleware on `Configuration`.
- **Errors:** error responses are `{ error: { code, message, field, request_id } }`. Branch on `code`.

## Regenerate

Run the script. By default it reads the spec from `/Users/fathur/Codes/com.zerpto.openapi/dist/openapi.yaml`, copies it to `spec/openapi.yaml` (git-ignored), regenerates the SDK and builds it:

```bash
./scripts/generate.sh
```

To use another spec, set `ZERPTO_SPEC_URL` to a local path, a `file://` URL or an `http(s)` URL. A URL needs credentials, read from the environment or a git-ignored `.env` (see `.env.example`):

```bash
ZERPTO_SPEC_URL=https://docs.zerpto.my.id/api/openapi.yaml ./scripts/generate.sh
```
