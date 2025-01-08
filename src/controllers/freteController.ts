import { Request, Response } from 'express';
import { calcularFrete } from '../services/freteService';

export const calcularFreteController = async (req: Request, res: Response) => {
  try {
    const { cepOrigem, cepDestino, peso, comprimento, altura, largura } = req.query;
    const resultado = await calcularFrete(cepOrigem as string, cepDestino as string, peso as string, comprimento as string, altura as string, largura as string);
    res.json(resultado);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao calcular o frete' });
  }
};
