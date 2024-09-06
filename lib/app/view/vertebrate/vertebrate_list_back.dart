import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'vertebrate_list_back.g.dart';

class VertebrateListBack = _VertebrateListBack with _$VertebrateListBack;

abstract class _VertebrateListBack with Store {
  var _service = GetIt.I.get<VertebrateService>();

  @observable
  late Future<List<Vertebrate>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _VertebrateListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [Subject? subject]) {
    Navigator.of(context)
        .pushNamed(Routes.SUBJECT_FORM, arguments: subject)
        .then(refreshList);
  }

  gotToDetails(BuildContext context, Subject subject) {
    Navigator.of(context)
        .pushNamed(Routes.HOME, arguments: subject)
        .then(refreshList);
  }

  remove(BuildContext context, dynamic subjectId) async {
    await _service.remove(subjectId);
    refreshList();
    Navigator.of(context).pop();
  }
}
