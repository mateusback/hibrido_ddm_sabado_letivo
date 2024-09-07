import 'package:flutter/cupertino.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/entities/vertebrate.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/services/i_vertebrate_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'vertebrate_list_back.g.dart';

class VertebrateListBack = _VertebrateListBack with _$VertebrateListBack;

abstract class _VertebrateListBack with Store {
  var _service = GetIt.I.get<IVertebrateService>();

  @observable
  late Future<List<Vertebrate>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _VertebrateListBack() {
    refreshList();
  }

  void goToForm(BuildContext context, [Vertebrate? vertebrate]) {
    Navigator.of(context)
        .pushNamed('/vertebrate_form', arguments: vertebrate)
        .then((_) => refreshList());
  }

  void goToDetails(BuildContext context, Vertebrate vertebrate) {
    Navigator.of(context)
        .pushNamed('/vertebrate_details', arguments: vertebrate)
        .then((_) => refreshList());
  }

  Future<void> remove(BuildContext context, dynamic vertebrateId) async {
    await _service.remove(vertebrateId);
    refreshList();
    Navigator.of(context).pop();
  }
}
