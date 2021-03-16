import 'package:flutter/material.dart';
import 'package:travel_app/TextFieldWidget.dart';
import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/login.dart';

class MySignUp extends StatefulWidget {
  @override
  _MySignUp createState() => new _MySignUp();
}

class _MySignUp extends State<MySignUp> {
  bool checkBoxValue = false;
  bool checkBoxValue2 = false;
  @override
  Widget build(BuildContext context) {
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
              'SignUp',
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
            Text('\n', style: TextStyle(fontSize: 2)),
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
      floatingActionButton: IconButton(
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
    );
  }
}
