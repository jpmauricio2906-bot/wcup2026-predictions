-- FIFA World Cup 2026 Predictions App - Supabase Schema

-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- Users table (simple, no auth needed - just a name/handle)
create table if not exists players (
  id uuid primary key default uuid_generate_v4(),
  name text not null unique,
  created_at timestamptz default now()
);

-- Predictions table
create table if not exists predictions (
  id uuid primary key default uuid_generate_v4(),
  player_id uuid references players(id) on delete cascade,
  match_id integer not null,
  home_score integer,
  away_score integer,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  unique(player_id, match_id)
);

-- Row Level Security
alter table players enable row level security;
alter table predictions enable row level security;

-- Policies: allow all reads, allow inserts/updates
create policy "Allow read players" on players for select using (true);
create policy "Allow insert players" on players for insert with check (true);

create policy "Allow read predictions" on predictions for select using (true);
create policy "Allow insert predictions" on predictions for insert with check (true);
create policy "Allow update predictions" on predictions for update using (true);

-- Index for performance
create index if not exists idx_predictions_player on predictions(player_id);
create index if not exists idx_predictions_match on predictions(match_id);
