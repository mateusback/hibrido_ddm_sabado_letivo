import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class VertebrateFormBack {
  var _service = GetIt.I.get<VertebrateService>();
  Vertebrate? subject;
  bool? _nameIsValid = false;
  bool? _teacherIsValid = false;
  bool? _periodIsValid = false;

  bool get isValid => _nameIsValid! && _teacherIsValid! && _periodIsValid!;

  SubjectFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments;
    subject = (parameter == null) ? Subject() : parameter as Subject;
  }

  save(BuildContext context) async {
    await _service.save(subject!);
    Navigator.of(context).pop();
  }
}
