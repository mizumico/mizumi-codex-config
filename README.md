# Mizumi Codex CLI Config

> Everything you need to point [OpenAI Codex CLI](https://github.com/openai/codex) at [Mizumi](https://mizumi.co/codex) — official OpenAI & Gemini models through one OpenAI-compatible API.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/mizumico/mizumi-codex-config/pulls)

## Requirements

- Codex CLI **>= 0.122** (this config uses `wire_api = "responses"`)
- A Mizumi API key — get one at [mizumi.co](https://mizumi.co) (**$3 free trial credit** for new users)

## Setup

1. **Install Codex CLI**

   ```bash
   npm install -g @openai/codex
   codex --version   # make sure it's >= 0.122
   ```

2. **Install the Mizumi config**

   ```bash
   mkdir -p ~/.codex
   cp config.toml ~/.codex/config.toml
   ```

3. **Export your API key** (add to your `~/.zshrc` / `~/.bashrc` to persist)

   ```bash
   export MIZUMI_API_KEY=sk-your-key
   ```

4. **Verify (optional but recommended)**

   ```bash
   ./verify-setup.sh
   ```

5. **Run**

   ```bash
   codex
   ```

## Using Gemini models

Same provider, same config — just switch the model. Either edit `~/.codex/config.toml`:

```toml
model = "gemini-3.1-pro-preview"   # or gemini-3.6-flash for the fast tier
```

or per session:

```bash
codex -m gemini-3.6-flash
```

OpenAI models available include `gpt-5.6-sol` (default), `gpt-5.5`, `gpt-5.6-luna` (budget), `gpt-4.1-mini`. Full list: **[mizumi.co](https://mizumi.co)**.

## Troubleshooting

| Symptom | Cause | Fix |
| --- | --- | --- |
| `401 Unauthorized` | `MIZUMI_API_KEY` not set or invalid | `export MIZUMI_API_KEY=sk-...` in the same shell, then retry |
| `model not found` | Typo in the model name | Check the exact id at [mizumi.co](https://mizumi.co) |
| Config seems ignored | Wrong config path | The file must be at `~/.codex/config.toml` |
| Provider errors about the API shape | Old Codex CLI | Upgrade to >= 0.122 (`npm update -g @openai/codex`) |

Still stuck? Run `./verify-setup.sh` — it isolates key/endpoint problems from CLI problems.

## Links

- Codex on Mizumi landing page: **[mizumi.co/codex](https://mizumi.co/codex)**
- API docs: **[mizumi.co/docs](https://mizumi.co/docs)**
- Sign up ($3 free trial credit): **[mizumi.co](https://mizumi.co)**

## License

MIT — see [LICENSE](LICENSE).

---

Built with Mizumi — official OpenAI & Gemini models via one OpenAI-compatible API. $3 free trial credit at https://mizumi.co
