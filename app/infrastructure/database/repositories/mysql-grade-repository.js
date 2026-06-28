import { getPool } from '../connection.js';
import { Grade } from '../../../domain/entities/grade.js';

export class MySQLGradeRepository {
  async findBySubject(subjectCode) {
    const [rows] = await getPool().query(`
      SELECT g.score, g.feedback, a.name AS assessment, s.name AS subject
      FROM grades g
      JOIN assessments a ON g.assessment_id = a.id
      JOIN professor_subjects ps ON a.professor_subject_id = ps.id
      JOIN subjects s ON ps.subject_id = s.id
      WHERE s.code = ? AND g.feedback IS NOT NULL AND g.feedback != ''
      ORDER BY g.score ASC
    `, [subjectCode]);
    return rows.map(r => new Grade(r));
  }

  async findAll() {
    const [rows] = await getPool().query(`
      SELECT s.name AS subject, a.name AS assessment, g.score, g.feedback
      FROM grades g
      JOIN assessments a ON g.assessment_id = a.id
      JOIN professor_subjects ps ON a.professor_subject_id = ps.id
      JOIN subjects s ON ps.subject_id = s.id
      ORDER BY s.name
    `);
    return rows.map(r => new Grade(r));
  }
}
