import 'package:flutter/material.dart';
import 'package:hibrido_ddm_sabado_letivo/app/view/vertebrate/vertebrate_form_back.dart';

class VertebrateForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(VertebrateFormBack back) {
    var initValue = back.vertebrate!.nome;
    return TextFormField(
      validator: (String? value) => back.validateName(value!),
      onSaved: (newValue) => back.vertebrate!.nome = newValue!,
      initialValue: initValue ?? '',
      decoration: const InputDecoration(labelText: 'Nome do Vertebrado'),
    );
  }

  Widget fieldSpecies(VertebrateFormBack back) {
    var initValue = back.vertebrate!.especie;
    return TextFormField(
      validator: (String? value) => back.validateSpecies(value!),
      onSaved: (newValue) => back.vertebrate!.especie = newValue!,
      initialValue: initValue ?? '',
      decoration: const InputDecoration(labelText: 'Espécie'),
    );
  }

  Widget fieldVertebralColumnType(VertebrateFormBack back) {
    var initValue = back.vertebrate!.tipoColunaVertebral;
    return TextFormField(
      validator: (String? value) => back.validateVertebralColumnType(value!),
      onSaved: (newValue) => back.vertebrate!.tipoColunaVertebral = newValue!,
      initialValue: initValue ?? '',
      decoration: const InputDecoration(labelText: 'Tipo de Coluna Vertebral'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = VertebrateFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Vertebrado'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _form.currentState!.validate();
              _form.currentState!.save();
              if (_back.isValid) {
                _back.save(context);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldName(_back),
              fieldSpecies(_back),
              fieldVertebralColumnType(_back),
            ],
          ),
        ),
      ),
    );
  }
}
