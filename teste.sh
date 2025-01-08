#!/bin/bash

# Defina o caminho base da estrutura
BASE_DIR="src"

# Criar diretórios principais
mkdir -p $BASE_DIR/controllers $BASE_DIR/models $BASE_DIR/routes $BASE_DIR/services $BASE_DIR/utils $BASE_DIR/config $BASE_DIR/middlewares

# Criar arquivos de exemplo
echo "import express from 'express';
import freteRoutes from './routes/freteRoutes';

const app = express();

app.use(express.json());
app.use('/api', freteRoutes);

export default app;" > $BASE_DIR/app.ts

echo "import app from './app';

const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(\`Servidor rodando em http://localhost:\${port}\`);
});" > $BASE_DIR/server.ts

echo "import { Request, Response } from 'express';
import { calcularFrete } from '../services/freteService';

export const calcularFreteController = async (req: Request, res: Response) => {
  try {
    const { cepOrigem, cepDestino, peso, comprimento, altura, largura } = req.query;
    const resultado = await calcularFrete(cepOrigem as string, cepDestino as string, peso as string, comprimento as string, altura as string, largura as string);
    res.json(resultado);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao calcular o frete' });
  }
};" > $BASE_DIR/controllers/freteController.ts

echo "export const calcularFrete = async (cepOrigem: string, cepDestino: string, peso: string, comprimento: string, altura: string, largura: string) => {
  const valorFrete = 30.0; // Exemplo
  return { valorFrete };
};" > $BASE_DIR/services/freteService.ts

echo "import express from 'express';
import { calcularFreteController } from '../controllers/freteController';

const router = express.Router();

router.get('/frete', calcularFreteController);

export default router;" > $BASE_DIR/routes/freteRoutes.ts

echo "export const config = {
  port: process.env.PORT || 3000,
};" > $BASE_DIR/config/config.ts

echo "import { Request, Response, NextFunction } from 'express';

export const authMiddleware = (req: Request, res: Response, next: NextFunction) => {
  next();
};" > $BASE_DIR/middlewares/authMiddleware.ts

echo "export const formatarValorFrete = (valor: number) => {
  return \`R$\${valor.toFixed(2)}\`;
};" > $BASE_DIR/utils/helpers.ts

echo "Estrutura de pastas e arquivos criada com sucesso!"
