import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/clientHomepage.dart';
import 'package:travel_app/form.dart';
import 'package:travel_app/objects/companyInfo.dart';
import 'package:travel_app/objects/images.dart';
import 'package:travel_app/objects/rooms.dart';
import 'package:travel_app/providers/companyInfo_provider.dart';
import 'package:travel_app/providers/images_provider.dart';
import 'package:travel_app/providers/rooms_provider.dart';
import 'package:travel_app/reservation.dart';

class MyHotelClient extends StatefulWidget {
  final String uid;
  MyHotelClient(this.uid);
  @override
  _MyHotelClient createState() => new _MyHotelClient();
}

class _MyHotelClient extends State<MyHotelClient> {
  @override
  Widget build(BuildContext context) {
    final room = Provider.of<List<MyRooms>>(context);
    final roomSel = select2(room, widget.uid);
    final companyInfo = Provider.of<List<MyCompanyInfo>>(context);
    final MyCompanyInfo mci = getData(companyInfo, widget.uid);
    final imgs = Provider.of<List<MyImages>>(context);
    final img = select(imgs, widget.uid);
    return new Scaffold(
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
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyClientHomepage()));
                  },
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
        body: (img != null &&
                imgs != null &&
                room != null &&
                mci != null &&
                companyInfo != null)
            ? ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    AppBar(
                        automaticallyImplyLeading: false,
                        toolbarHeight: 40,
                        backgroundColor: Colors.grey[350],
                        title: Row(children: <Widget>[
                          Text("      App",
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
                        ]),
                    Container(
                        height: (MediaQuery.of(context).size.height * 2 / 3),
                        child: ListView(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Text(
                                '\n',
                                style: TextStyle(fontSize: 7),
                              ),
                              Center(
                                  child: Container(
                                      child: Column(children: <Widget>[
                                Text(
                                  mci.name,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  mci.location,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  '\n',
                                  style: TextStyle(fontSize: 7),
                                ),
                              ]))),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.brown[50],
                                      border: Border.all(
                                        color: Colors.deepOrange[600],
                                      )),
                                  height: 250,
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                              color: Colors.brown[50],
                                            ),
                                            height: 200,
                                            child: Row(children: <Widget>[
                                              Row(
                                                  children: List<Row>.generate(
                                                      img.length,
                                                      (index) => Row(children: [
                                                            Image.network(
                                                                img[index]
                                                                    .image,
                                                                height: 180),
                                                            Text('    ')
                                                          ])))
                                            ])),
                                      ])),
                              Text(
                                '\n',
                                style: TextStyle(fontSize: 10),
                              ),
                              Container(
                                  height: (MediaQuery.of(context).size.height *
                                      1 /
                                      3),
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        DataTable(
                                            headingRowColor:
                                                MaterialStateColor.resolveWith(
                                                    (state) {
                                              return Colors.deepOrange[600];
                                            }),
                                            headingTextStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            columns: <DataColumn>[
                                              DataColumn(
                                                  label: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      child: Text(
                                                        'Type',
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                  numeric: false),
                                              DataColumn(
                                                  label: Container(
                                                      width: 40,
                                                      child: Text(
                                                        'Price',
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                  numeric: false),
                                              DataColumn(
                                                  label: Container(
                                                      width: 70,
                                                      child: Text(
                                                        'Benefits',
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                  numeric: false),
                                              DataColumn(
                                                  label: Container(
                                                      width: 40,
                                                      child: Text(
                                                        '    ',
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                  numeric: false),
                                            ],
                                            rows: List<DataRow>.generate(
                                                roomSel.length,
                                                (index) =>
                                                    DataRow(cells: <DataCell>[
                                                      DataCell(Container(
                                                          width: 50,
                                                          child: Text(
                                                              roomSel[index]
                                                                  .type))),
                                                      DataCell(Container(
                                                          width: 40,
                                                          child: Text(roomSel[
                                                                  index]
                                                              .getPriceString()))),
                                                      DataCell(Container(
                                                          width: 70,
                                                          child: Text(
                                                              roomSel[index]
                                                                  .benefits))),
                                                      DataCell(MaterialButton(
                                                        color: Colors.green,
                                                        textColor: Colors.white,
                                                        child: Text('Take it!'),
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      MyForm(roomSel[
                                                                              index]
                                                                          .uid)));
                                                        },
                                                      ))
                                                    ]))),
                                      ]))
                            ]))
                  ]);
                })
            : Center(child: CircularProgressIndicator()));
  }

  List<MyImages> select(List<MyImages> imgs, String u) {
    List<MyImages> l = [];
    if ((imgs != null))
      for (int i = 0; i < imgs.length; i++)
        if (imgs[i].uid == u) {
          l.add(imgs[i]);
        }
    return l;
  }

  List<MyRooms> select2(List<MyRooms> r, String u) {
    List<MyRooms> l = [];
    if ((r != null))
      for (int i = 0; i < r.length; i++)
        if (r[i].uidHotel == u) {
          l.add(r[i]);
        }
    return l;
  }

  MyCompanyInfo getData(List<MyCompanyInfo> x, String u) {
    int i;
    if (x != null) {
      for (i = 0; i < x.length && x[i].uid != u; i++);
      if (x.length == i)
        return null;
      else
        return x[i];
    }
    return null;
  }
}
