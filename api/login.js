import mysql from 'mysql2/promise';

export default async function handler(req, res) {
  // Only allow POST
  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST');
    return res.status(405).json({ error: 'Method not allowed' });
  }

  let body = req.body;
  // Vercel may not parse JSON automatically for this runtime; ensure body is object
  if (typeof body === 'string') {
    try {
      body = JSON.parse(body);
    } catch (e) {
      return res.status(400).json({ error: 'Invalid JSON' });
    }
  }

  const { username, password } = body || {};
  if (!username || !password) return res.status(400).json({ error: 'Missing credentials' });

  // Use environment variables set in Vercel: DB_HOST, DB_USER, DB_PASS, DB_NAME
  const dbHost = process.env.DB_HOST;
  const dbUser = process.env.DB_USER;
  const dbPass = process.env.DB_PASS;
  const dbName = process.env.DB_NAME;

  if (!dbHost || !dbUser || !dbName) {
    return res.status(500).json({ error: 'Database not configured on server' });
  }

  let conn;
  try {
    conn = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPass,
      database: dbName,
      charset: 'utf8mb4',
    });

    const [rows] = await conn.execute('SELECT * FROM users WHERE username = ? LIMIT 1', [username]);
    await conn.end();

    if (!rows || rows.length === 0) {
      return res.status(401).json({ ok: false, error: 'Invalid credentials' });
    }

    const user = rows[0];
    // NOTE: this project stores plaintext passwords. For production, use hashing.
    if (user.password === password) {
      // Return a simple success payload. Sessions/cookies require a full server that supports PHP sessions.
      return res.status(200).json({ ok: true, username: user.username, role: user.role });
    }

    return res.status(401).json({ ok: false, error: 'Invalid credentials' });
  } catch (err) {
    console.error('DB error:', err?.message || err);
    if (conn && conn.end) try { await conn.end(); } catch (e) {}
    return res.status(500).json({ error: 'Server error' });
  }
}
