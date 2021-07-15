import express from 'express';
import config from './config'
import sucursalesRoutes from './routes/sucursales.routes'

const app = express();
const { port } = config;

// settings
app.set('port', port);

// middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(sucursalesRoutes);

export default app;