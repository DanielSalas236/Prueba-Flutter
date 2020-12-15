import 'package:flutter/material.dart';
import 'package:libreria_online/constants.dart';
import 'package:libreria_online/pages/components/custom_list_title.dart';
import 'package:libreria_online/pages/libros_page.dart';
import 'package:libreria_online/pages/registrar_libro_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            AppBar(
              backgroundColor: morado,
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Text(
                "Librería",
                style: TextStyle(
                    color: morado, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            CustomListTitle(
              text: "Registrar libro",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrarLibroPage()));
              },
            ),
            SizedBox(
              height: 5,
            ),
            CustomListTitle(text: "Consultar libros", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LibrosPage()));
            })
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/background-image.png"),
              alignment: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
