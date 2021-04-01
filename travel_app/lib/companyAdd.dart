import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/reservation.dart';
import 'package:travel_app/services/imageService.dart';
//import 'package:path/path.dart'

class MyCompanyAdd extends StatefulWidget {
  @override
  _MyCompanyAddState createState() => new _MyCompanyAddState();
}

class _MyCompanyAddState extends State<MyCompanyAdd> {
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                    'Customize',
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
          ),
          Container(
              height: 170,
              child: ListView(
                  padding: EdgeInsets.only(right: 30, left: 30),
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Text('\n\n'),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.brown[50],
                            border: Border.all(
                              color: Colors.deepOrange[600],
                            )),
                        height: 200,
                        //width: (MediaQuery.of(context).size.width - 100),
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: ListView(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.brown[50],
                                  ),
                                  height: 150,
                                  child: Row(children: <Widget>[
                                    IconButton(
                                        onPressed: () {
                                          uploadImage();
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          size: 40,
                                          color: Colors.deepOrange[600],
                                        )),
                                  ]))
                            ]))
                  ]))
        ]));
  }
}
