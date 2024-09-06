import 'package:flutter/material.dart';
import 'package:hibrido_ddm_sabado_letivo/app/injection.dart';

import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  //insertTestSubject();
  runApp(const MyApp());
}
