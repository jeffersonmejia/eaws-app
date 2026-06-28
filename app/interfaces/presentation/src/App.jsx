import { useState, useEffect, useCallback } from 'react';
import { fetchStudent, fetchAverage } from './api';
import Sidebar from './components/Sidebar';
import ChatArea from './components/ChatArea';

export default function App() {
  const [dark, setDark] = useState(true);
  const [sidebarOpen, setSidebarOpen] = useState(true);
  const [student, setStudent] = useState(null);
  const [average, setAverage] = useState(null);
  const [context, setContext] = useState(null);

  useEffect(() => {
    document.documentElement.setAttribute('data-theme', dark ? 'dark' : 'light');
  }, [dark]);

  useEffect(() => {
    fetchStudent().then(setStudent).catch(() => {});
    fetchAverage().then(setAverage).catch(() => {});
  }, []);

  const handleSelect = useCallback((subject, type) => {
    setContext({ subject, type });
  }, []);

  return (
    <div style={{
      height: '100vh',
      display: 'flex',
      fontFamily: 'system-ui, -apple-system, sans-serif',
      background: 'var(--page)',
      color: 'var(--text)',
      transition: 'background 0.25s, color 0.25s',
      padding: '0.5rem',
      gap: '0.5rem',
    }}>
      <Sidebar
        student={student}
        average={average}
        open={sidebarOpen}
        dark={dark}
        onToggleTheme={() => setDark(d => !d)}
        onToggleSidebar={() => setSidebarOpen(o => !o)}
        onSelect={handleSelect}
      />
      <ChatArea context={context} />
    </div>
  );
}
