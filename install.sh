#!/bin/bash

# Brand Voice Skill — Installer
# By @tenfoldmarc

SKILL_DIR="$HOME/.claude/skills/brand-voice-skill"

echo ""
echo "Installing Brand Voice Analyzer & Script Writer..."
echo ""

# Check if git is available
if ! command -v git &> /dev/null; then
    echo "Error: git is required. Install it and try again."
    exit 1
fi

# Remove existing install if present
if [ -d "$SKILL_DIR" ]; then
    echo "Updating existing install..."
    rm -rf "$SKILL_DIR"
fi

# Create skills directory if it doesn't exist
mkdir -p "$HOME/.claude/skills"

# Clone the skill
git clone https://github.com/tenfoldmarc/brand-voice-skill "$SKILL_DIR" --quiet

if [ $? -eq 0 ]; then
    echo "✓ Brand Voice skill installed to $SKILL_DIR"
    echo ""
    echo "Restart Claude Code, then say: 'Analyze my brand voice'"
    echo ""
else
    echo "Install failed. Check your internet connection and try again."
    exit 1
fi
