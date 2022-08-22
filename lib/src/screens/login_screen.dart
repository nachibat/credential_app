import 'package:facultad_app/src/services/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:facultad_app/src/ui/input_decorations.dart';
import 'package:facultad_app/src/providers/login_form_provider.dart';
import 'package:facultad_app/src/themes/main_theme.dart';
import 'package:facultad_app/src/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool checkTerms = false;
  @override
  Widget build(BuildContext context) {
    portrait();

    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 200),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 10),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(checkTerms)                    
                    )
                  ],
                )
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _chekbox(context),
                  _terms(context),
                ],
              ),
              
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  RichText _terms(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black45),
        children: [
          TextSpan(text: 'He leído y acepto los '),
          TextSpan(
            style: TextStyle(color: Colors.indigo),
            text: 'términos y condiciones',
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pushNamed(context, 'terms');
            }
          ),
        ]
      ),
    );
  }

  Widget _chekbox(BuildContext context) {
    return Checkbox(
      value: checkTerms,
      onChanged: (valor) {
        setState(() {         
          checkTerms = valor!;
        });
      }
    );
  }
}

class _LoginForm extends StatelessWidget {
  final bool terms;

  const _LoginForm(this.terms);

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Legajo', 
                labelText: 'Legajo facultad',
                prefixIcon: Icons.list_alt_outlined
              ),
              onChanged: (value) => loginForm.legajo = value,
              validator: (value) {
                return (value == null || value.isEmpty)
                  ? 'Campo obligatorio'
                  : null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Usuario',
                labelText: 'Usuario facultad',
                prefixIcon: Icons.account_circle_outlined
              ),
              onChanged: (value) => loginForm.usuario = value,
              validator: (value) {
                return (value == null || value.isEmpty)
                  ? 'Campo Obligatorio'
                  : null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: '**********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6) 
                    ? null
                    : 'La contraseña debe tener mínimo 6 caracteres';
              },
            ),
            SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.indigo,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading
                    ? ' Espere '
                    : 'Ingresar',
                  style: TextStyle(color: Colors.white)
                ),
              ),
              onPressed: loginForm.isLoading ? null : () async {
                FocusScope.of(context).unfocus(); // Oculta el teclado
                final authService = Provider.of<AuthService>(context, listen: false);
                if (!loginForm.isValidForm()) return;
                if (!terms) {
                  NotificationService.showSnackbar('Debe aceptar los términos y condiciones');
                  return;
                }
                loginForm.isLoading = true;
                
                // try {
                //   final String? login = await authService.login(loginForm.legajo, loginForm.usuario, loginForm.password);
                //   loginForm.isLoading = false;
                //   if (login == 'login_ok') {
                //     Navigator.pushReplacementNamed(context, 'profile');
                //   } else {
                //     NotificationService.showSnackbar('Error de autenticación');
                //   }
                // } catch (e) {
                //   loginForm.isLoading = false;
                //   print(e);
                //   NotificationService.showAlertDialog(context, 'Problema de comunicación. Vuelva intentarlo nuevamente');
                // }

                final String? login = await authService.login(loginForm.legajo, loginForm.usuario, loginForm.password);
                loginForm.isLoading = false;
                 if (login == 'login_ok') {
                  Navigator.pushReplacementNamed(context, 'credential');
                } else if (login == 'login_error') {
                  NotificationService.showSnackbar('Error de autenticación');
                } else {
                  NotificationService.showAlertDialog(context, 'Problema de comunicación. Vuelva intentarlo nuevamente');
                }
              }
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}