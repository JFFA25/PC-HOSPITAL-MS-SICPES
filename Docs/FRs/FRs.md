# Functional Requirements (FRs) - Sistema de Servicios Médicos Híbrido

## Propósito
Este documento describe las funciones clave que la API debe ofrecer para soportar la generación de datos hospitalarios y la coordinación entre MySQL y MongoDB.

## Endpoints principales
- `POST /api/poblar-test` → Genera datos mixtos SQL + NoSQL.
- `POST /api/poblar-nosql` → Genera solo valoraciones en MongoDB.

## Requisitos funcionales clave

| ID | Funcionalidad | Detalle |
|---|---|---|
| FR1 | Generación masiva de datos | Crear pacientes, citas y valoraciones con parámetros de filtro. |
| FR2 | Filtro paramétrico | Aceptar `genero`, `estado_vida`, `prioridad`, `tipo_servicio`, `edad_min`, `edad_max`, `con_alergias`. |
| FR3 | Soporte de modo crítico | `es_grave=true` genera valoraciones y estudios de prioridad alta. |
| FR4 | Inserción híbrida | Guardar datos en MySQL y MongoDB según `test_sql` y `test_nosql`. |
| FR5 | Documentación API | Swagger expone los endpoints y ejemplos de solicitud.

## Comportamiento esperado
- Validar la entrada y responder con error si `cantidad` no es un número válido.
- Construir documentos de valoraciones con campos médicos y auditoría.
- Retornar un resumen con pacientes creados, registros generados y modo de operación.

## Notas
- Los datos deben ser consistentes entre MySQL y MongoDB.
- El endpoint core debe permitir pruebas de rendimiento con grandes volúmenes.
