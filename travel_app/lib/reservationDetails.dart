import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/TextFieldWidget.dart';
import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/clientHomepage.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/authenticationService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:travel_app/objects/reservation.dart';
import 'package:travel_app/objects/rooms.dart';
import 'package:travel_app/providers/reservation_provider.dart';
import 'package:travel_app/textFieldWidget2.dart';
import 'package:uuid/uuid.dart';

class MyReservationDetails extends StatefulWidget {
  final Reservation reservation;
  MyReservationDetails(this.reservation);
  @override
  _MyReservationDetails createState() => new _MyReservationDetails();
}

class _MyReservationDetails extends State<MyReservationDetails> {
  @override
  Widget build(BuildContext context) {
    final room = Provider.of<List<MyRooms>>(context);
    final roomSel = select(room, widget.reservation.tipCamera);
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.deepOrange[600]),
      body: Center(
          child: Container(
        width: 270,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Details',
              style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        offset: Offset(4, 1))
                  ]),
            ),
            Text('\n', style: TextStyle(fontSize: 10)),
            Text('Nume:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange[600])),
            Text(widget.reservation.name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text('Check In Data:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange[600])),
            Text(widget.reservation.perioada,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text('Total price:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange[600])),
            Text(widget.reservation.getPriceString() + ' euro',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text('Number of people:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange[600])),
            Text(widget.reservation.nrPersoane,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text('Number of days:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange[600])),
            Text(widget.reservation.getDaysString(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text('Room :',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange[600])),
            Text('Type: ' + roomSel.type,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text('Benefits: ' + roomSel.benefits,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
           
          ],
        ),
      )),
    );
  }

  MyRooms select(List<MyRooms> room, String u) {
    if ((room != null))
      for (int i = 0; i < room.length; i++)
        if (room[i].uid == u) {
          return room[i];
        }

    return null;
  }
}
