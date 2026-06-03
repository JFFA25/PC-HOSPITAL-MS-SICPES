# Business Requirements (BRs) - Sistema de Servicios Médicos Híbrido

![BRs](https://img.shields.io/badge/BRs-8A2BE2?style=for-the-badge&logo=business&logoColor=white) ![Análisis](https://img.shields.io/badge/Análisis-FF8C00?style=for-the-badge&logo=chart-bar&logoColor=white)

## Visión General

Plataforma hospitalaria híbrida (MySQL + MongoDB) para generar, gestionar y analizar datos médicos de prueba. Permite validar escalabilidad de arquitectura con volúmenes realistas.

## Objetivos de Negocio

| ID | Objetivo | Descripción |
|---|---|---|
| OB1 | Gestión de Pacientes | Registro centralizado y accesible de pacientes |
| OB2 | Coordinación de Servicios | Asignación eficiente de recursos médicos |
| OB3 | Registro de Valoraciones | Capturar información clínica completa |
| OB4 | Análisis de Rendimiento | Validar escalabilidad híbrida SQL+NoSQL |

## Requisitos de Negocio

| ID | Requisito | Implementación real | Prioridad |
|---|---|---|---|
| RB1 | Generación de Datos | `POST /api/poblar-test` ejecuta `sp_poblacion` y retorna los registros insertados en SQL y NoSQL. | ALTA |
| RB2 | Filtrado Avanzado | Los parámetros `genero`, `edad_min`, `edad_max`, `con_alergias`, `prioridad`, `tipo_servicio`, `estado_vida` se usan en la generación de datos SQL y NoSQL. | MEDIA |
| RB3 | Registro de Valoraciones | La colección `valoraciones` almacena síntomas, estudios, diagnóstico preliminar y auditoría. | ALTA |
| RB4 | Casos Críticos | `es_grave=true` cambia los síntomas y los estudios solicitados hacia prioridad `alta`. | ALTA |
| RB5 | Integración Híbrida | `test_sql=true` y `test_nosql=true` permiten generar datos en ambas bases de datos simultáneamente. | CRÍTICA |
| RB6 | Documentación API | Swagger documenta exactamente los endpoints disponibles y su cuerpo de solicitud. | MEDIA |

## Procesos de Negocio

### PB1: Generación de Población Test
1. Usuario solicita generación (cantidad, filtros)
2. Sistema valida parámetros
3. Ejecuta SP en MySQL para registros base
4. Genera documentos en MongoDB
5. Retorna resumen (pacientes, citas, valoraciones)

### PB2: Valoración Clínica
1. Médico inicia consulta
2. Registra IDs (servicio, cita, médico)
3. Ingresa síntomas, estudios, diagnóstico
4. Sistema marca prioridad según severidad
5. Almacena en MongoDB con auditoría
6. Vincula referencia a MySQL

### PB3: Análisis de Datos
1. Analista solicita reporte
2. Sistema consulta ambas BD
3. Agrega y correlaciona información
4. Genera dashboard con KPIs
5. Soporta toma de decisiones

## Reglas de Negocio

| ID | Regla |
|---|---|
| RN1 | Cantidad entre 1 y 100,000 registros |
| RN2 | Integridad de referencias MongoDB↔MySQL |
| RN3 | Auditoría obligatoria con timestamp |
| RN4 | es_grave=true: síntomas severos + prioridad alta |
| RN5 | Confidencialidad según HIPAA/GDPR |
| RN6 | Género: "H","M",null \| Estado: "Vivo","Fallecido",null |

## Casos de Uso

### CU1: Prueba de Carga
**Actor:** Tester  
**Flujo:** Solicita 50K registros → filtra (edad 20-70, es_grave=true) → Valida en dashboards  
**Resultado:** 50K pacientes en MySQL + 50K valoraciones en MongoDB

### CU2: Escenario Crítico
**Actor:** Médico de Simulación  
**Flujo:** Genera 1K casos críticos → Equipo practica protocolos → Registra tiempos  
**Resultado:** Escenarios de entrenamiento listos

### CU3: Análisis de Rendimiento
**Actor:** Arquitecto DevOps  
**Flujo:** Genera progresivamente (10K, 50K, 100K) → Monitoriza latencia/memoria → Documenta  
**Resultado:** Reporte de escalabilidad

## Criterios de Éxito

✅ Endpoints sin errores (poblar-test, poblar-nosql)  
✅ Generación 10K: <30s | 50K: <2min  
✅ 100% sin duplicados, referencias íntegras  
✅ API documentada en Swagger con ejemplos  
✅ Uptime 99.9%, recuperación automática <1min

## Restricciones

| Restricción | Impacto |
|---|---|
| Cumplimiento HIPAA/GDPR | Auditoría obligatoria, encriptación |
| MySQL 5.7+ / MongoDB 4.0+ | Validación de compatibilidad |
| Latencia máx. 5 seg | Optimización de índices, caching |
| Stack: Node.js, Express, MySQL, MongoDB | Sin cambios de herramientas |

## Supuestos

- MySQL y MongoDB disponibles y funcionando
- Servidor Node.js con 4GB RAM mínimo
- Datos generados permanecen en BD de test
- Limpieza manual entre ciclos
- Red confiable, datos no-producción

## Matriz de Trazabilidad

| BR | Prioridad | Test Case |
|---|---|---|
| RB1 | ALTA | Generación 10K registros |
| RB2 | MEDIA | Filtros combinados |
| RB3 | ALTA | Estructura documento |
| RB4 | ALTA | Flag es_grave |
| RB5 | CRÍTICA | Integridad referencias |
| RB6 | MEDIA | Swagger actualizado |

## Historial

| v | Fecha | Cambios | Autor |
|---|---|---|---|
| 1.0 | 28/05/2026 | Inicial | JFFA25 |

**Documento:** Equipo SICPES | **Actualizado:** 28/05/2026 | **Clasificación:** Interno
