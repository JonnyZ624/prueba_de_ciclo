import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba_fin_de_ciclo/navigators/drawer.dart';
import 'package:prueba_fin_de_ciclo/registro.dart';
import 'package:prueba_fin_de_ciclo/login.dart'; 
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Prueba final",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pantalla de Inicio"),
        ),
        drawer: MiDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Registro()),
                  );
                },
                child: const Text("Ir a Registro"),
              ),
              const SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()), 
                  );
                },
                child: const Text("Ir a Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
