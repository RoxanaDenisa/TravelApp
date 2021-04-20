import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/clientHomepage.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/objects/companyInfo.dart';
import 'package:travel_app/objects/reservation.dart';
import 'package:travel_app/objects/rooms.dart';
import 'package:travel_app/providers/reservation_provider.dart';

class MyReservations extends StatefulWidget {
  @override
  _MyReservations createState() => new _MyReservations();
}

class _MyReservations extends State<MyReservations> {
  @override
  Widget build(BuildContext context) {
    final resp = Provider.of<List<Reservation>>(context);
    final res = select2(resp, FirebaseAuth.instance.currentUser.uid.toString());
    final ci = Provider.of<List<MyCompanyInfo>>(context);
    final room = Provider.of<List<MyRooms>>(context);
    final reservationProvider = Provider.of<ReservationProvider>(context);
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyClientHomepage()));
                      },
                      child: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyReservations()));
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.orange[800]),
                      child: Text(
                        'Reservations',
                        style: TextStyle(color: Colors.white),
                      )),
                ]),
            body: (res != null && ci != null)
                ? Column(children: <Widget>[
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
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyLogin()));
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.logout,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Logout',
                                )
                              ],
                            ),
                          )
                        ]),
                    Center(
                        child: Container(
                            width: 275,
                            height: 40,
                            child: Center(
                                child: Row(children: <Widget>[
                              Icon(Icons.cancel, size: 12, color: Colors.red),
                              Text(
                                '- cancel the reservation',
                                style: TextStyle(fontSize: 10),
                              )
                            ])))),
                    Container(
                        width: (MediaQuery.of(context).size.width * 9 / 10),
                        height: (MediaQuery.of(context).size.height * 2 / 3),
                        child: ListView(
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Container(
                                  width: 300,
                                  height: (MediaQuery.of(context).size.height *
                                      2 /
                                      3),
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        DataTable(
                                            headingRowColor:
                                                MaterialStateColor.resolveWith(
                                                    (state) {
                                              return Colors.orange[800];
                                            }),
                                            headingTextStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            columns: <DataColumn>[
                                              DataColumn(
                                                  label: Text('Hotel name'),
                                                  numeric: false),
                                              DataColumn(
                                                  label: Text('Check In Date'),
                                                  numeric: false),
                                              DataColumn(
                                                  label: Text('Price'),
                                                  numeric: false),
                                              DataColumn(
                                                  label: Text('    Status'),
                                                  numeric: false),
                                            ],
                                            rows: List<DataRow>.generate(
                                                res.length,
                                                (index) =>
                                                    DataRow(cells: <DataCell>[
                                                      DataCell(Container(
                                                          width: 80,
                                                          child: Text(getHotelName(
                                                              room,
                                                              ci,
                                                              res[index]
                                                                  .tipCamera)))),
                                                      DataCell(Container(
                                                          width: 80,
                                                          child: Text(res[index]
                                                              .perioada))),
                                                      DataCell(Container(
                                                          width: 70,
                                                          child: Text(res[index]
                                                                  .getPriceString() +
                                                              ' euro'))),
                                                      DataCell(Container(
                                                          child: Column(
                                                              children: [
                                                            Text(res[index]
                                                                .status),
                                                            (res[index].status ==
                                                                    'In progress')
                                                                ? Container(
                                                                    height: 30,
                                                                    child: Row(
                                                                        children: [
                                                                          IconButton(
                                                                            icon:
                                                                                Icon(
                                                                              Icons.cancel,
                                                                              color: Colors.red,
                                                                              size: 20,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              reservationProvider.deleteReservation(res[index]);
                                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyReservations()));
                                                                            },
                                                                          ),
                                                                        ]))
                                                                : Container(
                                                                    width: 0,
                                                                    height: 0)
                                                          ])))
                                                    ]))),
                                      ]))
                            ]))
                  ])
                : Center(child: CircularProgressIndicator())));
  }

  List<Reservation> select2(List<Reservation> room, String u) {
    List<Reservation> l = [];
    if ((room != null))
      for (int i = 0; i < room.length; i++)
        if (room[i].uidClient == u) {
          l.add(room[i]);
        }
    return l;
  }

  String getHotelName(List<MyRooms> room, List<MyCompanyInfo> hotel, String u) {
    if (hotel != null && room != null) {
      int i;
      for (i = 0; i < room.length && (room[i].uid != u); i++);
      if (i != room.length) {
        for (int j = 0; j < hotel.length; j++)
          if (room[i].uidHotel == hotel[j].uid)
            return hotel[j].name + ' ' + hotel[j].location;
      }
      return 'The room was removed';
    }
    return 'The room was removed';
  }
}
