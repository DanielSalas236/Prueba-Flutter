import 'package:flutter/material.dart';
import 'package:libreria_online/models/libro_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GuardarLibro{
Future<Libro> guardarLibro(String author, bool available, String name,
    double price, DateTime publicationDate) async {
  final http.Response response =
      await http.post('http://localhost:8090/api/library/book/save',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: convert.jsonEncode({
            "author": author,
            "available": available,
            "name": name,
            "price": price,
            "publicationDate": publicationDate
          }));
        
      if(response.statusCode == 200){
        print("guardado");
      }else{
        print("error");
      }
}
}