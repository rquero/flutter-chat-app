import 'package:chat_socket_app/pages/button_blue.dart';
import 'package:chat_socket_app/pages/register_page.dart';
import 'package:chat_socket_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/labels.dart';
import '../widgets/logo.dart';

class LoginPage extends StatelessWidget {
  static const String route = 'login_route';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(
                    title: 'Login',
                  ),
                  _Form(),
                  Labels(
                    title: '¿No tienes cuenta?',
                    subtitle: 'Crea una cuenta ahora!',
                    navigateTo: RegisterPage.route,
                  ),
                  Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailController,
          ),
          const SizedBox(height: 20),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: passwordController,
            isPassword: true,
          ),
          // CustomInput(),
          const SizedBox(height: 20),

          ButtonBlue(
            label: 'Ingrese',
            onTap: () {
              print('email: ${emailController.value}');
              print('password: ${passwordController.value}');
            },
          )
        ],
      ),
    );
  }
}
