import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba_fin_de_ciclo/proyecto.dart';  
import 'package:cloud_firestore/cloud_firestore.dart';

class PantallaPrincipalPr extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mis Proyectos")),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('proyectos')
            .where('usuario_id', isEqualTo: _auth.currentUser?.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error al cargar proyectos"));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No tienes proyectos aún"));
          }

          final proyectos = snapshot.data!.docs;

          return ListView.builder(
            itemCount: proyectos.length,
            itemBuilder: (ctx, index) {
              final proyecto = proyectos[index];
              return Card(
                child: ListTile(
                  title: Text(proyecto['titulo']),
                  subtitle: Text(proyecto['descripcion']),
                  
                  onTap: () {
                    
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Proyecto()),
            );
          },
          child: const Text('Crear Nuevos Proyectos'),
        ),
      ),
    );
  }
}
