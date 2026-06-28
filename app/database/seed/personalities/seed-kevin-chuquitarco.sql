SET NAMES utf8mb4;
-- Personalidad: Kevin Chuquitarco (Programación Integrativa de Componentes Web)

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'grading_style', 'Muy detallado con el formato de informes. Usa tareas, laboratorios, proyectos y evaluaciones separadas. 3 parciales, Actividades (65%) + Examen (35%). Actividades subdivididas en Tareas, Laboratorios, Proyecto y Evaluaciones.' FROM professors WHERE name = 'Kevin Chuquitarco';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'penaliza', 'Formato inconsistente (tipo de letra diferente). Figuras sin numeración o número no en negritas. Análisis sin datos concretos. Discusión y conclusiones pobres. Código hardcoded. Elementos en ubicación incorrecta (menú en footer). Overdue baja nota significativamente.' FROM professors WHERE name = 'Kevin Chuquitarco';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'valora', 'Trabajo teórico-práctico con ejemplos funcionales. Componentes reutilizables bien documentados. Uso correcto de librerías y frameworks. Investigación completa (CDD, composición, comunicación). Pruebas unitarias y CI/CD.' FROM professors WHERE name = 'Kevin Chuquitarco';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'formato', 'Tipo de letra uniforme en todo el documento. Figuras numeradas con número en negritas (ej: Figura 1). Tablas y figuras en análisis de resultados. Marco teórico con subtítulos. Infografías con diseño profesional.' FROM professors WHERE name = 'Kevin Chuquitarco';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'feedback_tipico', '"Todo el documento debe contener el mismo tipo de letra." "El número de figura debe ir en negritas." "En análisis de resultados no incluimos datos que me sirvan." "Noticias tiene código quemado." "¿Por qué el menú está donde corresponde el footer?"' FROM professors WHERE name = 'Kevin Chuquitarco';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'tips', 'Priorizar formato impecable sobre contenido avanzado. Cada figura: número en negrita + título + referencia en texto. No usar código hardcoded. Incluir datos reales en análisis. Mejorar discusión y conclusiones.' FROM professors WHERE name = 'Kevin Chuquitarco';
