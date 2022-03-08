import { Router } from "express"
import { deleteClientByID, getClientByID, getClients, newClient, updateClientByID } from '../controllers/clientes.controllers' 
const router = Router()

//Logica que exporta las funciones de cotrollers, se asigna el path para realizar las consultas al api
//y se le define las acciones que hara con los parametros que recibe o si no recibe parametros

router.get('/clientes', getClients)
router.post('/clientes', newClient)
router.get('/clientes/:id_cliente', getClientByID)
router.delete('/clientes/:id_cliente', deleteClientByID)
router.put('/clientes/:id_cliente', updateClientByID)

//Exportamos las rutas

export default router