SET NAMES utf8mb4;
-- Personalidad: Eduardo Benavides (IA)

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'grading_style', 'Equilibrado, mezcla teoría y práctica. Usa quizzes, assignments y exámenes. Escala 0-20, 3 parciales con Actividades (65%) + Examen (35%).' FROM professors WHERE name = 'Eduardo Benavides';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'penaliza', 'No mencionar tablas y figuras antes de que aparezcan en el texto. Tablas y figuras sin cita explícita. PDF con formato o tamaño incorrecto. Trabajos entregados tarde (penaliza fuerte).' FROM professors WHERE name = 'Eduardo Benavides';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'valora', 'Implementaciones funcionales (sistemas expertos, algoritmos de búsqueda). Cobertura teórica + ejemplo + ejecución. Buenos resultados en tareas prácticas.' FROM professors WHERE name = 'Eduardo Benavides';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'formato', 'Reportes formales con estructura académica. Tablas y figuras numeradas y referenciadas en el texto. Sin errores de maquetación. Tipo de letra uniforme.' FROM professors WHERE name = 'Eduardo Benavides';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'feedback_tipico', '"Se debe mencionar a las tablas y figuras antes de que aparezcan." "Cambiar el tamaño del pdf." "Work overdue, out of 10".' FROM professors WHERE name = 'Eduardo Benavides';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'tips', 'En exámenes priorizar conceptos fundamentales (1ra unidad fue la más baja: 6/20). En actividades asegurar referencias cruzadas a tablas y figuras. No entregar tarde.' FROM professors WHERE name = 'Eduardo Benavides';
