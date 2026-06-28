-- TEXTOS ACADÉMICOS - Daniel Nuñez

INSERT INTO grading_criteria (professor_subject_id, description, breakdown)
SELECT ps.id, '3 parciales. Cada parcial: Actividades de aprendizaje 65% + Evaluación acumulativa 35%. Escala 0-20.',
  '{"parciales":3,"peso_actividades":65,"peso_examen":35,"escala":20}'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'TA101';

INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 1 - Primer Parcial', 1 FROM subjects s WHERE s.code = 'TA101';
INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 2 - Segundo Parcial', 2 FROM subjects s WHERE s.code = 'TA101';
INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 3 - Tercer Parcial', 3 FROM subjects s WHERE s.code = 'TA101';

-- 1P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Examen Parcial Teórico', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'TA101';

-- 1P: Actividades
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Taller: Diseño del Planteamiento del Problema de Investigación', 'assignment', 11.54, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'TA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Taller sobre la síntesis critica de literatura científica', 'assignment', 11.54, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'TA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Prueba Nro. 01. sobre generalidades de la investigación', 'quiz', 23.08, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'TA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Lab. Nro. 01. sobre busqueda de información y creación de perfiles', 'assignment', 23.08, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'TA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Proyecto de Unidad', 'project', 30.77, 20.00,
  'Preguntas de investigación son excesiva. El diagrama PRISMA (Figura 1) presenta inconsistencias matemáticas gravísimas. La propuesta tecnológica no se entiende en absoluto.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'TA101';

-- 2P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Examen Parcial', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'TA101';

-- 2P: Actividades
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Taller sobre la identificación de la metodología', 'assignment', 23.08, 20.00,
  'La entrega refleja un notable nivel de detalle y claridad argumentativa. Como recomendación para la redacción de sus futuros artículos científicos, vigilen que la alta densidad de términos técnicos en un mismo párrafo no sobrecargue la lectura; procuren balancear las oraciones largas con oraciones breves e independientes para dinamizar el estilo de su prosa académica.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'TA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Evaluación sobre desarrollo de la metodología', 'quiz', 23.08, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'TA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Proyecto de Unidad', 'project', 30.77, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'TA101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Lab. Nro. 01 sobre Evaluación de carga y rendimiento', 'assignment', 23.08, 20.00,
  'La justificación de caja negra es técnicamente débil y consta de un solo párrafo.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'TA101';

-- 3P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Prueba Nro. 01 sobre Análisis de resultados', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'TA101';

-- 3P: Actividad
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Taller Nro. 01. Taller sobre la visualización y reporte técnico de los hallazgos del caso de estudio.', 'assignment', 100.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'TA101';

-- Grades 1P
INSERT INTO grades (assessment_id, score)
SELECT a.id, 19.20 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'TA101' AND a.name = 'Examen Parcial Teórico';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 18.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'TA101' AND a.name = 'Taller: Diseño del Planteamiento del Problema de Investigación';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'TA101' AND a.name = 'Taller sobre la síntesis critica de literatura científica';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'TA101' AND a.name = 'Prueba Nro. 01. sobre generalidades de la investigación';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'TA101' AND a.name = 'Lab. Nro. 01. sobre busqueda de información y creación de perfiles';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 14.00, 'Preguntas de investigación son excesiva. El diagrama PRISMA presenta inconsistencias matemáticas gravísimas. La propuesta tecnológica no se entiende en absoluto.'
FROM assessments a
JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON a.unit_id = u.id
WHERE s.code = 'TA101' AND a.name = 'Proyecto de Unidad' AND u.name = 'Unidad 1 - Primer Parcial';

-- Grades 2P
INSERT INTO grades (assessment_id, score)
SELECT a.id, 18.00
FROM assessments a
JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON a.unit_id = u.id
WHERE s.code = 'TA101' AND a.name = 'Examen Parcial' AND u.name = 'Unidad 2 - Segundo Parcial';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 20.00, 'La entrega refleja un notable nivel de detalle y claridad argumentativa. Como recomendación para la redacción de sus futuros artículos científicos, vigilen que la alta densidad de términos técnicos en un mismo párrafo no sobrecargue la lectura; procuren balancear las oraciones largas con oraciones breves e independientes para dinamizar el estilo de su prosa académica.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'TA101' AND a.name = 'Taller sobre la identificación de la metodología';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 16.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'TA101' AND a.name = 'Evaluación sobre desarrollo de la metodología';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 18.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id JOIN units u ON a.unit_id = u.id
WHERE s.code = 'TA101' AND a.name = 'Proyecto de Unidad' AND u.name = 'Unidad 2 - Segundo Parcial';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 19.00, 'La justificación de caja negra es técnicamente débil y consta de un solo párrafo.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'TA101' AND a.name = 'Lab. Nro. 01 sobre Evaluación de carga y rendimiento';
