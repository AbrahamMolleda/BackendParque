import express from 'express';
import cors from 'cors';
import config from './config'
import sucursalesRoutes from './routes/sucursales.routes'

const app = express();
const { port, host } = config;

// settings
app.set('port', port);

app.use(cors());

// middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(sucursalesRoutes);

export default app;