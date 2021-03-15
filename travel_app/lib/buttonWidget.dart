import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final String title;
  final Function onPressed;
  ButtonWidget({
    this.title,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context)
  {
    return MaterialButton(
      height: 40,
      minWidth: 150,
      onPressed: onPressed,
      splashColor: Colors.green[600],
      color: Colors.green[700],
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
        
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

      );
      
      
  }
}
