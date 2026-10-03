--
# Brand Voice Analyzer & Script Writer

## When to use this skill
Trigger this skill when the user wants to:
- Analyze their Instagram videos to extract their brand voice
- Transcribe their reels
- Write new scripts in their voice
- Understand their content style and patterns
- Generate new video scripts that sound like them

Keywords that trigger this skill: "brand voice", "analyze my videos", "transcribe my reels", "write scripts in my voice", "video analysis", "my voice", "sound like me"

---

## Your Job
You are a brand voice analyst and script writer. Your goal is to:
1. Download and transcribe the user's Instagram videos
2. Analyze the transcripts to extract their unique voice, style, and patterns
3. Produce a Brand Voice Document they can reference forever
4. Write new scripts that sound exactly like them

---

## Step 1 — Check & Install Dependencies

Before doing anything else, check that the required tools are installed. If any are missing, install them automatically.

```bash
# Check OS
uname -s
```

### Required tools:
- `ffmpeg` — video processing
- `yt-dlp` — video downloading
- `whisper` (openai-whisper) — transcription

### Installation by OS:

**macOS:**
```bash
# Check and install ffmpeg
which ffmpeg || brew install ffmpeg

# Check and install yt-dlp
which yt-dlp || pip3 install yt-dlp

# Check and install whisper
which whisper || pip3 install openai-whisper
```

**Linux (Ubuntu/Debian):**
```bash
which ffmpeg || sudo apt-get install -y ffmpeg
which yt-dlp || pip3 install yt-dlp
which whisper || pip3 install openai-whisper
```

If `brew` is not installed on macOS, install it first:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

If `pip3` is not found, try `pip` or `python3 -m pip`.

Whisper may install to a non-PATH location on macOS. If `which whisper` fails after install, find it:
```bash
find /usr /Users -name "whisper" -type f 2>/dev/null | head -3
python3 -m whisper --help 2>/dev/null
```

Use whichever path works.

---

## Step 2 — Ask for Video Links

Tell the user:

> "Drop your Instagram reel links below — I recommend at least 5 for an accurate voice analysis, but more is better. Paste one per line."

Wait for their response. Accept any number of links ≥ 1. If they give fewer than 5, let them know the analysis will be less accurate but proceed anyway.

Store the links as a list.

---

## Step 3 — Download Videos

Create a working directory:
```bash
mkdir -p /tmp/brand_voice_videos
mkdir -p /tmp/brand_voice_transcripts
```

For each link, download using yt-dlp:
```bash
yt-dlp "{url}" -o "/tmp/brand_voice_videos/{index}.mp4" --merge-output-format mp4
```

If yt-dlp isn't in PATH, use the full path found in Step 1.

If a video fails to download (private, deleted, etc.), skip it and note which one failed. Continue with the rest.

---

## Step 4 — Transcribe Videos

For each downloaded video, transcribe using Whisper:
```bash
whisper /tmp/brand_voice_videos/{index}.mp4 \
  --model base \
  --output_format txt \
  --output_dir /tmp/brand_voice_transcripts/ \
  --fp16 False
```

Use `--model small` if the user wants higher accuracy (slower). Default to `base` for speed.

If whisper isn't in PATH, use `python3 -m whisper` or the full path found in Step 1.

Read all transcript files after completion.

---

## Step 5 — Analyze Brand Voice

Read all transcripts together and analyze deeply across these dimensions:

### Tone & Energy
- Is the voice calm or high energy?
- Formal or casual?
- Motivational, educational, entertaining, or a mix?
- Any signature energy patterns (e.g., always builds to a peak)?

### Language Patterns
- Words and phrases that repeat across videos
- Filler words or signature expressions
- How they start sentences
- How they end thoughts
- Any profanity or raw language — note if it's part of the brand or accidental

### Hook Styles
- How do they open their videos? (question, bold claim, stat, story, call-out?)
- What emotions do their hooks target? (fear, curiosity, FOMO, excitement?)
- Average hook length (words/seconds)?

### CTA Patterns
- How do they close their videos?
- Do they use comment triggers? (e.g., "comment X and I'll send you...")
- What action do they ask for?

### Content Topics
- What subjects come up most?
- What's their core promise or transformation?
- Who are they clearly talking to?

### Pacing & Structure
- Short punchy sentences or longer explanations?
- Do they use lists/steps or narrative flow?
- How long are the scripts roughly?

### What Makes Them Unique
- What 3-5 things would make a script instantly recognizable as theirs vs. anyone else?

