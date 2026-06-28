export class MistakesController {
  constructor(getMistakesUseCase) {
    this.getMistakesUseCase = getMistakesUseCase;
  }

  async handle(req, res) {
    try {
      const data = await this.getMistakesUseCase.execute(req.params.subject);
      res.json({ ok: true, data });
    } catch (err) {
      res.status(500).json({ ok: false, error: err.message });
    }
  }
}
