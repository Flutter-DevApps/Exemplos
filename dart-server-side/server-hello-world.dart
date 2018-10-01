import 'dart:io';

void main() async {
  //Criação de um HttpServer que vai atender na ip/porta localhost:4040
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response
      ..write('Hello, world! Flutter-DevApps.')
      ..close();
  }
}
