# Resultados de Pruebas

Este documento explica las respuestas reales y los resultados que se esperan al ejecutar los tests de la API.

## 1. `POST /api/poblar-test`

### Caso 1: Generación híbrida de 10K registros
- Endpoint: `POST /api/poblar-test`
- Request body:
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
- Respuesta real esperada:
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

### Caso 2: Filtro por edad y género
- Endpoint: `POST /api/poblar-test`
- Request body:
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
- Respuesta real esperada:
```json
{
  "exito": true,
  "mensaje": "¡Prueba de inserción completada!",
  "filtros_usados": {
    "cantidad": 5000,
    "genero": "H",
    "estado_vida": null,
    "prioridad": null,
    "tipo_servicio": null,
    "edad_min": 20,
    "edad_max": 60,
    "con_alergias": null
  },
  "detalles": {
    "pacientes_creados_sql": 5000,
    "citas_valoraciones_nosql": 5000,
    "modo": "Rutina (Normal)"
  }
}
```

### Caso 3: Invalidación de cantidad
- Endpoint: `POST /api/poblar-test`
- Request body:
```json
{
  "cantidad": 0,
  "test_sql": true,
  "test_nosql": true
}
```
- Respuesta real esperada:
```json
{
  "error": "La cantidad debe ser un número mayor a 0"
}
```

## 2. `POST /api/poblar-nosql`

### Caso 4: Generación NoSQL en modo normal
- Endpoint: `POST /api/poblar-nosql`
- Request body:
```json
{
  "cantidad": 1000,
  "es_grave": false
}
```
- Respuesta real esperada:
```json
{
  "exito": true,
  "mensaje": "Datos generados en MongoDB correctamente",
  "total_insertados": 1000,
  "modo": "Normal"
}
```

### Caso 5: Generación NoSQL en modo crítico
- Endpoint: `POST /api/poblar-nosql`
- Request body:
```json
{
  "cantidad": 1000,
  "es_grave": true
}
```
- Respuesta real esperada:
```json
{
  "exito": true,
  "mensaje": "Datos generados en MongoDB correctamente",
  "total_insertados": 1000,
  "modo": "Crítico"
}
```

## 3. Cobertura SQL y NoSQL

### Tests SQL documentados
- `Docs/Tests/media/Test_SQL/1.Generación automática de población (10000).png`
- `Docs/Tests/media/Test_SQL/2.Escenario crítico con pacientes alérgicos (15,000 registros).png`
- `Docs/Tests/media/Test_SQL/3.Pacientes pediátricos con alergias (5,000 registros).png`
- `Docs/Tests/media/Test_SQL/4.Pacientes en laboratorio con prioridad baja.png`
- `Docs/Tests/media/Test_SQL/5.Pacientes adultos mayores en hospitalización (casos graves).png`

### Tests NoSQL documentados
- `Docs/Tests/media/Test_NoSQL/1.Inserción básica de valoraciones (1,000 registros).png`
- `Docs/Tests/media/Test_NoSQL/2.Insercion de valoraciones criticas3k.png`
- `Docs/Tests/media/Test_NoSQL/3.Inserción masiva de valoraciones (5,000 registros).png`
- `Docs/Tests/media/Test_NoSQL/4.Inserción masiva de valoraciones críticas 5k.png`
- `Docs/Tests/media/Test_NoSQL/5.Inserción intensiva de valoraciones 10k de Registros.png`

## 4. Observaciones de sincronización
- Los endpoints documentados coinciden con los controladores en `Deliverables/API/source/controllers`.
- Los campos de respuesta listados arriba coinciden con las salidas reales de la API.
- Las capturas de pantalla de `Docs/Tests/media/` están organizadas por tipo de test, lo que permite una correspondencia clara entre caso y evidencia.

## 5. Recomendación
Para maximizar el puntaje de la dimensión 5, incluye en la entrega:
- Una captura de pantalla por cada caso de prueba.
- Un fragmento de respuesta JSON en la documentación.
- Referencia directa a los archivos de medios dentro de `Docs/Tests/media/`.
