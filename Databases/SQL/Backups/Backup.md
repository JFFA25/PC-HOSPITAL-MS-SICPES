# SQL – Base de Datos Relacional

![MySQL](https://img.shields.io/badge/mysql-4479A1?style=for-the-badge\&logo=mysql\&logoColor=white)
![SQL](https://img.shields.io/badge/sql-database-orange?style=for-the-badge)
![Relational](https://img.shields.io/badge/database-relational-blue?style=for-the-badge)

## Descripción

Esta carpeta contiene todos los recursos relacionados con la **base de datos relacional (MySQL)** del sistema.

Su función principal es:

* Gestionar datos estructurados
* Mantener relaciones entre entidades
* Ejecutar lógica mediante Stored Procedures
* Proporcionar respaldos del sistema

## Estructura

```bash id="sql1"
SQL/
│── backups/     # Respaldos (.sql)
│── routines/    # Stored Procedures
│── structure/   # Estructura de la base de datos
```

## Importación de Respaldos

Los respaldos de la base de datos se encuentran en la carpeta:

```bash
SQL/
└── backups/
    ├── backup_estructura.sql
```

### Opción 1: Importar desde MySQL Workbench

1. Abrir **MySQL Workbench**.
2. Conectarse al servidor MySQL.
3. Crear una base de datos vacía:

```sql
CREATE DATABASE servicios_medicos;
USE servicios_medicos;
```

4. Ir a **Server → Data Import**.
5. Seleccionar **Import from Self-Contained File**.
6. Importar primero:

```text
backup_estructura.sql
```

7. Ejecutar la importación.
8. Repetir el proceso con:

```text
backup_poblacion.sql
```

9. Verificar que las tablas y registros hayan sido creados correctamente.

### Opción 2: Importar desde la terminal

Crear la base de datos:

```sql
CREATE DATABASE servicios_medicos;
```

Importar la estructura:

```bash
mysql -u root -p servicios_medicos < backups/backup_estructura.sql
```

Importar los datos:

```bash
mysql -u root -p servicios_medicos < backups/backup_poblacion.sql
```

### Orden recomendado

1. Importar `backup_estructura.sql`
2. Importar `backup_poblacion.sql`
3. Ejecutar los Stored Procedures ubicados en `routines/` (si aplica)

### Verificación

Comprobar que las tablas fueron creadas correctamente:

```sql
SHOW TABLES;
```

Consultar algunos registros:

```sql
SELECT * FROM nombre_tabla LIMIT 10;
```

## Resultado esperado

Una vez importados ambos respaldos, la base de datos quedará completamente configurada con su estructura, relaciones y datos iniciales necesarios para el funcionamiento de la API.

## Componentes

### backups/

* Archivos `.sql` con estructura y datos
* Permiten restaurar la base de datos
* Incluyen scripts de población

### routines/

* Stored Procedures
* Automatización de procesos
* Generación de datos

### structure/

* Representación de la base de datos
* Diagramas o capturas (`.png`)
* Definición de tablas y relaciones

## Tecnologías utilizadas

| Componente    | Tecnología                                                                                                     |
| ------------- | -------------------------------------------------------------------------------------------------------------- |
| Base de datos | MySQL ![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge\&logo=mysql\&logoColor=white) |
| Lenguaje      | SQL ![SQL](https://img.shields.io/badge/sql-database-orange?style=for-the-badge)                               |
| Arquitectura  | Relacional ![Relational](https://img.shields.io/badge/relational-model-blue?style=for-the-badge)               |

## Objetivo

* Garantizar integridad de los datos
* Manejar relaciones complejas
* Optimizar consultas mediante procedimientos
* Servir como base estructurada del sistema

## Notas

* Se recomienda ejecutar primero la estructura antes de la población
* Las rutinas optimizan el rendimiento del sistema
* MySQL actúa como base principal del modelo híbrido
