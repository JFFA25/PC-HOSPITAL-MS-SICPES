# Routines – Stored Procedures

![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge\&logo=mysql\&logoColor=white)
![SQL](https://img.shields.io/badge/sql-stored_procedures-orange?style=for-the-badge)
![Automation](https://img.shields.io/badge/automation-database-blue?style=for-the-badge)

## Descripción

Esta carpeta contiene las **rutinas almacenadas (Stored Procedures)** utilizadas en la base de datos MySQL.

Su propósito es:

* Automatizar procesos dentro de la base de datos
* Optimizar la generación de datos
* Centralizar la lógica SQL
* Facilitar pruebas y simulaciones

## Estructura

```bash id="rt1"
database/
└── SQL/
    └── routines/
        │── sp_limpiar_tablas.sql
        │── sp_poblar_servicios.sql
```
## Stored Procedures disponibles

### sp_limpiar_tablas.sql

**Encargado de:**

* Eliminar datos existentes en las tablas
* Reiniciar el estado de la base de datos
* Preparar el entorno para nuevas pruebas

### sp_poblar_servicios.sql

**Encargado de:**

* Insertar datos de prueba en la base de datos
* Generar servicios médicos automáticamente
* Simular escenarios reales del sistema

## Tecnologías utilizadas

| Componente    | Tecnología                                                                                                     |
| ------------- | -------------------------------------------------------------------------------------------------------------- |
| Base de datos | MySQL ![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge\&logo=mysql\&logoColor=white) |
| Lenguaje      | SQL ![SQL](https://img.shields.io/badge/sql-database-orange?style=for-the-badge)                               |
| Funcionalidad | Stored Procedures ![SP](https://img.shields.io/badge/stored_procedures-logic-blue?style=for-the-badge)         |


## Uso de las rutinas

Estas rutinas pueden utilizarse para:

* Limpiar la base de datos antes de pruebas
* Generar datos automáticamente
* Ejecutar procesos repetitivos
* Mejorar el rendimiento al manejar lógica en el servidor

## Ejemplo de ejecución

```sql id="rt2"
-- Ejecutar procedimiento para limpiar tablas
CALL sp_limpiar_tablas();

-- Ejecutar procedimiento para poblar servicios
CALL sp_poblar_servicios();
```

## Notas

* Las rutinas deben ejecutarse dentro de la base de datos correspondiente
* Se recomienda ejecutar primero `sp_limpiar_tablas` antes de poblar
* Mejoran el rendimiento al evitar lógica en la aplicación
* Son reutilizables y fáciles de mantener

### Autores

1. **Jose Francisco Flores Amador** /[@JFFA25](https://github.com/JFFA25)
2. **Edgar Cabrera Velázquez** /[@Edgar-Cbr](https://github.com/Edgar-Cbr)
3. **Edwin Hernández Campos** /[@Edwinhdzcm](https://github.com/Edwinhdzcm)
4. **Giovany Raul Pazos Cruz** /[@giova0412](https://github.com/giova0412)
5. **Uriel Maldonado Bernabe** /[@Urii7895](https://github.com/Urii7895)