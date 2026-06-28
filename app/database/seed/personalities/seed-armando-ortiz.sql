-- Personalidad: Armando Ortiz (Modelado Avanzado de Base de Datos)

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'grading_style', 'Práctico, centrado en implementaciones reales (MongoDB, ETL, PostgreSQL). Usa talleres, laboratorios, tareas y proyecto. 3 parciales, Actividades (65%) + Examen (35%). Notas altas cuando se siguen especificaciones técnicas.' FROM professors WHERE name = 'Armando Ortiz';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'penaliza', 'Usar herramientas incorrectas (ej: Aggregation Framework cuando pide Map Reduce). No demostrar funcionalidades completas. Errores al almacenar datos. Documentación técnica insuficiente. No incluir código, SQL ni comparación de resultados.' FROM professors WHERE name = 'Armando Ortiz';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'valora', 'Implementaciones CRUD completas y funcionales. Uso correcto de tecnologías específicas (MongoDB, ETL, PostgreSQL). Optimización de rendimiento en BD NoSQL. Participación individual y trabajo en equipo.' FROM professors WHERE name = 'Armando Ortiz';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'formato', 'Reportes técnicos con código, explicación y capturas. Proyectos con análisis de negocio. Laboratorios con implementación demostrable. Consultas documentadas con código, SQL y resultados.' FROM professors WHERE name = 'Armando Ortiz';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'feedback_tipico', '"Se solicitó un ejemplo distinto al conteo de palabras." "Se evidencia errores al tratar de almacenar en la base de datos." "El aggregation framework reemplaza a map reduce."' FROM professors WHERE name = 'Armando Ortiz';

INSERT INTO professor_personalities (professor_id, aspect, detail)
SELECT id, 'tips', 'Cada consulta debe incluir código, explicación y resultados. Verificar que la tecnología usada sea la solicitada (MongoDB, ETL, PostgreSQL). Proyectos grupales pesan mucho (30.77% y 16.67%).' FROM professors WHERE name = 'Armando Ortiz';
