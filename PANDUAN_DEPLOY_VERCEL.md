# PBW Adventure — GitHub + Vercel + Supabase

Paket ini menyiapkan website PBW Adventure untuk deployment ke Vercel dan database Supabase.

## 1. Upload ke GitHub
1. Buat repository baru, misalnya `pbw-adventure`.
2. Upload seluruh isi folder paket ini.
3. Jangan upload file `.env` atau kunci rahasia.

## 2. Buat database Supabase
1. Buat project baru di Supabase.
2. Buka SQL Editor.
3. Jalankan seluruh isi `supabase_schema.sql`.
4. Di Project Settings → API, salin Project URL dan anon/publishable key.

## 3. Hubungkan Vercel
1. Import repository GitHub ke Vercel.
2. Framework preset: Other/Static.
3. Build Command: `npm run build`
4. Output Directory: `public`
5. Tambahkan Environment Variables:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
6. Deploy.

## 4. Penting untuk keamanan admin
Jangan menaruh password admin/database service-role key di HTML/JavaScript.
Gunakan Supabase Auth untuk login admin dan RLS untuk membatasi tambah/edit/hapus jadwal dan peserta.

## 5. Tentang data peserta
Data yang bersifat sensitif (WA, email, riwayat kesehatan, dan bukti pembayaran) sebaiknya hanya dapat diakses admin.
Untuk publik, tampilkan hanya nama, trip/tanggal, paket, dan meeting point.

## 6. Bukti pembayaran
Untuk versi produksi, buat Supabase Storage bucket privat untuk bukti pembayaran.
Jangan membuat bucket bukti pembayaran menjadi public.

## 7. Catatan
`public/index.html` adalah versi website yang sekarang dan dipertahankan sebagai tampilan awal. Integrasi Supabase perlu dihubungkan ke form/admin JavaScript agar data form tidak lagi hanya tersimpan di browser.
