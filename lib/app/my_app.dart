import 'package:flutter/material.dart';
import 'package:hibrido_ddm_sabado_letivo/app/view/home_page.dart';
import 'package:hibrido_ddm_sabado_letivo/app/view/vertebrate/vertebrate_form.dart';
import 'package:hibrido_ddm_sabado_letivo/app/view/vertebrate/vertebrate_list.dart';
import 'package:hibrido_ddm_sabado_letivo/app/view/vertebrate/vertebrate_details.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Vertebrados Sabado Letivo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/vertebrate_form': (context) => VertebrateForm(),
        '/vertebrate_list': (context) => VertebrateList(),
        '/vertebrate_details': (context) => VertebrateDetails(),
      },
    );
  }
}
