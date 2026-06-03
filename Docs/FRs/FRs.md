# Functional Requirements (FRs) - Sistema de Servicios Médicos Híbrido

## Propósito
Este documento describe las funciones clave efectivamente implementadas en la API del proyecto, y cómo cada requisito funcional se corresponde con los endpoints reales.

## Endpoints implementados
- `POST /api/poblar-test` → Genera datos híbridos SQL + NoSQL.
- `POST /api/poblar-nosql` → Genera documentos de valoraciones únicamente en MongoDB.

## Requisitos funcionales clave

| ID | Funcionalidad | Implementación real |
|---|---|---|
| FR1 | Generación masiva de datos | `POST /api/poblar-test` invoca `sp_poblacion` en MySQL y luego inserta valoraciones en MongoDB. |
| FR2 | Filtro paramétrico | Endpoint acepta `genero`, `estado_vida`, `prioridad`, `tipo_servicio`, `edad_min`, `edad_max`, `con_alergias`, `es_grave`, `test_sql`, `test_nosql`. |
| FR3 | Soporte de modo crítico | `es_grave=true` genera síntomas y estudios de prioridad alta en los documentos de MongoDB. |
| FR4 | Inserción híbrida | `test_sql=true` ejecuta el procedimiento almacenado `sp_poblacion`; `test_nosql=true` inserta valoraciones en la colección `valoraciones`. |
| FR5 | Documentación API | Swagger está configurado en `Deliverables/API/source/swagger.js` y documenta los endpoints. |

## Comportamiento real documentado
- Validación de entrada: `cantidad` debe ser entero mayor a 0, si no la API responde con error 400.
- La API retorna un objeto con `exito`, `mensaje`, `filtros_usados` y `detalles`.
- La generación en MongoDB incluye campos: `servicio_medico_id`, `cita_id`, `medico_id`, `fecha_valoracion`, `sintomas`, `estudios_solicitados`, `diagnostico_preliminar`, `observaciones`, `auditoria`.
- El endpoint `POST /api/poblar-nosql` inserta valoraciones en fragmentos (`chunkSize=1000`) para evitar cargas de memoria excesivas.

## Trazabilidad de los FRs con el código
- FR1 → `Deliverables/API/source/controllers/poblacion.controller.js`, `Databases/SQL/routines/sp_poblar_servicios.sql`
- FR2 → `Deliverables/API/source/routes/poblacion.routes.js`
- FR3 → `Deliverables/API/source/controllers/poblacion.controller.js` y `poblar.controller.nosql.js`
- FR4 → `Deliverables/API/source/controllers/poblacion.controller.js`
- FR5 → `Deliverables/API/source/swagger.js`

## Notas
- Los filtros nulos se normalizan antes de ejecutar el procedimiento almacenado.
- `test_sql=false` con `test_nosql=true` permite generar solo datos NoSQL en modo mock.
- La API documentada en Swagger coincide con los parámetros realmente aceptados por los controladores.
