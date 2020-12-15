import 'package:flutter/material.dart';
import 'package:libreria_online/constants.dart';

class CustomListTitle extends StatelessWidget {
  final String text;
  final Function onTap;
  const CustomListTitle({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Colors.black26,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(color: naranja, width: 2),
                  left: BorderSide(color: naranja, width: 8))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              text,
              style: TextStyle(fontSize: 20),
            )),
          ),
        ),
      ),
    );
  }
}
