# Brand Voice Analyzer & Script Writer
### A Claude Code Skill by [@tenfoldmarc](https://www.instagram.com/tenfoldmarc)

Drop your Instagram reel links. Get your brand voice analyzed. Generate new scripts that sound exactly like you.

**No API keys. No manual setup. Just paste your links.**

---

## What It Does

1. **Auto-installs** ffmpeg, yt-dlp, and Whisper if you don't have them
2. **Downloads** your Instagram reels directly from their links
3. **Transcribes** every video using OpenAI's Whisper
4. **Analyzes** the transcripts to extract your unique voice, hooks, CTAs, and patterns
5. **Outputs** a Brand Voice Document you can reference forever
6. **Writes** new scripts on any topic that sound exactly like you

---

## Install

```bash
git clone https://github.com/tenfoldmarc/brand-voice-skill ~/.claude/skills/brand-voice-skill
```

That's it. Restart Claude Code and it's ready.

---

## How to Use

Once installed, just tell Claude Code:

> "Analyze my brand voice"

or

> "Transcribe my Instagram reels and write scripts in my voice"

Claude will ask you to drop your reel links (5+ recommended), handle everything automatically, and return your Brand Voice Document + offer to write scripts.

---

## Requirements

- Claude Code (any version)
- macOS or Linux
- Internet connection (for downloading videos)
- Python 3 (usually pre-installed)

Everything else gets installed automatically.

---

## Example Output

```
# Your Brand Voice Document

## Voice in 3 Words
Direct. Energetic. No-fluff.

## Signature Phrases
- "Like bro, for real..."
- "If you sleep on this you are cooked"
- "Comment [X] and I'll send it to you"
...
```

---

## Tips

- **More videos = better analysis.** 5 is the minimum, 10-15 is ideal.
- **Reels with talking work best.** Videos that are mostly music or B-roll will have thin transcripts.
- After install, run it on your latest content every few months to keep your voice document fresh.

---

Built by [@tenfoldmarc](https://www.instagram.com/tenfoldmarc) — follow for more Claude Code automations for business owners.
