import { env } from '../../config/env.js';

const createHeaders = () => ({
  'Content-Type': 'application/json',
  ...(env.opencode.token ? { Authorization: `Bearer ${env.opencode.token}` } : {}),
});

export class OpencodeClient {
  async generate({ professors, query, summary }) {
    const grouped = {};
    for (const row of professors) {
      if (!grouped[row.professor]) grouped[row.professor] = [];
      grouped[row.professor].push(row);
    }
    const personality = Object.entries(grouped)
      .map(([name, rows]) =>
        `--- ${name} ---\n` +
        rows.map(r => `${r.aspect}: ${r.detail}`).join('\n')
      ).join('\n\n');

    const system = [
      summary ? `Resumen del estudiante: ${summary}` : '',
      `Personalidades de profesores:\n${personality}`,
      'Genera material de estudio personalizado para obtener la máxima calificación.',
      'Usa un estilo técnico, preciso y natural, sin muletillas de IA.',
    ].filter(Boolean).join('\n\n');

    const userMessage = query || (
      'Genera material de estudio para prepararme para el examen. ' +
      'Enfócate en los temas donde puedo cometer errores y en lo que el profesor valora.'
    );

    const sessionRes = await fetch(`${env.opencode.url}/session`, {
      method: 'POST',
      headers: createHeaders(),
      body: JSON.stringify({ title: `EAWS: study` }),
    });
    const session = await sessionRes.json();

    const msgRes = await fetch(`${env.opencode.url}/session/${session.id}/message`, {
      method: 'POST',
      headers: createHeaders(),
      body: JSON.stringify({
        parts: [
          { type: 'text', text: system },
          { type: 'text', text: userMessage },
        ],
      }),
    });
    const msg = await msgRes.json();

    await fetch(`${env.opencode.url}/session/${session.id}`, {
      method: 'DELETE',
      headers: createHeaders(),
    });

    return msg.parts?.find(p => p.type === 'text')?.text || '';
  }
}
