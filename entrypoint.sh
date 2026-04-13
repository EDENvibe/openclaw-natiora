#!/bin/sh
set -e

echo "==> Configuration OpenClaw..."
mkdir -p $HOME/.openclaw

cat > $HOME/.openclaw/openclaw.json << EOF
{
  "gateway": {
    "mode": "local",
    "bind": "lan"
  },
  "models": {
    "providers": {
      "openrouter": {
        "baseUrl": "https://openrouter.ai/api/v1",
        "apiKey": "${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}",
        "models": [
          {
            "id": "mistralai/mistral-7b-instruct",
            "name": "mistral-7b"
          }
        ]
      }
    }
  },
  "agents": {
    "entries": {
      "main": {
        "model": "openrouter/mistralai/mistral-7b-instruct"
      }
    }
  }
}
EOF

echo "==> Démarrage de la gateway..."
exec node /home/node/.npm-global/lib/node_modules/openclaw/dist/index.js gateway --bind lan --port 18789
