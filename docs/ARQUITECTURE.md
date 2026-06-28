# EAWS — Engineering Academic Workspace

**Autor:** Jefferson Mejía
**Documento:** PROJECT_BLUEPRINT.md
**Versión del documento:** v0.1.0
**Versión del proyecto:** v1.0.0
**Estado:** Planeación y Arquitectura
**Metodología de desarrollo de software:** Scrum adaptado a desarrollador único
**Licencia:** Pendiente de definición
**Última actualización:** 28 de junio de 2026

---

# 1. Resumen

EAWS es un espacio académico inteligente diseñado para acompañar a estudiantes universitarios durante toda su formación académica. El sistema no se limita a la redacción de documentos, sino que también organiza materias, docentes, sílabos, diapositivas, recursos de estudio, evaluaciones, errores, progreso académico y estrategias de aprendizaje.

La arquitectura combina documentación en archivos Markdown, una base de datos para la información estructurada y almacenamiento físico para archivos académicos como diapositivas, tareas, exámenes, laboratorios, conjuntos de datos, cuadernos de trabajo y documentos generados. De esta manera, el sistema puede crecer por carreras, semestres, materias y evaluaciones sin convertirse en una colección desordenada de archivos.

EAWS se concibe como un proyecto de código abierto y replicable. Cualquier estudiante podrá clonar el repositorio, configurar su propia información académica y utilizar la plataforma sin depender de los datos del autor.

---

# 2. Objetivo

Construir una plataforma académica modular que permita centralizar, organizar y reutilizar el conocimiento del estudiante para apoyar la redacción académica, el aprendizaje, la preparación de exámenes y el seguimiento del progreso universitario.

---

# 3. Estado del proyecto

Actualmente EAWS se encuentra en la fase de planeación y diseño arquitectónico.

En esta etapa no se desarrolla código fuente ni se crean directorios, módulos o servicios definitivos. El objetivo es definir la visión del sistema, el alcance, los requisitos, la arquitectura, el modelo de dominio, la arquitectura de datos y las decisiones técnicas antes de iniciar la implementación.

La implementación comenzará únicamente cuando la documentación de análisis y diseño haya sido aprobada y consolidada.

---

# 4. Producto Mínimo Viable

En este documento se utilizará la sigla MVP para referirse al Producto Mínimo Viable.

El MVP corresponde a la primera versión funcional de EAWS capaz de resolver el problema principal sin incorporar funcionalidades avanzadas.

El alcance del MVP contempla:

- Registro de estudiantes.
- Gestión de carreras, semestres y materias.
- Gestión de docentes.
- Organización de unidades, temas y subtemas.
- Administración de materiales académicos.
- Registro de tareas, laboratorios y evaluaciones.
- Registro de errores académicos.
- Generación de documentos mediante plantillas.
- Consulta del historial académico.

Las funcionalidades relacionadas con sincronización en la nube, aplicación móvil, colaboración entre usuarios, múltiples modelos de inteligencia artificial, analítica avanzada y otras características de expansión se desarrollarán en versiones posteriores.

---

# 5. Metodología de desarrollo de software

EAWS se desarrolla utilizando Scrum adaptado a un único desarrollador.

## Roles

- Product Owner.
- Software Architect.
- Developer.
- Database Designer.

Todos los roles son desempeñados por un único desarrollador.

## Artefactos

- Product Backlog.
- Sprint Backlog.
- Roadmap.
- Changelog.
- Architecture Decision Records.

En la documentación se utilizará la sigla ADR para referirse a Architecture Decision Records.

## Sprints

La duración estimada de cada Sprint será de una semana.

Cada Sprint deberá finalizar con un entregable verificable, como documentación, modelos de dominio, diseño de base de datos, implementación de módulos o pruebas del sistema.

---

# 6. Principios de diseño

El desarrollo de EAWS seguirá los siguientes principios:

- Modularidad.
- Escalabilidad.
- Replicabilidad.
- Reutilización.
- Separación de responsabilidades.
- Documentación antes de implementación.
- Arquitectura desacoplada.
- Independencia del proveedor de inteligencia artificial.
- Mantenibilidad.

---

# 7. Convenciones del proyecto

Durante el desarrollo se adoptarán las siguientes convenciones:

- Toda decisión técnica relevante deberá documentarse.
- Toda modificación importante deberá registrarse en CHANGELOG.md.
- Ningún módulo será implementado sin una definición previa de su diseño.
- Toda funcionalidad deberá estar respaldada por requisitos.
- La documentación tendrá prioridad sobre la implementación durante la fase de análisis.

---

A partir de este punto puedes mantener exactamente el contenido que ya tienes:

- Arquitectura del repositorio.
- Arquitectura de la base de datos.
- Explicación de módulos.

Solo realiza dos cambios:

- Cambia `ARCHITECTURE.md` por `PROJECT_BLUEPRINT.md`.
- Agrega `REQUIREMENTS.md` dentro de la carpeta `docs`, ya que será el siguiente documento a desarrollar.
