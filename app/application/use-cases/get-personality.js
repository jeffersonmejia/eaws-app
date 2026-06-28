export class GetPersonalityUseCase {
  constructor(professorRepository) {
    this.professorRepository = professorRepository;
  }

  async execute(subjectCode) {
    const professors = await this.professorRepository.findBySubject(subjectCode);
    const grouped = {};
    for (const p of professors) {
      if (!grouped[p.professor]) grouped[p.professor] = {};
      grouped[p.professor][p.aspect] = p.detail;
    }
    return grouped;
  }
}
