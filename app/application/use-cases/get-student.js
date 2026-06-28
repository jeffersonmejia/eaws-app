import { getPool } from '../../infrastructure/database/connection.js';

export class GetStudentUseCase {
  async execute() {
    const [rows] = await getPool().query(
      'SELECT config_key, config_value FROM app_config WHERE config_key LIKE ?',
      ['student_%']
    );
    const data = { subjects: [] };
    for (const r of rows) {
      const key = r.config_key.replace('student_', '');
      data[key] = r.config_value;
    }
    const [subjects] = await getPool().query(
      'SELECT s.name, s.code FROM subjects s JOIN professor_subjects ps ON ps.subject_id = s.id GROUP BY s.id ORDER BY s.name'
    );
    data.subjects = subjects;
    return data;
  }
}
