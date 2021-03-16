
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
class MyClientHomepage extends StatefulWidget{
  @override
  _MyClientHomepage createState()=>new _MyClientHomepage();

}
class _MyClientHomepage extends State<MyClientHomepage>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.deepOrange[600],
          title: Text(
            "Travel",
            style: TextStyle(
              
                      color: Colors.green[800],
                      fontSize: 40.0, fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'
              )
              ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(backgroundColor: Colors.orange[800]),
               child: Text('Home',style: TextStyle(color: Colors.white),)),
               
            TextButton(
              onPressed: (){},
               child: Text('Reservations',style: TextStyle(color: Colors.white),)),
            
            ]
        ),
        body: Column(
          children: <Widget>[
            AppBar(
              toolbarHeight: 40,
            
              backgroundColor: Colors.grey[350],
              title: Row(
                children:<Widget>[
                Text("App",
                   style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 40.0, fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'
              )),
              
                
                ]),
                actions: <Widget>[
                Padding(
                padding: EdgeInsets.only(right: 13),
                ),
                Container(
                  width: 200,
                  height: 10,
                 child: TextField(
                  cursorHeight: 25,
                  selectionHeightStyle: BoxHeightStyle.tight,
                 decoration: InputDecoration(
                     hintText: 'Search',
                      prefixIcon: Icon(
                           Icons.search,
                            size:25,
                             color: Colors.black,
                      ),
                  filled: true,
                 fillColor: Colors.grey[300],
                  enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.green[800]),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.green[800]),
        )
      )))]),
              Center(
               child: Container(
                 width:300,
               child: Row(
                   children:<Widget>[
                     Container(
                       width:150,
                       child:
                     Column(
                       children: <Widget>[
                         Container(
                           width:150,
                         child:Text(
                           '  Welcome!',
                           textAlign: TextAlign.left,
                           style: TextStyle(
                             color: Colors.grey,
                             fontSize: 12
                             ),
                         ),),
                         Text(
                           'Discover the best\noffers and travel\naround the\nworld!',
                           style: TextStyle(
                             color: Colors.green[600],
                             fontSize: 18
                             ),
                         )
                       ],
                       ),),
                       
                           Image(
                            image: AssetImage('assets/earth.png'),
                            width:150,
                            height:150
                            )
                      
                 ]
                ))
              )]

            
        ),
      ),
    );
  }
}