import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_fin_de_ciclo/navigators/pantallapricipalpro.dart';

class Proyecto extends StatefulWidget {
  const Proyecto({super.key});

  @override
  _ProyectoState createState() => _ProyectoState();
}

class _ProyectoState extends State<Proyecto> {
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _resultadoController = TextEditingController(); // Nuevo controlador para resultado esperado

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _crearProyecto() async {
    final usuario = _auth.currentUser;

    if (_tituloController.text.isEmpty || _descripcionController.text.isEmpty || _resultadoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor complete todos los campos')));
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('proyectos').add({
        'titulo': _tituloController.text,
        'descripcion': _descripcionController.text,
        'resultado_esperado': _resultadoController.text, // Guardamos el resultado esperado
        'usuario_id': usuario?.uid,
        'tareas': [],
      });

      // Navegar a PantallaPrincipalPr después de crear el proyecto
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  PantallaPrincipalPr()), // Cambié a PantallaPrincipalPr
      );

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Proyecto creado exitosamente')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al crear proyecto: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Proyecto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: _resultadoController, 
              decoration: const InputDecoration(labelText: 'Resultado Esperado'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _crearProyecto,
              child: const Text('Crear Proyecto'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  PantallaPrincipalPr()),
                );
              },
              child: const Text('Ver proyectos'),
            ),
            
          ],
        ),
      ),
    );
  }
}
