import express from 'express'
import config from './config'
import clientesRutas from './routes/clientes.routes'

const app = express()


//Middleware que nos permite procesar las peticiones

app.use(express.json())
app.use(express.urlencoded({extended:false}))

app.set('port', config.port)

//Se configura cors para aceptar peticiones del host creado al levantar el servidor de vue en el puerto 8080
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "http://localhost:8080"); // update to match the domain you will make the request from
    res.header("Access-Control-Allow-Methods","*")
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
  });
//la app de express usa las rimportadas del archivo de rutas
app.use(clientesRutas)
export default app