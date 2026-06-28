SET NAMES utf8mb4;
-- PROGRAMACIÓN INTEGRATIVA DE COMPONENTES WEB - Kevin Chuquitarco

INSERT INTO grading_criteria (professor_subject_id, description, breakdown)
SELECT ps.id, '3 parciales. Cada parcial: Actividades de aprendizaje 65% + Evaluación acumulativa 35%. Actividades se divide en Tareas, Laboratorios, Proyecto y Evaluaciones. Escala 0-20.',
  '{"parciales":3,"peso_actividades":65,"peso_examen":35,"escala":20}'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101';

INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 1 - Primer Parcial', 1 FROM subjects s WHERE s.code = 'PW101';
INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 2 - Segundo Parcial', 2 FROM subjects s WHERE s.code = 'PW101';
INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 3 - Tercer Parcial', 3 FROM subjects s WHERE s.code = 'PW101';

-- 1P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Examen Primera Unidad', 'exam', 35.00, 20.00,
  'Noticias tiene código quemado, debía ser como se realizó la sección cursos. ¿Por qué el menú está donde corresponde el footer?'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'PW101';

-- 1P: Tareas
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Tarea 1: Investigar los Web Components nativos y mostrar un ejemplo', 'assignment', 50.00, 20.00,
  'Todo el documento debe contener el mismo tipo de letra (verificar índice). Esta vez no se penaliza por el excelente trabajo realizado.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'PW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea 2: Create an infographic about the use of libraries for Web Components', 'assignment', 50.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'PW101';

-- 1P: Laboratorios
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Laboratorio 1: Desarrollar un sitio web modular utilizando Web Components nativos', 'lab', 50.00, 20.00,
  'Buen trabajo se debe mejorar la discusión también se debe mejorar la presentación del marco teórico incluyendo subtítulos.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'PW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Laboratorio 2: Desarrollar un sitio web utilizando Web Components con librerías', 'lab', 50.00, 20.00,
  'Excelente trabajo pero en análisis de resultados no incluimos datos que me sirvan para realizar dicho análisis. También se debe mejorar discusión y conclusiones.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'PW101';

-- 1P: Proyecto
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Proyecto Primera Unidad', 'project', 100.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'PW101';

-- 1P: Evaluaciones
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Prueba 1 Primera Unidad', 'quiz', 50.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'PW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Prueba 2 Primera Unidad', 'quiz', 50.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'PW101';

-- 2P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Examen Segunda Unidad', 'exam', 35.00, 20.00, 'Muy bien, solo faltó el carrito de compras la funcionalidad.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'PW101';

-- 2P: Tareas
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Tarea 1: Investigación sobre Component-Driven Development', 'assignment', 50.00, 20.00,
  'Excelente trabajo, solo que el número de figura debe ir en negritas.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'PW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea 2: Creation of an infographic explaining component composition and communication', 'assignment', 50.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'PW101';

-- 2P: Laboratorios
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Labotatorio 3: Desarrollo de componentes reutilizables usando Frameworks', 'lab', 50.00, 20.00,
  'Incorporar Tablas, Figuras en el análisis de Resultados. Verificar el número de la práctica.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'PW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Labotatorio 4: Implementación de pruebas unitarias y despliegue del proyecto usando CI/CD', 'lab', 50.00, 20.00,
  'Verificar número de práctica. Cumple con lo solicitado.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'PW101';

-- 2P: Proyecto
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Proyecto Segunda Unidad', 'project', 100.00, 20.00, 'Mejorar la usabilidad del formulario MRU'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'PW101';

-- 2P: Evaluaciones
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Evaluación 1 Segunda Unidad', 'quiz', 50.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'PW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Evaluación 2 Segunda Unidad', 'quiz', 50.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'PW101';

-- 3P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Examen Tercera Unidad', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'PW101';

-- 3P: Actividad
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea 1: Investigación sobre servicios web RESTful, arquitectura y buenas prácticas', 'assignment', 100.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'PW101';

-- Grades 1P
INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 17.00, 'Noticias tiene código quemado, debía ser como se realizó la sección cursos. ¿Por qué el menú está donde corresponde el footer?'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Examen Primera Unidad';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 20.00, 'Todo el documento debe contener el mismo tipo de letra (verificar índice). Esta vez no se penaliza por el excelente trabajo realizado.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Tarea 1: Investigar los Web Components nativos y mostrar un ejemplo';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 10.75 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Tarea 2: Create an infographic about the use of libraries for Web Components';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 17.00, 'Buen trabajo se debe mejorar la discusión también se debe mejorar la presentación del marco teórico incluyendo subtítulos.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Laboratorio 1: Desarrollar un sitio web modular utilizando Web Components nativos';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 17.00, 'Excelente trabajo pero en análisis de resultados no incluimos datos que me sirvan para realizar dicho análisis. También se debe mejorar discusión y conclusiones.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Laboratorio 2: Desarrollar un sitio web utilizando Web Components con librerías';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Proyecto Primera Unidad';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 17.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Prueba 1 Primera Unidad';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 16.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Prueba 2 Primera Unidad';

-- Grades 2P
INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 18.00, 'Muy bien, solo faltó el carrito de compras la funcionalidad.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Examen Segunda Unidad';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 20.00, 'Excelente trabajo, solo que el número de figura debe ir en negritas.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Tarea 1: Investigación sobre Component-Driven Development';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 17.50 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Tarea 2: Creation of an infographic explaining component composition and communication';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 18.00, 'Incorporar Tablas, Figuras en el análisis de Resultados. Verificar el número de la práctica.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Labotatorio 3: Desarrollo de componentes reutilizables usando Frameworks';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 19.00, 'Verificar número de práctica. Cumple con lo solicitado.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Labotatorio 4: Implementación de pruebas unitarias y despliegue del proyecto usando CI/CD';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 19.00, 'Mejorar la usabilidad del formulario MRU'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Proyecto Segunda Unidad';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 18.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Evaluación 1 Segunda Unidad';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 19.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'PW101' AND a.name = 'Evaluación 2 Segunda Unidad';
