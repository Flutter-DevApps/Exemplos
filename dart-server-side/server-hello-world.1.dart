import 'dart:io';

Future main() async {
  //Criação de um HttpServer que vai atender na ip/porta localhost:4040
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  server.listen((request) {
    request.response.write('Hello, world!');
    request.response.close();
  });

}


// import 'dart:async';
  // await for (HttpRequest request in server) {
  //   request.response
  //     ..write('Hello, world!')
  //     ..close();
  // }