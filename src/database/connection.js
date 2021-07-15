import sql from 'mssql';

const dbSettings = {
  user: 'sa',
  password: 'AbrAz0501',
  server: 'localhost',
  database: 'myPark',
  encrypt: true,
  trustServerCertificate: true
}

export async function getConnection() {
  try {
    const pool = await sql.connect(dbSettings);
    return pool;
  } catch (error) {
    console.error(error);
  }
}
