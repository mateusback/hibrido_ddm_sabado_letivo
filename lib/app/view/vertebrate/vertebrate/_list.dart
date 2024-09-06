import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/view/subject/subject_list_back.dart';

class SubjectList extends StatelessWidget {
  final _back = SubjectListBack();

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.edit),
      color: Colors.orange,
    );
  }

  Widget iconGradesButton(VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.list_alt_outlined),
      color: Colors.greenAccent,
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
        title: const Text("Gerenciador de Matérias"),
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
        return FutureBuilder(
          future: _back.list,
          builder: (context, futureData) {
            if (!futureData.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            List<Subject> list = futureData.data!;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                var subject = list[i];
                var allGrades = subject.grades = subject.grades ?? [];
                double sumGrades = 0, average = 0;
                if (allGrades.length > 0) {
                  sumGrades = allGrades.fold(
                      0, (sum, grade) => sum + (grade.value ?? 0));
                  average = sumGrades / allGrades.length;
                }

                return ListTile(
                  leading: CircleAvatar(child: Text(subject.name?[0] ?? '')),
                  title: Text(subject.name ?? ''),
                  onTap: () {
                    //TODO - IMPLEMENTAR
                  },
                  subtitle: Text(
                    'Professor: ${subject.teacherName ?? ''}\nFaltas: ${subject.misses?.length ?? 0}\nMédia: $average',
                  ),
                  trailing: Container(
                    width: 120,
                    child: Row(
                      children: [
                        iconEditButton(() {
                          _back.goToForm(context, subject);
                        }),
                        iconRemoveButton(context, () {
                          _back.remove(context, subject.id!);
                        }),
                        iconGradesButton(() {
                          _back.goToGradesList(context, subject);
                        }),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _back.goToForm(context, Subject());
        },
        backgroundColor: Colors.greenAccent,
        shape: CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
