SET NAMES utf8mb4;
INSERT INTO semesters (name, start_date, end_date)
VALUES ('2026-1', '2026-03-01', '2026-08-31');

INSERT INTO subjects (name, code) VALUES
('Inteligencia Artificial', 'IA101'),
('Textos Académicos', 'TA101'),
('Modelado Avanzado de Base de Datos', 'MBD101'),
('Programación Integrativa de Componentes Web', 'PW101'),
('Desarrollo Web para Integración de Tecnologías', 'DW101');

INSERT INTO professors (name) VALUES
('Eduardo Benavides'),
('Daniel Nuñez'),
('Armando Ortiz'),
('Kevin Chuquitarco'),
('Geovanny Brito');

INSERT INTO professor_subjects (professor_id, subject_id, semester_id)
SELECT p.id, s.id, sem.id
FROM professors p, subjects s, semesters sem
WHERE p.name = 'Eduardo Benavides' AND s.code = 'IA101' AND sem.name = '2026-1';

INSERT INTO professor_subjects (professor_id, subject_id, semester_id)
SELECT p.id, s.id, sem.id
FROM professors p, subjects s, semesters sem
WHERE p.name = 'Daniel Nuñez' AND s.code = 'TA101' AND sem.name = '2026-1';

INSERT INTO professor_subjects (professor_id, subject_id, semester_id)
SELECT p.id, s.id, sem.id
FROM professors p, subjects s, semesters sem
WHERE p.name = 'Armando Ortiz' AND s.code = 'MBD101' AND sem.name = '2026-1';

INSERT INTO professor_subjects (professor_id, subject_id, semester_id)
SELECT p.id, s.id, sem.id
FROM professors p, subjects s, semesters sem
WHERE p.name = 'Kevin Chuquitarco' AND s.code = 'PW101' AND sem.name = '2026-1';

INSERT INTO professor_subjects (professor_id, subject_id, semester_id)
SELECT p.id, s.id, sem.id
FROM professors p, subjects s, semesters sem
WHERE p.name = 'Geovanny Brito' AND s.code = 'DW101' AND sem.name = '2026-1';
