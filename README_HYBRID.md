Hybrid deployment (Vercel front-end + external PHP host)
=====================================================

This guide walks you through hosting the frontend on Vercel (static) while running the PHP backend (the `admin/` folder and PHP scripts) on a PHP-capable host (shared hosting / cPanel / Hostinger / etc.). This lets Vercel serve the static UI while the PHP host handles authentication and database access.

What we changed in the repo
- `index.html` form action now points to a placeholder `https://YOUR_PHP_HOST_DOMAIN/admin/login.php`. Replace with your host domain.
- The serverless `/api/login` route is available in the repo but not used in hybrid mode. The hybrid approach posts directly to your PHP host.

Steps — summary
1. Choose a PHP-capable host (cPanel/Hostinger/A2/other).
2. Create a MySQL database there and import `dbchua.sql`.
3. Upload the project's `admin/` folder and PHP files to the host (via FTP or File Manager).
4. Update `admin/connect.php` on the host with the host's DB credentials.
5. Set `index.html` form action to the absolute URL of your PHP host (already set to a placeholder).
6. Test login — the form will POST to the PHP host which sets PHP sessions and redirects to PHP pages.

Detailed steps
--------------

1) Prepare the database on the PHP host
- In your hosting control panel (cPanel), create a new MySQL database and a database user. Grant the user all privileges for that database.

2) Import `dbchua.sql` into the host database
Option A — Using phpMyAdmin (recommended on shared hosts):
  - Log into your host control panel → phpMyAdmin.
  - Select the newly created database → Import → choose `dbchua.sql` (found in the repo root) → Go.

Option B — Using mysql client (if your host supports remote import):
  - On your local machine where `dbchua.sql` is located, run (PowerShell):

```powershell
# replace placeholders
$DB_HOST = "<HOST_DB_ENDPOINT>"
$DB_USER = "<DB_USER>"
$DB_NAME = "<DB_NAME>"
mysql -h $DB_HOST -u $DB_USER -p $DB_NAME < "C:\xampp\htdocs\student_information\dbchua.sql"
```

3) Upload PHP files to your host
- Using FTP (FileZilla) or the host's File Manager:
  - Upload the entire `admin/` folder from this repo to the webroot on the PHP host (e.g., `public_html/admin/`).
  - Ensure file permissions are correct (644 for files, 755 for directories).

4) Update `admin/connect.php` on the host
- We included a template `admin/connect.php.template` in the repo. On the host, rename it to `connect.php` (or edit the existing `connect.php`) and replace placeholders with the DB host/user/password/dbname from your hosting control panel.

Example `connect.php` (on the host):
```php
<?php
  $server = "your-db-host.example.com";
  $user   = "your_db_user";
  $pass   = "your_db_pass";
  $dbname = "your_db_name";

  $conn = new mysqli($server, $user, $pass, $dbname);
  if ($conn->connect_error) {
    die("Connection Failed: " . $conn->connect_error);
  }
  $conn->set_charset("utf8mb4");
?>
```

5) Update the form action in the frontend
- `index.html` already contains a placeholder action:
  `<form id="formAuthentication" action="https://YOUR_PHP_HOST_DOMAIN/admin/login.php" method="POST">`
- Replace `https://YOUR_PHP_HOST_DOMAIN` with your real host domain (for example `https://example.com` or `https://username.hostingprovider.com`). Commit and deploy to Vercel.

6) Sessions and redirects
- After a successful login `admin/login.php` redirects to PHP pages (e.g., `index.php` or `../user/index.php`) that run on the PHP host. To keep the session working you should let the user remain on the PHP host domain after login (i.e., let PHP handle redirects on that host). Cross-domain PHP sessions are not practical.

Testing
-------
- Visit your Vercel site, fill the form and submit. The browser will POST to the PHP host.
- Or visit the PHP host directly at `https://your-php-host/admin/login.php` and test login there.
- Use credentials from `dbchua.sql`:
  - admin / admin
  - user / user
  - Chua / 123

Troubleshooting
---------------
- If you see a white page or PHP error: check the PHP error logs on the host.
- If database connection fails: double-check values in `connect.php` and ensure the DB user has privileges.
- If uploads fail: check file permissions.

Security notes
--------------
- Don't commit `connect.php` with real credentials to git. Use the host's file manager to edit the file directly on the server.
- Move to hashed passwords in production — the current DB uses plaintext passwords.

