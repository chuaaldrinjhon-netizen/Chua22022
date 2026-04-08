Serverless login (Vercel) — setup guide

Goal
----
Make the deployed site on Vercel validate logins by using a serverless function (provided at `/api/login`) that connects to a managed MySQL database containing your `dbchua.sql` data.

What I added
-------------
- `api/login.js` — a Node serverless endpoint that validates `username` + `password` against the `users` table.
- `index.html` — updated to submit the login form via fetch to `/api/login`.
- `package.json` — dependency `mysql2` added so Vercel will install it for the functions.

Important limitations
---------------------
- Vercel does not run PHP. The serverless function only validates credentials and returns JSON. Your app's PHP pages (e.g., `admin/index.php`, `user/index.php`) won't execute on Vercel. To preserve full functionality you must either host the PHP app on a PHP-capable server (recommended) or convert pages to serverless/static.

Steps to enable login on Vercel
--------------------------------
1) Provision a managed MySQL database
   - Options: DigitalOcean Managed MySQL, Amazon RDS, ClearDB, PlanetScale (MySQL-compatible), etc.
   - Create a database (name of your choice). Note the host, port, username and password.

2) Import `dbchua.sql` into the managed DB
   - From your dev machine (where `dbchua.sql` exists), run:

```powershell
# replace placeholders with values from your provider
mysql -h <DB_HOST> -u <DB_USER> -p <DB_NAME> < dbchua.sql
```

   - Or use the provider's phpMyAdmin/import tool in their control panel.

3) Set Vercel environment variables
   - In your Vercel project dashboard → Settings → Environment Variables, add the following for Production (and Preview if desired):
     - `DB_HOST`  e.g. `db-1.cluster-xyz.region.provider.com`
     - `DB_USER`
     - `DB_PASS`
     - `DB_NAME`

4) Deploy to Vercel
   - Push your branch. Vercel will install `mysql2` and deploy the serverless function.

5) Test login
   - Visit your Vercel site and use one of the credentials from `dbchua.sql` (e.g., `admin` / `admin` or `user` / `user`).
   - The page will show an alert indicating success or failure.

Notes about sessions and redirects
----------------------------------
- This serverless approach returns JSON only. It does NOT create PHP sessions on the server because PHP is not running. If you need session-authenticated pages, you'll need to either:
  - Host the PHP app and DB on a PHP host (then the original flow works), or
  - Implement a token-based authentication flow (JWT) and migrate pages to serverless/static + client session handling.

Security notes
--------------
- The current database stores plaintext passwords. For production, migrate to hashed passwords (bcrypt/argon2).
- Never commit real DB credentials into source control; use Vercel env vars.

If you want help next
---------------------
- I can:
  - Help import `dbchua.sql` into a managed provider if you give the provider's DB connection details (or you can run import yourself following step 2), and then I can deploy/verify.
  - Convert serverless responses to issue a short-lived JWT and show how to protect static pages.
  - Or prepare a full migration guide to move the entire PHP app to a PHP host so sessions continue to work exactly like locally.
