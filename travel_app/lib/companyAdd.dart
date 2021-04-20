import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/companyHomepage.dart';
import 'package:travel_app/objects/companyInfo.dart';
import 'package:travel_app/objects/rooms.dart';
import 'package:travel_app/providers/companyInfo_provider.dart';
import 'package:travel_app/providers/rooms_provider.dart';
import 'package:travel_app/textFieldWidget.dart';
import 'package:travel_app/textFieldWidget2.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_app/objects/images.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/images_provider.dart';
import 'dart:ui' as ui;

class MyCompanyAdd extends StatefulWidget {
  final MyCompanyInfo companyInfo;
  MyCompanyAdd([this.companyInfo]);
  @override
  _MyCompanyAddState createState() => new _MyCompanyAddState();
}

class _MyCompanyAddState extends State<MyCompanyAdd> {
  String imageURL;
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.companyInfo == null) {
      nameController.text = "";
      locationController.text = "";
      new Future.delayed(Duration.zero, () {
        final companyInfoProvider =
            Provider.of<CompanyInfoProvider>(context, listen: false);
        companyInfoProvider.loadValues(MyCompanyInfo());
      });
    } else {
      nameController.text = widget.companyInfo.name;
      locationController.text = widget.companyInfo.location;

      new Future.delayed(Duration.zero, () {
        final medicineProvider =
            Provider.of<CompanyInfoProvider>(context, listen: false);
        medicineProvider.loadValues(widget.companyInfo);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagesProvider>(context);
    final roomsProvider = Provider.of<RoomsProvider>(context);
    final rooms = Provider.of<List<MyRooms>>(context);
    final room =
        select2(rooms, FirebaseAuth.instance.currentUser.uid.toString());
    final companyInfoProvider = Provider.of<CompanyInfoProvider>(context);
    final imgs = Provider.of<List<MyImages>>(context);
    final img = select(imgs, FirebaseAuth.instance.currentUser.uid.toString());
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
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyCompanyHome()));
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.orange[800]),
                  onPressed: () {},
                  child: Text(
                    'Customize',
                    style: TextStyle(color: Colors.white),
                  )),
            ]),
        body: (img != null && imgs != null && room != null)
            ? ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
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
                        height: (MediaQuery.of(context).size.height * 2 / 3),
                        child: ListView(
                            padding: EdgeInsets.only(right: 30, left: 30),
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Text(
                                '\n',
                                style: TextStyle(fontSize: 7),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.brown[50],
                                      border: Border.all(
                                        color: Colors.deepOrange[600],
                                      )),
                                  height: 250,
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  child: ListView(
                                      padding:
                                          EdgeInsets.only(left: 30, right: 30),
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                              color: Colors.brown[50],
                                            ),
                                            height: 200,
                                            child: Row(children: <Widget>[
                                              IconButton(
                                                  onPressed: () async {
                                                    final _picker =
                                                        ImagePicker();
                                                    final _storage =
                                                        FirebaseStorage
                                                            .instance;
                                                    PickedFile image;
                                                    //check permission
                                                    await Permission.photos.request();
                                                    var permissionStatus =
                                                        await Permission
                                                            .photos.status;
                                                    if (permissionStatus
                                                        .isGranted) {
                                                      //select image
                                                      image = await _picker.getImage(source: ImageSource.gallery);

                                                      if (image != null) {
                                                        //upload to firebase
                                                        String uuid = Uuid().v1();
                                                        var file =File(image.path);
                                                        var snapshot =
                                                            await _storage
                                                                .ref()
                                                                .child('images')
                                                                .child(uuid)
                                                                .putFile(file);
                                                        var downloadURL =
                                                            await snapshot.ref.getDownloadURL();
                                                        //print(downloadURL);
                                                        setState(() {
                                                          imageURL =downloadURL;
                                                        });
                                                        imageProvider
                                                            .setImage(imageURL);
                                                        imageProvider.setUID(
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser
                                                                .uid);

                                                        String uuuid =
                                                            Uuid().v1();
                                                        imageProvider
                                                            .setProdId(uuuid);
                                                        imageProvider.toSave();
                                                        print(imageURL);
                                                      } else {
                                                        print(
                                                            'no path received');
                                                      }
                                                    } else {
                                                      print(
                                                          'grant permissions and try again');
                                                    }
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                    size: 40,
                                                    color:
                                                        Colors.deepOrange[600],
                                                  )),
                                              Text('           '),
                                              Row(
                                                  children: List<Row>.generate(
                                                      img.length,
                                                      (index) => Row(
                                                            children: [
                                                              Image.network(
                                                                  img[index]
                                                                      .image,
                                                                  height: 180),
                                                              Column(
                                                                children: [
                                                                  IconButton(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .cancel_outlined,
                                                                        size:
                                                                            40,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        imageProvider
                                                                            .deleteImage(img[index]);
                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                MyCompanyAdd(widget.companyInfo)));
                                                                      })
                                                                ],
                                                              ),
                                                              Text('       ')
                                                            ],
                                                          )))
                                            ]))
                                      ])),
                              Text(
                                '\nLocation:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green[600],
                                    fontWeight: FontWeight.bold),
                              ),
                              TextField(
                                selectionHeightStyle: ui.BoxHeightStyle.tight,
                                controller: locationController,
                                onChanged: (value) {
                                  companyInfoProvider.setSearchKey(value[0]);
                                  companyInfoProvider.setLocation(value);
                                },
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.green[800]),
                                )),
                              ),
                              Text(
                                '\nComplete Name:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green[600],
                                    fontWeight: FontWeight.bold),
                              ),
                              TextField(
                                controller: nameController,
                                selectionHeightStyle: ui.BoxHeightStyle.tight,
                                onChanged: (value) {
                                  companyInfoProvider.setSearchKey2(value[0]);
                                  companyInfoProvider.setName(value);
                                },
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.green[800]),
                                )),
                              ),
                              Text(
                                '\n',
                                style: TextStyle(fontSize: 5),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: 10,
                                    left: (MediaQuery.of(context).size.width * 1 /2)),
                                width: 40,
                                height: 20,
                                child: MaterialButton(
                                  height: 20,
                                  onPressed: () {
                                    companyInfoProvider.setUID(FirebaseAuth
                                        .instance.currentUser.uid
                                        .toString());
                                    companyInfoProvider.toSave();
                                  },
                                  child: Text(
                                    'Upgrade',
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white),
                                  ),
                                  color: Colors.green[700],
                                ),
                              ),
                              Text('\n'),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.brown[50],
                                      border: Border.all(
                                        color: Colors.deepOrange[600],
                                      )),
                                  height: 350,
                                  width: 270,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 25, right: 25),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            '\nRoom Type',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green[700],
                                                fontSize: 20),
                                          ),
                                          TextFieldWidget(
                                            obscureText: false,
                                            hintText: '',
                                            lines: 1,
                                            onChanged: (value) {
                                              roomsProvider.setType(value);
                                            },
                                          ),
                                          Text(
                                            'Price/night',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green[700],
                                                fontSize: 20),
                                          ),
                                          TextFieldWidget2(
                                            lines: 1,
                                            obscureText: false,
                                            hintText: '',
                                            onChanged: (value) {
                                              roomsProvider
                                                  .setPrice(int.parse(value));
                                            },
                                          ),
                                          Text(
                                            'Benefits',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green[700],
                                                fontSize: 20),
                                          ),
                                          TextFieldWidget(
                                            lines: 3,
                                            obscureText: false,
                                            hintText: '',
                                            onChanged: (value) {
                                              roomsProvider.setBenefits(value);
                                            },
                                          ),
                                          Text(
                                            '\n',
                                            style: TextStyle(fontSize: 8),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30, right: 30),
                                              child: ButtonWidget(
                                                onPressed: () {
                                                  String u = Uuid().v1();
                                                  roomsProvider.setUID(u);
                                                  roomsProvider.setUidHotel(
                                                      FirebaseAuth.instance
                                                          .currentUser.uid
                                                          .toString());
                                                  roomsProvider.toSave();
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyCompanyAdd(widget.companyInfo)));
                                                },
                                                title: 'Save',
                                              )),
                                        ],
                                      ))),
                              Column(
                                  children: List<Column>.generate(
                                      room.length,
                                      (index) => Column(
                                            children: [
                                              Text('\n'),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.brown[50],
                                                      border: Border.all(
                                                        color: Colors.deepOrange[600],
                                                      )),
                                                  height: 230,
                                                  width: 270,
                                                  child:Column(children: <Widget>[
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: IconButton(
                                                          icon: Icon(
                                                            Icons.cancel,
                                                            size: 25,
                                                            color: Colors.deepOrange[600],
                                                          ),
                                                          onPressed: () {
                                                            roomsProvider.deleteRoom(room[index]);
                                                          }),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 25,
                                                                right: 25),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              'Room Type',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  fontWeight:FontWeight.bold,
                                                                  color: Colors.green[700],
                                                                  fontSize: 20),
                                                            ),
                                                            Text(room[index].type),
                                                            Text(
                                                              'Price/night',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  fontWeight:FontWeight.bold,
                                                                  color: Colors.green[700],
                                                                  fontSize: 20),
                                                            ),
                                                            Text(room[index]
                                                                .getPriceString()),
                                                            Text(
                                                              'Benefits',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  fontWeight:FontWeight.bold,
                                                                  color: Colors.green[700],
                                                                  fontSize: 20),
                                                            ),
                                                            Container(
                                                                height: 40,
                                                                child: Text(room[index].benefits)),
                                                            Text(
                                                              '\n',
                                                              style: TextStyle(fontSize: 8),
                                                            ),
                                                          ],
                                                        ))
                                                  ])),
                                              Text('       ')
                                            ],
                                          )))
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

  List<MyRooms> select2(List<MyRooms> room, String u) {
    List<MyRooms> l = [];
    if ((room != null))
      for (int i = 0; i < room.length; i++)
        if (room[i].uidHotel == u) {
          l.add(room[i]);
        }
    return l;
  }
}
