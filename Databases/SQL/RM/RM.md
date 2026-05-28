# Estructura de Datos – Área de Servicios Médicos

![MySQL](https://img.shields.io/badge/MySQL-Database-blue?style=for-the-badge&logo=mysql&logoColor=white)
![ERD](https://img.shields.io/badge/ERD-Data%20Architecture-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Documented-success?style=for-the-badge)

## Descripción

En esta sección se presenta la **Arquitectura de Datos (ERD)** del sistema **Servicios Médicos**, la cual describe la estructura de la base de datos relacional utilizada para la gestión de pacientes y sus procesos clínicos.

El **Entity Relationship Diagram (ERD)** permite visualizar:

- Las entidades principales del sistema  
- Las relaciones entre pacientes, servicios, citas y valoraciones  
- La organización de los datos clínicos  

Esta arquitectura es fundamental para:

-  Diseño de base de datos  
-  Implementación de lógica en Stored Procedures  
- Generación de datos para pruebas  
- Escalabilidad del sistema  

## Diagrama de Relaciones

![Relaciones](/Databases/SQL/RM/estructura.png)

## Arquitectura de Datos (ERD)

| Entidad                    | Descripción |
|---------------------------|------------|
| **tbb_pacientes**         | Contiene la información principal del paciente, incluyendo datos personales, estado de vida, edad, alergias y estatus médico |
| **tbc_servicios_medicos** | Registra los servicios médicos asignados a cada paciente, incluyendo tipo de servicio, prioridad y estado |
| **tbd_citas_medicas**     | Almacena las citas médicas relacionadas a cada servicio, incluyendo especialidad, consultorio y estado de la cita |
| **tbd_valoraciones**      | Contiene las valoraciones clínicas del paciente, como diagnóstico, temperatura, presión arterial y observaciones |

## Relación entre Entidades

La arquitectura sigue un modelo relacional jerárquico:

1. **tbb_pacientes** es la entidad principal del sistema.
2. **tbc_servicios_medicos** se relaciona con pacientes mediante `Paciente_ID`.
3. **tbd_citas_medicas** se vincula a los servicios médicos mediante `Servicio_Medico_ID`.
4. **tbd_valoraciones** depende de las citas médicas mediante `Cita_ID`.

## Flujo de Información

El flujo de datos dentro del sistema es el siguiente:

1.Paciente  
2.Servicio Médico  
3.Cita Médica  
4.Valoración  

Este flujo permite representar el proceso clínico completo dentro del sistema.

## Características del Modelo

- Modelo normalizado  
- Separación de responsabilidades por entidad  
- Soporte para generación masiva de datos  
- Integración con sistemas híbridos (SQL + NoSQL)  
- Escalable para simulación de entornos hospitalarios  

## Conclusión

La arquitectura implementada permite representar de manera estructurada y eficiente la información clínica de los pacientes, facilitando la generación de datos, su análisis y su visualización en dashboards.

Este modelo es clave para garantizar consistencia, integridad y escalabilidad en el sistema de servicios médicos.
