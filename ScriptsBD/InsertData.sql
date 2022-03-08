use examenCmv
go

-- Insertar datos de prueba a clientes

insert into TBL_CMV_CLIENTE (nombre, apellido_paterno, apellido_materno, rfc, curp, fecha_alta) values
('Aron', 'Martinez', 'Martinez', 'asdfghjklo123', 'asdfghjkloqwert123', '2016-10-23 20:44:11.500' ),
('Nahomi', 'Garcia', 'Garcia', 'asdfghjklo124', 'asdfghjkloqwert124', '2016-10-23 20:44:11.500'),
('Jose', 'Martinez', 'Martinez', 'asdfghjklo123', 'asdfghjkloqwert123', '2016-10-23 20:44:11.500' ),
('Miguel', 'Garcia', 'Garcia', 'asdfghjklo124', 'asdfghjkloqwert124', '2016-10-23 20:44:11.500'),
('Francisca', 'Martinez', 'Martinez', 'asdfghjklo123', 'asdfghjkloqwert123', '2016-10-23 20:44:11.500' ),
('Sandra', 'Garcia', 'Garcia', 'asdfghjklo124', 'asdfghjkloqwert124', '2016-10-23 20:44:11.500'),
('Magdalena', 'Martinez', 'Martinez', 'asdfghjklo123', 'asdfghjkloqwert123', '2016-10-23 20:44:11.500' ),
('Jair', 'Garcia', 'Garcia', 'asdfghjklo124', 'asdfghjkloqwert124', '2016-10-23 20:44:11.500')

-- insertar nombres de cuentas

insert into CAT_CMV_TIPO_CUENTA (nombre_cuenta) values
('Ahorros'),
('Cheques'),
('Inversion'),
('Digital')


-- insertar relacion de cuenta y cliente

insert into TBL_CMV_CLIENTE_CUENTA (id_cliente, id_cuenta, saldo_actual, fecha_contratacion, fecha_ultimo_movimiento) values
(1, 4, '$123.45', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' ),
(2, 3, '$12345.67', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' ),
(3, 1, '$123.45', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' ),
(4, 2, '$12345.67', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' ),
(5, 2, '$123.45', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' ),
(6, 1, '$12345.67', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' ),
(7, 4, '$123.45', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' ),
(8, 3, '$12345.67', '2016-10-23 20:44:11.500', '2016-10-23 20:44:11.500' )
