# Data Dictionary - NoSQL (Medical Services)

![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white)
![Documentation](https://img.shields.io/badge/Documentation-Reference-green?style=for-the-badge&logo=bookstack&logoColor=white)

Esta carpeta centraliza la documentación técnica del esquema NoSQL utilizado para el módulo de servicios médicos y auditoría del sistema.

## Archivo Principal

*   **[DataDictionary_MS.pdf](./DataDictionary_MS.pdf)**: Documento detallado que describe la estructura de los documentos, colecciones, tipos de datos y la lógica de persistencia en MongoDB.

## Estructura de Datos (Document-Oriented)

A diferencia del esquema relacional (SQL), el diccionario NoSQL se enfoca en una estructura flexible basada en documentos BSON:

*   **Colecciones**: Conjuntos de documentos (equivalente a tablas).
*   **Documentos**: Registros en formato JSON/BSON con esquemas dinámicos.
*   **Sub-documentos**: Objetos anidados para representar relaciones 1:1 o 1:N de forma embebida.

## Entidades documentadas

La documentación actualiza el diccionario NoSQL para reflejar la implementación real utilizada por la API.

### Colección `valoraciones`
Registra las valoraciones generadas por los endpoints de pruebas.

| Campo | Tipo | Descripción |
|---|---|---|
| `servicio_medico_id` | Number | ID del servicio médico asociado (generado en MySQL). |
| `cita_id` | Number | ID de la cita asociada (generado en MySQL). |
| `medico_id` | Number | Identificador del médico responsable. |
| `fecha_valoracion` | Date | Fecha y hora de la valoración. |
| `sintomas` | Array[String] | Lista de síntomas registrados. |
| `estudios_solicitados` | Array[Object] | Estudios médicos solicitados. |
| `diagnostico_preliminar` | String | Diagnóstico preliminar de la valoración. |
| `observaciones` | String | Comentarios adicionales. |
| `auditoria.creado_en` | Date | Fecha de creación del registro. |
| `auditoria.actualizado_en` | Date | Fecha de actualización del registro (opcional). |

### Subdocumento `estudios_solicitados`

| Campo | Tipo | Descripción |
|---|---|---|
| `estudio` | String | Nombre del estudio. |
| `prioridad` | String | Prioridad del estudio (`baja`, `media`, `alta`). |
| `fecha_solicitud` | Date | Fecha de solicitud del estudio. |

## Tipos de datos usados

| Tipo | Uso |
|------|-----|
| `Number` | IDs del servicio, cita y médico. |
| `String` | Textos, diagnósticos y observaciones. |
| `Date` | Fechas de valoración y auditoría. |
| `Array` | Síntomas y estudios solicitados. |
| `Object` | Subdocumentos como `auditoria` y `estudios_solicitados`. |

## Correspondencia con el código

- Definido en `Databases/NoSQL/Schemas/Valoracion.js`.
- Generado por `Deliverables/API/source/controllers/poblacion.controller.js` y `Deliverables/API/source/controllers/poblar.controller.nosql.js`.

> Este diccionario refleja la estructura real usada en la colección `valoraciones` y alinea el documento con la implementación actual.
