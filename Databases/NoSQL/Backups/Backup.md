# NoSQL – Base de Datos Documental

![MongoDB](https://img.shields.io/badge/mongodb-4EA94B?style=for-the-badge\&logo=mongodb\&logoColor=white)
![NoSQL](https://img.shields.io/badge/nosql-database-green?style=for-the-badge)
![JSON](https://img.shields.io/badge/json-document-orange?style=for-the-badge)

## Descripción

Esta carpeta contiene los recursos relacionados con la **base de datos NoSQL (MongoDB)** del sistema.

Su propósito es:

* Almacenar datos en formato JSON
* Manejar información flexible y no estructurada
* Registrar valoraciones clínicas
* Mantener respaldos de datos

## Estructura

```bash id="nosql1"
NoSQL/
│── backups/   # Archivos JSON de respaldo
```

## Creación de la Base de Datos y Colección desde mongosh

### Iniciar MongoDB Shell

Abrir una terminal y ejecutar:

```bash
mongosh
```

### Crear o Seleccionar la Base de Datos

```javascript
use servicios_medicos
```

Verificar la base de datos actual:

```javascript
db
```

Resultado esperado:

```text
servicios_medicos
```

## Creación del Schema de Valoraciones

La colección **valoraciones** almacena información clínica generada durante una valoración médica y se encuentra relacionada con los registros almacenados en MySQL mediante los campos:

- `servicio_medico_id`
- `cita_id`
- `medico_id`

Ejecutar el siguiente script en **mongosh** para crear la colección con validación de esquema:

```javascript
db.createCollection("valoraciones", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "servicio_medico_id",
        "cita_id",
        "medico_id",
        "fecha_valoracion",
        "diagnostico_preliminar"
      ],
      properties: {

        servicio_medico_id: {
          bsonType: ["int", "long"],
          description: "ID del servicio médico proveniente de MySQL"
        },

        cita_id: {
          bsonType: ["int", "long"],
          description: "ID de la cita proveniente de MySQL"
        },

        medico_id: {
          bsonType: ["int", "long"],
          description: "ID del médico"
        },

        fecha_valoracion: {
          bsonType: "date",
          description: "Fecha de realización de la valoración"
        },

        sintomas: {
          bsonType: "array",
          description: "Lista de síntomas reportados por el paciente",
          items: {
            bsonType: "string"
          }
        },

        estudios_solicitados: {
          bsonType: "array",
          description: "Estudios médicos solicitados",
          items: {
            bsonType: "object",
            required: [
              "estudio",
              "prioridad"
            ],
            properties: {

              estudio: {
                bsonType: "string",
                description: "Nombre del estudio solicitado"
              },

              prioridad: {
                enum: [
                  "baja",
                  "media",
                  "alta"
                ],
                description: "Nivel de prioridad del estudio"
              },

              fecha_solicitud: {
                bsonType: "date",
                description: "Fecha de solicitud"
              }

            }
          }
        },

        diagnostico_preliminar: {
          bsonType: "string",
          description: "Diagnóstico preliminar emitido por el médico"
        },

        observaciones: {
          bsonType: "string",
          description: "Observaciones adicionales"
        },

        auditoria: {
          bsonType: "object",
          properties: {

            creado_en: {
              bsonType: "date",
              description: "Fecha de creación del documento"
            },

            actualizado_en: {
              bsonType: "date",
              description: "Fecha de actualización del documento"
            }

          }
        }

      }
    }
  }
})
```

## Verificación de la Colección

Mostrar las colecciones existentes:

```javascript
show collections
```

Este esquema corresponde al modelo **Valoracion.js** utilizado por la API para almacenar valoraciones clínicas dentro de la arquitectura híbrida **MySQL + MongoDB**.

## Componentes

### backups/

* Archivos `.json` con datos de MongoDB
* Respaldos de colecciones
* Datos generados por la API

## Tecnologías utilizadas

| Componente       | Tecnología                                                                                                         |
| ---------------- | ------------------------------------------------------------------------------------------------------------------ |
| Base de datos    | MongoDB ![MongoDB](https://img.shields.io/badge/mongodb-4EA94B?style=for-the-badge\&logo=mongodb\&logoColor=white) |
| Formato de datos | JSON ![JSON](https://img.shields.io/badge/json-FF6F00?style=for-the-badge)                                         |
| Arquitectura     | NoSQL ![NoSQL](https://img.shields.io/badge/nosql-document-green?style=for-the-badge)                              |

## Objetivo

* Manejar datos no estructurados
* Complementar el modelo relacional
* Permitir mayor flexibilidad
* Almacenar información clínica detallada

## Relación con SQL

MongoDB trabaja en conjunto con MySQL:

* MySQL → Datos estructurados
* MongoDB → Valoraciones y datos flexibles

 Forman una arquitectura **híbrida SQL + NoSQL**

## Notas

* Los datos están en formato JSON compatible con MongoDB
* Se utilizan para pruebas y análisis
* Permiten escalabilidad del sistema
