import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget2 extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final bool obscureText;
  final Function onChanged;
  final int lines;
  TextFieldWidget2(
      {this.hintText,
      this.prefixIconData,
      this.obscureText,
      this.onChanged,
      this.lines});
  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: lines,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              prefixIconData,
              size: 18,
              color: Colors.black,
            ),
            filled: true,
            fillColor: Colors.deepOrange[200],
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.green[800]),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.green[800]),
            )
            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            ));
  }
}
