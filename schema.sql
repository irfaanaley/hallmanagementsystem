-- Supabase Dashboard -> SQL Editor -> paste this -> Run (one time)

create table if not exists public.users (
  id            integer generated always as identity primary key,
  name          text not null,
  email         text not null,
  password_hash text not null,
  role          text not null default 'Customer'
                check (role in ('Owner','Admin','Manager','Staff','Accountant','Customer')),
  status        text not null default 'Active' check (status in ('Active','Inactive')),
  phone text, cnic text, city text, address text,
  created_at    timestamptz not null default now()
);
create unique index if not exists users_email_key on public.users (lower(email));

create table if not exists public.sessions (
  token_hash text primary key,
  user_id    integer not null references public.users(id) on delete cascade,
  expires_at bigint not null
);

create table if not exists public.login_attempts (
  key          text primary key,
  fails        integer not null default 0,
  locked_until bigint not null default 0
);

-- IMPORTANT: Supabase exposes public tables through its public API key.
-- Row Level Security with NO policies blocks that completely; our server connects
-- directly to Postgres with the database password, so it is not affected.
alter table public.users          enable row level security;
alter table public.sessions       enable row level security;
alter table public.login_attempts enable row level security;
