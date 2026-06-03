# Convenciones de Documentación

Este archivo define normas simples para mantener consistencia en la documentación del proyecto.

## Estructura y nombres
- Carpetas y archivos: usar minúsculas y `snake_case` o `kebab-case` para rutas públicas (ej. `docs/`, `deliverables/`).
- README por carpeta: cada carpeta de nivel contiene un `README.md` explicando propósito y contenido.
- Archivos largos: dividir en secciones (`Overview`, `How to run`, `Examples`).

## Formato Markdown
- Usar encabezados claros (`#`, `##`, `###`).
- Incluir ejemplos de uso y bloques de código con el lenguaje (```bash, ```json, ```js).
- Preferir tablas para listar parámetros y campos.

## Código y snippets
- Siempre indicar la ruta del archivo fuente cuando se ejemplifique (`Deliverables/API/source/controllers/poblacion.controller.js`).
- Añadir respuestas de ejemplo (JSON) en los tests para facilitar la verificación manual.

## Imágenes y evidencias
- Guardar capturas en `Docs/Tests/media/Test_SQL/` o `Test_NoSQL/` según corresponda.
- Nombrar las imágenes con el formato `NN.Descripcion.png` para ordenarlas cronológicamente.
- Añadir un `README.md` en cada carpeta `media` con lista de imágenes y descripción breve.

## Control de versiones de la documentación
- Actualizar `Docs/Tech/Technical_Decisions.md` cuando se tome una decisión técnica importante.
- Usar mensajes de commit claros: `docs: add test results` o `docs: update data dictionary`.

## Revisión y responsable
- El autor de cada carpeta es responsable de mantener su `README.md` actualizado.
- Revisiones mayores deben incluir una breve justificación en `Docs/Tech/Technical_Decisions.md`.

---

*Estas convenciones ayudan a obtener mejor puntuación en criterios de calidad transversal y facilitan revisión.*
