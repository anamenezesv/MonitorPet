import 'package:flutter/material.dart';
import 'package:modelo/components/common/custom_from_button.dart';
import 'package:modelo/components/common/custom_input_field.dart';
import 'package:modelo/components/common/page_heading.dart';
import 'package:modelo/components/forget_password_page.dart';
import 'package:modelo/components/home_page.dart';
import 'package:modelo/components/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEEF1F3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  const PageHeading(title: 'Login'),
                  const SizedBox(height: 24),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        CustomInputField(
                          labelText: 'Email',
                          hintText: 'Endereço de e-mail',
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'É obrigatório informar um e-mail!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomInputField(
                          labelText: 'Senha',
                          hintText: 'Sua senha',
                          obscureText: true,
                          suffixIcon: true,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'É obrigatório informar uma senha!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPasswordPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color:  Color(0xff939393),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomFormButton(
                          innerText: 'Login',
                          onPressed: _handleLoginUser,
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Não tem uma conta? ',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff939393),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignupPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Registre-se',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff748288),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLoginUser() {
    // login user
    if (_loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Entrando...')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(heartRate: 100),
        ),
      );
    }
  }
}
