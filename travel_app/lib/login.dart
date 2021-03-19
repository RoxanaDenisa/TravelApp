
import 'package:flutter/material.dart';
import 'package:travel_app/TextFieldWidget.dart';
import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/signUp.dart';
class MyLogin extends StatefulWidget{
  @override
  _MyLoginState createState()=>new _MyLoginState();

}
class _MyLoginState extends State<MyLogin>{
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
                     Text('\n',style: TextStyle(fontSize: 4)),
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
                  onPressed: () {
                  },
                  title: 'Login'
                )
               ] 
          ,),
        ),
        ),
       
        ]
    ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MaterialButton(height:70,
          onPressed: (){},
          child:Container(
              height: 70,
            child:Column(   
        children:<Widget>[
                IconButton(
                  onPressed: () {
                    
                    Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context)=>MySignUp()
                        )
                    );
                  },
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

          ])) )
    );
  }
}
