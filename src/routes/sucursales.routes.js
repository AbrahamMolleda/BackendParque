import {Router} from 'express';
import { createNewSucursal, getSucursales, getSucursalById, deleteSucursalById, updateSucursalById } from '../controllers/sucursales.controller'

const router = Router();

router.get('/sucursales', getSucursales);
router.get('/sucursales/:id', getSucursalById);
router.post('/sucursales', createNewSucursal );
router.delete('/sucursales/:id', deleteSucursalById);
router.put('/sucursales/:id', updateSucursalById);


export default router;