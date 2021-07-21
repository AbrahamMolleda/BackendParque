import sql from 'mssql';

const dbSettings = {
  user: 'sa',
  password: 'Equipo7R6',
  server: 'pc1.centralus.cloudapp.azure.com',
  database: 'myPark',
  options: {
    trustServerCertificate: true
  }
}

export async function getConnection() {
  try {
    const pool = await sql.connect(dbSettings);
    return pool;
  } catch (error) {
    console.error(error);
  }
}

export {sql};