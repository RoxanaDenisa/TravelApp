import 'package:flutter/material.dart';
import 'package:travel_app/TextFieldWidget.dart';
import 'package:travel_app/buttonWidget.dart';
//import 'package:flutter_auth/Screens/Welcome/components/background.dart';
//import 'package:flutter_svg/svg.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MyHomePage(),
        );
      
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState()=>new _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.deepOrange[600],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Center(
                child:Container(
                  padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                  child: Text(
                    'Travel\n    App',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 60.0, fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'
                      )))),
                      Center(
                      child: Container(
                        padding: EdgeInsets.only(right:100,top:130),
                          child: Image(
                            image: AssetImage('assets/logo.png'),
                            width:90,
                            height:90
                            )
                      )),
                
            ],
          ),  
      ),
        Container(
          //padding: EdgeInsets.only(top: 30.0,left: 20.0,right: 20.0),
          child: Center(
          child: Column(
               
               children:<Widget>[
                 Container(
                   width:260,
                 child:Column(
                   children:<Widget>[
                     TextFieldWidget(
                      hintText: 'Username',
                      obscureText: false,
                      prefixIconData: Icons.person,
                      ),
                 
                     Text('\n',style: TextStyle(fontSize: 2)),
                     TextFieldWidget(
                     hintText: 'Password',
                     obscureText: true,
                     prefixIconData: Icons.vpn_key,
                     ),
                     Text('\n',style: TextStyle(fontSize: 4)),
                   ],),),
                 ButtonWidget(
                  onPressed: () {},
                  title: 'Login'
                )
               ] 
          ,),
        ),
        ),
        Container(
          padding: EdgeInsets.only(top: 35.0),
          child: Center(
          child: Column(
               children:<Widget>[
                IconButton(
                  onPressed: () {},
                  splashColor: Colors.white,
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                  iconSize: 40.0,
                  ),
               
                Text(
                  'If you do not have an account, you can join right now !',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                    ),
                    textAlign: TextAlign.center,
                )
               ] 
          ,),
        )
        )
        ]
    )
    );
  }
}