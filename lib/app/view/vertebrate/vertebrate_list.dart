import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hibrido_ddm_sabado_letivo/app/domain/entities/vertebrate.dart';
import 'package:hibrido_ddm_sabado_letivo/app/view/vertebrate/vertebrate_list_back.dart';

class VertebrateList extends StatelessWidget {
  final _back = VertebrateListBack();

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.edit),
      color: Colors.orange,
    );
  }

  Widget iconRemoveButton(BuildContext context, VoidCallback onPressed) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Excluir"),
              content: const Text("Confirma a exclusão?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Não"),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: const Text("Sim"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Vertebrados"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _back.refreshList();
            },
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
        ],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder<List<Vertebrate>>(
          future: _back.list,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhum vertebrado encontrado.'));
            } else {
              final vertebrates = snapshot.data!;
              return ListView.builder(
                itemCount: vertebrates.length,
                itemBuilder: (context, index) {
                  final vertebrate = vertebrates[index];
                  return ListTile(
                    leading:
                        CircleAvatar(child: Text(vertebrate.nome?[0] ?? '')),
                    title: Text(vertebrate.nome ?? ''),
                    subtitle: Text(
                        'Espécie: ${vertebrate.especie ?? 'Desconhecida'}'),
                    onTap: () => _back.goToDetails(context, vertebrate),
                    trailing: Container(
                      width: 120,
                      child: Row(
                        children: [
                          iconEditButton(() {
                            _back.goToForm(context, vertebrate);
                          }),
                          iconRemoveButton(context, () {
                            _back.remove(context, vertebrate.id);
                          }),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _back.goToForm(context, Vertebrate());
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
