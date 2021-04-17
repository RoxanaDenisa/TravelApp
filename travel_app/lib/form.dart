import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/TextFieldWidget.dart';
import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/infoForm.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/authenticationService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:travel_app/objects/rooms.dart';
import 'package:travel_app/providers/reservation_provider.dart';
import 'package:travel_app/textFieldWidget2.dart';
import 'package:uuid/uuid.dart';

class MyForm extends StatefulWidget {
  final String roomUID;
  MyForm(this.roomUID);
  @override
  _MyForm createState() => new _MyForm();
}

class _MyForm extends State<MyForm> {
  int p = 0;
  @override
  Widget build(BuildContext context) {
    final rooms = Provider.of<List<MyRooms>>(context);
    final room = select(rooms, widget.roomUID);
    final reservationProvider = Provider.of<ReservationProvider>(context);
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.deepOrange[600]),
      body: Center(
          child: Container(
        width: 270,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Text(
              'Reservation Form',
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
            TextFieldWidget(
              hintText: 'Name',
              obscureText: false,
              lines: 1,
              onChanged: (value) {
                reservationProvider.setname(value);
              },
            ),
            Text('\n', style: TextStyle(fontSize: 2)),
            TextFieldWidget(
              hintText: 'Number of people',
              lines: 1,
              obscureText: false,
              onChanged: (value) {
                reservationProvider.setNrPersoane(value);
              },
            ),
            Text('\n', style: TextStyle(fontSize: 2)),
            TextFieldWidget(
              lines: 1,
              hintText: 'Check in date',
              obscureText: false,
              onChanged: (value) {
                reservationProvider.setPerioada(value);
              },
            ),
            Text('\n', style: TextStyle(fontSize: 2)),
            TextFieldWidget2(
              lines: 1,
              hintText: 'Number of days',
              obscureText: false,
              onChanged: (value) {
                int v = int.parse(value);
                MyRooms x = select(rooms, widget.roomUID);
                reservationProvider.setTipCamera(x.uid);

                p = v * x.price;
                print('$p');
                reservationProvider.setPret(p);
                reservationProvider.setNrZile(v);
              },
            ),
            Text('\n', style: TextStyle(fontSize: 2)),
            Text('\n', style: TextStyle(fontSize: 2)),
            ButtonWidget(
              title: 'Next',
              onPressed: () {
                var u = Uuid().v1();
                reservationProvider.setStatus('In progress');
                reservationProvider.setUID(u);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MyInfoForm(reservationProvider, '$p')));
              },
            )
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
