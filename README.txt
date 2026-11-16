Grand Hall Booking System - Vercel + Supabase

SETUP (ek dafa)
1. supabase.com par project banayein (database password yaad rakhein).
2. Supabase > SQL Editor mein schema.sql ka poora content paste karke Run karein.
3. Supabase > Connect > "Transaction pooler" wali connection string copy karein
   (port 6543, aisi: postgresql://postgres.xxxx:[YOUR-PASSWORD]@...pooler.supabase.com:6543/postgres)
   [YOUR-PASSWORD] ki jagah apna database password likhein.
4. Vercel > Project > Settings > Environment Variables:
   Name = DATABASE_URL , Value = woh connection string  (Production + Preview)
   (Agar Supabase-Vercel integration lagayi hai to POSTGRES_URL khud mil jata hai, woh bhi chalega.)
5. Project dobara deploy karein (git push ya: vercel --prod).
6. Site kholein: pehli dafa "Create the Owner account" ka form aayega.

Local test: npm i -g vercel ; npm install ; .env.local mein DATABASE_URL likhein ; vercel dev

Accounts (name, email, phone, CNIC, city, address, role, password hash) Supabase ke "users" table mein save hote hain.
