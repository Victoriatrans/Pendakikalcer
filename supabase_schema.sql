-- PBW Adventure: persistent database
create extension if not exists pgcrypto;

create table if not exists public.trips (
  id uuid primary key default gen_random_uuid(),
  month text not null,
  mountain text not null,
  route text,
  trip_date text not null,
  package_a text,
  package_b text,
  package_c text,
  created_at timestamptz not null default now()
);

create table if not exists public.participants (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  birth_date date,
  gender text,
  trip_id uuid references public.trips(id) on delete set null,
  trip_label text,
  package text,
  meeting_point text,
  whatsapp text,
  family_whatsapp text,
  instagram text,
  email text,
  illness_history text,
  vision text,
  info_source text,
  hiking_experience text,
  special_notes text,
  height_cm numeric,
  weight_kg numeric,
  payment_proof_url text,
  status text not null default 'pending',
  created_at timestamptz not null default now()
);

alter table public.trips enable row level security;
alter table public.participants enable row level security;

-- Public can read trips and the safe participant fields through the app.
create policy "public read trips"
on public.trips for select
to anon, authenticated
using (true);

create policy "public read participants"
on public.participants for select
to anon, authenticated
using (true);

-- Registration from the public site.
create policy "public insert participants"
on public.participants for insert
to anon, authenticated
with check (true);

-- Admin write policies should NOT be opened to anon.
-- Use a Supabase Auth admin account and authenticated role for admin writes.
create policy "authenticated insert trips"
on public.trips for insert
to authenticated
with check (true);

create policy "authenticated update trips"
on public.trips for update
to authenticated
using (true)
with check (true);

create policy "authenticated delete trips"
on public.trips for delete
to authenticated
using (true);

create policy "authenticated update participants"
on public.participants for update
to authenticated
using (true)
with check (true);

create policy "authenticated delete participants"
on public.participants for delete
to authenticated
using (true);

-- Helpful indexes
create index if not exists trips_date_idx on public.trips(trip_date);
create index if not exists participants_trip_idx on public.participants(trip_id);
create index if not exists participants_created_idx on public.participants(created_at desc);
