import 'package:flutter/material.dart';
import 'package:libreria_online/constants.dart';

class StyledFlatButton extends StatelessWidget {
  final String text;
  final onPressed;
  final double radius;

  const StyledFlatButton(this.text, {this.onPressed, Key key, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: morado,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Text(
          this.text,
          style: TextStyle(
            color: Colors.white,
            height: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onPressed: () {
        this.onPressed();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 4.0),
        side: BorderSide(
          color: morado,
          width: 2,
        ),
      ),
    );
  }
}