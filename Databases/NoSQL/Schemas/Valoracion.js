import mongoose from "mongoose";

const valoracionSchema = new mongoose.Schema({
  servicio_medico_id: { type: Number, required: true }, // ID de MySQL
  cita_id: { type: Number, required: true },           // ID de MySQL
  medico_id: { type: Number, required: true },
  fecha_valoracion: { type: Date, required: true },
  sintomas: [String],
  estudios_solicitados: [{
    estudio: { type: String, required: true },
    prioridad: { type: String, enum: ["baja", "media", "alta"], required: true },
    fecha_solicitud: { type: Date, default: Date.now }
  }],
  diagnostico_preliminar: { type: String, required: true },
  observaciones: String,
  auditoria: {
    creado_en: { type: Date, default: Date.now },
    actualizado_en: Date
  }
});

// El tercer parámetro "valoraciones" fuerza el nombre de la colección en Mongo
export default mongoose.model("Valoracion", valoracionSchema, "valoraciones");