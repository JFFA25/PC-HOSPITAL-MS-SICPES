# Diccionario de Datos (DD)

![Data Dictionary](https://img.shields.io/badge/Data%20Dictionary-FF8C00?style=for-the-badge&logo=book&logoColor=white)

Esta carpeta se encuentra en `Databases/SQL/DD`.

Aquí se documentan las tablas, columnas, tipos de datos, relaciones y restricciones de la base de datos SQL. Incluye definiciones de cada elemento para facilitar el entendimiento del modelo de datos.

## Estructura de carpetas actual

>|- **Databases** <br>
>|- NoSQL <br>
>|- **SQL** <br>
>&nbsp;&nbsp;|- Backups <br>
>&nbsp;&nbsp;|- **DD** <br>
>&nbsp;&nbsp;|- ERD <br>
>&nbsp;&nbsp;|- RM <br>
>|- DataModels <br>
>|- Deliverables <br>
>|- Docs <br>

> Ideal para mantener la documentación técnica del diseño de la base de datos.

## Tablas clave usadas por `sp_poblacion`

### `tbb_pacientes`
| Campo | Tipo | Descripción |
|---|---|---|
| `Nombre` | VARCHAR | Nombre del paciente. |
| `Apellido_Paterno` | VARCHAR | Apellido paterno del paciente. |
| `Apellido_Materno` | VARCHAR | Apellido materno del paciente. |
| `Genero` | VARCHAR | Género del paciente. |
| `Fecha_Nacimiento` | DATE | Fecha de nacimiento calculada. |
| `Tipo_Sangre` | VARCHAR | Tipo de sangre. |
| `Estado_Vida` | VARCHAR | Estado de vida del paciente. |
| `Estatus_Medico` | VARCHAR | Estado médico actual. |
| `Alergias` | TEXT | Información de alergias. |
| `Fecha_Registro` | DATETIME | Fecha de registro del paciente. |
| `Activo` | BOOLEAN | Flag de actividad del registro. |
| `Edad_Min` | INT | Edad mínima usada en la generación. |
| `Edad_Max` | INT | Edad máxima usada en la generación. |
| `Edad` | INT | Edad real calculada. |

### `tbc_servicios_medicos`
| Campo | Tipo | Descripción |
|---|---|---|
| `Tipo_Servicio` | VARCHAR | Tipo de servicio médico. |
| `Estado_Servicio` | VARCHAR | Estado del servicio. |
| `Prioridad` | VARCHAR | Prioridad asignada. |
| `Fecha_Inicio` | DATETIME | Fecha de inicio del servicio. |
| `Paciente_ID` | INT | FK al paciente. |

### `tbd_citas_medicas`
| Campo | Tipo | Descripción |
|---|---|---|
| `Especialidad` | VARCHAR | Especialidad médica. |
| `Consultorio` | VARCHAR | Consultorio asignado. |
| `Tipo_Cita` | VARCHAR | Tipo de la cita. |
| `Prioridad` | VARCHAR | Prioridad de la cita. |
| `Estado_Cita` | VARCHAR | Estado de la cita. |
| `Fecha_Cita` | DATETIME | Fecha de la cita. |
| `Servicio_Medico_ID` | INT | FK al servicio médico. |

### `tbd_valoraciones`
| Campo | Tipo | Descripción |
|---|---|---|
| `Cita_ID` | INT | FK a la cita médica. |
| `Diagnostico` | TEXT | Diagnóstico generado. |
| `Temperatura` | DECIMAL | Temperatura simulada. |
| `Fecha_Valoracion` | DATETIME | Fecha de valoración. |

## Correspondencia con la API
- `sp_poblacion` se define en `Databases/SQL/routines/sp_poblar_servicios.sql`.
- `POST /api/poblar-test` utiliza este procedimiento para crear datos SQL.
- Los campos generados se usan para crear documentos en MongoDB.

## Observaciones
- El procedimiento admite filtros reales por género, edad, alergias, prioridad, tipo de servicio y estado de vida.
- Este documento ahora refleja la implementación actual de la base de datos SQL.

## Tabla de observaciones

| Desarrollador | Rol | Observacines|
| :--- | :--- | :--- |
| **Jose Francisco Flores Amador** | Líder de Proyecto / Fullstack / Documentación | 🟢 Aprobado|
| **Edgar Cabrera Velázquez** | Backend / Lógica del sistema |🟢 Aprobado|
| **Edwin Hernández Campos** | Base de datos / Estructura | 🟢 Aprobado|
| **Giovany Raul Pazos Cruz** | Frontend / Interfaz |🟢 Aprobado|