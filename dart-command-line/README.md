# Conversor de moeda para o Real

Exemplo de aplicação command-line que faz uso de um serviço Rest disponibilizado pelo site [Alpha Vantage](https://www.alphavantage.co/) que faz conversão de moeda em tempo real.

A criação deste programa durante a elaboração de um documento de estudo do Dart/Flutter que você pode encontrar neste [link](https://github.com/Flutter-DevApps/Documentos/blob/master/03_Platforms_Dart/DartInCommandLine.md).

E ao digitar o comando 'dart cotacao-moeda.dart', veja o resultado. Como padrão a moeda a ser convertida para o real é a cripto moeda Bitcoin.

      $ dart cotacao-moeda.dart
      De: BTC - Bitcoin
      Para: BRL - Brazilian Real
      Última atualização: 2018-09-30 03:08:17.000
      26586.83954400

Mas se você passar o parâmetro <código da moeda>, a conversão se dará a partir desta moeda.

- Usando a moeda Dolar!

      $ dart cotacao-moeda.dart USD
      De: USD - United States Dollar
      Para: BRL - Brazilian Real
      Última atualização: 2018-09-30 03:07:07.000
      4.03840000

- Usando a moeda Iene!

      $ dart cotacao-moeda.dart JPY
      De: JPY - Japanese Yen
      Para: BRL - Brazilian Real
      Última atualização: 2018-09-30 03:09:04.000
      0.03550000


Para conseguir rodar este exemplo em sua máquina, você precisará acessar o site da [Alpha Vantage](https://www.alphavantage.co/) para gerar sua apiKey.

Crie sua chave acessando o link https://www.alphavantage.co/support/#api-key. Logo após o submit do formulário você receberá uma chave parecida com essa aqui ***FB9HJESAWGT7YDH6***.

Depois altere o valor da constante abaixo no arquivo 'dart cotacao-moeda.dart'.

***const apiKey = '<digite_aqui_sua_apiKey>';***

Se quiser consultar a documentação da API, segue os links: 

https://www.alphavantage.co/documentation/

https://www.alphavantage.co/documentation/#digital-currency

