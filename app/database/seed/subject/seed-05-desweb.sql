-- DESARROLLO WEB PARA INTEGRACIÓN DE TECNOLOGÍAS - Geovanny Brito

INSERT INTO grading_criteria (professor_subject_id, description, breakdown)
SELECT ps.id, '3 parciales. Cada parcial: Actividades de aprendizaje 65% + Evaluación acumulativa 35%. Actividades: Informe lab, Taller, Tareas, Otras técnicas y Participación. Escala 0-20.',
  '{"parciales":3,"peso_actividades":65,"peso_examen":35,"escala":20}'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id WHERE s.code = 'DW101';

INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 1 - Primer Parcial', 1 FROM subjects s WHERE s.code = 'DW101';
INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 2 - Segundo Parcial', 2 FROM subjects s WHERE s.code = 'DW101';
INSERT INTO units (subject_id, name, order_index)
SELECT s.id, 'Unidad 3 - Tercer Parcial', 3 FROM subjects s WHERE s.code = 'DW101';

-- 1P: Evaluación acumulativa
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Evaluación práctica: Aplicación MVC con login, CRUD, relación entre tablas y eliminación lógica', 'exam', 65.00, 20.00,
  'El proyecto es funcional, pero la documentación es superficial. El informe se basa principalmente en capturas de pantalla.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Evaluación Teórica: Desarrollo de Sitios Web con MVC, Razor, ASP.NET Identity, SQL Server y Autorización', 'quiz', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

-- 1P: Informe de laboratorio
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Laboratorio: Aplicación de conexión a datos en aplicaciones web', 'lab', 33.33, 20.00,
  'El informe cumple de forma general con la actividad solicitada; sin embargo, la documentación es limitada y poco detallada.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Laboratorio: Análisis de reglas de validación y conexión a datos (envío)', 'lab', 33.33, 50.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Laboratorio: Análisis de reglas de validación y conexión a datos (evaluación)', 'lab', 33.34, 50.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

-- 1P: Taller
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Taller: Diseño de flujo para vinculación de datos (envío)', 'assignment', 33.33, 80.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Taller: Diseño de flujo para vinculación de datos (evaluación)', 'assignment', 33.33, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Taller: Organización de contenidos sobre desarrollo web', 'assignment', 33.34, 20.00,
  'Presenta un cuestionario completo con preguntas de opción múltiple y ejercicios de relación correctamente estructurados.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

-- 1P: Tareas
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Task: Building data structures for web applications', 'assignment', 50.00, 20.00,
  'The project features a comprehensive and well-organized technical structure. However, much of the writing has an overly mechanical and academic structure, indicating significant use of AI in the document preparation.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Tarea: Análisis del flujo de autenticación en aplicaciones web', 'assignment', 50.00, 20.00,
  'El informe presenta alta coherencia técnica en la implementación de JWT en PHP, incluyendo RBAC, PDO y blacklist, con procedimiento claro y resultados bien validados; sin embargo, las referencias bibliográficas incluyen fuentes web (Auth0).'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

-- 1P: Proyecto
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Proyecto: Integración de flujo web con datos y sesiones', 'project', 100.00, 20.00,
  'El informe presenta una estructura ordenada y comprensible. Incluye los elementos principales del desarrollo web con MVC, sin embargo, algunas secciones carecen de mayor profundidad técnica.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

-- 1P: Participación
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Participación individual: Preguntas, ejercicios e intervenciones en clase – Unidad 1', 'assignment', 100.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 1 - Primer Parcial'
WHERE s.code = 'DW101';

-- 2P: Evaluación acumulativa
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Evaluación Teórica: Arquitectura ASP.NET Core, Enrutamiento, Inyección de Dependencias, LINQ, Entity Framework Core, Identity, Roles y Publicación Web', 'quiz', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Evaluación Práctica: Aplicación web con ASP.NET Core, PostgreSQL, Database First y LINQ', 'exam', 65.00, 20.00,
  'El proyecto implementa correctamente la eliminación lógica y la paginación. No obstante, Products/Index no presenta directamente la categoría y el proveedor.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

-- 2P: Informe de laboratorio
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Laboratorio: Gestión de permisos de acceso', 'lab', 50.00, 20.00,
  'Presenta la configuración de Identity, las tablas de seguridad, los cuatro roles y usuarios, una matriz de permisos. No obstante, la ampliación funcional se evidencia principalmente en Actors y Films.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Laboratorio: Aplicación de conexión a datos', 'lab', 50.00, 20.00,
  'El informe evidencia la estructura del proyecto, el uso de Database First, la configuración. No obstante, la sección de consultas obligatorias presenta principalmente una búsqueda con Contains y un ordenamiento.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

-- 2P: Taller
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Taller: Organización de componentes del proyecto', 'assignment', 100.00, 20.00,
  'Presenta una arquitectura sólida para Orbi, con doce entidades, servicios, ViewModels, DbContext, relaciones, filtros globales, Seeder, eliminación lógica y dos módulos CRUD. Sin embargo, existe una inconsistencia en el número de tablas.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

-- 2P: Tareas
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Task: Analysis of Services and Dependencies', 'assignment', 50.00, 20.00,
  'The report presents the Category entity with validations, its context registration. However, the report does not contain a table of contents or a list of figures.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Tarea: Práctica de consultas LINQ con Entity Framework Core', 'assignment', 50.00, 20.00,
  'Presenta resultados y explicaciones para los cuarenta ejercicios, pero no incluye el código LINQ utilizado, el controlador, el método modificado ni una ruta específica para cada consulta.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

