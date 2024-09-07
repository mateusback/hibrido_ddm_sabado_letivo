import 'package:flutter/material.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/entities/vertebrate.dart';

class VertebrateDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vertebrate = ModalRoute.of(context)?.settings.arguments as Vertebrate;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Vertebrado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${vertebrate.nome}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Espécie: ${vertebrate.especie}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Idade: ${vertebrate.idade}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Tipo de Coluna Vertebral: ${vertebrate.tipoColunaVertebral}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
