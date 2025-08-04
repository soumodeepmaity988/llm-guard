#!/bin/bash

APP_WORKERS=-1
export CONFIG_FILE=./config/scanners.yml

# Uvicorn with workers
uvicorn app.app:create_app --host=0.0.0.0 --port=8000 --workers="$APP_WORKERS" --forwarded-allow-ips="*" --proxy-headers --timeout-keep-alive="2"
