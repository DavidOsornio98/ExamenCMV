import { config } from 'dotenv'
config()
//Configuracion por del servicio de express, usamos el puerto definido en el archivo .env
//Si no hay puerto se utiliza por defecto el puerto 3000
//  Exportamos la configuracion del puerto
export default {
    port: process.env.PORT || 3000
}