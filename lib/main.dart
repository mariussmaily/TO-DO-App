import 'package:dana/auth/auth_exceptions.dart';
import 'package:dana/screens/login_views.dart';
import 'package:dana/screens/register_views.dart';
import 'package:dana/screens/todo_screen.dart';
import 'package:dana/screens/verify_email_view.dart';
import 'package:flutter/material.dart';

import 'auth/auth_service.dart';
import 'constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const TodoScreen(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
      },
    ),
  );
}

//La función WidgetsFlutterBinding.ensureInitialized() se utiliza en Flutter para asegurarse de que el motor de widgets de Flutter esté inicializado antes de que se ejecuten otras operaciones.
//Cuando se crea una aplicación Flutter, el motor de widgets es responsable de administrar el árbol de widgets de la aplicación y renderizarlo en la pantalla. El motor de widgets también es responsable de administrar la interacción del usuario con los widgets y las actualizaciones de estado.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const TodoScreen();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
