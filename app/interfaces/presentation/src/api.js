const BASE = '/api';

export async function fetchStudent() {
  const res = await fetch(`${BASE}/student`);
  return (await res.json()).data;
}

export async function fetchAverage() {
  const res = await fetch(`${BASE}/average`);
  return (await res.json()).data;
}

export async function sendChat(subject, query) {
  const res = await fetch(`${BASE}/chat`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ subject, query }),
  });
  const json = await res.json();
  return json.data || '(sin respuesta)';
}
