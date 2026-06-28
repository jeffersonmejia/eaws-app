export class GetMistakesUseCase {
  constructor(gradeRepository) {
    this.gradeRepository = gradeRepository;
  }

  async execute(subjectCode) {
    return this.gradeRepository.findBySubject(subjectCode);
  }
}
