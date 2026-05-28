# API Servicios Médicos SQL + NoSQL![Node.js](https://img.shields.io/badge/node.js-339933?style=for-the-badge&logo=Node.js&logoColor=white)![Express](https://img.shields.io/badge/express.js-000000?style=for-the-badge&logo=express&logoColor=white)![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)![MongoDB](https://img.shields.io/badge/mongodb-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)![Mongoose](https://img.shields.io/badge/mongoose-880000?style=for-the-badge&logo=mongoose&logoColor=white)![Swagger](https://img.shields.io/badge/swagger-85EA2D.svg?style=for-the-badge&logo=swagger&logoColor=black)![API REST](https://img.shields.io/badge/API-REST-blue?style=for-the-badge)

## Descripción

Esta API REST forma parte del sistema **Servicios Médicos Híbrido**, diseñado para generar datos de prueba en un entorno hospitalario mediante el uso combinado de:

- **MySQL (Base de datos relacional)**
- **MongoDB (Base de datos NoSQL)**

El sistema permite simular escenarios clínicos reales, generar grandes volúmenes de datos y evaluar el rendimiento de una arquitectura híbrida.

## Arquitectura del sistema

El sistema se divide en dos componentes principales:

- **SQL (MySQL)** → Manejo de pacientes, servicios médicos y citas  
- **NoSQL (MongoDB)** → Almacenamiento de valoraciones clínicas  

Esto permite combinar la integridad de datos estructurados con la flexibilidad de documentos dinámicos.

## Estructura del Proyecto

```bash
API/
│── controllers/      # Lógica de negocio (SQL y NoSQL)
│── routes/           # Definición de endpoints
│── db.js             # Conexión a MySQL y MongoDB
│── server.js         # Configuración principal del servidor
│── swagger.js        # Documentación Swagger
```

## Instalación y Ejecución

### Requisitos previos

Antes de iniciar la API, asegúrate de tener instalado:

- Node.js v18 o superior
- npm
- MySQL Server
- MongoDB Community Server

Verifica las versiones instaladas:

```bash
node -v
npm -v
mysql --version
mongod --version
```

### Clonar el repositorio

```bash
git clone https://github.com/JFFA25/API_ServiciosMedicos_SQL_NoSQL.git
cd API_ServiciosMedicos_SQL_NoSQL
```

### Instalar dependencias

Instala todas las dependencias definidas en el proyecto:

```bash
npm install
```

### Configurar variables de entorno

Crea un archivo `.env` en la raíz del proyecto utilizando como base el archivo `.env.example`.

Ejemplo:

```env

PORT=3000

MONGO_URI=mongodb://127.0.0.1:27017/your_database_name

MYSQL_HOST=localhost
MYSQL_USER=your_user
MYSQL_PASSWORD=your_password
MYSQL_DB=your_database_name
MYSQL_PORT=3306
```

### Configuración de bases de datos

#### MySQL

1. Inicia el servicio MySQL.
2. Crea la base de datos correspondiente:

```sql
CREATE DATABASE servicios_medicos;
```

3. Ejecuta los scripts SQL contenidos en la carpeta:

```text
database/
```

#### MongoDB

Inicia el servicio MongoDB y asegúrate de que la URI configurada en el archivo `.env` sea correcta.

## Levantar la API

### Modo desarrollo

Ejecuta la API con recarga automática mediante Nodemon:

```bash
npm run dev
```

### Modo producción

Ejecuta la API con Node.js:

```bash
npm start
```

### Verificación

Si la configuración es correcta, el servidor iniciará y mostrará mensajes similares a:

```bash
Servidor iniciado correctamente
Conectado a MySQL
Conectado a MongoDB
```

La API estará disponible en:

```text
http://localhost:3000
```

### Documentación Swagger

La documentación interactiva puede consultarse desde:

```text
http://localhost:3000/api/docs
```

Desde Swagger UI es posible visualizar y probar todos los endpoints disponibles.
## Tecnologías utilizadas

| Componente        | Tecnología / Herramienta |
|------------------|--------------------------|
| Backend          | Node.js + Express ![Node.js](https://img.shields.io/badge/node.js-339933.svg?style=for-the-badge&logo=node.js&logoColor=white) ![Express](https://img.shields.io/badge/express.js-000000.svg?style=for-the-badge&logo=express&logoColor=white) |
| Base de Datos SQL | MySQL (mysql2) ![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white) |
| Base de Datos NoSQL | MongoDB + Mongoose ![MongoDB](https://img.shields.io/badge/mongodb-47A248.svg?style=for-the-badge&logo=mongodb&logoColor=white) ![Mongoose](https://img.shields.io/badge/mongoose-880000.svg?style=for-the-badge) |
| Documentación    | Swagger (OpenAPI) ![Swagger](https://img.shields.io/badge/swagger-85EA2D.svg?style=for-the-badge&logo=swagger&logoColor=black) |
