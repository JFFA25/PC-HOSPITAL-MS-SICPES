# User Histories (UHs) - Sistema de Servicios Médicos Híbrido

## Propósito
Capturar historias de usuario que describen las necesidades del sistema desde la perspectiva de los distintos actores.

## Historias principales

- Como **tester**, quiero generar datos de prueba masivos con filtros clínicos para validar el rendimiento de la plataforma.
- Como **médico**, quiero registrar valoraciones con prioridad crítica para simular casos graves y verificar la respuesta del sistema.
- Como **analista**, quiero ver un resumen de registros generados para validar la calidad de los datos producidos.
- Como **administrador**, quiero ejecutar pruebas SQL y NoSQL desde una sola interfaz para comprobar la integración híbrida.
- Como **documentador**, quiero acceder a Swagger para comprender rápidamente los endpoints disponibles.

## Estructura de las historias
Cada historia sigue el formato:

```
Como [rol]
Quiero [acción]
Para que [beneficio]
```

## Priorización
- Alta: generación de datos masivos, validación de casos críticos, integración híbrida.
- Media: filtros avanzados, auditoría de operaciones, panel de resultados.
- Baja: vistas wearable de activación rápida de pruebas.

## Uso esperado
Estas historias se utilizan para guiar el desarrollo de los endpoints `POST /api/poblar-test` y `POST /api/poblar-nosql` y su interface asociada.
