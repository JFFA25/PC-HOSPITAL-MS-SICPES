import express from "express";
import { poblarNoSQL } from "../controllers/poblar.controller.nosql.js";

const router = express.Router();

/**
 * @swagger
 * /poblar-nosql:
 *   post:
 *     summary: Generar datos únicamente en MongoDB
 *     tags: [Población NoSQL]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               cantidad:
 *                 type: integer
 *                 example: 1000
 *               es_grave:
 *                 type: boolean
 *                 example: true
 *     responses:
 *       200:
 *         description: Datos generados correctamente en MongoDB
 */
router.post("/poblar-nosql", poblarNoSQL);

export default router;