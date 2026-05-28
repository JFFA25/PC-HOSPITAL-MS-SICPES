# Test NoSQL – Generación de Datos Hospitalarios![Node.js](https://img.shields.io/badge/node.js-339933?style=for-the-badge&logo=Node.js&logoColor=white)![Express](https://img.shields.io/badge/express.js-000000?style=for-the-badge&logo=express&logoColor=white)![MongoDB](https://img.shields.io/badge/mongodb-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)![Mongoose](https://img.shields.io/badge/mongoose-880000?style=for-the-badge&logo=mongoose&logoColor=white)![Swagger](https://img.shields.io/badge/swagger-85EA2D.svg?style=for-the-badge&logo=swagger&logoColor=black)

##  Descripción

Este módulo corresponde a las pruebas realizadas sobre el **esquema NoSQL (MongoDB)** del sistema de servicios médicos.

El objetivo es validar la correcta inserción, estructura y comportamiento de documentos dentro de la colección **`valoraciones`**.

Cada documento representa una **valoración clínica** asociada a un paciente, incluyendo información médica, estudios solicitados, síntomas y datos de auditoría.

## Endpoint utilizado

```
POST /api/poblar-nosql
```

## Ejemplo de solicitud

```json
{
  "cantidad": 1000,
  "es_grave": false
}
```

### Descripción de parámetros

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `cantidad` | `integer` | Número de documentos de valoraciones a insertar |
| `es_grave` | `boolean` | Si es `true`, genera valoraciones críticas con síntomas severos y estudios de mayor prioridad |

## Estructura del Documento

Cada documento generado incluye los siguientes campos:

- **`servicio_medico_id`**: ID del servicio médico (referencia a MySQL)
- **`cita_id`**: ID de la cita médica (referencia a MySQL)
- **`medico_id`**: ID del médico que realiza la valoración
- **`fecha_valoracion`**: Fecha y hora de la valoración
- **`sintomas`**: Array de síntomas reportados
- **`estudios_solicitados`**: Array de estudios (estudio, prioridad, fecha)
- **`diagnostico_preliminar`**: Texto del diagnóstico inicial
- **`observaciones`**: Notas adicionales del médico
- **`auditoria`**: Metadatos de creación y actualización

## Evidencia de Pruebas

### 1. Inserción básica de valoraciones (1,000 registros)

![NoSQL](./1.Inserción%20básica%20de%20valoraciones%20(1,000%20registros).png)

### 2. Inserción de valoraciones críticas (3,000 registros)

![NoSQL](./2.Insercion%20de%20valoraciones%20criticas3k.png)

### 3. Inserción masiva de valoraciones (5,000 registros)

![NoSQL](./3.Inserción%20masiva%20de%20valoraciones%20(5,000%20registros).png)

### 4. Inserción masiva de valoraciones críticas (5,000 registros)

![NoSQL](./4.Inserción%20masiva%20de%20valoraciones%20críticas%205k.png)

### 5. Inserción intensiva de valoraciones (10,000 registros)

![NoSQL](./5.Inserción%20intensiva%20de%20valoraciones%2010k%20de%20Registros.png)
