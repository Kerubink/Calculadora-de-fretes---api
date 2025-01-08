import express from 'express';
import freteRoutes from './routes/freteRoutes';

const app = express();

app.use(express.json());
app.use('/api', freteRoutes);

export default app;
