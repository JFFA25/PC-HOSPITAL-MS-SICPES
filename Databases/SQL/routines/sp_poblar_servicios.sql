CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblacion`(
  IN p_cantidad INT,
  IN p_genero VARCHAR(10),
  IN p_estado_vida VARCHAR(20),
  IN p_prioridad VARCHAR(20),
  IN p_tipo_servicio VARCHAR(50),
  IN p_edad_min INT,
  IN p_edad_max INT,
  IN p_con_alergias BOOLEAN
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_paciente_id, v_servicio_id, v_cita_id INT;
    DECLARE v_genero, v_nombre, v_ap1, v_ap2 VARCHAR(60);
    DECLARE v_fecha_nac DATE;
    DECLARE v_estado_vida, v_status_medico, v_tipo_servicio, v_prioridad VARCHAR(50);
    DECLARE v_rand DECIMAL(5,4);
    DECLARE v_grupo_sang VARCHAR(10);
    DECLARE v_alergias TEXT;
    DECLARE v_edad INT; --  NUEVO

    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_inserted_citas (
        servicio_medico_id INT,
        cita_id INT,
        fecha_valoracion DATETIME,
        diagnostico_preliminar TEXT
    );

    TRUNCATE TABLE tmp_inserted_citas;

    START TRANSACTION;

    WHILE i < p_cantidad DO

        SET v_rand = RAND();

        -- GENERO
        SET v_genero = IF(p_genero IS NOT NULL,
            p_genero,
            ELT(FLOOR(1 + RAND()*3),'H','F','N/B')
        );

        -- NOMBRE
        SET v_nombre = IF(v_genero = 'H', 
            ELT(FLOOR(1 + RAND()*5), 'Juan','Luis','Carlos','Miguel','Jorge'),
            ELT(FLOOR(1 + RAND()*5), 'María','Ana','Sofía','Valeria','Daniela')
        );

        SET v_ap1 = ELT(FLOOR(1 + RAND()*5), 'Hernández','García','Martínez','López','Pérez');
        SET v_ap2 = ELT(FLOOR(1 + RAND()*5), 'Torres','Vargas','Castillo','Ruiz','Mendoza');

        -- EDAD CONTROLADA
        SET v_fecha_nac = DATE_SUB(
            CURDATE(),
            INTERVAL FLOOR(
                IF(p_edad_min IS NOT NULL AND p_edad_max IS NOT NULL,
                    p_edad_min + RAND() * (p_edad_max - p_edad_min),
                    18 + RAND()*60
                )
            ) YEAR
        );

        --  CALCULAR EDAD REAL
        SET v_edad = TIMESTAMPDIFF(YEAR, v_fecha_nac, CURDATE());

        -- SANGRE
        SET v_grupo_sang = ELT(FLOOR(1 + RAND()*8), 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-');

        -- ALERGIAS
        SET v_alergias = IF(p_con_alergias IS NOT NULL,
            IF(p_con_alergias = TRUE,
                ELT(FLOOR(1 + RAND()*4), 'Penicilina', 'Polen', 'Aspirina', 'Lactosa'),
                'Ninguna'
            ),
            ELT(FLOOR(1 + RAND()*5), 'Ninguna', 'Penicilina', 'Polen', 'Aspirina', 'Lactosa')
        );

        -- ESTADO DE VIDA
        SET v_estado_vida = IF(p_estado_vida IS NOT NULL,
            p_estado_vida,
            CASE 
                WHEN v_rand <= 0.25 THEN 'Vivo'
                WHEN v_rand <= 0.50 THEN 'Coma'
                WHEN v_rand <= 0.75 THEN 'Vegetativo'
                WHEN v_rand <= 0.90 THEN 'Finado'
                ELSE 'Desconocido'
            END
        );

        -- STATUS MEDICO
        SET v_status_medico = CASE v_estado_vida 
            WHEN 'Coma' THEN 'Terapia Intensiva' 
            WHEN 'Vegetativo' THEN 'Observacion'
            WHEN 'Finado' THEN 'Cuidados Paliativos'
            WHEN 'Desconocido' THEN 'Estable'
            ELSE ELT(FLOOR(1 + RAND()*2), 'Estable', 'Recuperacion') 
        END;

        -- INSERT PACIENTE CORREGIDO
        INSERT INTO tbb_pacientes (
            Nombre, Apellido_Paterno, Apellido_Materno, Genero,
            Fecha_Nacimiento, Tipo_Sangre, Estado_Vida,
            Estatus_Medico, Alergias, Fecha_Registro, Activo,
            Edad_Min, Edad_Max, Edad
        )
        VALUES (
            v_nombre, v_ap1, v_ap2, v_genero,
            v_fecha_nac, v_grupo_sang, v_estado_vida,
            v_status_medico, v_alergias, NOW(), 1,
            p_edad_min, p_edad_max, v_edad
        );

        SET v_paciente_id = LAST_INSERT_ID();

        -- SOLO SI ESTA VIVO
        IF v_estado_vida NOT IN ('Finado', 'Desconocido') THEN

            SET v_tipo_servicio = IF(p_tipo_servicio IS NOT NULL,
                p_tipo_servicio,
                ELT(FLOOR(1 + RAND()*5),
                    'Consulta','Urgencia','Hospitalizacion','Laboratorio','Rehabilitacion')
            );

            SET v_prioridad = IF(p_prioridad IS NOT NULL,
                p_prioridad,
                ELT(FLOOR(1 + RAND()*3), 'Baja', 'Media', 'Alta')
            );

            INSERT INTO tbc_servicios_medicos (
                Tipo_Servicio, Estado_Servicio, Prioridad, Fecha_Inicio, Paciente_ID
            )
            VALUES (
                v_tipo_servicio, 'Activo', v_prioridad, NOW(), v_paciente_id
            );

            SET v_servicio_id = LAST_INSERT_ID();

            INSERT INTO tbd_citas_medicas (
                Especialidad, Consultorio, Tipo_Cita,
                Prioridad, Estado_Cita, Fecha_Cita, Servicio_Medico_ID
            )
            VALUES (
                'Medicina General',
                CONCAT('Consultorio ', FLOOR(1+RAND()*20)),
                'Consulta',
                v_prioridad,
                'Atendida',
                NOW(),
                v_servicio_id
            );

            SET v_cita_id = LAST_INSERT_ID();

            INSERT INTO tbd_valoraciones (
                Cita_ID, Diagnostico, Temperatura, Fecha_Valoracion
            )
            VALUES (
                v_cita_id,
                'Evaluacion general',
                ROUND(36 + RAND()*2, 1),
                NOW()
            );

            INSERT INTO tmp_inserted_citas (
                servicio_medico_id,
                cita_id,
                fecha_valoracion,
                diagnostico_preliminar
            )
            VALUES (
                v_servicio_id,
                v_cita_id,
                NOW(),
                'Evaluacion general'
            );

        END IF;

        SET i = i + 1;

    END WHILE;

    COMMIT;

    SELECT * FROM tmp_inserted_citas;

    DROP TEMPORARY TABLE IF EXISTS tmp_inserted_citas;

END