# Integrasi ke HTML yang ada

HTML asli sudah dipertahankan di `public/index.html`.

Agar form pendaftaran dan panel admin benar-benar memakai database:
- ganti pembacaan/penyimpanan jadwal `localStorage` menjadi tabel `trips`;
- ganti penyimpanan peserta menjadi tabel `participants`;
- gunakan Supabase Auth untuk login admin;
- jangan menaruh service-role key di frontend;
- tampilkan ke publik hanya field peserta yang aman.

Skema SQL sudah tersedia di `supabase_schema.sql`.
