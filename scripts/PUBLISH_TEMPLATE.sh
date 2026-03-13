#!/bin/bash

# Cipher Space Automated Publishing Script
# Auto-generated when Cipher schedules a delayed publication
# This script validates time and executes publish operations

# Configuration
CIPHER_HOME="/home/sanyyao/Cipher-Space"
ARTICLE_SLUG="article-slug"  # Replace with actual slug
PUBLISH_TIME="18:20"  # CST in HH:MM format
GIT_MESSAGE="New article: [TITLE]"

# ===== TIME VALIDATION =====
# Extract hour and minute
HOUR=$(echo $PUBLISH_TIME | cut -d: -f1)
MINUTE=$(echo $PUBLISH_TIME | cut -d: -f2)

# Validate hour (0-23)
if ! [[ "$HOUR" =~ ^[0-9]+$ ]] || [ "$HOUR" -lt 0 ] || [ "$HOUR" -gt 23 ]; then
    echo "❌ FATAL: Invalid hour in PUBLISH_TIME: $HOUR"
    echo "   Must be between 00-23"
    exit 1
fi

# Validate minute (0-59)
if ! [[ "$MINUTE" =~ ^[0-9]+$ ]] || [ "$MINUTE" -lt 0 ] || [ "$MINUTE" -gt 59 ]; then
    echo "❌ FATAL: Invalid minute in PUBLISH_TIME: $MINUTE"
    echo "   Must be between 00-59"
    exit 1
fi

echo "✅ Time validation passed: $PUBLISH_TIME CST"

# ===== PUBLISH OPERATIONS =====
cd "$CIPHER_HOME" || exit 1

# Check if article file exists before commit
if [ -z "$(git status --porcelain)" ]; then
    echo "⚠️  No changes to commit. Exiting."
    exit 0
fi

# Stage and commit
git add .
git commit -m "${GIT_MESSAGE}" || exit 1

# Push to remote
git push || exit 1

echo "✅ Article published at $(date '+%Y-%m-%d %H:%M:%S') CST"
echo "   Slug: $ARTICLE_SLUG"
echo "   Scheduled time: $PUBLISH_TIME CST"

# ===== CLEANUP =====
# Update publishing lock (this would be done by parent cron)
# After successful push, set locked=false in publishing-lock.json
