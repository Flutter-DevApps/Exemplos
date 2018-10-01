class Pessoa {

  int id;
  String nome;
  DateTime dataNascimento;
  Sexo sexo; 

  Pessoa.fromJson(Map<String, dynamic> json)
        : id = json['id'],
          nome = json['nome'],
          dataNascimento = DateTime.parse(json['dataNascimento']),
          sexo = Sexo.values.firstWhere((test) { 
            return test.toString().substring(5) == json['sexo']; 
          });

 Map<String, dynamic> toJson() => {
      'id': id,
      'nome': nome,
      'dataNascimento': dataNascimento.toString(),
      'sexo': sexo.toString().substring(5)
    };          

}

enum Sexo {
  MASCULINO, FEMINO,
}