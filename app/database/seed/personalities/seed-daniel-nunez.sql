SET NAMES utf8mb4;
-- Personalidad: Daniel Nuñez (Textos Académicos)

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'grading_style', 'Retroalimentación muy detallada y constructiva. Notas altas (16-20) cuando se siguen indicaciones. Exigente con estructura metodológica de investigación. 3 parciales, Actividades (65%) + Examen (35%).' FROM professors WHERE name = 'Daniel Nuñez';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'penaliza', 'Preguntas de investigación excesivas o mal planteadas. Diagramas con inconsistencias matemáticas (PRISMA). Propuesta tecnológica poco clara. Justificaciones técnicas débiles (ej: caja negra con un solo párrafo). Falta de profundidad en análisis.' FROM professors WHERE name = 'Daniel Nuñez';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'valora', 'Claridad argumentativa y nivel de detalle. Redacción académica con estilo equilibrado. Balance entre oraciones largas y cortas. Investigación bien estructurada con metodología clara.' FROM professors WHERE name = 'Daniel Nuñez';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'formato', 'Trabajos de investigación con formato académico formal. Diagramas PRISMA, síntesis de literatura, proyectos de unidad. Citas y referencias bibliográficas correctas.' FROM professors WHERE name = 'Daniel Nuñez';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'feedback_tipico', '"Preguntas de investigación son excesiva." "El diagrama PRISMA presenta inconsistencias matemáticas gravísimas." "La propuesta tecnológica no se entiende en absoluto." "La justificación de caja negra es técnicamente débil."' FROM professors WHERE name = 'Daniel Nuñez';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'tips', 'En proyectos, enfocarse en preguntas de investigación precisas y concretas. Verificar consistencia matemática en diagramas. Redactar con claridad equilibrando profundidad técnica con legibilidad.' FROM professors WHERE name = 'Daniel Nuñez';
