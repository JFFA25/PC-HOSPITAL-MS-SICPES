CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_limpiar_tablas`()
BEGIN

    SET FOREIGN_KEY_CHECKS = 0;

    TRUNCATE TABLE tbd_valoraciones;
    TRUNCATE TABLE tbd_citas_medicas;
    TRUNCATE TABLE tbc_servicios_medicos;
    TRUNCATE TABLE tbb_pacientes;

    SET FOREIGN_KEY_CHECKS = 1;

END