import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Bienvenido')),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Bienvenido, $username',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

