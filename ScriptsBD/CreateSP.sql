CREATE PROC SP_insertar_cliente
(
@nombre varchar(30),
@apellido_paterno varchar(30),
@apellido_materno varchar(30),
@rfc varchar(13),
@curp varchar(18),
@fecha_alta datetime
)

AS
BEGIN

INSERT INTO TBL_CMV_CLIENTE (nombre, apellido_paterno, apellido_materno, rfc, curp, fecha_alta) 
VALUES (@nombre, @apellido_paterno, @apellido_materno, @rfc, @curp, @fecha_alta)
END



CREATE PROC SP_consultar_clientes

AS
BEGIN

SELECT * FROM TBL_CMV_CLIENTE

END



CREATE PROC SP_actualizar_info_cliente
(
@nombre varchar(30),
@apellido_paterno varchar(30),
@apellido_materno varchar(30),
@rfc varchar(13),
@curp varchar(18), 
@fecha_ultimo_movimiento datetime,
@id_cliente int
)

AS
BEGIN

UPDATE TBL_CMV_CLIENTE
SET nombre = @nombre, apellido_paterno = @apellido_paterno, apellido_materno = @apellido_materno,
rfc = @rfc, curp = @curp
WHERE id_cliente = @id_cliente
UPDATE TBL_CMV_CLIENTE_CUENTA
SET fecha_ultimo_movimiento = @fecha_ultimo_movimiento
WHERE  id_cliente = @id_cliente

END



CREATE PROC SP_eliminar_cliente
(
@id_cliente int
)

AS
BEGIN

DELETE FROM TBL_CMV_CLIENTE WHERE id_cliente = @id_cliente

END




CREATE PROC SP_consultar_cuenta_cliente
(
@id_cliente int
)

AS
BEGIN

SELECT nombre, apellido_paterno, apellido_materno, rfc, curp, nombre_cuenta FROM TBL_CMV_CLIENTE
INNER JOIN TBL_CMV_CLIENTE_CUENTA ON TBL_CMV_CLIENTE.id_cliente = TBL_CMV_CLIENTE_CUENTA.id_cliente
INNER JOIN CAT_CMV_TIPO_CUENTA ON CAT_CMV_TIPO_CUENTA.id_cuenta = TBL_CMV_CLIENTE_CUENTA.id_cuenta
WHERE TBL_CMV_CLIENTE.id_cliente = @id_cliente

END
