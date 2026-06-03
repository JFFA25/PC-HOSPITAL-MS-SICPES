
# <p align="center">PC-HOSPITAL-MS-SICPES</p>
<p align="center">
  <strong>Sistema Integral de Control de Pensión de Estudiantes</strong><br>
  <em>"Conectando estudiantes con hogares seguros, digitalizando la gestión de pensiones."</em>
</p>

<p align="center">
  <img src="/Images/SICPES_Producto.png" alt="SICPES Logo" width="250"/>
</p>

<p align="center">
  <a href="#tecnologías">
    <img src="https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB" alt="React"/>
  </a>
  <a href="#tecnologías">
    <img src="https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript"/>
  </a>
  <a href="#tecnologías">
    <img src="https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white" alt="Node.js"/>
  </a>
  <a href="#tecnologías">
    <img src="https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>
  </a>
  <a href="#tecnologías">
    <img src="https://img.shields.io/badge/FastAPI-009688.svg?style=for-the-badge&logo=fastapi&logoColor=white" alt="FastAPI"/>
  </a>
</p>

## Resumen Ejecutivo

SICPES es una innovadora plataforma web diseñada para proporcionar a los estudiantes un acceso simplificado a la gestión y búsqueda de alojamiento en pensiones. Nuestra misión es conectar a estudiantes con espacios seguros y accesibles, y brindar a los administradores una herramienta eficiente para el control de sus inmuebles.

### Por qué SICPES
*   **Automatización:** Control centralizado de disponibilidad sin procesos manuales.
*   **Seguridad:** Conexión con espacios seguros y verificación de identidad.
*   **Finanzas Claras:** Gestión de pagos, cuotas y deudores sin errores técnicos.
*   **UX Intuitiva:** Dashboards modernos diseñados para la facilidad de uso.

## Problemática vs Solución

| El Problema | La Solución (SICPES) |
| :--- | :--- |
| Procesos informales y desorganizados en la búsqueda de pensión. | Plataforma intuitiva para visualizar disponibilidad y solicitar reservaciones. |
| Administración manual en libretas propensa a errores y pérdida de datos. | Administrador digital que estandariza cobros y automatiza registros. |
| Dificultad para validar pagos y empalme de reservaciones. | Sistema de validación en tiempo real y dashboards administrativos claros. |

## Tecnologías

