import { getPool } from '../connection.js';

export class MySQLSubjectRepository {
  async findAll() {
    const [rows] = await getPool().query(`
      SELECT DISTINCT s.name, s.code
      FROM subjects s
      JOIN professor_subjects ps ON ps.subject_id = s.id
      ORDER BY s.name
    `);
    return rows;
  }
}
