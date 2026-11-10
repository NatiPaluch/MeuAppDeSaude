-- ============================================================================
-- SCHEMA SQL DO SUPABASE — MeuAppDeSaude
-- Basta copiar e colar no SQL Editor do Supabase e clicar em "Run"
-- ============================================================================

-- 1. Tabela de Perfis dos Pacientes
create table if not exists public.perfis (
  id uuid primary key references auth.users(id) on delete cascade,
  nome text default '',
  "fotoUri" text,
  telefone text default '',
  "frequenciaAtividade" text,
  idade integer,
  peso numeric,
  altura numeric,
  sexo text,
  updated_at timestamptz default now()
);

-- 2. Tabela de Lembretes
create table if not exists public.lembretes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  type text not null,
  time text not null,
  color text default '#0d6efd',
  created_at timestamptz default now()
);

-- 3. Tabela de Medicamentos (Farmácia / Estoque)
create table if not exists public.medicamentos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  nome text not null,
  dosagem text not null,
  forma text not null,
  estoque text not null,
  created_at timestamptz default now()
);

-- 4. Tabela de Sinais Vitais
create table if not exists public.sinais_vitais (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  bpm text,
  glicose text,
  "glicoseTipo" text,
  pressao text,
  oxigenacao text,
  humor text,
  exercicio boolean,
  data timestamptz default now()
);

-- 5. Tabela de Sinais Vitais de Enfermagem
create table if not exists public.sinais_enfermagem (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  temperatura text,
  pressao text,
  spo2 text,
  data timestamptz default now()
);

-- 6. Tabela de Histórico de Humor (Psicologia)
create table if not exists public.humor_historico (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  "moodId" text not null,
  activity text,
  data timestamptz default now()
);

-- 7. Tabela de Treinos (Educação Física)
create table if not exists public.treinos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  descricao text not null,
  data timestamptz default now()
);

-- 8. Tabela de Histórico de Dor (Fisioterapia)
create table if not exists public.historico_dor (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  nivel integer not null check (nivel >= 0 and nivel <= 10),
  data timestamptz default now()
);

-- ============================================================================
-- SEGURANÇA: ROW LEVEL SECURITY (RLS) - LGPD (RNF03 / RNF04)
-- Cada paciente autenticado só pode ler, inserir, editar ou excluir os próprios dados
-- ============================================================================
alter table public.perfis enable row level security;
alter table public.lembretes enable row level security;
alter table public.medicamentos enable row level security;
alter table public.sinais_vitais enable row level security;
alter table public.sinais_enfermagem enable row level security;
alter table public.humor_historico enable row level security;
alter table public.treinos enable row level security;
alter table public.historico_dor enable row level security;

create policy "Paciente gerencia proprio perfil" on public.perfis
  for all using (auth.uid() = id) with check (auth.uid() = id);

create policy "Paciente gerencia proprios lembretes" on public.lembretes
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Paciente gerencia proprios medicamentos" on public.medicamentos
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Paciente gerencia proprios sinais vitais" on public.sinais_vitais
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Paciente gerencia proprios sinais enfermagem" on public.sinais_enfermagem
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Paciente gerencia proprio humor" on public.humor_historico
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Paciente gerencia proprios treinos" on public.treinos
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Paciente gerencia proprio historico de dor" on public.historico_dor
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

