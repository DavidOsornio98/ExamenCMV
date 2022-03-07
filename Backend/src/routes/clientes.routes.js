import { Router } from "express"
import { deleteClientByID, getClientByID, getClients, newClient, updateClientByID } from '../controllers/clientes.controllers' 
const router = Router()

router.get('/clientes', getClients)
router.post('/clientes', newClient)
router.get('/clientes/:id_cliente', getClientByID)
router.delete('/clientes/:id_cliente', deleteClientByID)
router.put('/clientes/:id_cliente', updateClientByID)


export default router