import 'package:flutter/material.dart';
import 'package:libreria_online/constants.dart';
import 'package:libreria_online/models/libro_model.dart';
import 'package:libreria_online/pages/components/date_picker_input.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class RegistroForm extends StatefulWidget {
  RegistroForm({Key key}) : super(key: key);

  @override
  _RegistroFormState createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  // Crear una key globar unica para el widget formulario y
  // permite la validación del formulario
  final nombreLibroController = TextEditingController();
  final nombreAutorController = TextEditingController();
  final precioController = TextEditingController();
  DateTime fechaPublicacion;
  bool estado;
  
  final _formKey = GlobalKey<FormState>();
  String estadoValue = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            TextFormField(
              controller: nombreLibroController,
              decoration: InputDecoration(
                labelText: "Nombre del libro",
                labelStyle: TextStyle(color: morado),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: morado, width: 1)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: morado, width: 1)),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Por favor llenar este campo";
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nombreAutorController,
              decoration: InputDecoration(
                labelText: "Nombre del autor",
                labelStyle: TextStyle(color: morado),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: morado, width: 1)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: morado, width: 1)),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Por favor llenar este campo";
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            DatePickerInput(
              onChanged: (date) {
                //Este método se ejecuta cada vez
                //que la fecha cambia
                fechaPublicacion = date;
                print('Selected date: $date');
              },
              validator: (String value) {
                // Validación si seleccionó una fecha
                if (value.isEmpty) {
                  return 'Por favor ingrese una fecha';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: precioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Precio",
                labelStyle: TextStyle(color: morado),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: morado, width: 1)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: morado, width: 1)),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Por favor llenar este campo";
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Estado",
                      style: TextStyle(
                        color: morado,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: " (Disponible / No disponible)",
                            style: TextStyle(color: Colors.red))
                      ]),
                ),
              ],
            ),
            DropdownButton(
              isExpanded: true,
              value: estadoValue,
              icon: Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: TextStyle(color: morado),
              underline: Container(height: 2, color: morado),
              onChanged: (String newEstado) {
                setState(() {
                  estadoValue = newEstado;
                  if(estadoValue == "Disponible"){
                    estado = true;
                  }else{
                    estado = false;
                  }
                  print(newEstado);
                });
              },
              items: <String>['Disponible', '', 'No disponible']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              minWidth: double.infinity,
              color: morado,
              onPressed: () {
                // Valida si el formulario está correcto
                if (_formKey.currentState.validate()) {
                  // Si el formulario es correcto
                  // guardarLibro(nombreAutorController.text.trim(), estado, nombreLibroController.text.trim(), double.parse(precioController.text.trim()), fechaPublicacion);
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Guardando información...')));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Registrar libro",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

guardarLibro(String author, bool available, String name,
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
            "publicationDate": publicationDate.toString()
          }));
        
      if(response.statusCode == 200){
        print("guardado");
      }else{
        print("error");
      }
}