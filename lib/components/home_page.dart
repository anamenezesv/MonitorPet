import 'package:flutter/material.dart';
import 'package:modelo/components/register_pet_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final int heartRate;

  const HomePage({required this.heartRate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitoramento de Batimentos'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffEEF1F3),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xff939393),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Lógica para navegar para a tela Home
              },
            ),
            ListTile(
              title: const Text(
                'Cadastro de Pet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPetPage()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Configurações',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Lógica para navegar para a tela de Configurações
              },
            ),
            ListTile(
              title: const Text(
                'Sobre',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Lógica para navegar para a tela Sobre
              },
            ),
            ListTile(
              title: const Text(
                'Sair',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Redirecionar para a tela de login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Batimentos Cardíacos: $heartRate',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
