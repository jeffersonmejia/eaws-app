import { getPool } from '../../infrastructure/database/connection.js';

export class GetAverageUseCase {
  async execute() {
    const [rows] = await getPool().query(`
      WITH last_unit AS (
        SELECT ps.subject_id AS sid, MAX(u.order_index) AS max_ord
        FROM units u
        JOIN professor_subjects ps ON u.subject_id = ps.subject_id
        JOIN assessments a ON a.unit_id = u.id
        JOIN grades g ON g.assessment_id = a.id
        GROUP BY ps.subject_id
      ),
      unit_assessments AS (
        SELECT l.sid, l.max_ord, a.id, a.weight, g.score
        FROM last_unit l
        JOIN professor_subjects ps ON ps.subject_id = l.sid
        JOIN assessments a ON a.professor_subject_id = ps.id
        JOIN units u ON a.unit_id = u.id
        JOIN grades g ON g.assessment_id = a.id
        WHERE u.order_index = l.max_ord
      )
      SELECT s.name AS subject,
        SUM(ua.score * ua.weight) / SUM(ua.weight) AS weighted_avg,
        MAX(ua.max_ord) AS ord
      FROM unit_assessments ua
      JOIN subjects s ON ua.sid = s.id
      GROUP BY s.id, s.name
      ORDER BY s.name
    `);
    const ord = rows[0]?.ord || 1;
    const partial = `${ord}P`;
    const subjects = rows.map(r => ({
      subject: r.subject,
      avg: Math.round(parseFloat(r.weighted_avg) * 100) / 100,
    }));
    const general = subjects.length
      ? Math.round(subjects.reduce((s, x) => s + x.avg, 0) / subjects.length * 100) / 100
      : 0;
    return { general, subjects, partial };
  }
}
