#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$DIR/init"
cp "$DIR/schema/schema.sql" "$DIR/init/000-schema.sql"
cp "$DIR/seed/subject/"*.sql "$DIR/init/"
cp "$DIR/seed/personalities/"*.sql "$DIR/init/"
echo "Init directory ready. Run from app/: docker compose up -d"
