export class AverageController {
  constructor(getAverageUseCase) {
    this.getAverageUseCase = getAverageUseCase;
  }

  async handle(_req, res) {
    try {
      const data = await this.getAverageUseCase.execute();
      res.json({ ok: true, data });
    } catch (err) {
      res.status(500).json({ ok: false, error: err.message });
    }
  }
}
