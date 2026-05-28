# User Requirements (URs) - Sistema de Servicios Médicos Híbrido

## Propósito
Definir lo que los usuarios esperan obtener de la API desde una perspectiva funcional y de experiencia.

## Requisitos de usuario clave

| ID | Usuario | Requisito |
|---|---|---|
| UR1 | Tester | Generar datos masivos usando un solo endpoint. |
| UR2 | Médico | Marcar valoraciones críticas y registrar estudios prioritarios. |
| UR3 | Administrador | Configurar si se inserta en SQL, NoSQL o ambos. |
| UR4 | Analista | Recibir un resumen claro de registros creados. |
| UR5 | Documentador | Acceder fácilmente a la documentación Swagger. |

## Expectativas de uso
- El endpoint debe aceptar un JSON con `cantidad`, filtros y banderas `test_sql` / `test_nosql`.
- Debe existir un endpoint separado para pruebas solo NoSQL.
- La respuesta debe incluir cantidad de registros creados y estado de la operación.
- Las opciones de filtro deben ser claras y opcionales.

## Criterios de aceptación
- El sistema procesa correctamente la solicitud y genera datos.
- En caso de error, el usuario recibe un mensaje con la causa.
- La documentación de los endpoints es accesible y completa.
- La API soporta la generación de pruebas a gran escala sin perder consistencia.
