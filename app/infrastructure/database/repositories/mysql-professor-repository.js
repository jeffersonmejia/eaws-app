import { getPool } from '../connection.js';

export class MySQLProfessorRepository {
  async findBySubject(subjectCode) {
    const [rows] = await getPool().query(`
      SELECT p.name AS professor, pp.aspect, pp.detail
      FROM professor_personalities pp
      JOIN professors p ON pp.professor_id = p.id
      JOIN professor_subjects ps ON ps.professor_id = p.id
      JOIN subjects s ON ps.subject_id = s.id
      WHERE s.code = ?
      ORDER BY pp.aspect
    `, [subjectCode]);
    return rows;
  }
}
