# Decisiones Técnicas

Este documento explica por qué se eligieron ciertas tecnologías y arquitecturas en el proyecto.

## Resumen ejecutivo
- Backend: `Node.js` + `Express` (rápido de prototipar y compatible con `swagger-jsdoc`).
- Persistencia: MySQL (relacional) + MongoDB (documental) — enfoque híbrido para simular cargas y relaciones.
- Bulk SQL: `sp_poblacion` (procedimiento almacenado) para generación eficiente en MySQL.
- NoSQL: `Mongoose` con esquema `Valoracion` para asegurar validaciones mínimas y facilitar inserciones en bloques.
- Documentación: `swagger-jsdoc` + `swagger-ui-express` para exponer contratos API.
- Configuración: `dotenv` y `.env.example` para separar credenciales y entornos.

## Por qué esta arquitectura
- Rendimiento: delegar la generación masiva a MySQL (procedimiento almacenado) reduce latencia de la aplicación Node y aprovecha el motor de BD.
- Flexibilidad: MongoDB almacena valoraciones con esquema semiestructurado, útil para datos de pruebas y auditoría.
- Mantenibilidad: separar `source/` y `build/` facilita despliegues y revisiones por entregables.

## Elecciones concretas y beneficios
- `sp_poblacion` (MySQL): permite crear 10k+ registros más rápido que generar e insertar uno a uno desde Node.
- Inserciones NoSQL en chunks: evita consumo excesivo de memoria y fallos por grandes batch inserts.
- Swagger: hace que los FRs estén verificables por el reviewer y coherentes con la implementación.
- `.env.example` + `.gitignore`: evita fugas de credenciales en el repositorio.

## Seguridad y despliegue
- Nunca versionar archivos `.env` con credenciales reales.
- Para despliegue, usar variables de entorno del proveedor (Azure/AWS/GCP) o secret manager.

## Recomendaciones futuras
- Añadir tests automatizados (e.g., Mocha/Jest) que validen los endpoints `poblar-test` y `poblar-nosql` con datasets pequeños.
- Añadir un script de integración que ejecute un test de 1k registros y capture tiempos para métricas.
- Documentar el SLA esperado y los pasos de rollback en el `DeployManual`.

---

*Archivo generado automáticamente para justificar decisiones técnicas y facilitar revisión.*
