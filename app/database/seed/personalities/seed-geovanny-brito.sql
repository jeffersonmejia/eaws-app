SET NAMES utf8mb4;
-- Personalidad: Geovanny Brito (Desarrollo Web para Integración de Tecnologías)

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'grading_style', 'Extremadamente detallado en retroalimentación técnica y de formato. Exige profundidad técnica, no solo capturas. Notas entre 12-19, rara vez da 20. 3 parciales, Actividades (65%) + Evaluación Acumulativa (35%). Actividades: Informe Lab, Taller, Tareas, Otras Técnicas, Participación.' FROM professors WHERE name = 'Geovanny Brito';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'penaliza', 'Documentación superficial basada solo en capturas. Falta de profundidad técnica. Código hardcoded. Inconsistencias en datos técnicos (ej: 12 vs 11 tablas). Figuras sin numeración ni títulos. Mezclar idiomas sin convención. Informes sin TdC ni lista de figuras. Referencias no académicas. Estructura "muy guiada" (posible uso de IA). No demostrar funcionalidades completas. Secciones conceptuales sin implementación.' FROM professors WHERE name = 'Geovanny Brito';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'valora', 'Arquitectura sólida con múltiples entidades, servicios, ViewModels. Implementaciones que manejan grandes volúmenes (500k+ registros). Eliminación lógica, paginación, LINQ completo. Identity, roles, JWT, RBAC. Reportes bien estructurados. Cumplir idioma solicitado (inglés cuando pide inglés).' FROM professors WHERE name = 'Geovanny Brito';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'formato', 'Informes con: tabla de contenidos, lista de figuras, lista de tablas. Figuras numeradas, tituladas y explicadas en texto. Código + explicación + SQL equivalente + capturas. README y appsettings.example.json incluidos. Coherencia lingüística (no mezclar idiomas). Archivos del repo visibles y explicados.' FROM professors WHERE name = 'Geovanny Brito';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'feedback_tipico', '"La documentación es limitada y poco detallada." "El informe se basa principalmente en capturas de pantalla." "Indicating significant use of AI in the document preparation." "Existe una inconsistencia en el número de tablas." "Capturas sin figuras formalmente numeradas." "Debe mejorar la coherencia lingüística."' FROM professors WHERE name = 'Geovanny Brito';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'tips', 'Nunca entregar informes con solo capturas: cada imagen debe tener análisis técnico. Verificar consistencia de datos numéricos. Cada figura: numerada + título + referencia en texto. No mezclar idiomas. Incluir TdC, lista de figuras, referencias académicas. Demostrar cada funcionalidad con evidencia visual Y explicación técnica.' FROM professors WHERE name = 'Geovanny Brito';
