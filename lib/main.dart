import 'package:flutter/material.dart';
import 'pantallas/login_page.dart';
import 'pantallas/register_page.dart';
import 'pantallas/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegación entre Pantallas',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
