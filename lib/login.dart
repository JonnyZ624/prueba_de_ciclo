import 'package:flutter/material.dart';
import 'package:prueba_fin_de_ciclo/navigators/drawer.dart';
import 'package:prueba_fin_de_ciclo/proyecto.dart';
import 'package:prueba_fin_de_ciclo/registro.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Login"),
          ],
        ),
      ),
      drawer: MiDrawer(),  
      body: SingleChildScrollView(
        child: LoginForm(),  
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Correo Electrónico',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            obscureText: true, 
            decoration: InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) =>  Proyecto()),);
            },
            child: Text('Iniciar sesión'),
          ),
          ElevatedButton(onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => const Registro()),);
            },
            child: Text('Ir a Registro'),
          ),
        ],
      ),
    );
  }
}