# Test SQL – Generación de Datos Hospitalarios

![Node.js](https://img.shields.io/badge/node.js-339933.svg?style=for-the-badge&logo=node.js&logoColor=white)![Express](https://img.shields.io/badge/express.js-000000.svg?style=for-the-badge&logo=express&logoColor=white)![MySQL](https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white)![MongoDB](https://img.shields.io/badge/mongodb-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)![Mongoose](https://img.shields.io/badge/mongoose-880000?style=for-the-badge&logo=mongoose&logoColor=white)![Swagger](https://img.shields.io/badge/swagger-85EA2D?style=for-the-badge&logo=swagger&logoColor=black)![API REST](https://img.shields.io/badge/API-REST-blue?style=for-the-badge)

##  Descripción

Este módulo forma parte del proyecto **API Servicios Médicos** y tiene como objetivo generar grandes volúmenes de datos hospitalarios para pruebas de rendimiento y análisis.

El sistema utiliza un **Stored Procedure en MySQL (`sp_poblacion`)** que permite crear:

- Pacientes  
- Servicios médicos  
- Citas  
- Valoraciones (SQL + NoSQL)  

Simulando un entorno hospitalario real.

## Endpoint utilizado

```
POST /api/poblar-test
```

## Ejemplo de solicitud

```json
{
  "cantidad": 10,
  "genero": "H",
  "estado_vida": "Vivo",
  "prioridad": "Alta",
  "tipo_servicio": "Urgencia",
  "edad_min": 20,
  "edad_max": 60,
  "con_alergias": true,
  "es_grave": false,
  "test_sql": true,
  "test_nosql": true
}
```

### Descripción de parámetros

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `cantidad` | `integer` | Número de registros a generar |
| `genero` | `string` | Género: "H" (Hombre), "M" (Mujer), null (Ambos) |
| `estado_vida` | `string` | Estado de vida: "Vivo", "Fallecido", null (Ambos) |
| `prioridad` | `string` | Nivel de prioridad: "Baja", "Media", "Alta", null (Todas) |
| `tipo_servicio` | `string` | Tipo de servicio: "Urgencia", "Consulta", "Hospitalización", null (Todos) |
| `edad_min` | `integer` | Edad mínima (filtro inclusivo) |
| `edad_max` | `integer` | Edad máxima (filtro inclusivo) |
| `con_alergias` | `boolean` | Si es `true`, solo pacientes alérgicos; si es `false`, sin alergias; null (Ambos) |
| `es_grave` | `boolean` | Si es `true`, genera casos críticos/graves |
| `test_sql` | `boolean` | Si es `true`, inserta datos en MySQL |
| `test_nosql` | `boolean` | Si es `true`, inserta valoraciones en MongoDB |

## Evidencia de Pruebas

### 1. Generación automática de población (10,000 registros)

![Test](./1.Generación%20automática%20de%20población%20(10000).png)

### 2. Escenario crítico con pacientes alérgicos (15,000 registros)

![Test](./2.Escenario%20crítico%20con%20pacientes%20alérgicos%20(15,000%20registros).png)

### 3.Pacientes pediátricos con alergias (5,000 registros)

![Test](./3.Pacientes%20pediátricos%20con%20alergias%20(5,000%20registros).png)

### 4. Pacientes en laboratorio con prioridad baja (4,000 registros)

![Test](./4.Pacientes%20en%20laboratorio%20con%20prioridad%20baja.png)

### 5. Pacientes adultos mayores en hospitalización (4,000 casos graves)

![Test](./5.Pacientes%20adultos%20mayores%20en%20hospitalización%20(casos%20graves).png)
