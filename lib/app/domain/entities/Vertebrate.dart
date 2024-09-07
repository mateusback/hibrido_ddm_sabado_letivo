import 'animal.dart';

class Vertebrate extends Animal {
  String tipoColunaVertebral;

  Vertebrate(
      {int? id,
      String? nome,
      int? idade,
      String? especie,
      this.tipoColunaVertebral = ''})
      : super(id ?? 0, nome ?? '', idade ?? 0, especie ?? '');

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'especie': especie,
      'tipoColunaVertebral': tipoColunaVertebral,
    };
  }

  factory Vertebrate.fromMap(Map<String, dynamic> map) {
    return Vertebrate(
      id: map['id'],
      nome: map['nome'],
      idade: map['idade'],
      especie: map['especie'],
      tipoColunaVertebral: map['tipoColunaVertebral'],
    );
  }
}
