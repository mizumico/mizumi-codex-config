#!/usr/bin/env bash
# verify-setup.sh — check that your Mizumi API key works with Codex CLI's endpoint.
#
# Usage:
#   export MIZUMI_API_KEY=sk-your-key
#   ./verify-setup.sh

set -euo pipefail

BASE_URL="https://api.mizumi.co/v1"

if [[ -z "${MIZUMI_API_KEY:-}" ]]; then
  echo "✗ MIZUMI_API_KEY is not set."
  echo "  Get a key at https://mizumi.co (\$3 free trial credit), then:"
  echo "  export MIZUMI_API_KEY=sk-your-key"
  exit 1
fi

echo "Checking ${BASE_URL}/models ..."

http_code=$(curl -sS -o /tmp/mizumi_verify_response.json -w "%{http_code}" \
  -H "Authorization: Bearer ${MIZUMI_API_KEY}" \
  "${BASE_URL}/models")

case "$http_code" in
  200)
    echo "✓ API key is valid (HTTP 200). Available models include:"
    # Print up to 5 model ids; works with or without jq.
    if command -v jq >/dev/null 2>&1; then
      jq -r '.data[:5][] | "  - \(.id)"' /tmp/mizumi_verify_response.json
    else
      grep -o '"id":"[^"]*"' /tmp/mizumi_verify_response.json | head -5 | sed 's/"id":"\(.*\)"/  - \1/'
    fi
    echo
    echo "✓ You're all set. Run: codex"
    ;;
  401)
    echo "✗ HTTP 401 Unauthorized — your key is missing or invalid."
    echo "  Double-check MIZUMI_API_KEY at https://mizumi.co"
    exit 1
    ;;
  *)
    echo "✗ Unexpected HTTP ${http_code}. Response:"
    cat /tmp/mizumi_verify_response.json
    exit 1
    ;;
esac
