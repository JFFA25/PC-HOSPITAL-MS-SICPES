# Routes – Definición de Endpoints

![Node.js](https://img.shields.io/badge/node.js-339933?style=for-the-badge\&logo=Node.js\&logoColor=white)
![Express](https://img.shields.io/badge/express.js-000000?style=for-the-badge\&logo=express\&logoColor=white)

## Descripción

Esta carpeta contiene la **definición de las rutas de la API**, encargadas de:

* Recibir las solicitudes HTTP del cliente
* Definir los endpoints disponibles
* Redirigir cada petición hacia su controller correspondiente

Las rutas son el punto de entrada de la API y trabajan en conjunto con:

* **Controllers (lógica de negocio)**
* **Cliente (frontend o herramientas como Postman)**

## Estructura

```bash
routes/
│── poblacion.routes.js        # Rutas para población híbrida (SQL + MongoDB)
│── poblar.nosql.routes.js     # Rutas exclusivas para MongoDB
```

## Rutas disponibles

### poblacion.routes.js

**Encargado de:**

* Definir endpoints para generación de datos híbridos
* Conectar con `poblacion.controller.js`
* Manejar solicitudes relacionadas con MySQL + MongoDB

 **Endpoint principal:**

```http
POST /api/poblar-test
```

### poblar.nosql.routes.js

**Encargado de:**

* Definir endpoints para generación de datos en MongoDB
* Conectar con `poblar.controller.nosql.js`
* Manejar solicitudes NoSQL

**Endpoint principal:**

```http
POST /api/poblar-nosql
```

## Flujo de funcionamiento

```text
Cliente → Routes → Controllers → Base de Datos → Respuesta
```

## Notas

* Cada archivo de rutas está separado por tipo de base de datos
* Se mantiene una arquitectura modular y escalable
* Las rutas utilizan **Express Router** para organizar los endpoints

### Autores

1. **Jose Francisco Flores Amador** /[@JFFA25](https://github.com/JFFA25)
2. **Edgar Cabrera Velázquez** /[@Edgar-Cbr](https://github.com/Edgar-Cbr)
3. **Edwin Hernández Campos** /[@Edwinhdzcm](https://github.com/Edwinhdzcm)
4. **Giovany Raul Pazos Cruz** /[@giova0412](https://github.com/giova0412)
5. **Uriel Maldonado Bernabe** /[@Urii7895](https://github.com/Urii7895)