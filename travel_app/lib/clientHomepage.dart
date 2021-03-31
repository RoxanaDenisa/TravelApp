import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app/reservation.dart';

class MyClientHomepage extends StatefulWidget {
  @override
  _MyClientHomepage createState() => new _MyClientHomepage();
}

class _MyClientHomepage extends State<MyClientHomepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.deepOrange[600],
            title: Text("Travel",
                style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway')),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
              ),
              TextButton(
                  onPressed: () {},
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.orange[800]),
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyReservations()));
                  },
                  child: Text(
                    'Reservations',
                    style: TextStyle(color: Colors.white),
                  )),
            ]),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
          AppBar(
              toolbarHeight: 40,
              backgroundColor: Colors.grey[350],
              title: Row(children: <Widget>[
                Text("App",
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway')),
              ]),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 23),
                ),
                Container(
                    width: 200,
                    child: TextField(
                        selectionHeightStyle: BoxHeightStyle.tight,
                        decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(
                              Icons.search,
                              size: 25,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: Colors.grey[300],
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.green[800]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.green[800]),
                            ))))
              ]),
          Center(
            child: Container(
                width: 300,
                height: 180,
                child: Row(children: <Widget>[
                  Container(
                    width: 150,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Text(
                            '\n\n\n  Welcome!',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        Text(
                          'Discover the best\noffers and travel\naround the\nworld!',
                          style:
                              TextStyle(color: Colors.green[600], fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Image(
                      image: AssetImage('assets/earth.png'),
                      width: 150,
                      height: 150),
                ])),
          ),
           Positioned.fill(
             // width: (MediaQuery.of(context).size.width),
            
                      child: Image(
                        image: AssetImage('assets/HomeC.png'),
                        width: (MediaQuery.of(context).size.width),
                        alignment: Alignment.bottomCenter,
                      ))
        ]),
      ),
    );
  }
}
