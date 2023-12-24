#!/usr/bin/env bash
# Bash strict mode - http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'
# Allow globs to expand to null
shopt -s nullglob

# Change directory to the script's directory
cd "$(dirname "$0")"
mkdir -p dist

# Build pure theme that can be used as custom css directly
cat base.css pure.css addons/*.css > dist/discord_inspired.css

# Build the full theme and includes the custom css
cat base.css mod.css addons/*.css > dist/theme.css
THEME_CSS=$(cat dist/theme.css)
jq --arg css "$THEME_CSS" '.custom_css = $css' theme.json.in > dist/discord_inspired.json