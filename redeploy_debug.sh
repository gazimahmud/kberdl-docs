#!/bin/bash
echo "Starting redeploy..." > debug_status.txt
docker compose down --remove-orphans >> debug_status.txt 2>&1
echo "Down complete. Starting up..." >> debug_status.txt
docker compose up -d --force-recreate >> debug_status.txt 2>&1
echo "Up complete. Exit code: $?" >> debug_status.txt
docker compose logs --tail=50 mkdocs > debug_logs.txt 2>&1
echo "Logs captured." >> debug_status.txt