| Capa | Herramientas |
| :--- | :--- |
| **Frontend** | React, TypeScript, TailwindCSS ![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB) ![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white) ![TailwindCSS](https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white) |
| **Backend** | Node.js, Express, FastAPI (Python) ![Node.js](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white) ![Express](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB) ![FastAPI](https://img.shields.io/badge/FastAPI-009688.svg?style=for-the-badge&logo=fastapi&logoColor=white) |
| **Bases de Datos** | MySQL, MongoDB ![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white) ![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white) |
| **Documentación** | Swagger/OpenAPI, Markdown ![Markdown](https://img.shields.io/badge/markdown-%23000000.svg?style=for-the-badge&logo=markdown&logoColor=white) |

## Estructura del Proyecto

- `source/` — directorio raíz de la estructura fuente del proyecto.
- `build/` — directorio raíz de la estructura de artefactos de compilación.
- `Deliverables/API/source/` — código fuente del backend de la API.
- `Deliverables/API/build/` — artefactos listos para despliegue del backend.
- `Deliverables/WebApp/source/` — código fuente del frontend web.
- `Deliverables/WearableApp/source/` — código fuente de la app wearable.
- `.gitignore` — excluye archivos temporales y datos sensibles.
- `.env.example` — variables de entorno requeridas para ejecutar el proyecto.
- 
- `Docs/Tech/Technical_Decisions.md` — justificación técnica y decisiones arquitecturales.
- `Docs/Documentation/CONVENTIONS.md` — convenciones de documentación y formato.
> Copia `.env.example` a `.env` y ajusta los valores locales antes de ejecutar `npm start` o `npm run dev`.

## Identidad Visual

### Logos del Proyecto
<p align="center">
  <img src="/Images//SICPES_Empresa.png" alt="Logo Empresa" width="300"/>
  <img src="/Images//SICPES_Producto.png" alt="Logo Producto" width="300"/>
</p>

### Paleta de Colores
<p align="center">
  <img src="/Images//colors_scipes.png" alt="Colores" width="600"/>
</p>

## Nuestro Equipo

| Desarrollador | Rol | GitHub |
| :--- | :--- | :--- |
| **Jose Francisco Flores Amador** | Líder de Proyecto / Fullstack / Documentación | [@JFFA25](https://github.com/JFFA25) |
| **Edgar Cabrera Velázquez** | Backend / Lógica del sistema | [@Edgar-Cbr](https://github.com/Edgar-Cbr) |
| **Edwin Hernández Campos** | Base de datos / Estructura | [@Edwinhdzcm](https://github.com/Edwinhdzcm) |
| **Giovany Raul Pazos Cruz** | Frontend / Interfaz | [@giova0412](https://github.com/giova0412) |

## Pruebas de API

La API Hospital Híbrida incluye un endpoint para generar grandes volúmenes de datos hospitalarios y validar el correcto funcionamiento del sistema con datos reales.

### Endpoint de Pruebas

```
POST /api/poblar-test
```

### Parámetros Disponibles

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `cantidad` | `integer` | Número de registros a generar |
| `genero` | `string` | Género: "H" (Hombre), "M" (Mujer), null (Ambos) |
| `estado_vida` | `string` | Estado: "Vivo", "Fallecido", null (Ambos) |
| `prioridad` | `string` | Nivel: "Baja", "Media", "Alta", null (Todas) |
| `tipo_servicio` | `string` | Tipo: "Urgencia", "Consulta", "Hospitalización", null (Todos) |
| `edad_min` | `integer` | Edad mínima (inclusivo) |
| `edad_max` | `integer` | Edad máxima (inclusivo) |
| `con_alergias` | `boolean` | Filtro de alergias (true/false/null) |
| `es_grave` | `boolean` | Si es true, genera casos críticos |
| `test_sql` | `boolean` | Inserta datos en MySQL |
| `test_nosql` | `boolean` | Inserta datos en MongoDB |

---

## Tests SQL - 5 Escenarios de Prueba

### Test SQL 1: Generación Automática de Población (10K Registros)

**Caso de Uso:** Validación de rendimiento con volumen moderado de datos.

```json
{
  "cantidad": 10000,
  "test_sql": true,
  "test_nosql": false
}
```

**Esperado:** 10,000 pacientes creados en MySQL sin duplicados.

**Respuesta Exitosa:**
```json
{
  "exito": true,
  "mensaje": "¡Prueba de inserción completada!",
  "total_pacientes_creados": 10000,
  "modo_sql": "Activo",
  "modo_nosql": "Inactivo"
}
```

### Test SQL 2: Escenario Crítico - Pacientes Alérgicos (15K Registros)

**Caso de Uso:** Validar identificación de pacientes con alergias para casos críticos.

```json
{
  "cantidad": 15000,
  "con_alergias": true,
  "prioridad": "Alta",
  "edad_min": 10,
  "edad_max": 70,
  "test_sql": true,
  "test_nosql": false
}
```

**Esperado:** 15,000 registros de pacientes alérgicos con prioridad alta.

**Respuesta Exitosa:**
```json
{
  "exito": true,
  "mensaje": "¡Prueba de inserción completada!",
  "total_pacientes_creados": 15000,
  "filtros_usados": {
    "cantidad": 15000,
    "con_alergias": true,
    "prioridad": "Alta"
  }
}
```

### Test SQL 3: Pacientes Pediátricos con Alergias (5K Registros)

**Caso de Uso:** Validar generación de población infantil con condiciones especiales.

```json
{
  "cantidad": 5000,
  "genero": null,
  "edad_min": 0,
  "edad_max": 12,
  "con_alergias": true,
  "tipo_servicio": "Consulta",
  "test_sql": true,
  "test_nosql": false
}
```

**Esperado:** 5,000 pacientes pediátricos alérgicos en servicio de consulta.

**Respuesta Exitosa:**
```json
{
  "exito": true,
  "mensaje": "¡Prueba de inserción completada!",
  "total_pacientes_creados": 5000,
  "rango_edad": "0-12 años"
}
```

### Test SQL 4: Pacientes en Laboratorio - Prioridad Baja (4K Registros)

**Caso de Uso:** Validar registros rutinarios sin urgencia.

```json
{
  "cantidad": 4000,
  "tipo_servicio": "Laboratorio",
  "prioridad": "Baja",
  "con_alergias": false,
  "estado_vida": "Vivo",
  "test_sql": true,
  "test_nosql": false
}
```

**Esperado:** 4,000 pacientes vivos en laboratorio sin alergias.

**Respuesta Exitosa:**
```json
{
  "exito": true,
  "mensaje": "¡Prueba de inserción completada!",
  "total_pacientes_creados": 4000,
  "prioridad_procesada": "Baja"
}
```

### Test SQL 5: Pacientes Adultos Mayores - Hospitalización (4K Casos Graves)

**Caso de Uso:** Validar población de alto riesgo en cuidados intensivos.

```json
{
  "cantidad": 4000,
  "genero": "M",
  "edad_min": 65,
  "edad_max": 100,
  "tipo_servicio": "Hospitalización",
  "es_grave": true,
  "con_alergias": true,
  "test_sql": true,
  "test_nosql": false
}
```

**Esperado:** 4,000 adultos mayores masculinos en hospitalización crítica.

**Respuesta Exitosa:**
```json
{
  "exito": true,
  "mensaje": "¡Prueba de inserción completada!",
  "total_pacientes_creados": 4000,
  "modo_critico": true,
  "edad_promedio": "75-80 años"
}
```

## Tests NoSQL - 5 Escenarios de Prueba

### Test NoSQL 1: Valoraciones Críticas (2K Documentos)

**Caso de Uso:** Generar documentos de casos críticos con síntomas graves.

```json
{
  "cantidad": 2000,
  "es_grave": true,
  "test_sql": false,
  "test_nosql": true
}
```

**Esperado:** 2,000 documentos en MongoDB con síntomas: Fiebre alta, Dificultad respiratoria.

**Estructura del Documento Generado:**
```json
{
  "servicio_medico_id": 45623,
  "cita_id": 89234,
  "medico_id": 15,
  "fecha_valoracion": "2026-05-29T15:30:45.000Z",
  "sintomas": ["Fiebre alta", "Dificultad respiratoria"],
  "estudios_solicitados": [
    {
      "estudio": "Tomografía",
      "prioridad": "alta",
      "fecha_solicitud": "2026-05-29T15:30:45.000Z"
    }
  ],
  "diagnostico_preliminar": "Paciente en estado crítico",
  "observaciones": "Generado automáticamente para pruebas",
  "auditoria": {
    "creado_en": "2026-05-29T15:30:45.000Z"
  }
}
```

### Test NoSQL 2: Chequeos Generales (5K Documentos)

**Caso de Uso:** Generación masiva de valoraciones de rutina sin urgencia.

```json
{
  "cantidad": 5000,
  "es_grave": false,
  "test_sql": false,
  "test_nosql": true
}
```

**Esperado:** 5,000 documentos con síntomas: "Chequeo general" y estudios básicos.

**Estructura del Documento Generado:**
```json
{
  "servicio_medico_id": 12345,
  "cita_id": 67890,
  "medico_id": 8,
  "fecha_valoracion": "2026-05-29T14:20:00.000Z",
  "sintomas": ["Chequeo general"],
  "estudios_solicitados": [
    {
      "estudio": "Análisis de sangre",
      "prioridad": "baja",
      "fecha_solicitud": "2026-05-29T14:20:00.000Z"
    }
  ],
  "diagnostico_preliminar": "Evaluación general",
  "observaciones": "Generado automáticamente para pruebas",
  "auditoria": {
    "creado_en": "2026-05-29T14:20:00.000Z"
  }
}
```

### Test NoSQL 3: Valoraciones con Estudios Especializados (3K Documentos)

**Caso de Uso:** Documentos que requieren múltiples estudios diagnósticos avanzados.

```json
{
  "cantidad": 3000,
  "es_grave": true,
  "test_sql": false,
  "test_nosql": true
}
```

**Esperado:** 3,000 documentos con estudios especializados: Tomografía, Rayos X.

**Estructura del Documento Generado:**
```json
{
  "servicio_medico_id": 55432,
  "cita_id": 98765,
  "medico_id": 12,
  "fecha_valoracion": "2026-05-29T16:45:30.000Z",
  "sintomas": ["Fiebre alta", "Dolor intenso", "Dificultad respiratoria"],
  "estudios_solicitados": [
    {
      "estudio": "Tomografía",
      "prioridad": "alta",
      "fecha_solicitud": "2026-05-29T16:45:30.000Z"
    },
    {
      "estudio": "Rayos X",
      "prioridad": "media",
      "fecha_solicitud": "2026-05-29T16:45:30.000Z"
    }
  ],
  "diagnostico_preliminar": "Paciente en estado crítico",
  "observaciones": "Generado automáticamente para pruebas",
  "auditoria": {
    "creado_en": "2026-05-29T16:45:30.000Z"
  }
}
```

### Test NoSQL 4: Validación de Índices y Queries (8K Documentos)

**Caso de Uso:** Prueba de rendimiento en búsquedas con alto volumen de datos.

```json
{
  "cantidad": 8000,
  "es_grave": false,
  "test_sql": false,
  "test_nosql": true
}
```

**Esperado:** 8,000 documentos indexados para búsquedas rápidas por `medico_id`, `servicio_medico_id`.

**Query Recomendada para Validación:**
```javascript
// Búsqueda por médico
db.valoraciones.find({ medico_id: { $in: [1, 5, 10] } }).count()

// Búsqueda por síntomas
db.valoraciones.find({ sintomas: "Fiebre alta" }).count()

// Búsqueda por fecha
db.valoraciones.find({ 
  fecha_valoracion: { $gte: new Date("2026-05-29") } 
}).count()
```

### Test NoSQL 5: Auditoría y Trazabilidad Completa (6K Documentos)

**Caso de Uso:** Generación de documentos con trazabilidad completa para cumplimiento regulatorio.

```json
{
  "cantidad": 6000,
  "es_grave": false,
  "test_sql": false,
  "test_nosql": true
}
```

**Esperado:** 6,000 documentos con auditoría completa y metadatos de creación.

**Estructura del Documento Generado con Auditoría Extendida:**
```json
{
  "_id": ObjectId("..."),
  "servicio_medico_id": 34567,
  "cita_id": 56789,
  "medico_id": 7,
  "fecha_valoracion": "2026-05-29T17:50:15.000Z",
  "sintomas": ["Chequeo general"],
  "estudios_solicitados": [
    {
      "estudio": "Análisis de sangre",
      "prioridad": "baja",
      "fecha_solicitud": "2026-05-29T17:50:15.000Z"
    }
  ],
  "diagnostico_preliminar": "Evaluación general",
  "observaciones": "Generado automáticamente para pruebas",
  "auditoria": {
    "creado_en": "2026-05-29T17:50:15.000Z",
    "sistema": "API Hospital Híbrida v1.0",
    "version_datos": "1"
  }
}
```

**Validación de Auditoría:**
```javascript
// Verificar integridad de datos
db.valoraciones.aggregate([
  {
    $group: {
      _id: null,
      total_documentos: { $sum: 1 },
      fecha_primera: { $min: "$auditoria.creado_en" },
      fecha_ultima: { $max: "$auditoria.creado_en" }
    }
  }
])
```

## Resumen de Pruebas

| Tipo | Test | Cantidad | Propósito |
|------|------|----------|-----------|
| **SQL** | Test 1 | 10K | Volumen moderado |
| **SQL** | Test 2 | 15K | Pacientes alérgicos |
| **SQL** | Test 3 | 5K | Población pediátrica |
| **SQL** | Test 4 | 4K | Laboratorio |
| **SQL** | Test 5 | 4K | Adultos mayores críticos |
| **NoSQL** | Test 1 | 2K | Casos críticos |
| **NoSQL** | Test 2 | 5K | Chequeos generales |
| **NoSQL** | Test 3 | 3K | Estudios especializados |
| **NoSQL** | Test 4 | 8K | Rendimiento de índices |
| **NoSQL** | Test 5 | 6K | Auditoría completa |

**Total de Registros Probados:** 72,000 registros

## Instrucciones para Ejecutar las Pruebas

### Requisitos Previos
- API Hospital Híbrida corriendo en `http://localhost:3000`
- MySQL conectado y disponible
- MongoDB disponible
- Herramientas: Postman, cURL o similar

### Ejecutar Test SQL
```bash
curl -X POST http://localhost:3000/api/poblar-test \
  -H "Content-Type: application/json" \
  -d '{
    "cantidad": 10000,
    "test_sql": true,
    "test_nosql": false
  }'
```

### Ejecutar Test NoSQL
```bash
curl -X POST http://localhost:3000/api/poblar-test \
  -H "Content-Type: application/json" \
  -d '{
    "cantidad": 5000,
    "es_grave": false,
    "test_sql": false,
    "test_nosql": true
  }'
```

### Ejecutar Ambos Tests Simultáneamente
```bash
curl -X POST http://localhost:3000/api/poblar-test \
  -H "Content-Type: application/json" \
  -d '{
    "cantidad": 10000,
    "test_sql": true,
    "test_nosql": true,
    "es_grave": false
  }'
```