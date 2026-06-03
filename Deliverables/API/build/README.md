# build

![Build](https://img.shields.io/badge/Build-FFA500?style=for-the-badge&logo=webpack&logoColor=white) ![API](https://img.shields.io/badge/API-008080?style=for-the-badge&logo=node.js&logoColor=white)

Esta carpeta se encuentra en `Deliverables/API/build` y contiene la versión compilada o lista para producción del backend de la API. Aquí se almacenan los archivos generados después del proceso de construcción (build), optimizados para su despliegue en entornos reales.

## Estructura de carpetas actual

>|- Databases <br>
>|- DataModels <br>
>|- **Deliverables** <br>
>&nbsp;&nbsp;|- API <br>
>&nbsp;&nbsp;&nbsp;&nbsp;|- **build** <br>
>&nbsp;&nbsp;&nbsp;&nbsp;|- DeployManual <br>
>&nbsp;&nbsp;&nbsp;&nbsp;|- source <br>
>|- Docs <br>

> Usa este README como guía rápida para identificar el propósito de esta carpeta dentro del módulo API.

## Manual rápido para ejecutar la API

1. Desde la raíz del proyecto, copia el archivo de ejemplo de variables de entorno:

```powershell
copy .env.example .env
```

2. Instala dependencias en la raíz del proyecto:

```powershell
npm install
```

3. Si deseas ejecutar en modo desarrollo, usa:

```powershell
npm run dev
```

4. Para iniciar la API en modo producción, usa:

```powershell
npm start
```

5. Abre el navegador en:

```text
http://localhost:3000
```

> Si el contenido de `Deliverables/API/build` ya contiene archivos listos para producción, puedes ejecutar el servidor desde esa carpeta con `node server.js`.

## Tabla de Observaciones

| Desarrollador | Rol | Observaciones |
| :--- | :--- | :--- |
| **Jose Francisco Flores Amador** | Líder de Proyecto / Fullstack / Documentación | 🟢 Aprobado |
| **Edgar Cabrera Velázquez** | Backend / Lógica del sistema | 🟢 Aprobado |
| **Edwin Hernández Campos** | Base de datos / Estructura | 🟢 Aprobado |
| **Giovany Raul Pazos Cruz** | Frontend / Interfaz | 🟢 Aprobado |