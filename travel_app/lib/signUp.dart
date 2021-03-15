import 'package:flutter/material.dart';
import 'package:travel_app/TextFieldWidget.dart';
import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/login.dart';

class MySignUp extends StatefulWidget {
  @override
  _MySignUpState createState() => new _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  bool checkBoxValue = false;
  bool checkBoxValue2 = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                //padding: EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 0),
                child: Stack(children: <Widget>[
              Container(
                height: 65,
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                color: Colors.deepOrange[600],
              ),
              Container(
                padding: EdgeInsets.only(top: 45.0, right: 100.0),
                child: Image(
                  image: AssetImage('assets/Sign_up.png'),
                  width: 200,
                  height: 50,
                ),
              ),
            ])),
            Center(
                child: Container(
              width: 260,
              child: Column(
                children: <Widget>[
                  TextFieldWidget(
                      hintText: 'Name',
                      obscureText: false,
                      prefixIconData: Icons.verified_user),
                  Text('\n', style: TextStyle(fontSize: 2)),
                  TextFieldWidget(
                    hintText: 'Username',
                    obscureText: false,
                    prefixIconData: Icons.person,
                  ),
                  Text('\n', style: TextStyle(fontSize: 2)),
                  TextFieldWidget(
                    hintText: 'Password',
                    obscureText: true,
                    prefixIconData: Icons.vpn_key,
                  ),
                  Text('\n', style: TextStyle(fontSize: 4)),
                  TextFieldWidget(
                    hintText: 'Phone Number',
                    obscureText: false,
                    prefixIconData: Icons.phone,
                  ),
                  Text('\n', style: TextStyle(fontSize: 2)),
                  TextFieldWidget(
                    hintText: 'Email',
                    obscureText: false,
                    prefixIconData: Icons.email,
                  ),
                  Text('\n', style: TextStyle(fontSize: 2)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Customer', style: TextStyle(fontSize: 14)),
                      Checkbox(
                        value: checkBoxValue,
                        onChanged: (bool value) {
                          print(value);
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
                          print(value);
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
                  ButtonWidget(
                    title: 'Create',
                    onPressed: () {},
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.only(left: 250.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyLogin()));
                },
                splashColor: Colors.grey[600],
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.grey[600],
                ),
                iconSize: 40,
              ),
            )
          ],
        ));
  }
}
