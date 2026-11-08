-- PRANJAL MEDIA PRO - SUPABASE POSTGRESQL DATABASE SCHEMA

-- 1. Users Table
CREATE TABLE public.users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name TEXT NOT NULL,
    mobile_number TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE,
    artist_name TEXT,
    label_name TEXT,
    profile_photo TEXT,
    account_type TEXT DEFAULT 'Normal User',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. User Roles Table
CREATE TABLE public.user_roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
    role TEXT CHECK (role IN ('Super Admin', 'Admin', 'Label Owner', 'Artist', 'Normal User')) DEFAULT 'Normal User',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Music Releases Table
CREATE TABLE public.music_releases (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    song_title TEXT NOT NULL,
    album_name TEXT,
    singer_name TEXT NOT NULL,
    lyricist TEXT,
    composer TEXT,
    label_name TEXT,
    genre TEXT,
    release_date DATE,
    cover_artwork TEXT,
    audio_file_url TEXT NOT NULL,
    isrc_code TEXT,
    distribution_status TEXT DEFAULT 'Pending Approval',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 4. YouTube Accounts Table
CREATE TABLE public.youtube_accounts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
    channel_name TEXT NOT NULL,
    channel_id TEXT UNIQUE NOT NULL,
    access_token TEXT,
    refresh_token TEXT,
    connected_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 5. Audit Logs Table
CREATE TABLE public.audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE SET NULL,
    action_performed TEXT NOT NULL,
    ip_address TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);
