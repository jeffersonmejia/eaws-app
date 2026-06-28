import { Router } from 'express';

export function buildRoutes(controllers) {
  const router = Router();

  router.get('/personality/:subject', (req, res) =>
    controllers.personality.handle(req, res));
  router.get('/summary', (req, res) =>
    controllers.summary.handle(req, res));
  router.get('/mistakes/:subject', (req, res) =>
    controllers.mistakes.handle(req, res));
  router.post('/chat', (req, res) =>
    controllers.chat.handle(req, res));
  router.get('/student', (req, res) =>
    controllers.student.handle(req, res));
  router.get('/average', (req, res) =>
    controllers.average.handle(req, res));
  router.get('/health', (_req, res) =>
    res.json({ ok: true, service: 'eaws-backend' }));

  return router;
}