If you want, I can:
- Update `index.html` to include your actual PHP host domain (tell me the domain) and push the change, or
- Create a short `import-db.ps1` script you can run locally to import `dbchua.sql` (you provide DB credentials locally when running).
Hybrid deployment (Vercel front-end + PHP host for auth/database)
===============================================================

This guide shows how to keep the front-end on Vercel (static) while running the PHP backend and MySQL on a PHP-capable host.

Overview
--------
- Front-end: deployed on Vercel (serves `index.html`).
- Backend: PHP files under `admin/` (including `admin/login.php`, `admin/connect.php`) must be uploaded to a PHP host that supports MySQL.
- Database: import `dbchua.sql` into the host's MySQL.

Steps
-----

1) Choose a PHP host
   - Examples: shared cPanel hosting (Hostinger, Namecheap), A2, DigitalOcean App Platform (with PHP), or a small VPS.

2) Export / verify SQL (you already have `dbchua.sql` in the repo)
   - File path in repo: `dbchua.sql` (already included).
   - If you want to export from local again:
     ```powershell
     mysqldump -u root -p dbchua > C:\temp\dbchua.sql
     ```

3) Create database and user on the PHP host
   - In cPanel (or provider control panel), create a new database and a DB user, and grant the user all privileges on that database.

4) Import `dbchua.sql` into the host DB
   - Option A (phpMyAdmin): log into host phpMyAdmin → Import → choose `dbchua.sql` → Go.
   - Option B (mysql client, from your machine):
     ```powershell
     mysql -h <HOST> -u <USER> -p <DBNAME> < C:\xampp\htdocs\student_information\dbchua.sql
     ```

5) Upload PHP files to the host
   - Upload the `admin/` directory (and any other necessary PHP files) via FTP, SFTP, or File Manager.
   - Ensure `admin/login.php`, `admin/register.php`, etc., are in the correct web-accessible path.

6) Update `admin/connect.php` on the host
   - On the host, edit `admin/connect.php` to use the host's DB credentials. Example:
     ```php
     <?php
     $server = 'localhost'; // or the host's DB endpoint
     $user   = 'YOUR_DB_USER';
     $pass   = 'YOUR_DB_PASS';
     $dbname = 'YOUR_DB_NAME';

     $conn = new mysqli($server, $user, $pass, $dbname);
     if ($conn->connect_error) {
       die('Connection Failed: ' . $conn->connect_error);
     }
     $conn->set_charset('utf8mb4');
     ?>
     ```

7) Update the Vercel front-end form action (done in `index.html`)
   - In the repository `index.html` the login form action has been set to a placeholder:
     ```html
     <form id="formAuthentication" action="https://YOUR_PHP_HOST_DOMAIN/admin/login.php" method="POST">
     ```
   - Replace `https://YOUR_PHP_HOST_DOMAIN` with your actual PHP host domain (e.g., `https://myapp.example.com`). Commit and push the change to Vercel.

8) Sessions / cookies / redirects
   - When `admin/login.php` authenticates, it sets PHP session cookies for the PHP host domain only. To keep UX simple, have `admin/login.php` redirect users to pages on the PHP host (e.g., `admin/index.php` on the PHP host) after login.
   - Avoid trying to share PHP sessions across different domains — that's complex and brittle.

9) Test
   - Visit your Vercel front-end and submit the login form. It will POST to the PHP host which will perform authentication.
   - If login succeeds, the PHP host should redirect to a page on its domain where the session is valid.

Troubleshooting
---------------
- If the form POST returns an error or blank page: check `error_log` on the PHP host and ensure `admin/login.php` had no fatal errors.
- If DB errors appear: check `admin/connect.php` credentials and database import.
- If uploads are blocked: verify file permissions and that PHP files are accessible.

Security notes
--------------
- Do not commit real DB credentials to git. Only the template `connect.php.template` should be in repo. Add the actual `connect.php` directly on the host.
- For production, store hashed passwords (bcrypt) instead of plaintext.

If you want, I can:
- Add a small `admin/connect.php.template` (if missing) — you can copy it on the host and fill credentials.
- Create a short PowerShell `import-db.ps1` that prompts for creds and imports `dbchua.sql` (you run it locally).

---
Replace the placeholder in `index.html` with your PHP host domain and upload `admin/`+DB to the host. If you share which hosting provider you'll use, I can give provider-specific steps.
