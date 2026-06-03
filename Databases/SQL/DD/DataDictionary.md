# Data Dictionary - SQL

Este documento complementa la carpeta `Databases/SQL/DD` con un diccionario de datos explícito.

## Tablas usadas por el procedimiento `sp_poblacion`

### `tbb_pacientes`
| Campo | Tipo | Descripción |
|---|---|---|
| `Nombre` | VARCHAR | Nombre del paciente. |
| `Apellido_Paterno` | VARCHAR | Apellido paterno. |
| `Apellido_Materno` | VARCHAR | Apellido materno. |
| `Genero` | VARCHAR | Género del paciente. |
| `Fecha_Nacimiento` | DATE | Fecha de nacimiento calculada. |
| `Tipo_Sangre` | VARCHAR | Grupo sanguíneo. |
| `Estado_Vida` | VARCHAR | Estado actual de vida. |
| `Estatus_Medico` | VARCHAR | Estado médico actual. |
| `Alergias` | TEXT | Registro de alergias. |
| `Fecha_Registro` | DATETIME | Fecha de creación del registro. |
| `Activo` | BOOLEAN | Indicador de registro activo. |
| `Edad_Min` | INT | Edad mínima de la generación. |
| `Edad_Max` | INT | Edad máxima de la generación. |
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
| `Especialidad` | VARCHAR | Especialidad de la cita. |
| `Consultorio` | VARCHAR | Consultorio asignado. |
| `Tipo_Cita` | VARCHAR | Tipo de cita. |
| `Prioridad` | VARCHAR | Prioridad. |
| `Estado_Cita` | VARCHAR | Estado de la cita. |
| `Fecha_Cita` | DATETIME | Fecha de la cita. |
| `Servicio_Medico_ID` | INT | FK al servicio médico. |

### `tbd_valoraciones`
| Campo | Tipo | Descripción |
|---|---|---|
| `Cita_ID` | INT | FK a la cita médica. |
| `Diagnostico` | TEXT | Diagnóstico generado. |
| `Temperatura` | DECIMAL | Temperatura simulada. |
| `Fecha_Valoracion` | DATETIME | Fecha de la valoración. |

## Correspondencia con la API
- `POST /api/poblar-test` usa `sp_poblacion` para generar pacientes, servicios, citas y valoraciones.
- Los valores generados por SQL se usan luego para poblar la colección `valoraciones` en MongoDB.

## Notas
- El diccionario se basa en la implementación actual de `Databases/SQL/routines/sp_poblar_servicios.sql`.
- Mantener este archivo sincronizado con el procedimiento almacenado garantiza coherencia entre documentación y código.
