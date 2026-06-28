export class ChatController {
  constructor(generateStudyMaterialUseCase) {
    this.generateStudyMaterialUseCase = generateStudyMaterialUseCase;
  }

  async handle(req, res) {
    try {
      const { subject, query, summary } = req.body;
      const data = await this.generateStudyMaterialUseCase.execute({
        subjectCode: subject,
        query,
        summary,
      });
      res.json({ ok: true, data });
    } catch (err) {
      res.status(500).json({ ok: false, error: err.message });
    }
  }
}
