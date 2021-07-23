import 'package:flutter/material.dart';

class FormData extends StatelessWidget {
  final label, hint, type, obcure, controller;

  FormData(this.label, this.hint, this.type, this.obcure, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obcure,
      keyboardType: type,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: Colors.black54),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
        border: OutlineInputBorder(),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
      ),
      cursorColor: Colors.black26,
    );
  }
}
