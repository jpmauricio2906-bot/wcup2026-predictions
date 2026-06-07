# 🏆 FIFA World Cup 2026 — Predictions App

A beautiful web app for predicting FIFA World Cup 2026 match scores with Supabase backend, deployable to Vercel.

## Features
- **104 matches**: All 72 group stage + 32 knockout round matches
- **12 Groups A–L**: Full 2026 format (48 teams, 3 host nations)
- **Leaderboard**: Compare predictions across all players
- **4 Themes**: Midnight (default), Arctic, Sunset, Forest
- **Supabase sync**: Persist predictions across devices
- **Local fallback**: Works offline with localStorage

## Setup

### 1. Supabase Database
1. Create a project at [supabase.com](https://supabase.com)
2. Go to SQL Editor and run `schema.sql`
3. Copy your Project URL and `anon` key from Settings → API

### 2. Configure App
Open `index.html` and update the constants at the top of the `<script>`:

```js
const SUPABASE_URL = 'https://your-project.supabase.co';
const SUPABASE_KEY = 'your-anon-key-here';
```

### 3. Deploy to Vercel + GitHub
```bash
# Create repo and push
git init
git add .
git commit -m "feat: FIFA World Cup 2026 predictions app"
git remote add origin https://github.com/jpmauricio2906-bot/wcup2026-predictions.git
git push -u origin main
```
Then import the repo at [vercel.com/new](https://vercel.com/new) — zero-config deploy.

## Supabase Notes
- Free tier may pause after ~1 week of inactivity
- Default row limit is 1,000 — for many users, update Settings → API → Max Rows
- Use `service_role` key (not `anon`) if you enable RLS with stricter policies
- The schema in `schema.sql` uses permissive policies for simplicity

## Match Data
- Extracted from official FIFA World Cup 2026 bracket file (`WCup_2026_4_2_6_en.xlsx`)
- 48 teams across 12 groups (A–L)
- Groups: A(Mexico, South Africa, Korea, Czech Rep.), B(Canada, Bosnia, Qatar, Switzerland), C(Brazil, Morocco, Haiti, Scotland), D(USA, Paraguay, Australia, Turkey), E(Germany, Curaçao, Ivory Coast, Ecuador), F(Netherlands, Japan, Sweden, Tunisia), G(Belgium, Egypt, IR Iran, New Zealand), H(Spain, Cape Verde, Saudi Arabia, Uruguay), I(France, Senegal, Iraq, Norway), J(Argentina, Algeria, Austria, Jordan), K(Portugal, DR Congo, Uzbekistan, Colombia), L(England, Croatia, Ghana, Panama)

## Scoring (future feature)
Points system (configurable):
- Correct result (W/D/L): 1 pt
- Correct goal difference: 2 pts  
- Exact score: 3 pts
