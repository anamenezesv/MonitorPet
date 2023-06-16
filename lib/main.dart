import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modelo/components/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp();
    runApp(MyApp());
  } catch (e) {
    print('Erro ao inicializar o Firebase: $e');
    // Trate o erro de inicialização do Firebase aqui
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
    );
  }
}