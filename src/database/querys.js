export const queries = {
    getAllSucursales: 'Select * FROM GetAllSucursales',
    getSucursalById: 'SELECT * FROM GetAllSucursales Where IdSucursal = @Id',
    deleteSucursal: 'EXEC DeleteSucursal @IdSucursal, @IdLocalizacion'
}