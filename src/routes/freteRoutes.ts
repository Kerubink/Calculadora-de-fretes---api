import express from 'express';
import { calcularFreteController } from '../controllers/freteController';

const router = express.Router();

router.get('/frete', calcularFreteController);

export default router;
