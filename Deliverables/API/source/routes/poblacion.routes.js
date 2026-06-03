import express from "express";
import { crearPoblacion } from "../controllers/poblacion.controller.js";

const router = express.Router();

/**
 * @swagger
 * /poblar-test:
 *   post:
 *     summary: Generar datos híbridos
 *     tags: [Población SQL]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               cantidad:
 *                 type: integer
 *                 example: 10
 *               genero:
 *                 type: string
 *                 example: "H"
 *               estado_vida:
 *                 type: string
 *                 example: "Vivo"
 *               prioridad:
 *                 type: string
 *                 example: "Alta"
 *               tipo_servicio:
 *                 type: string
 *                 example: "Urgencia"
 *               edad_min:
 *                 type: integer
 *                 example: 20
 *               edad_max:
 *                 type: integer
 *                 example: 60
 *               con_alergias:
 *                 type: boolean
 *                 example: true
 *               es_grave:
 *                 type: boolean
 *                 example: false
 *               test_sql:
 *                 type: boolean
 *                 example: true
 *               test_nosql:
 *                 type: boolean
 *                 example: true
 *     responses:
 *       200:
 *         description: Datos generados correctamente
 */
router.post("/poblar-test", crearPoblacion);

export default router;