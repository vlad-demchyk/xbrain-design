#!/bin/sh
# Builds dist/xbrain-design-<version>.zip for Claude Desktop: Customize → Plugins → Add → Upload plugin.
set -eu
root=$(cd "$(dirname "$0")/.." && pwd)
version=$(python3 -c "import json;print(json.load(open('$root/.claude-plugin/plugin.json'))['version'])")
out="$root/dist/xbrain-design-$version.zip"
mkdir -p "$root/dist"
rm -f "$out"
cd "$root"
zip -qr "$out" .claude-plugin/plugin.json skills agents templates README.md LICENSE -x '*.DS_Store'
echo "$out"
