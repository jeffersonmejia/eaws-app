import { Summary } from '../../domain/entities/summary.js';
import { Subject } from '../../domain/entities/subject.js';

export class GetSummaryUseCase {
  constructor(subjectRepository, gradeRepository) {
    this.subjectRepository = subjectRepository;
    this.gradeRepository = gradeRepository;
  }

  async execute() {
    const subjects = await this.subjectRepository.findAll();
    const grades = await this.gradeRepository.findAll();
    return new Summary({
      currentSemester: null,
      subjects: subjects.map(s => new Subject(s)),
      grades,
    });
  }
}
