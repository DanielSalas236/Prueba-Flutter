import 'package:flutter/material.dart';
import 'package:libreria_online/constants.dart';
import 'package:libreria_online/pages/components/registro_form.dart';

class RegistrarLibroPage extends StatefulWidget {
  RegistrarLibroPage({Key key}) : super(key: key);

  @override
  _RegistrarLibroPageState createState() => _RegistrarLibroPageState();
}

class _RegistrarLibroPageState extends State<RegistrarLibroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: morado,
        title: Text("Librería Online",
            style: TextStyle(color: naranja, fontWeight: FontWeight.bold)),
      ),
      body: RegistroForm(),
    );
  }
}