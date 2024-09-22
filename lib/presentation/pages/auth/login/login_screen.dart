import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text.dart';
import 'package:front_laboratory/presentation/widgets/nav_bar/nav_bar.dart';
import 'package:provider/provider.dart';
import '../../../../server/auth_service.dart';
import '../../../widgets/alert/show_alert.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/custom_textfield_password.dart';
import '../../../widgets/nav_bar/nav_bar_logout.dart';
import '../../template/template_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _password = TextEditingController();
  final _email = TextEditingController();

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: NavBarLogOut(title: 'Login'),
      backgroundColor: AppTheme.neutral100,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppTheme.baseWhite,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.baseBlack.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo

                const SizedBox(height: 20),
                // Título Login
                const Text(
                  'Bienvenida de nuevo',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                const Text(
                  'Por favor inicia sesión para continuar',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.neutral400,
                  ),
                ),
                const SizedBox(height: 30),
                const CustomText(labelText: 'Correo electrónico'),
                CustomTextField(
                  labelText: 'Correo electrónico',
                  controller: _email,
                ),
                const SizedBox(height: 20),
                const CustomText(labelText: 'Contraseña'),
                CustomPasswordField(
                  labelText: 'Contraseña',
                  controller: _password,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  width: 300,
                  text: "Iniciar Sesión",
                  onPressed: () async {
                    setState(() {
                      authService.autenticando = true;
                    });
                    final email = _email.text.trim();
                    final password = _password.text.trim();

                    if (_email.text.isEmpty || password.isEmpty) {
                      setState(() {
                        authService.autenticando = false;
                      });
                      showAlert(context, "Datos incompletos",
                          "Por favor complete los campos");
                      return;
                    }
                    print('Email: $email');

                    final loginOk = await authService.login(email, password);
                    setState(() {
                      authService.autenticando = false;
                    });
                    if (loginOk!) {
                      // Navigator.pushNamed(context, '/home');
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return TemplateScreen();
                          }));
                    } else {
                      showAlert(context, "Credenciales incorrectas",
                          "Por favor verifique sus credenciales");
                    }
                  },
                  enabled: !authService.autenticando,
                  loading: authService.autenticando,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
