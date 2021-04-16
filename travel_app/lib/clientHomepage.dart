//import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/objects/images.dart';
import 'package:travel_app/providers/companyInfo_provider.dart';
import 'package:travel_app/reservation.dart';
import 'package:travel_app/services/searchService.dart';

class MyClientHomepage extends StatefulWidget {
  @override
  _MyClientHomepage createState() => new _MyClientHomepage();
}

class _MyClientHomepage extends State<MyClientHomepage> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByLocation(value).then((QuerySnapshot doc) {
        for (int i = 0; i < doc.docs.length; ++i) {
          queryResultSet.add(doc.docs[i].data());
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['location'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot doc) {
        for (int i = 0; i < doc.docs.length; ++i) {
          queryResultSet.add(doc.docs[i].data());
        }
      });
    } else {
      queryResultSet.forEach((element) {
        if (element['name'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final imgs = Provider.of<List<MyImages>>(context);
    final img = select(imgs, FirebaseAuth.instance.currentUser.uid.toString());
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
        body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          AppBar(
              toolbarHeight: 45,
              backgroundColor: Colors.grey[350],
              title: Text("App",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway')),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                        height: 40,
                        width: 200,
                        child: TextField(
                            onChanged: (value) {
                              initiateSearch(value);
                            },
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
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide:
                                      BorderSide(color: Colors.green[800]),
                                ))))),
              ]),
          Text(
            '\n',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          if (tempSearchStore.length != 0)
            GridView.count(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                primary: false,
                shrinkWrap: true,
                children: tempSearchStore.map((element) {
                  return MaterialButton(
                      minWidth: 100,
                      height: 100,
                      color: Colors.grey[200],
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 2.0,
                      child: Center(
                          child: Container(
                              height: 100,
                              width: 100,
                              child: Column(children: <Widget>[
                                Text(
                                  element['name'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                ),
                                Text(
                                  element['location'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                                Text('\n',
                                    style: TextStyle(
                                      fontSize: 4.0,
                                    )),
                                if (select(imgs, element['uid']) != null)
                                  Image.network(select(imgs, element['uid']),
                                      height: 50)
                                else
                                  Icon(
                                    Icons.image_not_supported_sharp,
                                    size: 30,
                                    color: Colors.black,
                                  )
                              ]))));
                }).toList())
          else
            Column(
              children: <Widget>[
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
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                              Text(
                                'Discover the best\noffers and travel\naround the\nworld!',
                                style: TextStyle(
                                    color: Colors.green[600], fontSize: 18),
                              ),
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
              ],
            )
        ]),
      ),
    );
  }

  Widget buildResultCard(data) {}

  String select(List<MyImages> imgs, String u) {
    int i;
    if (imgs != null) for (i = 0; i < imgs.length && imgs[i].uid != u; i++);
    print(i);

    if (imgs.length == i)
      return null;
    else
      return imgs[i].image;
  }
}
