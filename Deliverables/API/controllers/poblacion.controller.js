import { pool } from "../db.js";
import Valoracion from "../../database/NoSQL/models/Valoracion.js";

export const crearPoblacion = async (req, res) => {
  const { 
    cantidad, 
    es_grave = false, 
    test_sql = true, 
    test_nosql = true,
    genero = null,
    estado_vida = null,
    prioridad = null,
    tipo_servicio = null,
    edad_min = null,
    edad_max = null,
    con_alergias = null

  } = req.body;

  try {
    let datosSQL = [];
    let pacientesCreados = 0;

    // VALIDACIÓN BÁSICA
    if (!cantidad || isNaN(cantidad) || cantidad <= 0) {
      return res.status(400).json({
        error: "La cantidad debe ser un número mayor a 0"
      });
    }

    // NORMALIZAR (MUY IMPORTANTE)
    const params = [
      parseInt(cantidad),
      genero || null,
      estado_vida || null,
      prioridad || null,
      tipo_servicio || null,
      edad_min || null,
      edad_max || null,
      (con_alergias === true || con_alergias === false) ? con_alergias : null
    ];

    // MYSQL
    if (test_sql) {
      const [result] = await pool.query(
        "CALL sp_poblacion(?, ?, ?, ?, ?, ?, ?, ?)",
        params
      );

      datosSQL = result[0] || [];
      pacientesCreados = datosSQL.length;
    } 
    // SOLO NOSQL (mock)
    else if (test_nosql) {
      datosSQL = Array.from({ length: cantidad }).map(() => ({
        servicio_medico_id: Math.floor(Math.random() * 100000) + 1,
        cita_id: Math.floor(Math.random() * 100000) + 1,
        fecha_valoracion: new Date(),
        diagnostico_preliminar: `Generado para test NoSQL`,
      }));
    }

    // 2️MONGO
    let documentosInsertados = 0;

    if (test_nosql && datosSQL.length > 0) {
      const documentos = datosSQL.map(dato => ({
        servicio_medico_id: dato.servicio_medico_id,
        cita_id: dato.cita_id,
        medico_id: Math.floor(Math.random() * 10) + 1,
        fecha_valoracion: new Date(dato.fecha_valoracion),
        diagnostico_preliminar: dato.diagnostico_preliminar,

        sintomas: es_grave 
          ? ["Fiebre alta", "Dificultad respiratoria"] 
          : ["Chequeo general"],

        estudios_solicitados: [{
          estudio: es_grave ? "Tomografía" : "Análisis de sangre",
          prioridad: es_grave ? "alta" : "baja",
          fecha_solicitud: new Date()
        }],

        observaciones: "Generado automáticamente",

        auditoria: { 
          creado_en: new Date() 
        }
      }));

      await Valoracion.insertMany(documentos);
      documentosInsertados = documentos.length;
    }

    // RESPUESTA MEJORADA
    res.json({
      exito: true,
      mensaje: "¡Prueba de inserción completada!",
      filtros_usados: {
        cantidad,
        genero,
        estado_vida,
        prioridad,
        tipo_servicio,
        edad_min,
        edad_max,
        con_alergias
      },
      detalles: {
        pacientes_creados_sql: pacientesCreados,
        citas_valoraciones_nosql: documentosInsertados,
        modo: es_grave ? "Emergencia (Grave)" : "Rutina (Normal)"
      }
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
};