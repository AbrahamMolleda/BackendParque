import {Router} from 'express';
import { createNewSucursal, getSucursales } from '../controllers/sucursales.controller'

const router = Router();

router.get('/sucursales', getSucursales);
router.get('/sucursales', );
router.post('/sucursales', createNewSucursal );
router.delete('/sucursales', );
router.put('/sucursales', );


export default router;