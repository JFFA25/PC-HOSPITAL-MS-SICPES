import swaggerUi from "swagger-ui-express";
import swaggerJsdoc from "swagger-jsdoc";

const options = {
  definition: {
    openapi: "3.0.0",
    info: { title: "API Hospital Híbrida", version: "1.0.0" },
    servers: [
      {
        url: "http://localhost:3000/api"
      }
    ]
  },
  // Ajustar rutas para que apunten desde la raíz del proyecto
  apis: ["./Deliverables/API/server.js", "./Deliverables/API/routes/*.js"]
};

const swaggerSpec = swaggerJsdoc(options);

export const setupSwagger = (app) => {
  app.use("/api/docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));
};