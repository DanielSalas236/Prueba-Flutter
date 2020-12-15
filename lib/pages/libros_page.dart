import 'package:flutter/material.dart';
import 'package:libreria_online/constants.dart';
import 'package:libreria_online/pages/components/libros.dart';

class LibrosPage extends StatelessWidget {
  const LibrosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: morado,
        title: Text("Librería Online",
            style: TextStyle(color: naranja, fontWeight: FontWeight.bold)),
      ),
      body: Libros(),
    );
  }
}