SET NAMES utf8mb4;
-- Configuración del sistema

INSERT INTO app_config (config_key, config_value) VALUES
('system_prompt', 'Sistema de estudio personalizado. Ayuda a redactar, conoce la personalidad del profesor, y genera material para obtener la máxima calificación. Estilo: investigador en ingeniería, preciso, natural. Sin muletillas de IA. Sin opiniones personales. Tiempo presente, tercera persona, redacción impersonal. Párrafos de 15-20 líneas. Referencias APA 7 actuales. Revisión crítica tipo director de tesis.');

INSERT INTO app_config (config_key, config_value) VALUES
('student_name', 'Jefferson Mejia');

INSERT INTO app_config (config_key, config_value) VALUES
('student_career', 'Ingeniería en Tecnologías de la Información y Comunicación');

INSERT INTO app_config (config_key, config_value) VALUES
('student_semester', '6');

INSERT INTO app_config (config_key, config_value) VALUES
('student_total_semesters', '8');
