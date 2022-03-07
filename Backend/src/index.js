import app from './app'


app.listen(app.get('port'))

console.log("Service Ready on ", app.get('port'));