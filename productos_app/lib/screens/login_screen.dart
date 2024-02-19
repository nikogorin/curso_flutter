import 'package:flutter/material.dart';
import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/services/notifications_service.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 175),
            CardContainer(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Login', style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 20),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, 'register'),
              child: Text('Crear una nueva cuenta',
                  style: TextStyle(fontSize: 18, color: Colors.black87)),
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    Colors.indigo.withOpacity(0.1),
                  ),
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ),
            SizedBox(height: 50),
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'john.doe@gmail.com',
              labelText: 'Correo electrónico',
              prefixIcon: Icons.alternate_email_sharp,
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = new RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no luce como un correo';
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: '******',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline,
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe de ser de 6 caracteres';
            },
          ),
          SizedBox(height: 20),
          MaterialButton(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: Text(
                loginForm.isLoading ? 'Espere' : 'Ingresar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final authservice =
                        Provider.of<AuthService>(context, listen: false);

                    if (!loginForm.isValidForm()) return;
                    loginForm.isLoading = true;

                    final String? errorMessage = await authservice.login(
                        loginForm.email, loginForm.password);
                    if (errorMessage == null) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      print(errorMessage);
                      NotificationService.showSnapbar(errorMessage);
                      loginForm.isLoading = false;
                    }
                  },
          )
        ]),
      ),
    );
  }
}
