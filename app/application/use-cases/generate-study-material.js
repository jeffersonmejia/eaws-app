export class GenerateStudyMaterialUseCase {
  constructor(professorRepository, summaryService) {
    this.professorRepository = professorRepository;
    this.summaryService = summaryService;
  }

  async execute({ subjectCode, query, summary }) {
    const professors = await this.professorRepository.findBySubject(subjectCode);
    return this.summaryService.generate({ professors, query, summary });
  }
}
