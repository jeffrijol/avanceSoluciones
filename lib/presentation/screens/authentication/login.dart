import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:activos/presentation/providers/auth_provider.dart';
import 'package:activos/Utils/snack_message.dart';

import '../../../Utils/WidgetsLogin/gradient_button.dart';
import '../../../Utils/WidgetsLogin/login_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Iniciar sesión',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              /* const SocialButton(
                  iconPath: 'assets/svgs/g_logo.svg',
                  label: 'Continue with Google'),
              const SizedBox(height: 20),
              const SocialButton(
                iconPath: 'assets/svgs/f_logo.svg',
                label: 'Continue with Facebook',
                horizontalPadding: 90,
              ),
              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15), */
              loginField(
                  title: 'Email',
                  controller: _email,
                  hint: 'Indique su correo electrónico',
                  obscureText: false),
              const SizedBox(height: 15),
              loginField(
                  title: 'Contraseña',
                  controller: _password,
                  hint: 'Indique su clave de seguridad',
                  obscureText: true),
              const SizedBox(height: 20),

              ///Button
              Consumer<AuthenticationProvider>(builder: (context, auth, child) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (auth.resMessage != '') {
                    showMessage(message: auth.resMessage, context: context);

                    ///Clear the response message to avoid duplicate
                    auth.clear();
                  }
                });
                return gradientButton(
                  text: 'Entrar',
                  tap: () {
                    if (_email.text.isEmpty || _password.text.isEmpty) {
                      showMessage(
                          message: "Todos los campos son requeridos",
                          context: context);
                    } else {
                      auth.loginUser(
                          context: context,
                          email: _email.text.trim(),
                          password: _password.text.trim());
                    }
                  },
                  context: context,
                  status: auth.isLoading,
                );
              }),
              //const GradientButton(),
            ],
          ),
        ),
      ),
    );
  }
}
