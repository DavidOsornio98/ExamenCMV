use examenCmv
go


insert into TBL_CMV_CLIENTE (nombre, apellido_paterno, apellido_materno, rfc, curp, fecha_alta) values
('Aron', 'Martinez', 'Martinez', 'asdfghjklo123', 'asdfghjkloqwert123', '2016-10-23 20:44:11.500' ),
('Miguel', 'Garcia', 'Garcia', 'asdfghjklo124', 'asdfghjkloqwert124', '2016-10-23 20:44:11.500')


insert into CAT_CMV_TIPO_CUENTA (nombre_cuenta) values
('Ahorros'),
('Cheques'),
('Inversion'),
('Digital')


insert into TBL_CMV_CLIENTE_CUENTA (id_cliente, id_cuenta, saldo_actual, fecha_contratacion, fecha_ultimo_movimiento) values
(1, 4, '$123.45', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' ),
(2, 3, '$12345.67', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' )
