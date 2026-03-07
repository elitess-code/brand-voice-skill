# Brand Voice Analyzer & Script Writer
### A Claude Code Skill by [@tenfoldmarc](https://www.instagram.com/tenfoldmarc)

Drop your Instagram reel links. Get your brand voice analyzed. Generate new scripts that sound exactly like you.

**No API keys. No manual setup. Just paste your links.**

---

## What It Does

1. **Auto-installs** everything it needs (ffmpeg, yt-dlp, Whisper) — you don't do anything
2. **Downloads** your Instagram reels directly from their links
3. **Transcribes** every video using OpenAI's Whisper
4. **Analyzes** the transcripts to extract your unique voice, hooks, CTAs, and patterns
5. **Identifies** who your real audience is based on what you actually say (not what you think you say)
6. **Outputs** a Brand Voice Document you can reference forever
7. **Writes** new scripts on any topic that sound exactly like you

---

## Requirements

- A Mac or Linux computer
- [Claude Code](https://claude.ai/code) installed
- That's it

---

## Install — Step by Step

### Step 1 — Open Terminal

**On Mac:** Press `Command + Space`, type `Terminal`, hit Enter.

You'll see a black or white window with a blinking cursor. That's Terminal.

### Step 2 — Copy and paste this command

Click the box below, copy the whole line, paste it into Terminal, and hit Enter:

```bash
git clone https://github.com/tenfoldmarc/brand-voice-skill ~/.claude/skills/brand-voice-skill
```

You'll see some text appear. Wait for it to finish (takes about 5 seconds).

### Step 3 — Restart Claude Code

Close Claude Code completely and reopen it.

### Step 4 — Use it

Open Claude Code and type:

> "Analyze my brand voice"

Claude will ask you to paste your Instagram reel links. Paste 5 or more (one per line) and let it run.

---

## That's it. Seriously.

Claude handles everything else — downloading the videos, transcribing them, analyzing your voice, and writing new scripts for you.

---

## How to Get Your Instagram Reel Links

1. Open Instagram on your phone or computer
2. Go to any reel you've posted
3. Tap the **three dots (...)** in the bottom right
4. Tap **Copy Link**
5. Paste it into Claude Code when asked

Repeat for each reel. 5 links minimum, 10-15 is ideal.

---

## Troubleshooting

**"git: command not found"**
You need to install Git first. On Mac, run this in Terminal:
```bash
xcode-select --install
```
A popup will appear — click Install. Then try the install command again.

**"Permission denied"**
Try adding `sudo` to the front:
```bash
sudo git clone https://github.com/tenfoldmarc/brand-voice-skill ~/.claude/skills/brand-voice-skill
```

**Claude doesn't seem to know the skill**
Make sure you fully closed and reopened Claude Code after installing.

**A video failed to download**
Some reels are private or have been deleted. Claude will skip those and continue with the rest.

---

## Example Output

After running the skill, you'll get:

```
## What You Talk About In Your Videos

| Video | What you're actually saying |
|---|---|
| Reel 1 | Teaching cold email automation — "I send 600 emails a day with zero manual work" |
| Reel 2 | FOMO content — "Sleep on this for 6 months and you're dead in the water" |
...

## Your Real Avatar
### The Manual Operator
> "I know AI is a big deal but that stuff looks like it's for developers — not me."

## Brand Voice Document
**Voice in 3 Words:** Direct. Energetic. No-fluff.
**Signature Phrases:** "Like bro, for real...", "You are cooked", "Comment X and I'll send it to you"
...

## Script: [Your Topic]
[Full ready-to-record script in your exact voice]
```

---

Built by [@tenfoldmarc](https://www.instagram.com/tenfoldmarc) — follow for more Claude Code automations for business owners.
