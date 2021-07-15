import { getConnection } from '../database/connection';  

export const getSucursales = async (request, response) => {
  const pool = await getConnection();
  const result = await pool.request().query('Select * FROM GetSucursales');
  response.json(result.recordset);

}

export const createNewSucursal = (request, response) => {
  const {
    NombreSucursal,
    Calle,
    Numero,
    Colonia,
    CP
    // IdMunicipio
  } = request.body;

  const resultado = request.body;

  if (NombreSucursal == null || Calle == null || Numero == null || Colonia == null || CP == null) {
    return response.status(400).json({msg: 'Bad Request'});
  }

  
  response.json('Nueva Sucursal');
}
