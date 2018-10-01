import '../model/pessoa.dart';

Map<int, Pessoa> myMemoryDb = {};
int sequence = 0;

List<Pessoa> getAll() {
  return List.unmodifiable(myMemoryDb.values);
}

Pessoa get(int id) {
  return myMemoryDb[id];
}

Pessoa add(Pessoa pessoa) {
  pessoa.id = ++sequence;
  myMemoryDb[pessoa.id] = pessoa;
  return pessoa;
}

Pessoa delete(int id) {
  return myMemoryDb.remove(id);
}

Pessoa update(int id, Pessoa pessoa) {
  myMemoryDb[id] = pessoa;
  pessoa.id = id;
  return pessoa;
}