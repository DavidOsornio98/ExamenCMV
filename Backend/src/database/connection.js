import sql from 'mssql'

// Variables de configuracion de la BD

const dbConfig = {
    user: 'sa',
    password: 'Abcde1',
    server: 'ALYCAT-PC',
    database:'examenCmv',
    options: {
        encrypt: true,
        trustServerCertificate: true

    }
}


// Se exporta funcion que genera la conexion a la bd

export const getConnection = async () =>{
    try {
        const pool = await sql.connect(dbConfig)
        return pool
    } catch (error) {
        console.log(error);
    }
}

export {sql}