-- 2P: Otras técnicas
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Evaluación Nearpod: Fundamentos del desarrollo web con ASP.NET Core utilizando LINQ y Entity Framework Core', 'quiz', 37.50, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Proyecto: Integración de arquitectura multiplataforma', 'project', 62.50, 20.00,
  'Presenta una arquitectura sólida con varias entidades, servicios, ViewModels, PostgreSQL, consultas paginadas, eliminación lógica, seguridad y perfiles de acceso. Debe mejorar la coherencia lingüística.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

-- 2P: Participación
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score, description)
SELECT ps.id, u.id, 'Participación individual: Preguntas, ejercicios e intervenciones en clase – Unidad 2', 'assignment', 100.00, 20.00,
  'La nota de participación se basa en las intervenciones registradas por el señor comandante durante el parcial.'
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 2 - Segundo Parcial'
WHERE s.code = 'DW101';

-- 3P: Examen
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Evaluación acumulativa Tercer Parcial', 'exam', 35.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'DW101';

-- 3P: Actividad
INSERT INTO assessments (professor_subject_id, unit_id, name, type, weight, max_score)
SELECT ps.id, u.id, 'Actividades 3P', 'assignment', 100.00, 20.00
FROM professor_subjects ps JOIN subjects s ON ps.subject_id = s.id
JOIN units u ON u.subject_id = s.id AND u.name = 'Unidad 3 - Tercer Parcial'
WHERE s.code = 'DW101';

-- Grades 1P
INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 16.00, 'El proyecto es funcional, pero la documentación es superficial. El informe se basa principalmente en capturas de pantalla.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Evaluación práctica: Aplicación MVC con login, CRUD, relación entre tablas y eliminación lógica';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 18.08 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Evaluación Teórica: Desarrollo de Sitios Web con MVC, Razor, ASP.NET Identity, SQL Server y Autorización';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 15.00, 'El informe cumple de forma general con la actividad solicitada; sin embargo, la documentación es limitada y poco detallada.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Laboratorio: Aplicación de conexión a datos en aplicaciones web';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 38.33 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Laboratorio: Análisis de reglas de validación y conexión a datos (envío)';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 38.33 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Laboratorio: Análisis de reglas de validación y conexión a datos (evaluación)';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 56.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Taller: Diseño de flujo para vinculación de datos (envío)';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 14.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Taller: Diseño de flujo para vinculación de datos (evaluación)';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 16.00, 'Presenta un cuestionario completo con preguntas de opción múltiple y ejercicios de relación correctamente estructurados.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Taller: Organización de contenidos sobre desarrollo web';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 19.00, 'The project features a comprehensive and well-organized technical structure. However, much of the writing indicates significant use of AI in the document preparation.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Task: Building data structures for web applications';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 17.00, 'El informe presenta alta coherencia técnica en la implementación de JWT en PHP... sin embargo, las referencias bibliográficas incluyen fuentes web (Auth0).'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Tarea: Análisis del flujo de autenticación en aplicaciones web';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 17.00, 'El informe presenta una estructura ordenada y comprensible. Incluye los elementos principales del desarrollo web con MVC, sin embargo, algunas secciones carecen de mayor profundidad técnica.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Proyecto: Integración de flujo web con datos y sesiones';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 16.00 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Participación individual: Preguntas, ejercicios e intervenciones en clase – Unidad 1';

-- Grades 2P
INSERT INTO grades (assessment_id, score)
SELECT a.id, 18.73 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Evaluación Teórica: Arquitectura ASP.NET Core, Enrutamiento, Inyección de Dependencias, LINQ, Entity Framework Core, Identity, Roles y Publicación Web';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 14.50, 'El proyecto implementa correctamente la eliminación lógica y la paginación. No obstante, Products/Index no presenta directamente la categoría y el proveedor.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Evaluación Práctica: Aplicación web con ASP.NET Core, PostgreSQL, Database First y LINQ';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 15.00, 'Presenta la configuración de Identity, las tablas de seguridad, los cuatro roles y usuarios. No obstante, la ampliación funcional se evidencia principalmente en Actors y Films.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Laboratorio: Gestión de permisos de acceso';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 12.50, 'El informe evidencia la estructura del proyecto. No obstante, la sección de consultas obligatorias presenta principalmente una búsqueda con Contains y un ordenamiento.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Laboratorio: Aplicación de conexión a datos';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 17.00, 'Presenta una arquitectura sólida para Orbi. Sin embargo, existe una inconsistencia en el número de tablas.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Taller: Organización de componentes del proyecto';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 15.00, 'The report presents the Category entity with validations. However, the report does not contain a table of contents or a list of figures.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Task: Analysis of Services and Dependencies';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 14.00, 'Presenta resultados y explicaciones para los cuarenta ejercicios, pero no incluye el código LINQ utilizado.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Tarea: Práctica de consultas LINQ con Entity Framework Core';

INSERT INTO grades (assessment_id, score)
SELECT a.id, 17.20 FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Evaluación Nearpod: Fundamentos del desarrollo web con ASP.NET Core utilizando LINQ y Entity Framework Core';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 16.75, 'Presenta una arquitectura sólida con varias entidades. Debe mejorar la coherencia lingüística del proyecto y del informe.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Proyecto: Integración de arquitectura multiplataforma';

INSERT INTO grades (assessment_id, score, feedback)
SELECT a.id, 16.00, 'La nota de participación se basa en las intervenciones registradas por el señor comandante durante el parcial.'
FROM assessments a JOIN professor_subjects ps ON a.professor_subject_id = ps.id JOIN subjects s ON ps.subject_id = s.id
WHERE s.code = 'DW101' AND a.name = 'Participación individual: Preguntas, ejercicios e intervenciones en clase – Unidad 2';
