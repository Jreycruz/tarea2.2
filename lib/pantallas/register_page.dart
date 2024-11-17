import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Registro')),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                String phone = phoneController.text;
                String password = passwordController.text;
                String confirmPassword = confirmPasswordController.text;

                if (!validatePassword(password)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('La contraseña debe tener al menos 8 caracteres, una mayúscula y un carácter especial'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (password != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Las contraseñas no coinciden'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (!validatePhone(phone)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('El teléfono debe iniciar con 3 o 9 y tener exactamente 8 números'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (!validateEmail(email)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('El correo debe ser válido y finalizar con @unah.edu.hn o @unah.hn'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Registro exitoso'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  print("Nombre: $name");
                  print("Correo: $email");
                  print("Teléfono: $phone");
                  print("Contraseña: $password");
                  print("Confirmar Contraseña: $confirmPassword");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('¡Regístrate!'),
            ),
          ],
        ),
      ),
    );
  }

  bool validatePassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*~])(?=.*[a-zA-Z0-9]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  bool validatePhone(String phone) {
    final phoneRegex = RegExp(r'^[39][0-9]{7}$');
    return phoneRegex.hasMatch(phone);
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@unah\.(edu\.hn|hn)$');
    return emailRegex.hasMatch(email);
  }
}
