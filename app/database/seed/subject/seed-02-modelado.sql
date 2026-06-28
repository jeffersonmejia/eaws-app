SET NAMES utf8mb4;
-- MODELADO AVANZADO DE BASE DE DATOS - Armando Ortiz

INSERT INTO grading_criteria (professor_subject_id, description, breakdown)
SELECT ps.id, '3 parciales. Cada parcial: Actividades de aprendizaje 65% + Evaluación acumulativa 35%. Escala 0-20.',
  '{"parciales":3,"peso_actividades":65,"peso_examen":35,"escala":20}'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101';

INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 1 - Primer Parcial', 1 FROM subjects s WHERE s.code = 'MBD101';
INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 2 - Segundo Parcial', 2 FROM subjects s WHERE s.code = 'MBD101';
INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 3 - Tercer Parcial', 3 FROM subjects s WHERE s.code = 'MBD101';

-- 1P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Examen, individual, primer parcial', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'MBD101';

-- 1P: Actividades
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Taller 1.1, Individual, Consultas en MongoDB', 'assignment', 7.69, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Taller 1.2, Grupal, Consultas avanzadas MongoDB', 'assignment', 7.69, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Laboratorio 1.1, Grupal, Implementación CRUD con MongoDB', 'assignment', 23.08, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea 1.1, Individual, Optimización de Rendimiento en BD NoSQL', 'assignment', 7.69, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Tarea 1.2, Individual, Map Reduce', 'assignment', 7.69, 20.00,
  'Se solicitó un ejemplo distinto al conteo de palabras, adicional se utiliza el aggregation framework, el cual reemplaza a map reduce.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Proyecto, Grupal, Análisis del negocio', 'project', 30.77, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Reporte de participación individual', 'assignment', 15.38, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'MBD101';

-- 2P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Examen segundo parcial', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'MBD101';

-- 2P: Actividades
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea 2.1, Individual, Análisis de herramientas ETL y arquitectura de integración', 'assignment', 16.67, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Tarea 2.2, Individual, ETL Process Design and Data Quality Analysis', 'assignment', 16.67, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Taller 2.1, Individual, Proceso de carga en un flujo ETL', 'assignment', 16.67, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Laboratorio 2.1, Grupal, Implementación de un proceso ETL', 'assignment', 16.67, 20.00,
  'Se evidencia errores al tratar de almacenar en la base de datos.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Reporte participación individual', 'assignment', 16.67, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Proyecto segundo parcial', 'project', 16.67, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'MBD101';

-- 3P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Examen tercer parcial', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'MBD101';

-- 3P: Actividades
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Actividad 3P - 1', 'assignment', 33.33, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Actividad 3P - 2', 'assignment', 33.33, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'MBD101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Actividad 3P - 3', 'assignment', 33.34, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'MBD101';

-- Grades 1P
INSERT INTO grades (assessment_id, score)
SELECT a.id, 15.50 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Examen, individual, primer parcial';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Taller 1.1, Individual, Consultas en MongoDB';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 19.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Taller 1.2, Grupal, Consultas avanzadas MongoDB';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Laboratorio 1.1, Grupal, Implementación CRUD con MongoDB';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Tarea 1.1, Individual, Optimización de Rendimiento en BD NoSQL';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 14.00, 'Se solicitó un ejemplo distinto al conteo de palabras, adicional se utiliza el aggregation framework, el cual reemplaza a map reduce.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Tarea 1.2, Individual, Map Reduce';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Proyecto, Grupal, Análisis del negocio';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Reporte de participación individual';

-- Grades 2P
INSERT INTO grades (assessment_id, score)
SELECT a.id, 15.50 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Examen segundo parcial';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 18.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Tarea 2.1, Individual, Análisis de herramientas ETL y arquitectura de integración';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Tarea 2.2, Individual, ETL Process Design and Data Quality Analysis';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Taller 2.1, Individual, Proceso de carga en un flujo ETL';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 14.00, 'Se evidencia errores al tratar de almacenar en la base de datos.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Laboratorio 2.1, Grupal, Implementación de un proceso ETL';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 20.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Reporte participación individual';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 12.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id
JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'MBD101' AND a.name = 'Proyecto segundo parcial';
