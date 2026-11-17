#!/usr/bin/env bash
# Render build: copies index.html into public/ and fills in the Supabase keys
# from Render's Environment settings (SUPABASE_URL, SUPABASE_ANON_KEY).
set -euo pipefail

if [ -z "${SUPABASE_URL:-}" ] || [ -z "${SUPABASE_ANON_KEY:-}" ]; then
  echo "ERROR: Set SUPABASE_URL and SUPABASE_ANON_KEY in Render -> Environment." >&2
  exit 1
fi

rm -rf public
mkdir -p public
sed \
  -e "s|https://YOUR-PROJECT-ID.supabase.co|${SUPABASE_URL}|g" \
  -e "s|YOUR-ANON-PUBLIC-KEY|${SUPABASE_ANON_KEY}|g" \
  index.html > public/index.html

echo "Built public/index.html"
