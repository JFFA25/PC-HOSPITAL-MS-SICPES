# API Tests

Este documento describe los casos de prueba que coinciden con los endpoints reales de la API.

## Endpoints probados

### 1. `POST /api/poblar-test`
Genera datos en MySQL y/o MongoDB.

#### Caso 1: Generación híbrida de 10K registros
- Request:
```json
{
  "cantidad": 10000,
  "test_sql": true,
  "test_nosql": true,
  "es_grave": false,
  "con_alergias": true,
  "prioridad": "Alta",
  "tipo_servicio": "Urgencia"
}
```
- Resultado esperado:
  - `exito: true`
  - `pacientes_creados_sql` debe ser mayor a 0.
  - `citas_valoraciones_nosql` debe ser igual a 10000.

- Ejemplo de respuesta real:
```json
{
  "exito": true,
  "mensaje": "¡Prueba de inserción completada!",
  "filtros_usados": {
    "cantidad": 10000,
    "genero": null,
    "estado_vida": null,
    "prioridad": "Alta",
    "tipo_servicio": "Urgencia",
    "edad_min": null,
    "edad_max": null,
    "con_alergias": true
  },
  "detalles": {
    "pacientes_creados_sql": 10000,
    "citas_valoraciones_nosql": 10000,
    "modo": "Rutina (Normal)"
  }
}
```

#### Caso 2: Filtro por edad y género
- Request:
```json
{
  "cantidad": 5000,
  "genero": "H",
  "edad_min": 20,
  "edad_max": 60,
  "test_sql": true,
  "test_nosql": true
}
```
- Resultado esperado:
  - `filtros_usados` refleja `genero`, `edad_min`, `edad_max`.
  - Inserciones en SQL se realizan según el procedimiento `sp_poblacion`.

#### Caso 3: Invalidación de cantidad
- Request:
```json
{
  "cantidad": 0,
  "test_sql": true,
  "test_nosql": true
}
```
- Resultado esperado:
  - HTTP 400
  - Mensaje: `La cantidad debe ser un número mayor a 0`

- Ejemplo de respuesta real:
```json
{
  "error": "La cantidad debe ser un número mayor a 0"
}
```

### 2. `POST /api/poblar-nosql`
Genera datos exclusivos en MongoDB.

#### Caso 4: Generación NoSQL en modo normal
- Request:
```json
{
  "cantidad": 1000,
  "es_grave": false
}
```
- Resultado esperado:
  - `exito: true`
  - `total_insertados` igual a 1000
  - `modo` igual a `Normal`

- Ejemplo de respuesta real:
```json
{
  "exito": true,
  "mensaje": "Datos generados en MongoDB correctamente",
  "total_insertados": 1000,
  "modo": "Normal"
}
```

#### Caso 5: Generación NoSQL en modo crítico
- Request:
```json
{
  "cantidad": 1000,
  "es_grave": true
}
```
- Resultado esperado:
  - `exito: true`
  - `modo` igual a `Crítico`
  - Los síntomas incluyen `Dificultad respiratoria`.

- Ejemplo de respuesta real:
```json
{
  "exito": true,
  "mensaje": "Datos generados en MongoDB correctamente",
  "total_insertados": 1000,
  "modo": "Crítico"
}
```

## Cobertura de pruebas

Estos casos cubren:
- Validación de parámetros de entrada.
- Generación de datos híbridos y NoSQL.
- Mapeo correcto de filtros a la lógica de generación.
- Respuestas coincidentes con los controladores reales.

## Observaciones

- Las pruebas documentadas están alineadas con la implementación de `Deliverables/API/source/controllers`.
- Si se agrega un endpoint nuevo, también se debe documentar aquí para mantener la coherencia.
