import 'dart:io';
import 'dart:convert';
import '../controllers/pessoa-controller.dart';
import '../model/pessoa.dart';

void pessoaRouter(HttpRequest request, HttpResponse response) async {
      if (request.method == 'POST') {
      String content = await request.transform(utf8.decoder).join();
      var data = jsonDecode(content) as Map;

      if (request.uri.pathSegments.length == 1 && request.uri.pathSegments.first == 'pessoas') {
        var pessoaPersistida = add(Pessoa.fromJson(data));
        request.response..statusCode = HttpStatus.ok
          ..write(json.encode(pessoaPersistida.toJson()));
      } else if (request.uri.pathSegments.length == 2 &&
          request.uri.pathSegments.first == 'pessoas') {
        request.response..statusCode = HttpStatus.ok
          ..write(json.encode(update(int.parse(request.uri.pathSegments.last), Pessoa.fromJson(data))));
      } else {
        recursoNaoEncontrado(request, response);
      }
    } else if (request.method == 'GET') {
      if (request.uri.pathSegments.length == 1 && request.uri.pathSegments.first == 'pessoas') {
        request.response..statusCode = HttpStatus.ok
          ..write(json.encode(getAll()));
      } else {
        recursoNaoEncontrado(request, response);
      }
    } else if (request.method == 'DELETE') {
      if (request.uri.pathSegments.length == 2 && request.uri.pathSegments.first == 'pessoas') {
        request.response..statusCode = HttpStatus.ok
          ..write(
              json.encode(delete(int.parse(request.uri.pathSegments.last))));
      } else {
        recursoNaoEncontrado(request, response);
      }
    } else {
      response..statusCode = HttpStatus.methodNotAllowed
        ..write("Método não suportado: ${request.method}.");
    }
    response.close();

}

recursoNaoEncontrado(HttpRequest req, HttpResponse resp) {
  resp..statusCode = HttpStatus.methodNotAllowed
    ..write("Recurso não encontrado: ${req.method}.");
}