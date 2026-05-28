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
### Evidencia del Test

### Dashboard Inicial con el Primer Test de 10K de Registros

![SQL](/dashboard/Dashboard_SQL.jpg)

### 1.Generación automática de población 10K

![Test](/database/SQL/tests/1.Generación%20automática%20de%20población%20(10000).png)

### 2.Generacion de 15k de Pacientes Alergicos entre 10 - 70 Años

![Test](/database/SQL/tests/2.Escenario%20crítico%20con%20pacientes%20alérgicos%20(15,000%20registros).png)

### 3.Pacientes pediátricos con alergias (5,000 registros)

![Test](/database/SQL/tests/3.Pacientes%20pediátricos%20con%20alergias%20(5,000%20registros).png)

### 4.Pacientes en laboratorio con prioridad baja (4,000 registros)

![Test](/database/SQL/tests/4.Pacientes%20en%20laboratorio%20con%20prioridad%20baja.png)

### 5.Pacientes adultos mayores en hospitalización (4,000 casos graves)

![Test](/database/SQL/tests/5.Pacientes%20adultos%20mayores%20en%20hospitalización%20(casos%20graves).png)


### Dashboard Actual con 40K de registros previos a los tests

![SQL](/dashboard/Upgrade_Dashboard_SQL.jpg)
