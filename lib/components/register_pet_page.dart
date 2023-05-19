import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Pet'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey[200],
        child: Form(
          key: _formKey,
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
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira o nome do pet';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _idadeController,
                decoration: const InputDecoration(
                  labelText: 'Idade',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira a idade do pet';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _racaController,
                decoration: const InputDecoration(
                  labelText: 'Raça',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira a raça do pet';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _pesoController,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira o peso do pet';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Executar a lógica de cadastro do pet aqui
                    String nome = _nomeController.text;
                    String idade = _idadeController.text;
                    String raca = _racaController.text;
                    String peso = _pesoController.text;

                    // Exemplo de impressão dos dados cadastrados
                    print('Nome: $nome');
                    print('Idade: $idade');
                    print('Raça: $raca');
                    print('Peso: $peso');

                    // Limpar os campos após o cadastro
                    _nomeController.clear();
                    _idadeController.clear();
                    _racaController.clear();
                    _pesoController.clear();

                    // Exibir uma mensagem de sucesso
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Pet cadastrado com sucesso!'),
                      ),
                    );
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
