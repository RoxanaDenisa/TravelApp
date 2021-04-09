import 'package:flutter/material.dart';
import 'package:travel_app/TextFieldWidget.dart';
import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/clientHomepage.dart';
import 'package:travel_app/companyAdd.dart';
import 'package:travel_app/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => new _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.deepOrange[600],
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(
            left: 45,
            right: 45,
            top: (MediaQuery.of(context).size.height * 1 / 14)),
        children: <Widget>[
          Image(image: AssetImage('assets/logo.png'), width: 200, height: 200),
          Text('\n', style: TextStyle(fontSize: 4)),
          TextFieldWidget(
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
            hintText: 'Email',
            obscureText: false,
            lines: 1,
            prefixIconData: Icons.person,
          ),
          Text('\n', style: TextStyle(fontSize: 4)),
          TextFieldWidget(
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
            hintText: 'Password',
            obscureText: true,
            lines: 1,
            prefixIconData: Icons.vpn_key,
          ),
          Text('\n', style: TextStyle(fontSize: 10)),
          Container(
              height: 80,
              child: ListView(
                padding: EdgeInsets.only(left: 60, right: 60),
                children: <Widget>[
                  ButtonWidget(
                      onPressed: () async {
                        try{
                          User user=(
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email, password: _password)).user;
                            if(user!=null)
                            {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        String uid = auth.currentUser.uid.toString();

                        CollectionReference collectionReference =
                            FirebaseFirestore.instance.collection('Users');
                        // ignore: missing_return
                        collectionReference.snapshots().listen((snapshot) {
                          for (int i = 0; i < snapshot.size; i++) {
                            if (snapshot.docs[i]['uid'] ==
                                uid) if (snapshot.docs[i]['Customer'] == true) {
                              print(uid);

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyClientHomepage()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyCompanyAdd()));
                            }
                          }
                        });
                            }} catch (e){
                                print(e);
                                _email="";
                                _password="";
                            }
                      },
                      title: 'Login')
                ],
              ))
        ],
      ),
      bottomNavigationBar: Container(
          height: 100,
          alignment: Alignment.bottomCenter,
          width: (MediaQuery.of(context).size.width),
          child: Column(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MySignUp()));
                },
                splashColor: Colors.white,
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                ),
                iconSize: 40.0,
              ),
              Text(
                'If you do not have an account, you can join right now !',
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
