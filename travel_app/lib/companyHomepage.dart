import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/companyAdd.dart';
import 'package:travel_app/objects/companyInfo.dart';
import 'package:travel_app/providers/companyInfo_provider.dart';
import 'package:travel_app/providers/rooms_provider.dart';
import 'package:travel_app/textFieldWidget.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_app/objects/images.dart';
import 'package:travel_app/reservation.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/images_provider.dart';
import 'dart:ui' as ui;

class MyCompanyHome extends StatefulWidget {
  MyCompanyHome();
  @override
  _MyCompanyHomeState createState() => new _MyCompanyHomeState();
}

class _MyCompanyHomeState extends State<MyCompanyHome> {
  @override
  Widget build(BuildContext context) {
    final ciProvider = Provider.of<CompanyInfoProvider>(context);
    final ci=Provider.of<List<MyCompanyInfo>>(context);
    final currentInfo=select(ci,FirebaseAuth.instance.currentUser.uid.toString());
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
                 style:
                      TextButton.styleFrom(backgroundColor: Colors.orange[800]),
                  onPressed: () {

                  },
                  
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  
                  onPressed: () {
                    if(currentInfo==null)
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyCompanyAdd()));
                    else
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyCompanyAdd(currentInfo)));
                  },
                  child: Text(
                    'Customize',
                    style: TextStyle(color: Colors.white),
                  )),
            ]),
     body: ListView.builder(
        itemCount:1,
        itemBuilder: (context,index){
        return Column(children: <Widget>[
          AppBar(
            toolbarHeight: 40,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey[350],
            title: Row(children: <Widget>[
              Text("       App",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway')),
            ]),
          ),
          Container(
                  )
        ]
        );
        })
        );}
       MyCompanyInfo select(List<MyCompanyInfo> imgs,String u){
         
          if((imgs!=null))
          for(int i=0;i<imgs.length;i++)
          if(imgs[i].uid==u)
          {
              return imgs[i];
          }
          return null;
        }
  }

