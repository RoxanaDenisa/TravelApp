import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget{
  final String hintText;
  final IconData prefixIconData;
  final bool obscureText;
  final Function onChanged;
  TextFieldWidget({
    this.hintText,
    this.prefixIconData,
    this.obscureText,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context){
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size:18,
          color: Colors.black,
        ),
        filled: true,
        fillColor: Colors.deepOrange[200],
        
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.green[800]),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.green[800]),
        )
      )
      
    );
  }
}