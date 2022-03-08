import app from './app'

//Se levanta el servicio en el puerto definido en el archivo config.js
app.listen({port: app.get('port')})

//Mesaje en consola para indicar que el servicio esta corriendo
console.log("Service Ready on ", app.get('port'));