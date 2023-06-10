import 'package:flutter/material.dart';
import 'package:modelo/components/common/custom_from_button.dart';
import 'package:modelo/components/common/custom_input_field.dart';

class RegisterPetPage extends StatefulWidget {
  @override
  _RegisterPetPageState createState() => _RegisterPetPageState();
}

class _RegisterPetPageState extends State<RegisterPetPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _racaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEEF1F3),
      appBar: AppBar(
        title: const Text('Cadastro de Pet'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              const Text(
                'Cadastro de Pet',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomInputField(
                      labelText: 'Nome',
                      hintText: 'Nome',
                      controller: _nomeController,
                      validator: (textValue) {
                        if (textValue == null || textValue.isEmpty) {
                          return 'Por favor, insira o nome do pet';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomInputField(
                      labelText: 'Idade',
                      hintText: 'Idade',
                      controller: _idadeController,
                      validator: (textValue) {
                        if (textValue == null || textValue.isEmpty) {
                          return 'Por favor, insira a idade do pet';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomInputField(
                      labelText: 'Raça',
                      hintText: 'Raça',
                      controller: _racaController,
                      validator: (textValue) {
                        if (textValue == null || textValue.isEmpty) {
                          return 'Por favor, insira a raça do pet';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomInputField(
                      labelText: 'Peso',
                      hintText: 'Peso',
                      controller: _pesoController,
                      validator: (textValue) {
                        if (textValue == null || textValue.isEmpty) {
                          return 'Por favor, insira o peso do pet';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    CustomFormButton(
                      innerText: 'Cadastrar',
                      onPressed: _handleRegisterPet,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRegisterPet() {
    if (_formKey.currentState!.validate()) {
      String nome = _nomeController.text;
      String idade = _idadeController.text;
      String raca = _racaController.text;
      String peso = _pesoController.text;

      print('Nome: $nome');
      print('Idade: $idade');
      print('Raça: $raca');
      print('Peso: $peso');

      _nomeController.clear();
      _idadeController.clear();
      _racaController.clear();
      _pesoController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pet cadastrado com sucesso!'),
        ),
      );
    }
  }
}
