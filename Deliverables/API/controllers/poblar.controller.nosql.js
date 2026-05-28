import Valoracion from "../../database/NoSQL/models/Valoracion.js";

export const poblarNoSQL = async (req, res) => {
  const { cantidad, es_grave = false } = req.body;

  try {
    const documentos = Array.from({ length: cantidad }).map(() => ({
      servicio_medico_id: Math.floor(Math.random() * 100000) + 1,
      cita_id: Math.floor(Math.random() * 100000) + 1,
      medico_id: Math.floor(Math.random() * 20) + 1,
      fecha_valoracion: new Date(),

      sintomas: es_grave
        ? ["Fiebre alta", "Dolor intenso", "Dificultad respiratoria"]
        : ["Chequeo general"],

      estudios_solicitados: es_grave
        ? [
            {
              estudio: "Tomografía",
              prioridad: "alta",
              fecha_solicitud: new Date()
            },
            {
              estudio: "Rayos X",
              prioridad: "media",
              fecha_solicitud: new Date()
            }
          ]
        : [
            {
              estudio: "Análisis de sangre",
              prioridad: "baja",
              fecha_solicitud: new Date()
            }
          ],

      diagnostico_preliminar: es_grave
        ? "Paciente en estado crítico"
        : "Evaluación general",

      observaciones: "Generado automáticamente para pruebas",

      auditoria: {
        creado_en: new Date()
      }
    }));

    const chunkSize = 1000;
    let totalInsertados = 0;

    for (let i = 0; i < documentos.length; i += chunkSize) {
      const chunk = documentos.slice(i, i + chunkSize);
      await Valoracion.insertMany(chunk);
      totalInsertados += chunk.length;
    }

    res.json({
      exito: true,
      mensaje: "Datos generados en MongoDB correctamente",
      total_insertados: totalInsertados,
      modo: es_grave ? "Crítico" : "Normal"
    });

  } catch (error) {
    res.status(500).json({
      error: error.message
    });
  }
};