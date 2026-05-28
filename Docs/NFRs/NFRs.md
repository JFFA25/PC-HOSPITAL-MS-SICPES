# Non-Functional Requirements (NFRs) - Sistema de Servicios Médicos Híbrido

## Propósito
Definir los atributos de calidad que la API debe cumplir: rendimiento, seguridad, disponibilidad, escalabilidad y mantenibilidad.

## Requisitos no funcionales principales

| ID | Categoría | Requisito |
|---|---|---|
| NFR1 | Rendimiento | Generación de 10K registros en menos de 30 segundos. |
| NFR2 | Disponibilidad | API disponible 99.9% en entorno de pruebas. |
| NFR3 | Seguridad | Uso de variables de entorno para credenciales y conexión segura de bases de datos. |
| NFR4 | Escalabilidad | Soportar generación creciente de datos (10K, 50K, 100K). |
| NFR5 | Mantenibilidad | Código estructurado en controladores, rutas y documentación Swagger. |

## Detalles
- **Rendimiento:** la inserción masiva debe ejecutarse sin bloquear el servidor.
- **Seguridad:** las credenciales de MySQL y MongoDB no deben estar en código fuente.
- **Escalabilidad:** la arquitectura debe permitir añadir nuevos endpoints o tipos de generación sin reescribir el núcleo.
- **Fiabilidad:** los errores deben atraparse y retornar mensajes claros desde el endpoint.
- **Documentación:** Swagger debe reflejar los endpoints y sus parámetros.

## Métricas sugeridas
- Latencia promedio de respuesta < 500ms para llamadas simples.
- Tiempo máximo de procesamiento de 50K registros < 2 minutos.
- Tasa de errores menores al 1% en pruebas de generación.