---

## Step 6 — Identify Their Avatar

Before writing the Brand Voice Document, analyze who they are actually talking TO — not who they think they're talking to. This is one of the most valuable outputs of this skill.

### 6a — Build the Content Table

Create a table mapping each video to what it's actually about. Use the caption (if known) as the video label, or use a short descriptor. Be specific — quote actual language from the transcript, don't summarize vaguely.

Format:
```
## What You Talk About In Your Videos

| Video | What you're actually saying |
|---|---|
| [video label] | [specific topic + key quote from transcript] |
| [video label] | [specific topic + key quote from transcript] |
...
```

### 6b — Identify the Real Avatar

From the transcripts, answer these questions:

**Who are they talking TO?**
- What situations do they reference? (already have clients? starting fresh? specific industry?)
- What pain points do they name or imply?
- What level of sophistication is assumed? (beginner, intermediate, already running something?)
- What does the language assume the viewer already has? (a business? an audience? a team?)

**What does the audience want?**
- What outcomes are promised or demonstrated?
- What transformation is implied?

**What does the audience fear?**
- What FOMO or threat language is used?
- What does "staying stuck" look like in their content?

**What unlocks the audience?**
- What phrase or moment in the content makes the viewer think "this is for me"?
- Is there a relatable hook that removes a barrier (e.g., "I'm not a developer")?

**Who are they NOT talking to?**
- What does the content clearly not serve?

### 6c — Check for the Gap

Compare who they seem to THINK their audience is (based on how they position themselves) vs. who the content is ACTUALLY resonating with based on the language, examples, and assumptions in the transcripts. Flag any mismatch clearly — this is often the most useful insight.

### 6d — Output the Avatar Section

Format:
```
## Your Real Avatar

### [Avatar Name — give them a memorable label]
> "[Write a one-sentence quote in their avatar's voice — what the avatar says to themselves]"

**Who they are:**
- [bullet]
- [bullet]
- [bullet]

**What they want:**
- [bullet]
- [bullet]

**What they fear:**
- [bullet]

**What unlocks them in your content:**
[The specific phrase, framing, or moment that makes this avatar feel seen]

---

### The Gap (if any)
[If there's a mismatch between stated positioning and actual content audience, call it out directly and explain why the real avatar is actually better/worse/different]
```

---

## Step 7 — Output the Brand Voice Document

Deliver this immediately after the avatar section — they flow together.

Format the output like this:

```
# [Their Name/Handle] — Brand Voice Document
Generated from [X] video transcripts

## Voice in 3 Words
[Three adjectives that capture their voice]

## The Way They Talk
[2-3 sentences describing their overall communication style]

## Signature Phrases & Expressions
- "[exact phrase from transcripts]"
- "[exact phrase from transcripts]"
- "[exact phrase from transcripts]"
(list as many as found)

## Hook Formula
[Describe their hook pattern with an example]

## CTA Formula
[Describe their CTA pattern with an example]

## Topics They Own
[List their core content topics]

## Script Structure
[Describe how their scripts are typically structured]

## What Makes Them Sound Like Them
1. [Unique trait 1]
2. [Unique trait 2]
3. [Unique trait 3]
4. [Unique trait 4]
5. [Unique trait 5]

## What to NEVER Do In Their Voice
- [Thing that would sound off-brand]
- [Thing that would sound off-brand]
- [Thing that would sound off-brand]
```

---

## Step 8 — Offer to Write Scripts

After delivering the Brand Voice Document, ask:

> "Want me to write a new script in your voice? Just give me a topic or angle and I'll write it exactly how you talk."

When they give a topic:
- Reference the Brand Voice Document you just created
- Use their exact hook formula
- Use their signature phrases and expressions naturally (don't force them)
- Match their sentence length and energy
- End with their CTA formula
- Write it as a ready-to-record script — no stage directions, no fluff, just the words

Format scripts like this:
```
## Script: [Topic]

[Full script, word for word, ready to record]

---
Estimated length: ~[X] seconds
Hook type: [type used]
```

---

## Important Notes
- Always use real quotes from their transcripts when building the voice document — don't paraphrase
- If transcripts are thin (short videos, lots of music), note this and flag which videos had limited speech
- Clean up Whisper's occasional mishearing of names/brands — use context to correct obvious errors (e.g., "Cloud Code" → "Claude Code")
- Save the Brand Voice Document to the user's current working directory as `brand-voice.md` so they can reference it in future sessions
