import express from 'express'
import config from './config'
import clientesRutas from './routes/clientes.routes'

const app = express()

//Configuraciones
let port = 5000

//Middleware
app.use(express.json())
app.use(express.urlencoded({extended:false}))

app.set('port', config.port)
app.use(clientesRutas)
export default app