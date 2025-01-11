
import 'package:flutter/material.dart';
import 'package:prueba_fin_de_ciclo/login.dart';
import 'package:prueba_fin_de_ciclo/main.dart';
import 'package:prueba_fin_de_ciclo/registro.dart';


class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Welcome"),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Prueba())),
          ),
          ListTile(
            title: Text("Login"),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Login())),
          ),
          ListTile(
            title: Text("Registro"),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Registro())),
          ),
          
         
          
        ],
      ),
    );
  }
}