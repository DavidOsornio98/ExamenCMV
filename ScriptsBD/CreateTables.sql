--  Creacion de la bd
 
 IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'examenCmv')
  BEGIN
    CREATE DATABASE [examenCmv]


    END
    GO
       USE [examenCmv]
    GO


-- Se verifica que no haya una tabla creada para clientes, de lo contrario  se crea 

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='examenCmv.dbo.TBL_CMV_CLIENTE' and xtype='U')
BEGIN

CREATE TABLE examenCmv.dbo.TBL_CMV_CLIENTE(
	id_cliente  int IDENTITY(1,1) constraint PK_TBL_CMV_CLIENTE primary key clustered not null, -- llave primaria,
	nombre varchar(30) NULL,
	apellido_paterno varchar(30) NOT NULL,
	apellido_materno varchar(30) NOT NULL,
    rfc varchar(13) NOT NULL,
    curp varchar(18) NOT NULL,
    fecha_alta datetime
)
END


-- Se verifica que no haya una tabla creada para tipos de cuenta de lo contrario se crea


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='examenCmv.dbo.CAT_CMV_TIPO_CUENTA' and xtype='U')
BEGIN

CREATE TABLE examenCmv.dbo.CAT_CMV_TIPO_CUENTA(
	id_cuenta int IDENTITY(1,1) constraint PK_CAT_CMV_TIPO_CUENTA primary key clustered not null, -- llave primaria,
	nombre_cuenta varchar(50) NOT NULL ,
)

END

-- Se verifica que no haya una tabla creada para cliente cuenta, de lo contrario se crea


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='examenCmv.dbo.TBL_CMV_CLIENTE_CUENTA' and xtype='U')
BEGIN

CREATE TABLE examenCmv.dbo.TBL_CMV_CLIENTE_CUENTA(
	id_cliente_cuenta  int IDENTITY(1,1) constraint PK_TBL_CMV_CLIENTE_CUENTA primary key clustered not null, -- llave primaria,
	id_cliente int NOT NULL ,
    id_cuenta int NOT NULL,
    saldo_actual money NOT NULL,
    fecha_contratacion datetime NOT NULL,
    fecha_ultimo_movimiento datetime NOT NULL,
    CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente)
    REFERENCES TBL_CMV_CLIENTE (id_cliente)
    ON UPDATE cascade
    ON DELETE cascade,
    CONSTRAINT FK_id_cuenta FOREIGN KEY (id_cuenta)
    REFERENCES CAT_CMV_TIPO_CUENTA (id_cuenta)
    ON UPDATE cascade
    ON DELETE cascade,
)

END