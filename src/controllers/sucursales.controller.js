import { getConnection, sql, queries } from '../database';

export const getSucursales = async (request, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query(queries.getAllSucursales);
    res.json(result.recordset);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
}

export const createNewSucursal = async (req, res) => {
  const {
    NombreSucursal,
    Calle,
    Numero,
    Colonia,
    CP,
    Municipio,
    Estado
  } = req.body;

  try {
    const pool = await getConnection();
    await pool
      .request()
      .query(
        `EXEC NewSucursal '${Estado}', '${Municipio}', '${CP}', '${Calle}', '${Colonia}', '${Numero}', '${NombreSucursal}'`
      )
    res.json(req.body);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
}

export const getSucursalById = async (req, res) => {
  const {id} = req.params;
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("Id", id)
    .query(queries.getSucursalById);
  res.send(result.recordset)
}

export const deleteSucursalById = async (req, res) => {
  const {id} = req.params;
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("IdLocalizacion", id)
    .input("IdSucursal", id)
    .query(queries.deleteSucursal)
    res.sendStatus(204);
}

export const updateSucursalById = async (req, res) => {
  const {
    NombreSucursal,
    Calle,
    Numero,
    Colonia,
    CP
  } = req.body;

  const {id} = req.params;
  const pool = await getConnection();
  const result = await pool
    .request()
    .query(
      `EXEC UpdateSucursal ${id}, ${id}, '${NombreSucursal}', '${Calle}', ${Numero}, '${Colonia}', '${CP}'`
    );
  res.json(req.body)
}