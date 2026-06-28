import { useState } from 'react';
import {
  BookOpen, GraduationCap, TrendingUp,
  MessageCircle,
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
  border: '1px solid transparent',
  color: 'var(--text)',
  width: '100%',
  textAlign: 'left',
  background: 'transparent',
  transition: 'background 0.15s, transform 0.15s',
};

const icon = { width: '15px', height: '15px', flexShrink: 0, color: 'var(--green)' };

const types = [
  { key: 'lab', label: 'Laboratorio' },
  { key: 'tarea', label: 'Tarea' },
  { key: 'consulta', label: 'Consulta Libre' },
];

function SectionLabel({ icon: Icon, label }) {
  return (
    <div style={{ fontSize: '0.6rem', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase', letterSpacing: '0.08em', padding: '0.45rem 0.5rem 0.15rem' }}>
      <Icon size={12} style={{ marginRight: '0.2rem', verticalAlign: 'middle', color: 'var(--green)' }} />
      {label}
    </div>
  );
}

export default function Sidebar({ student, average, open, dark, onToggleTheme, onToggleSidebar, onSelect }) {
  const [selectedType, setSelectedType] = useState(null);

  /* --- collapsed --- */
  if (!open) {
    return (
      <aside style={{ width: '3rem', flexShrink: 0, borderRadius: '1.25rem', display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '0.35rem', gap: '0.4rem', transition: '0.3s', ...glass }}>
        <button style={{ ...row, padding: '0.3rem', justifyContent: 'center', borderRadius: '0.8rem' }} onClick={onToggleSidebar}>
          <PanelRightOpen size={15} style={{ color: 'var(--text-muted)' }} />
        </button>
        <div style={{ width: '1.6rem', height: '1.6rem', borderRadius: '999px', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '0.55rem', fontWeight: 800, color: 'var(--green)', background: 'var(--glass-sheen), var(--surface-strong)', backgroundBlendMode: 'screen, normal', border: '1px solid var(--border)' }}>
          {student ? student.name.split(' ').map(w => w[0]).slice(0, 2).join('').toUpperCase() : '?'}
        </div>
        {average && (
          <span style={{ fontSize: '0.65rem', fontWeight: 600, color: 'var(--green)' }}>{average.general.toFixed(1)}</span>
        )}
        <button style={{ ...row, padding: '0.3rem', justifyContent: 'center', borderRadius: '0.8rem' }} onClick={onToggleTheme}>
          {dark ? <Sun size={14} style={{ color: 'var(--text-muted)' }} /> : <Moon size={14} style={{ color: 'var(--text-muted)' }} />}
        </button>
      </aside>
    );
  }

  /* --- expanded --- */
  return (
    <aside style={{ width: '14rem', flexShrink: 0, borderRadius: '1.25rem', display: 'flex', flexDirection: 'column', padding: '0.5rem', gap: '0.25rem', overflowY: 'auto', transition: '0.3s', ...glass }}>

      <button style={{ ...row, justifyContent: 'flex-end', padding: '0.15rem 0.25rem', borderRadius: '1rem', alignSelf: 'flex-end' }}
        onClick={onToggleSidebar}>
        <PanelRightClose size={14} style={{ color: 'var(--text-muted)' }} />
      </button>

      {/* profile + average unified card */}
      <div style={{ borderRadius: '0.9rem', padding: '0.65rem', display: 'flex', flexDirection: 'column', gap: '0.5rem',
        background: 'var(--glass-sheen), var(--surface-strong)',
        backgroundBlendMode: 'screen, normal',
        border: '1px solid var(--border)',
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
          <div style={{ width: '2.2rem', height: '2.2rem', borderRadius: '999px', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '0.7rem', fontWeight: 700, color: 'var(--green)', background: 'var(--glass-sheen), var(--surface)', backgroundBlendMode: 'screen, normal', border: '1px solid var(--border)', flexShrink: 0 }}>
            {student ? student.name.split(' ').map(w => w[0]).slice(0, 2).join('').toUpperCase() : '?'}
          </div>
          <div style={{ minWidth: 0, flex: 1 }}>
            <div style={{ fontSize: '0.82rem', fontWeight: 600, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
              {student?.name || '...'}
            </div>
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.25rem', fontSize: '0.62rem', color: 'var(--text-muted)', marginTop: '0.1rem' }}>
              <GraduationCap size={11} style={{ color: 'var(--green)' }} />
              Semestre {student?.semester || '?'}/{student?.total_semesters || '?'}
            </div>
          </div>
        </div>
        {average && (
          <div style={{ borderTop: '1px solid var(--border)', paddingTop: '0.4rem' }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.3rem', marginBottom: '0.2rem' }}>
              <TrendingUp size={13} style={{ color: 'var(--green)' }} />
              <span style={{ fontSize: '0.62rem', fontWeight: 600, color: 'var(--text-muted)', textTransform: 'uppercase', letterSpacing: '0.04em' }}>
                Promedio {average.partial}
              </span>
            </div>
            <div style={{ display: 'flex', alignItems: 'baseline', gap: '0.2rem' }}>
              <span style={{ fontSize: '0.95rem', fontWeight: 600, color: 'var(--green)' }}>
                {average.general.toFixed(1)}
              </span>
              <span style={{ fontSize: '0.65rem', color: 'var(--text-muted)' }}>/20</span>
            </div>
          </div>
        )}
      </div>

      <SectionLabel icon={MessageCircle} label="Tipo" />

      <select
        value={selectedType || ''}
        onChange={e => setSelectedType(e.target.value || null)}
        style={{
          width: '100%',
          borderRadius: '0.7rem',
          border: '1px solid var(--border-strong)',
          padding: '0.45rem 0.55rem',
          fontSize: '0.78rem',
          color: selectedType ? 'var(--text)' : 'var(--text-muted)',
          background: 'var(--surface-strong)',
          outline: 'none',
          cursor: 'pointer',
        }}
      >
        <option value="">Elige tipo...</option>
        {types.map(t => <option key={t.key} value={t.key}>{t.label}</option>)}
      </select>

      {selectedType && (
        <>
          <SectionLabel icon={BookOpen} label="Materias" />

          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.15rem' }}>
            {(student?.subjects || []).map(subj => (
              <button key={subj.code}
                style={row}
                className="glass-btn"
                onClick={() => onSelect(subj, selectedType)}
              >
                <BookOpen size={13} style={icon} />
                <span style={{ overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', flex: 1 }}>{subj.name}</span>
              </button>
            ))}
          </div>
        </>
      )}

      {/* theme */}
      <div style={{ marginTop: 'auto', paddingTop: '0.3rem', borderTop: '1px solid var(--border)', display: 'flex', justifyContent: 'center' }}>
        <button style={{ ...row, justifyContent: 'center', width: 'auto', padding: '0.35rem 0.6rem', borderRadius: '0.8rem' }}
          onClick={onToggleTheme} title={dark ? 'Modo claro' : 'Modo oscuro'}>
          {dark ? <Sun size={15} style={{ color: 'var(--text-muted)' }} /> : <Moon size={15} style={{ color: 'var(--text-muted)' }} />}
        </button>
      </div>
    </aside>
  );
}
