export class PersonalityController {
  constructor(getPersonalityUseCase) {
    this.getPersonalityUseCase = getPersonalityUseCase;
  }

  async handle(req, res) {
    try {
      const data = await this.getPersonalityUseCase.execute(req.params.subject);
      res.json({ ok: true, data });
    } catch (err) {
      res.status(500).json({ ok: false, error: err.message });
    }
  }
}
