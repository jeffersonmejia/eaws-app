export class StudentController {
  constructor(getStudentUseCase) {
    this.getStudentUseCase = getStudentUseCase;
  }

  async handle(_req, res) {
    try {
      const data = await this.getStudentUseCase.execute();
      res.json({ ok: true, data });
    } catch (err) {
      res.status(500).json({ ok: false, error: err.message });
    }
  }
}
