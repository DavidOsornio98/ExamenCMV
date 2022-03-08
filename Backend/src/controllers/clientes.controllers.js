import { getConnection, sql } from '../database/connection'

export const getClients = async (req, res) => {
    const query = 'exec SP_consultar_clientes'
    try {
        const pool = await getConnection()
        const clientes = await pool
        .request()
        .query(query)
        console.log(clientes);
        res.json(clientes.recordset)
    } catch (error) {
        console.log(error);
    }

}

export const newClient = async (req, res) => {
    let today = new Date();
    let date =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
    let time =
    today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    let dateTime = date + " " + time;
    const query = 'exec SP_insertar_cliente @nombre, @apellido_paterno, @apellido_materno, @rfc, @curp, @fecha_alta'
    try {
        const { nombre, apellido_paterno, apellido_materno, rfc, curp } = req.body
        const pool = await getConnection()
        const nuevoCliente = await pool
        .request()
        .input('nombre', sql.VarChar, nombre)
        .input('apellido_paterno', sql.VarChar, apellido_paterno)
        .input('apellido_materno', sql.VarChar, apellido_materno)
        .input('rfc', sql.VarChar, rfc)
        .input('curp', sql.VarChar, curp)
        .input('fecha_alta', sql.VarChar, dateTime)
        .query(query)
        console.log(nuevoCliente);
        res.json({
            nombre,
            apellido_paterno,
            apellido_materno,
            rfc,
            curp,
            fecha_alta: dateTime
        })
    } catch (error) {
        console.log(error);
    }

}


export const getClientByID = async (req, res) => {
    const query = 'exec SP_consultar_cuenta_cliente @id_cliente'
    try {
        const { id_cliente } = req.params
        const pool = await getConnection()
        const clienteId = await pool
        .request()
        .input('id_cliente', sql.Int, id_cliente)
        .query(query)
        console.log(clienteId);
        res.json(clienteId.recordset)
    } catch (error) {
        console.log(error);
    }

}

export const deleteClientByID = async (req, res) => {
    const query = 'exec SP_eliminar_cliente @id_cliente'
    try {
        const { id_cliente } = req.params
        const pool = await getConnection()
        const deleteClienteId = await pool
        .request()
        .input('id_cliente', sql.Int, id_cliente)
        .query(query)
        console.log(deleteClienteId);
        res.sendStatus(204)
    } catch (error) {
        console.log(error);
    }

}



export const updateClientByID = async (req, res) => {
    let today = new Date();
    let date =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
    let time =
    today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    let dateTime = date + " " + time;
    const query = 'exec SP_actualizar_info_cliente @nombre, @apellido_paterno, @apellido_materno, @rfc, @curp, @fecha_ultimo_movimiento, @id_cliente'
    try {
        const { nombre, apellido_paterno, apellido_materno, rfc, curp } = req.body
        const { id_cliente } = req.params
        const pool = await getConnection()
        const actualizarCliente = await pool
        .request()
        .input('nombre', sql.VarChar, nombre)
        .input('apellido_paterno', sql.VarChar, apellido_paterno)
        .input('apellido_materno', sql.VarChar, apellido_materno)
        .input('rfc', sql.VarChar, rfc)
        .input('curp', sql.VarChar, curp)
        .input('fecha_ultimo_movimiento', sql.VarChar, dateTime)
        .input('id_cliente', sql.Int, id_cliente)
        .query(query)
        console.log(nombre, apellido_paterno, apellido_materno, rfc, curp, id_cliente);
        console.log(actualizarCliente);
        res.json({
            nombre,
            apellido_paterno,
            apellido_materno,
            rfc,
            curp,
            fecha_ultimo_movimiento : dateTime,
            id_cliente
        })
    } catch (error) {
        console.log(error);
    }

}