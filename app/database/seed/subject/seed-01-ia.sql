-- INTELIGENCIA ARTIFICIAL - Eduardo Benavides

INSERT INTO grading_criteria (professor_subject_id, description, breakdown)
SELECT ps.id,
  '3 parciales. Cada parcial: Actividades de aprendizaje 65% + Evaluación acumulativa 35%. Suma de los 3 parciales ≥ 42.01 para pasar. Escala 0-20.',
  '{"parciales":3,"peso_actividades":65,"peso_examen":35,"nota_minima_suma":42.01,"escala":20}'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'IA101';

INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 1 - Primer Parcial', 1 FROM subjects s WHERE s.code = 'IA101';

INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 2 - Segundo Parcial', 2 FROM subjects s WHERE s.code = 'IA101';

INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 3 - Tercer Parcial', 3 FROM subjects s WHERE s.code = 'IA101';

-- 1P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Examen de la Primera Unidad', 'exam', 35.00, 20.00
FROM professor_subjects ps
JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

-- 1P: Actividades
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Aplicaciones que usan IA', 'assignment', 7.69, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Prueba: Fundamentos de IA y Tipos de Agentes', 'quiz', 11.54, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Report: Expert System based on FOL', 'assignment', 15.39, 20.00,
  'Mencionar tablas y figuras antes de que aparezcan. Toda tabla y figura debe ser citada.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Lección Búsqueda en Anchura', 'assignment', 23.08, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Lección Búsqueda en Profundidad', 'assignment', 23.08, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea de Busqueda Bidireccional', 'assignment', 3.85, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Deber de Búsqueda Primero el Mejor y A Estrella', 'assignment', 3.85, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea: Búsqueda en Haz', 'assignment', 3.85, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Deber de MiniMax con poda Alfa Beta', 'assignment', 3.85, 20.00, 'Cambiar el tamaño del pdf.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Lección primero el mejor', 'assignment', 3.85, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'IA101';

-- 2P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Examen de la Segunda Unidad', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'IA101';

-- 2P: Actividades
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Laboratorio de Algoritmos de Clasificación', 'assignment', 15.39, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Exposición de Algoritmos de Clasificación', 'assignment', 15.39, 20.00,
  'Faltó claridad en la exposición. Se recomienda alzar la voz al exponer.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Exposición de Algoritmos de Regresión', 'assignment', 15.39, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Prueba de algoritmos de regresión', 'quiz', 15.39, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea: Algoritmos no supervisados - KNN', 'assignment', 15.39, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Prueba de métricas de clasificación', 'quiz', 23.08, 20.00,
  'Se suma lo de edición del cuestionario. Se suma lo de punto pendiente por prueba de 1ra unidad.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'IA101';

-- 3P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Examen de la Tercera Unidad', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'IA101';

-- 3P: Actividades
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Laboratorio DB-Scan', 'assignment', 33.33, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Prueba de métricas de regresión', 'quiz', 33.33, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'IA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea grupal de análisis de sentimientos', 'assignment', 33.34, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'IA101';

-- Grades 1P
INSERT INTO grades (assessment_id, score)
SELECT a.id, 6.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Examen de la Primera Unidad';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 14.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Aplicaciones que usan IA';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 19.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Prueba: Fundamentos de IA y Tipos de Agentes';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 20.00, 'Se debe mencionar a las tablas y figuras antes de que aparezcan. Toda tabla y figura debe ser citada.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Report: Expert System based on FOL';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 0.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Lección Búsqueda en Anchura';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 6.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Lección Búsqueda en Profundidad';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Tarea de Busqueda Bidireccional';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Deber de Búsqueda Primero el Mejor y A Estrella';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Tarea: Búsqueda en Haz';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 20.00, 'Cambiar el tamaño del pdf.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Deber de MiniMax con poda Alfa Beta';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 18.50
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Lección primero el mejor';

-- Grades 2P
INSERT INTO grades (assessment_id, score)
SELECT a.id, 13.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Examen de la Segunda Unidad';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 13.80
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Laboratorio de Algoritmos de Clasificación';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 17.00, 'Faltó claridad en la exposición. Se recomienda alzar la voz al exponer.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Exposición de Algoritmos de Clasificación';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Exposición de Algoritmos de Regresión';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 19.20
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Prueba de algoritmos de regresión';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 16.00
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Tarea: Algoritmos no supervisados - KNN';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 20.00, 'Se suma lo de edición del cuestionario. Se suma lo de punto pendiente por prueba de 1ra unidad.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'IA101' AND a.name = 'Prueba de métricas de clasificación';
