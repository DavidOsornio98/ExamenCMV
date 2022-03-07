import sql from 'mssql'

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



export const getConnection = async () =>{
    try {
        const pool = await sql.connect(dbConfig)
        return pool
    } catch (error) {
        console.log(error);
    }
}

export {sql}

