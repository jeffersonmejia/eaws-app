import { useState } from 'react';
import {
  ChevronRight, User, TrendingUp, BookOpen,
  FlaskConical, FileText, MessageCircle,
  Sun, Moon, PanelRightClose, PanelRightOpen,
} from 'lucide-react';

const glass = {
  background: 'var(--glass-sheen), var(--surface)',
  backgroundBlendMode: 'screen, normal',
  backdropFilter: 'blur(30px) saturate(200%) contrast(1.04)',
  WebkitBackdropFilter: 'blur(30px) saturate(200%) contrast(1.04)',
  border: '1px solid var(--border)',
};

const row = {
  display: 'flex',
  alignItems: 'center',
  gap: '0.4rem',
  padding: '0.35rem 0.5rem',
  fontSize: '0.78rem',
  borderRadius: '0.7rem',
  cursor: 'pointer',
  border: 'none',
  color: 'var(--text)',
  width: '100%',
  textAlign: 'left',
  background: 'transparent',
  transition: 'background 0.15s, transform 0.15s',
};

const icon = { width: '15px', height: '15px', flexShrink: 0, color: 'var(--green)' };
const green = { color: 'var(--green)' };

const types = [
  { key: 'lab', label: 'Laboratorio', icon: FlaskConical },
  { key: 'tarea', label: 'Tarea', icon: FileText },
  { key: 'consulta', label: 'Consulta Libre', icon: MessageCircle },
];

function SectionLabel({ icon: Icon, label }) {
  return (
    <div style={{ fontSize: '0.6rem', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase', letterSpacing: '0.08em', padding: '0.45rem 0.5rem 0.15rem' }}>
      <Icon size={12} style={{ marginRight: '0.2rem', verticalAlign: 'middle', ...green }} />
      {label}
    </div>
  );
}

export default function Sidebar({ student, average, open, dark, onToggleTheme, onToggleSidebar, onSelect }) {
  const [openSubject, setOpenSubject] = useState(null);

  if (!open) {
    return (
      <aside style={{ width: '2.5rem', flexShrink: 0, borderRadius: '1.25rem', display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '0.4rem', gap: '0.5rem', transition: '0.3s', ...glass }}>
        <button style={{ ...row, padding: '0.4rem', justifyContent: 'center', borderRadius: '0.8rem' }} onClick={onToggleSidebar}>
          <PanelRightOpen {...icon} />
        </button>
      </aside>
    );
  }

  return (
    <aside style={{ width: '14rem', flexShrink: 0, borderRadius: '1.25rem', display: 'flex', flexDirection: 'column', padding: '0.5rem', gap: '0.25rem', overflowY: 'auto', transition: '0.3s', ...glass }}>

      {/* collapse */}
      <button style={{ ...row, justifyContent: 'flex-end', padding: '0.15rem 0.25rem', borderRadius: '1rem', alignSelf: 'flex-end' }} onClick={onToggleSidebar}>
        <PanelRightClose size={14} style={{ color: 'var(--text-muted)' }} />
      </button>

      {/* profile */}
      <div style={{ display: 'flex', alignItems: 'center', gap: '0.45rem', borderRadius: '0.8rem', padding: '0.3rem 0.5rem', background: 'var(--glass-sheen), var(--surface-strong)', backgroundBlendMode: 'screen, normal', border: '1px solid var(--border)' }}>
        <User {...icon} />
        {student ? (
          <div style={{ minWidth: 0, flex: 1 }}>
            <div style={{ fontSize: '0.78rem', fontWeight: 600, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{student.name}</div>
            <div style={{ fontSize: '0.6rem', color: 'var(--text-muted)' }}>S{student.semester}/{student.total_semesters}</div>
          </div>
        ) : (
          <div style={{ fontSize: '0.7rem', color: 'var(--text-muted)' }}>...</div>
        )}
      </div>

      {/* divider */}
      <div style={{ height: '1px', background: 'var(--border)', margin: '0.15rem 0.5rem' }} />

      {/* average */}
      {average && (
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.4rem', borderRadius: '0.8rem', padding: '0.3rem 0.5rem', ...glass }}>
          <TrendingUp {...icon} />
          <span style={{ fontSize: '1.2rem', fontWeight: 900, color: 'var(--green)', lineHeight: 1 }}>{average.general.toFixed(1)}</span>
          <span style={{ fontSize: '0.6rem', color: 'var(--text-muted)', marginTop: '0.3rem' }}>/20</span>
        </div>
      )}

      {/* divider */}
      <div style={{ height: '1px', background: 'var(--border)', margin: '0.15rem 0.5rem' }} />

      {/* subjects */}
      <SectionLabel icon={BookOpen} label="Materias" />

      {(student?.subjects || []).map(subj => {
        const isOpen = openSubject === subj.code;
        return (
          <div key={subj.code} style={{ borderRadius: '0.7rem', overflow: 'hidden' }}>
            <button style={row} className="glass-btn" onClick={() => setOpenSubject(isOpen ? null : subj.code)}>
              <ChevronRight size={13} style={{ ...icon, transition: 'transform 0.2s', transform: isOpen ? 'rotate(90deg)' : 'none' }} />
              <span style={{ overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', flex: 1 }}>{subj.name}</span>
            </button>
            <div style={{ overflow: 'hidden', maxHeight: isOpen ? '150px' : '0', transition: 'max-height 0.25s ease', display: 'flex', flexDirection: 'column', gap: '1px' }}>
              {types.map(t => {
                const Icon = t.icon;
                return (
                  <button key={t.key}
                    style={{ display: 'flex', alignItems: 'center', gap: '0.35rem', width: '100%', textAlign: 'left', padding: '0.28rem 0.5rem 0.28rem 1.6rem', fontSize: '0.7rem', borderRadius: '0.6rem', border: 'none', cursor: 'pointer', color: 'var(--text-muted)', background: 'transparent', transition: 'background 0.15s, color 0.15s' }}
                    onMouseEnter={e => { e.currentTarget.style.background = 'var(--surface)'; e.currentTarget.style.color = 'var(--text)'; }}
                    onMouseLeave={e => { e.currentTarget.style.background = 'transparent'; e.currentTarget.style.color = 'var(--text-muted)'; }}
                    onClick={() => onSelect(subj, t.key)}
                  >
                    <Icon size={13} style={{ color: 'var(--green)' }} />
                    {t.label}
                  </button>
                );
              })}
            </div>
          </div>
        );
      })}

      {/* theme at bottom */}
      <div style={{ marginTop: 'auto', paddingTop: '0.3rem', borderTop: '1px solid var(--border)', display: 'flex', justifyContent: 'center' }}>
        <button style={{ ...row, justifyContent: 'center', width: 'auto', padding: '0.35rem 0.6rem', borderRadius: '0.8rem' }}
          onClick={onToggleTheme} title={dark ? 'Modo claro' : 'Modo oscuro'}>
          {dark ? <Sun size={15} style={{ color: 'var(--text-muted)' }} /> : <Moon size={15} style={{ color: 'var(--text-muted)' }} />}
        </button>
      </div>
    </aside>
  );
}
