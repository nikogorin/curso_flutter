import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2,
        ),
      ),
      hintText: hintText, //'johndoe@gmail.com',
      labelText: labelText, //'Correo electrónico',
      labelStyle: TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon, //Icons.alternate_email_sharp,
              color: Colors.deepPurple,
            )
          : null,
    );
  }
}
