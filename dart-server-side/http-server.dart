import 'dart:async';
import 'dart:io';
import 'router/pessoa-router.dart';

String _host = InternetAddress.loopbackIPv4.host;

Future main() async {
  var server = await HttpServer.bind(_host, 8080);
  print('Listening on localhost:${server.port}');
  await for (var request in server) {
    HttpResponse response = request.response;
    try {
      await pessoaRouter(request, response);
    } catch (error) {
      response
        ..statusCode = HttpStatus.internalServerError
        ..write('Erro ao processar o recurso: ${request.method} - ${error.toString()}.');
      response.close();
    }
  }
}

