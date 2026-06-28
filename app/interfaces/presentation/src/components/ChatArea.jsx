import { useState, useEffect, useRef } from 'react';
import { Send } from 'lucide-react';
import { sendChat } from '../api';

const labels = { lab: 'Laboratorio', tarea: 'Tarea', consulta: 'Consulta Libre' };

const s = {
  container: {
    flex: 1,
    display: 'flex',
    flexDirection: 'column',
    borderRadius: '1.25rem',
    overflow: 'hidden',
    background: 'var(--glass-sheen), var(--surface)',
    backgroundBlendMode: 'screen, normal',
    backdropFilter: 'blur(30px) saturate(200%) contrast(1.04)',
    WebkitBackdropFilter: 'blur(30px) saturate(200%) contrast(1.04)',
    border: '1px solid var(--border)',
  },
  header: {
    flexShrink: 0,
    padding: '0.6rem 1rem',
    borderBottom: '1px solid var(--border)',
    fontSize: '0.85rem',
    color: 'var(--text-muted)',
  },
  messages: {
    flex: 1,
    overflowY: 'auto',
    padding: '0.75rem',
    display: 'flex',
    flexDirection: 'column',
    gap: '0.5rem',
  },
  inputRow: {
    flexShrink: 0,
    padding: '0.4rem 0.6rem',
    borderTop: '1px solid var(--border)',
  },
  inputWrap: {
    display: 'flex',
    gap: '0.4rem',
    alignItems: 'flex-end',
    borderRadius: '1.25rem',
    padding: '0.15rem 0.15rem 0.15rem 0.75rem',
    background: 'var(--glass-sheen), var(--surface)',
    backgroundBlendMode: 'screen, normal',
    backdropFilter: 'blur(30px) saturate(200%) contrast(1.04)',
    WebkitBackdropFilter: 'blur(30px) saturate(200%) contrast(1.04)',
    border: '1px solid var(--border)',
  },
  input: {
    flex: 1,
    background: 'transparent',
    padding: '0.45rem 0',
    fontSize: '0.85rem',
    outline: 'none',
    border: 'none',
    color: 'var(--text)',
  },
  sendBtn: {
    flexShrink: 0,
    padding: '0.45rem 0.9rem',
    borderRadius: '999px',
    fontSize: '0.8rem',
    fontWeight: 700,
    border: 'none',
    cursor: 'pointer',
    background: 'var(--green)',
    color: '#fff',
    display: 'flex',
    alignItems: 'center',
    gap: '0.3rem',
    transition: 'opacity 0.15s',
  },
};

const intros = {
  lab: (name) => `¡Empecemos a trabajar en tu laboratorio de **${name}**! Cuéntame qué actividad estás desarrollando o qué duda tienes sobre la práctica.`,
  tarea: (name) => `¡Empecemos a trabajar en tu tarea de **${name}**! ¿En qué necesitas ayuda?`,
  consulta: (name) => {
    const qs = [
      `¿Qué te gustaría explorar de **${name}** hoy?`,
      `Cuéntame, ¿hay algún tema de **${name}** que te gustaría repasar?`,
      `En **${name}**, ¿qué área te causa más curiosidad?`,
      `¡Hablemos de **${name}**! ¿Prefieres practicar o repasar conceptos?`,
      `¿Tienes alguna pregunta sobre **${name}**?`,
    ];
    return qs[Math.floor(Math.random() * qs.length)];
  },
};

function parseMsg(text) {
  return text.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>');
}

function Message({ text, isUser }) {
  const bg = isUser ? 'var(--surface-strong)' : 'var(--surface)';
  const radius = isUser ? '1.25rem 1.25rem 0.4rem 1.25rem' : '1.25rem 1.25rem 1.25rem 0.4rem';
  return (
    <div style={{ display: 'flex', justifyContent: isUser ? 'flex-end' : 'flex-start' }}>
      <div style={{
        maxWidth: '80%',
        borderRadius: radius,
        padding: '0.6rem 0.9rem',
        background: `var(--glass-sheen), ${bg}`,
        backgroundBlendMode: 'screen, normal',
        border: '1px solid var(--border)',
        fontSize: '0.88rem',
        lineHeight: 1.45,
        color: 'var(--text)',
        animation: 'fadeIn 0.3s ease',
      }}
        dangerouslySetInnerHTML={{ __html: parseMsg(text) }} />
    </div>
  );
}

export default function ChatArea({ context }) {
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState('');
  const [loading, setLoading] = useState(false);
  const endRef = useRef(null);

  useEffect(() => {
    endRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages]);

  useEffect(() => {
    if (!context) return;
    const { subject, type } = context;
    const msg = intros[type](subject.name);
    setMessages([{ text: msg, isUser: false }]);
  }, [context]);

  async function handleSend() {
    const text = input.trim();
    if (!text || !context) return;
    setInput('');
    setMessages(prev => [...prev, { text, isUser: true }]);
    setLoading(true);
    try {
      const typeCtx = context.type === 'lab' ? 'laboratorio' : context.type === 'tarea' ? 'tarea' : 'consulta libre';
      const query = `[${context.subject.name} - ${typeCtx}] ${text}`;
      const reply = await sendChat(context.subject.code, query);
      setMessages(prev => [...prev, { text: reply, isUser: false }]);
    } catch (err) {
      setMessages(prev => [...prev, { text: 'Error: ' + err.message, isUser: false }]);
    }
    setLoading(false);
  }

  const headerText = context
    ? `${context.subject.name} · ${labels[context.type]}`
    : 'Selecciona tipo y materia';

  return (
    <main style={s.container}>
      <div style={s.header}>{headerText}</div>
      <div style={s.messages}>
        {!context && (
          <div style={{ textAlign: 'center', padding: '3rem 0', color: 'var(--text-muted)' }}>
            <p style={{ fontSize: '1rem', fontWeight: 300 }}>Selecciona el tipo</p>
            <p style={{ fontSize: '0.8rem', opacity: 0.72, marginTop: '0.3rem' }}>Luego elige la materia</p>
          </div>
        )}
        {messages.map((m, i) => <Message key={i} {...m} />)}
        {loading && <Message text="..." isUser={false} />}
        <div ref={endRef} />
      </div>
      <div style={s.inputRow}>
        <div style={s.inputWrap}>
          <input
            style={s.input}
            placeholder={context ? "Escribe tu mensaje..." : "Selecciona tipo y materia primero"}
            value={input}
            onChange={e => setInput(e.target.value)}
            onKeyDown={e => e.key === 'Enter' && handleSend()}
            disabled={!context}
          />
          <button
            style={{ ...s.sendBtn, opacity: (!context || loading) ? 0.5 : 1 }}
            onClick={handleSend}
            disabled={!context || loading}
          >
            <Send size={14} /> Enviar
          </button>
        </div>
      </div>
    </main>
  );
}
