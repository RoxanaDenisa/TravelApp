import 'dart:ui';

import 'package:flutter/material.dart';

class MyReservations extends StatefulWidget {
  @override
  _MyReservations createState() => new _MyReservations();
}

class _MyReservations extends State<MyReservations> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                toolbarHeight: 50,
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
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.orange[800]),
                      child: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reservations',
                        style: TextStyle(color: Colors.white),
                      )),
                ]),
            body: Column(children: <Widget>[
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
                                  size: 25,
                                  color: Colors.black,
                                ),
                                filled: true,
                                fillColor: Colors.grey[300],
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide:
                                      BorderSide(color: Colors.green[800]),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide:
                                      BorderSide(color: Colors.green[800]),
                                ))))
                  ]),
              Center(
                  child: Container(
                      width: 275,
                      height: 40,
                      child: Center(
                          child: Row(children: <Widget>[
                        Icon(Icons.add_circle,
                            size: 12, color: Colors.lightGreenAccent[400]),
                        Text(
                          '- add a photo with payment          \n earnest confirmation',
                          style: TextStyle(fontSize: 10),
                        ),
                        Icon(Icons.cancel, size: 12, color: Colors.red),
                        Text(
                          '- cancel the reservation',
                          style: TextStyle(fontSize: 10),
                        )
                      ])))),
              Center(
                  child: DataTable(
                columns: <DataColumn>[
                  DataColumn(label: Text('Hotel name '), numeric: false),
                  DataColumn(label: Text('Date '), numeric: false),
                  DataColumn(label: Text('Price '), numeric: false),
                  DataColumn(label: Text('Status '), numeric: false),
                ],
                rows: <DataRow>[
                  DataRow(cells: <DataCell>[
                    DataCell(Text('Hilton Hotel London')),
                    DataCell(Text('20.05.2020 - 25.05.2020   ')),
                    DataCell(Text('500')),
                    DataCell(Text('Passed')),
                  ])
                ],
              ))
            ])));
  }
}
