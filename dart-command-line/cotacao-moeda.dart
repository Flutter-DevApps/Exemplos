import 'dart:io';
import 'dart:convert';

const utf8 = const Utf8Codec();
const apiKey = '<digite_aqui_sua_apiKey>';
const baseUrlAlphaVantage = 'https://www.alphavantage.co/query?apikey=${apiKey}';

void main(List<String> args) {
  HttpClient client = new HttpClient();
  client.getUrl(Uri.parse('${baseUrlAlphaVantage}&function=CURRENCY_EXCHANGE_RATE&from_currency=${args.length > 0 ? args.first : 'BTC'}&to_currency=BRL'))
  .then((HttpClientRequest request) {
    // Aqui você pode configurar a requisição (ex. adicionar headers, timeout e etc)
    // Chamar o close do request para que requisição seja realizada. 
    // Ao retorna o resultado método close (Future<HttpClientResponse>), podemos implmentar o then para aguardar o response
    return request.close();
  }).then((HttpClientResponse response) {
    // Processando o response
    response.transform(utf8.decoder).listen((contents) {
      // lendo o conteúdo do response e fazendo o json.decode
      var decoded = json.decode(contents);
      decoded = decoded['Realtime Currency Exchange Rate'];

      var ultimaAtualizacao = DateTime.parse(decoded['6. Last Refreshed']);
      ultimaAtualizacao = ultimaAtualizacao.toLocal();

      print('De: ${decoded['1. From_Currency Code']} - ${decoded['2. From_Currency Name']}');
      print('Para: ${decoded['3. To_Currency Code']} - ${decoded['4. To_Currency Name']}');
      print('Última atualização: ${ultimaAtualizacao}');
      print(decoded['5. Exchange Rate']);
    });
  });
}
