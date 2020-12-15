import 'package:flutter/material.dart';

class Libro {
  int id, price;
  String name, author, publicationDate;
  bool available;

  Libro({this.id, this.name, this.author, this.publicationDate, this.available, this.price});
}