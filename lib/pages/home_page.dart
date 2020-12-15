import 'package:flutter/material.dart';
import 'package:libreria_online/pages/components/custom_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    "assets/img/libreria1.jpeg",
    "assets/img/libreria2.png",
    "assets/img/libreria3.jpeg",
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: morado,
        title: Text("Librería Online",
            style: TextStyle(color: naranja, fontWeight: FontWeight.bold)),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Bienvenido", style: TextStyle(color: morado, fontWeight: FontWeight.bold, fontSize: 30)),
              ],
            ),
          ),
          CarouselSlider(
            items: [
              Image.asset("assets/img/libreria1.jpeg"),
              Image.asset("assets/img/libreria2.png"),
              Image.asset("assets/img/libreria3.jpeg")
            ],
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
