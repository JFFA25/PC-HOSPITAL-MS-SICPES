# Backups SQL – MySQL

![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge\&logo=mysql\&logoColor=white)
![Backup](https://img.shields.io/badge/backup-database-blue?style=for-the-badge)
![SQL](https://img.shields.io/badge/sql-scripts-orange?style=for-the-badge)

## Descripción

Esta carpeta contiene los **respaldos (backups) de la base de datos relacional (MySQL)** utilizados en el sistema de servicios médicos.

Su propósito es:

* Almacenar la estructura y datos de la base de datos
* Facilitar la restauración del sistema
* Permitir pruebas controladas
* Analizar el comportamiento del sistema

## Estructura

```bash id="sqlbk1"
database/
└── SQL/
    └── backups/
        │── backup_estructura.sql
        │── backup_poblacion.sql
```

## Archivos disponibles

### backup_estructura.sql

* Contiene la **estructura de la base de datos**
* Incluye creación de tablas, relaciones y restricciones
* No contiene datos (solo esquema)

### backup_poblacion.sql

* Contiene la **inserción de datos (población)**
* Incluye registros de prueba para el sistema
* Permite simular escenarios reales

## Tecnologías utilizadas

| Componente         | Tecnología                                                                                                     |
| ------------------ | -------------------------------------------------------------------------------------------------------------- |
| Base de datos      | MySQL ![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge\&logo=mysql\&logoColor=white) |
| Lenguaje           | SQL ![SQL](https://img.shields.io/badge/sql-database-orange?style=for-the-badge)                               |
| Gestión de backups | Scripts `.sql` ![Backup](https://img.shields.io/badge/backup-scripts-blue?style=for-the-badge)                 |

## Uso de los backups

Estos archivos pueden utilizarse para:

* Restaurar la base de datos completa
* Crear la estructura desde cero
* Insertar datos de prueba
* Ejecutar pruebas de rendimiento

## Ejemplo de restauración

```sql id="sqlbk2"
-- Crear base de datos
CREATE DATABASE hospital;

-- Usar base de datos
USE hospital;

-- Importar estructura
SOURCE backup_estructura.sql;


## Notas

* Se recomienda ejecutar primero el archivo de **estructura**
* Posteriormente ejecutar el archivo de **población**
* Los scripts son compatibles con MySQL
* Pueden ejecutarse desde consola o herramientas como MySQL Workbench
