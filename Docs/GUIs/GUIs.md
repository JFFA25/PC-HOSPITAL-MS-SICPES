# GUI Requirements - Sistema de Servicios Médicos Híbrido

## Propósito
Definir los elementos de interfaz necesarios para usar la API de generación de datos y visualizar resultados de las pruebas.

## Componentes principales

### Web App
- Formulario de generación de datos con campos:
  - `cantidad`, `genero`, `estado_vida`, `prioridad`, `tipo_servicio`, `edad_min`, `edad_max`, `con_alergias`, `es_grave`, `test_sql`, `test_nosql`
- Botón de envío para `POST /api/poblar-test` y `POST /api/poblar-nosql`.
- Panel de resultados con resumen de registros generados.
- Acceso directo a la documentación Swagger en `/api/docs`.
- Sección de dashboards para mostrar métricas de prueba.

### Wearable App
- Vista mínima para activar pruebas rápidas.
- Opción de seleccionar `es_grave` y `cantidad`.
- Notificación de finalización de generación.

## Prioridades de diseño
- Interfaz limpia y orientada a la validación rápida.
- Feedback inmediato sobre errores de entrada.
- Visualización clara del estado de la generación y resultados.
- Accesibilidad básica para usuarios técnicos.

## Requisitos derivados
- El mockup debe mostrar el flujo de solicitud de la API.
- Debe existir una página de estado que muestre si la generación se ejecutó con `test_sql` y/o `test_nosql`.
- Los prototipos Web y Wearable pueden ser referenciales y no necesariamente implementados en este repositorio.
