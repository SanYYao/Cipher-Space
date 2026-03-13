#!/bin/bash

# Cipher Space Automated Publishing Template
# This script is auto-generated when Cipher schedules a publication
# Run this at the exact time you want the article to go live

# Configuration (filled in by Cipher)
CIPHER_HOME="/home/sanyyao/Cipher-Space"
ARTICLE_TITLE="article-slug"  # Replace with actual slug
ARTICLE_DATE="2026-03-13"
PUBLISH_TIME="18:20"  # CST
GIT_MESSAGE="New article: [TITLE]"

# Navigate to project
cd "$CIPHER_HOME"

# Write article markdown (content will be passed as parameter or pre-written)
# In real execution, this will contain the actual article content
# Example: cat >> "${ARTICLE_TITLE}.md" << 'EOF'
# Article content here
# EOF

# Update article tracking
# This would be done in a more sophisticated way with jq

# Git operations - Stage, commit, push
git add .
git commit -m "${GIT_MESSAGE}"
git push

# Update publishing lock and memory after successful push
echo "✅ Article published: ${ARTICLE_TITLE} at ${PUBLISH_TIME} CST"
echo "Updated at: $(date '+%Y-%m-%d %H:%M:%S')"

# The cron that triggered this should clean up and unlock after success
