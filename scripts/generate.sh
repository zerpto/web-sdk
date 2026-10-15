#!/usr/bin/env bash
# Fetch the latest OpenAPI spec and regenerate the TypeScript SDK in the repo root.
#
# Credentials are read from the environment, or from a git-ignored .env file:
#   ZERPTO_SPEC_USER=...
#   ZERPTO_SPEC_PASSWORD=...
# Optional: ZERPTO_SPEC_URL overrides the spec location. It can be an http(s) URL
# (e.g. https://docs.zerpto.my.id/api/openapi.yaml) or a local file (a path or
# file:// URL). The default is the local build in com.zerpto.openapi; a local file
# needs no credentials.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [[ -f .env ]]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

SPEC_URL="${ZERPTO_SPEC_URL:-/Users/fathur/Codes/com.zerpto.monorepo/contract.openapi/dist/openapi.yaml}"
SPEC_FILE="spec/openapi.yaml"
TMP_FILE="$(mktemp)"
trap 'rm -f "$TMP_FILE"' EXIT

mkdir -p spec

if [[ "$SPEC_URL" =~ ^https?:// ]]; then
  : "${ZERPTO_SPEC_USER:?Set ZERPTO_SPEC_USER (env or .env)}"
  : "${ZERPTO_SPEC_PASSWORD:?Set ZERPTO_SPEC_PASSWORD (env or .env)}"
  echo "==> Fetching spec from $SPEC_URL"
  # Credentials go through a curl config on stdin, so they never appear in the process list.
  printf 'user = "%s:%s"\n' "$ZERPTO_SPEC_USER" "$ZERPTO_SPEC_PASSWORD" \
    | curl --fail --silent --show-error --config - --output "$TMP_FILE" "$SPEC_URL"
  mv "$TMP_FILE" "$SPEC_FILE"
else
  LOCAL_SPEC="${SPEC_URL#file://}"
  [[ -f "$LOCAL_SPEC" ]] || { echo "Spec file not found: $LOCAL_SPEC" >&2; exit 1; }
  echo "==> Using local spec $LOCAL_SPEC"
  if [[ "$(cd "$(dirname "$LOCAL_SPEC")" && pwd)/$(basename "$LOCAL_SPEC")" != "$ROOT/$SPEC_FILE" ]]; then
    cp "$LOCAL_SPEC" "$SPEC_FILE"
  fi
fi

echo "==> Generating SDK (typescript-fetch)"
pnpm dlx @openapitools/openapi-generator-cli generate \
  -i "$SPEC_FILE" \
  -g typescript-fetch \
  -o . \
  --additional-properties=npmName=@zerpto/sdk,npmVersion=1.0.0,supportsES6=true,typescriptThreePlus=true

echo "==> Building"
rm -rf dist
pnpm build

echo "==> Done"
