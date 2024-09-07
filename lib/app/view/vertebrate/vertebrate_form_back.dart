import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/entities/vertebrate.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/services/i_vertebrate_service.dart';

class VertebrateFormBack {
  var _service = GetIt.I.get<IVertebrateService>();
  Vertebrate? vertebrate;

  bool? _nameIsValid = false;
  bool? _speciesIsValid = false;
  bool? _vertebralColumnTypeIsValid = false;

  bool get isValid =>
      _nameIsValid! && _speciesIsValid! && _vertebralColumnTypeIsValid!;

  VertebrateFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments;
    vertebrate = (parameter == null)
        ? Vertebrate() // Criação de um novo objeto se os parâmetros não forem passados
        : parameter
            as Vertebrate; // Caso o parâmetro seja passado, converte para Vertebrate
  }

  save(BuildContext context) async {
    await _service.save(vertebrate!);
    Navigator.of(context).pop();
  }

  // Validações
  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Nome não pode estar vazio';
    }
    _nameIsValid = true;
    return null;
  }

  String? validateSpecies(String value) {
    if (value.isEmpty) {
      return 'Espécie não pode estar vazio';
    }
    _speciesIsValid = true;
    return null;
  }

  String? validateVertebralColumnType(String value) {
    if (value.isEmpty) {
      return 'Tipo de coluna vertebral não pode estar vazio';
    }
    _vertebralColumnTypeIsValid = true;
    return null;
  }
}
