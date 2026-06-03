# Non-Functional Requirements (NFRs) - Sistema de Servicios Médicos Híbrido

## Propósito
Definir los atributos de calidad que la API debe cumplir: rendimiento, seguridad, disponibilidad, escalabilidad y mantenibilidad.

## Requisitos no funcionales principales

| ID | Categoría | Requisito | Estado real |
|---|---|---|---|
| NFR1 | Rendimiento | Generación de 10K registros en menos de 30 segundos. | Factible con `sp_poblacion` y generación en chunks de MongoDB. |
| NFR2 | Disponibilidad | API disponible 99.9% en entorno de pruebas. | Servidor Express con manejo de errores y dependencias aisladas. |
| NFR3 | Seguridad | Uso de variables de entorno para credenciales y conexión segura de bases de datos. | Implementado con `dotenv` en `Deliverables/API/source/server.js`. |
| NFR4 | Escalabilidad | Soportar generación creciente de datos (10K, 50K, 100K). | `poblarNoSQL` usa inserciones por chunks; `sp_poblacion` maneja generación de grandes volúmenes. |
| NFR5 | Mantenibilidad | Código estructurado en controladores, rutas y documentación Swagger. | Implementado con `controllers/`, `routes/` y `swagger.js`. |

## Detalles
- **Rendimiento:** la inserción masiva de MongoDB se realiza en bloques de 1000 documentos para reducir uso de memoria.
- **Seguridad:** las credenciales no están en el código; se cargan desde `.env` con `dotenv`.
- **Escalabilidad:** la arquitectura de módulos permite ampliar endpoints sin romper la base existente.
- **Fiabilidad:** la API usa validación básica de entrada y maneja errores con respuestas 400/500.
- **Documentación:** `swagger.js` expone la documentación para todos los endpoints implementados.

## Métricas aplicadas
- Latencia de consulta simple: objetivo < 500ms.
- Tiempo de generación de datos grandes: objetivo < 2 min para 50K.
- Fallos de validación: la API retorna mensajes claros para entradas incorrectas.

## Trazabilidad con el código
- NFR3 → `Deliverables/API/source/server.js`, `.env.example`
- NFR5 → `Deliverables/API/source/controllers`, `Deliverables/API/source/routes`, `Deliverables/API/source/swagger.js`
- NFR4 → `Deliverables/API/source/controllers/poblar.controller.nosql.js`

## Métricas sugeridas
- Latencia promedio de respuesta < 500ms para llamadas simples.
- Tiempo máximo de procesamiento de 50K registros < 2 minutos.
- Tasa de errores menores al 1% en pruebas de generación.
