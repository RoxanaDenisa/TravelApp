import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/TextFieldWidget.dart';
import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/authenticationService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MySignUp extends StatefulWidget {
  @override
  _MySignUp createState() => new _MySignUp();
}

class _MySignUp extends State<MySignUp> {
  bool checkBoxValue = false;
  bool checkBoxValue2 = false;
  String email, password = '', name, uname, phone;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.deepOrange[600]),
      body: ListView(
        padding: EdgeInsets.only(
            top: (MediaQuery.of(context).size.width * 1 / 5),
            left: 40,
            right: 40),
        children: <Widget>[
          Text(
            'SignUp',
            textAlign: TextAlign.center,
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
          Container(
            width: 280,
            child: TextField(
              key: Key("value"),
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Name",
                prefixIcon: Icon(
                  Icons.verified_user,
                  size: 18,
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.deepOrange[200],
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.green[800]),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.green[800]),
                ),
              ),
              onChanged: (value) {
                setState(() => name = value);
              },
            ),
          ),
          Text('\n', style: TextStyle(fontSize: 2)),
          Container(
            width: 280,
            child: TextFieldWidget(
              hintText: 'Username',
              lines: 1,
              obscureText: false,
              prefixIconData: Icons.person,
              onChanged: (value) {
                setState(() => uname = value);
              },
            ),
          ),
          Text('\n', style: TextStyle(fontSize: 2)),
          Container(
            width: 280,
            child: TextField(
              key: Key("password"),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.vpn_key_sharp,
                  size: 18,
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.deepOrange[200],
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.green[800]),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.green[800]),
                ),
              ),
              onChanged: (value) {
                setState(() => password = value);
              },
            ),
          ),
          Text('\n', style: TextStyle(fontSize: 2)),
          Container(
            width: 280,
            child: TextFieldWidget(
              lines: 1,
              hintText: 'Phone Number',
              obscureText: false,
              prefixIconData: Icons.phone,
              onChanged: (value) {
                setState(() => phone = value);
              },
            ),
          ),
          Text('\n', style: TextStyle(fontSize: 2)),
          Container(
            width: 280,
            child: TextFieldWidget(
              lines: 1,
              hintText: 'Email',
              obscureText: false,
              prefixIconData: Icons.email,
              onChanged: (value) {
                setState(() => email = value);
              },
            ),
          ),
          Text('\n', style: TextStyle(fontSize: 2)),
          Container(
            width: 280,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Customer', style: TextStyle(fontSize: 14)),
                Checkbox(
                  value: checkBoxValue,
                  onChanged: (bool value) {
                    setState(() {
                      checkBoxValue = value;
                      if (checkBoxValue == true) {
                        checkBoxValue2 = false;
                      }
                    });
                  },
                  activeColor: Colors.green[700],
                ),
                Text('Company', style: TextStyle(fontSize: 14)),
                Checkbox(
                  value: checkBoxValue2,
                  onChanged: (bool value) {
                    setState(() {
                      checkBoxValue2 = value;
                      if (checkBoxValue2 == true) {
                        checkBoxValue = false;
                      }
                    });
                  },
                  activeColor: Colors.green[700],
                ),
              ],
            ),
          ),
          ButtonWidget(
            title: 'Create',
            onPressed: () async {
              int sw = 0;
              if (password.length > 6 && sw == 0) {
                try {
                  await Firebase.initializeApp();
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email, password: password);
                  User updateUser = FirebaseAuth.instance.currentUser;
                  updateUser.updateProfile(displayName: name);
                  userSetup(
                      name, email, phone, uname, checkBoxValue, checkBoxValue2);
                } on FirebaseAuthException catch (_) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MySignUp()));
                } catch (e) {
                  print(e.toString());
                }
              } else
                print('nu');
            },
          ),
          Text('\n', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
