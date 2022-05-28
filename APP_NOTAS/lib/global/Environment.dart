import 'dart:io';

class Environment {
// endpoint de nuestro servicio

static String ApiUrl = Platform.isAndroid ? 'https://api2analisis.azurewebsites.net/api/Servicios'
: 'http://localhost/api/Servicios';

}