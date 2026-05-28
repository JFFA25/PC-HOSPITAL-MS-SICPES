# Controllers – Lógica de Negocio
![Node.js](https://img.shields.io/badge/node.js-339933?style=for-the-badge\&logo=Node.js\&logoColor=white)
![Express](https://img.shields.io/badge/express.js-000000?style=for-the-badge\&logo=express\&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge\&logo=mysql\&logoColor=white)
![MongoDB](https://img.shields.io/badge/mongodb-4EA94B?style=for-the-badge\&logo=mongodb\&logoColor=white)
![Mongoose](https://img.shields.io/badge/mongoose-880000?style=for-the-badge\&logo=mongoose\&logoColor=white)

## Descripción

Esta carpeta contiene la **lógica de negocio de la API**, encargada de:

* Procesar las solicitudes entrantes
* Interactuar con las bases de datos
* Generar respuestas para el cliente

Los controllers funcionan como intermediarios entre:

* **Routes (rutas)**
* **Bases de datos (MySQL y MongoDB)**

## Estructura

```bash
controllers/
│── poblacion.controller.js        # Lógica híbrida (SQL + MongoDB)
│── poblar.controller.nosql.js     # Lógica exclusiva NoSQL
```

## Controllers disponibles

### poblacion.controller.js

**Encargado de:**

* Ejecutar Stored Procedures en MySQL
* Generar pacientes, servicios y citas
* Insertar datos en MongoDB (modo híbrido)
* Manejar parámetros de filtrado

 **Endpoint asociado:**

```http
POST /api/poblar-test
```

### poblar.controller.nosql.js

**Encargado de:**

* Generar documentos directamente en MongoDB
* Simular valoraciones clínicas
* Insertar datos en bloques (optimización de rendimiento)
* Manejar escenarios normales y críticos

**Endpoint asociado:**

```http
POST /api/poblar-nosql
```

### Autores

1. **Jose Francisco Flores Amador** /[@JFFA25](https://github.com/JFFA25)
2. **Edgar Cabrera Velázquez** /[@Edgar-Cbr](https://github.com/Edgar-Cbr)
3. **Edwin Hernández Campos** /[@Edwinhdzcm](https://github.com/Edwinhdzcm)
4. **Giovany Raul Pazos Cruz** /[@giova0412](https://github.com/giova0412)
5. **Uriel Maldonado Bernabe** /[@Urii7895](https://github.com/Urii7895)