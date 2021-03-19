import 'package:flutter/material.dart';
import 'package:travel_app/clientHomepage.dart';
//import 'package:flutter_auth/Screens/Welcome/components/background.dart';
//import 'package:flutter_svg/svg.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MyClientHomepage(),
        );
      
  }
}
