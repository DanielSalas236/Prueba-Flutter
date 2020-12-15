import 'package:flutter/material.dart';
import 'package:libreria_online/models/libro_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Libros extends StatefulWidget {
  const Libros({Key key}) : super(key: key);

  @override
  _LibrosState createState() => _LibrosState();
}

class _LibrosState extends State<Libros> {
  Future<List<Libro>> _librosList;

  Future<List<Libro>> getLibros() async {
    final response = await http.get(
        "http://192.168.1.1:8888/api/library/book/all");
    List<Libro> libros = [];
    if (response.statusCode == 200) {
      String body = convert.utf8.decode(response.bodyBytes);

      final jsonData = convert.jsonDecode(body);

      // for (var item in jsonData["data"]) {
        // gifs.add(Libro(item["title"], item["images"]["downsized"]["url"]));
      // }
      print(jsonData);
      // return gifs;
    } else {
      throw Exception("Fallo de conexión");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _librosList = getLibros();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _librosList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: _libros(snapshot.data),
              mainAxisSpacing: 20,
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Error");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  List<Widget> _libros(List<Libro> data) {
    List<Widget> libros = [];
    for (var libro in data) {
        libros.add(Column(
          children: [
            Expanded(
              child: Container(
                height: 180,
                width: 130,
                child: Image.network(
                  libro.author,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              libro.name,
              textAlign: TextAlign.center,
            )
          ],
        ));
    }
    return libros;
  }
}