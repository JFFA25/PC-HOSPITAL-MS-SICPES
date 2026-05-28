
## Descripción

Esta carpeta contiene los **modelos de datos (schemas)** utilizados en la base de datos NoSQL (MongoDB).

Los modelos definen:

* La estructura de los documentos
* Reglas de validación
* Relación con datos provenientes de MySQL
* Organización de la información clínica

Se implementan usando **Mongoose**, permitiendo una integración eficiente con Node.js.

## Estructura

```bash id="mdl1"
models/
│── valoracion.model.js   # Modelo de valoraciones clínicas
```

## Modelo disponible

### valoracion.model.js

Este modelo representa las **valoraciones médicas** generadas en el sistema.

### Estructura del esquema

| Campo                  | Tipo   | Descripción                     |
| ---------------------- | ------ | ------------------------------- |
| servicio_medico_id     | Number | ID del servicio médico (MySQL)  |
| cita_id                | Number | ID de la cita (MySQL)           |
| medico_id              | Number | ID del médico                   |
| fecha_valoracion       | Date   | Fecha de la valoración          |
| sintomas               | Array  | Lista de síntomas del paciente  |
| estudios_solicitados   | Array  | Estudios médicos solicitados    |
| diagnostico_preliminar | String | Diagnóstico inicial             |
| observaciones          | String | Notas adicionales               |
| auditoria              | Object | Información de control (fechas) |

### Subdocumento: estudios_solicitados

Cada elemento incluye:

* `estudio` → Nombre del estudio
* `prioridad` → Nivel: **baja, media, alta**
* `fecha_solicitud` → Fecha automática

### Auditoría

El campo `auditoria` permite:

* Registrar fecha de creación (`creado_en`)
* Registrar última actualización (`actualizado_en`)

## Relación con SQL

Este modelo está diseñado para trabajar en conjunto con MySQL:

* `servicio_medico_id`
* `cita_id`
* `medico_id`

Esto permite una arquitectura **híbrida SQL + NoSQL**.

## Tecnologías utilizadas

| Componente    | Tecnología                                                                                                             |
| ------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Base de datos | MongoDB ![MongoDB](https://img.shields.io/badge/mongodb-4EA94B?style=for-the-badge\&logo=mongodb\&logoColor=white)     |
| ODM           | Mongoose ![Mongoose](https://img.shields.io/badge/mongoose-880000?style=for-the-badge\&logo=mongoose\&logoColor=white) |
| Modelado      | Schema ![Schema](https://img.shields.io/badge/schema-data_model-blue?style=for-the-badge)                              |

## Notas

* Se utiliza `mongoose.Schema` para definir la estructura
* El modelo está vinculado explícitamente a la colección **"valoraciones"**
* Permite validaciones como `required` y `enum`
* Facilita consultas y manipulación de datos en MongoDB

## Ejemplo de documento

```json id="mdl2"
{
  "servicio_medico_id": 1,
  "cita_id": 101,
  "medico_id": 5,
  "fecha_valoracion": "2025-01-01T10:00:00Z",
  "sintomas": ["fiebre", "dolor de cabeza"],
  "estudios_solicitados": [
    {
      "estudio": "análisis de sangre",
      "prioridad": "alta",
      "fecha_solicitud": "2025-01-01T10:05:00Z"
    }
  ],
  "diagnostico_preliminar": "infección viral",
  "observaciones": "reposo y líquidos",
  "auditoria": {
    "creado_en": "2025-01-01T10:00:00Z"
  }
}
```