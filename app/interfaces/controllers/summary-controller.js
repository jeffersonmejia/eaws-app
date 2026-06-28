export class SummaryController {
  constructor(getSummaryUseCase) {
    this.getSummaryUseCase = getSummaryUseCase;
  }

  async handle(_req, res) {
    try {
      const data = await this.getSummaryUseCase.execute();
      res.json({ ok: true, data });
    } catch (err) {
      res.status(500).json({ ok: false, error: err.message });
    }
  }
}
