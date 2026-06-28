#!/bin/bash
mkdir -p database/init
cp database/schema/schema.sql database/init/000-schema.sql
cp database/seed/subject/*.sql database/init/
cp database/seed/personalities/*.sql database/init/
echo "Init directory ready. Run: docker compose up -d"
