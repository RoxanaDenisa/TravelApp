import 'package:travel_app/companyAdd.dart';
import 'package:travel_app/objects/companyInfo.dart';
import 'package:travel_app/objects/reservation.dart';
import 'package:travel_app/objects/rooms.dart';
import 'package:travel_app/providers/reservation_provider.dart';
import 'package:travel_app/reservationDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCompanyHome extends StatefulWidget {
  MyCompanyHome();
  @override
  _MyCompanyHomeState createState() => new _MyCompanyHomeState();
}

class _MyCompanyHomeState extends State<MyCompanyHome> {
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    final ci=Provider.of<List<MyCompanyInfo>>(context);
    final currentInfo=selectt(ci,FirebaseAuth.instance.currentUser.uid.toString());
     final reserv= Provider.of<List<Reservation>>(context);
    final room= Provider.of<List<MyRooms>>(context);
     final req=getMyRequests(room,reserv,FirebaseAuth.instance.currentUser.uid.toString());
     final res=getMyReservations(room,reserv,FirebaseAuth.instance.currentUser.uid.toString());
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
     body: (res != null && ci != null)
            ?Column(children: <Widget>[
              AppBar(
                  toolbarHeight: 40,
                  automaticallyImplyLeading: false,
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
                  width: (MediaQuery.of(context).size.width * 9/ 10),
                  height: (MediaQuery.of(context).size.height * 2 / 3),
                  child: ListView(
                      scrollDirection: Axis.vertical,

                      children: <Widget>[
                         Text('\nWelcome!\n',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey
                                  ),
                                  ),
                                  Text('Your order requests:\n',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black
                                  ),
                                  ),Center(
                  child: Container(
                      width: 275,
                      height: 40,
                      child: Center(
                          child: Row(children: <Widget>[
                        Icon(Icons.check_circle,
                            size: 12, color: Colors.lightGreenAccent[400]),
                        Text(
                          '- confirm reservation        ',
                          style: TextStyle(fontSize: 10),
                        ),
                        Icon(Icons.cancel, size: 12, color: Colors.red),
                        Text(
                          '- cancel the reservation',
                          style: TextStyle(fontSize: 10),
                        )
                      ])))),
                        Container(
                            width: 300,
                            height:
                                (MediaQuery.of(context).size.height * 1/ 3),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  DataTable(
                                    headingRowColor:
                                        MaterialStateColor.resolveWith((state) {
                                      return Colors.orange[800];
                                    }),
                                    headingTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    columns: <DataColumn>[
                                      DataColumn(
                                          label: Text('Name'),
                                          numeric: false),
                          
                                      DataColumn(
                                          label: Text('Details'), numeric: false),
                                      DataColumn(
                                          label: Text('    Status'),
                                          numeric: false),
                                    ],
                                     rows: List<DataRow>.generate(
                                                req.length,
                                                (index) =>
                                                    DataRow(cells: <DataCell>[
                                                      DataCell(Container(
                                                          width: 60,
                                                          child: Text(req[index].name))),
                                                      DataCell(Container(
                                                          width: 30,
                                                          child: IconButton(
                                                                     icon: Icon(Icons.remove_red_eye_rounded,color: Colors.black,size: 20,),
                                                                     onPressed: (){
                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                         builder: (context) => MyReservationDetails(req[index])));
                                                                     }))),
                                                      DataCell(Container(
                                                          child: Column(
                                                            children:[
                                                              Text(req[index].status),
                                                              (req[index].status=='In progress')
                                                              ?Container(
                                                                height: 30,
                                                                child:Row(
                                                                 children:[
                                                                   IconButton(
                                                                     icon: Icon(Icons.cancel,color: Colors.red,size: 20,),
                                                                     onPressed: (){
                                                                        reservationProvider.setStatus('Denied');
                                                                        reservationProvider.setUID(req[index].uid);
                                                                        reservationProvider.setPret(req[index].pret);
                                                                        reservationProvider.setTipCamera(req[index].tipCamera);
                                                                        reservationProvider.setname(req[index].name);
                                                                        reservationProvider.setNrPersoane(req[index].nrPersoane);
                                                                        reservationProvider.setNrZile(req[index].nrZile);
                                                                        reservationProvider.setPerioada(req[index].perioada);
                                                                        reservationProvider.toSave();
                                                                     },),
                                                                     IconButton(
                                                                     icon: Icon(Icons.check_circle,color: Colors.green,size: 20,),
                                                                     onPressed: (){
                                                                       reservationProvider.setStatus('Confirmed');
                                                                        reservationProvider.setUID(req[index].uid);
                                                                        reservationProvider.setPret(req[index].pret);
                                                                        reservationProvider.setTipCamera(req[index].tipCamera);
                                                                        reservationProvider.setname(req[index].name);
                                                                        reservationProvider.setNrPersoane(req[index].nrPersoane);
                                                                        reservationProvider.setNrZile(req[index].nrZile);
                                                                        reservationProvider.setPerioada(req[index].perioada);
                                                                       reservationProvider.toSave();
                                                                     },)
                                                                 ]
                                                              ))
                                                              :Container(width: 0,height:0)
                                                          ])))
                                                    ]))),
                                ])),
                                 Text('Confirmed orders:\n',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black
                                  ),
                                  ),
                        Container(
                            width: 300,
                            height:
                                (MediaQuery.of(context).size.height * 1 / 3),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  DataTable(
                                    headingRowColor:
                                        MaterialStateColor.resolveWith((state) {
                                      return Colors.orange[800];
                                    }),
                                    headingTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    columns: <DataColumn>[
                                      DataColumn(
                                          label: Text('Name'),
                                          numeric: false),
                          
                                      DataColumn(
                                          label: Text('Details'), numeric: false),
                                      DataColumn(
                                          label: Text('    Status'),
                                          numeric: false),
                                    ],
                                     rows: List<DataRow>.generate(
                                                res.length,
                                                (index) =>
                                                    DataRow(cells: <DataCell>[
                                                      DataCell(Container(
                                                          width: 60,
                                                          child: Text(res[index].name))),
                                                      DataCell(Container(
                                                          width: 30,
                                                          child: IconButton(
                                                                     icon: Icon(Icons.remove_red_eye_rounded,color: Colors.black,size: 20,),
                                                                     onPressed: (){
                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                         builder: (context) => MyReservationDetails(res[index])));
                                                                     }))),
                                                      DataCell(Container(
                                                          child: 
                                                              Text(res[index].status)
                                                          ))
                                                    ]))),
                                ])),
                                
                      ]))
            ]):Center(child: CircularProgressIndicator()));
  }
  List<Reservation> select2(List<Reservation> room, String u) {
    List<Reservation> l = [];
    if ((room != null))
      for (int i = 0; i < room.length; i++)
        if (room[i].uid == u) {
          l.add(room[i]);
        }
    return l;
  }
  List<Reservation> getMyRequests(List<MyRooms>room,List<Reservation> reservations,String u){
    List<Reservation> l=[];
    if(reservations!=null&&room!=null)
     {
       int i;
       for(i=0;i<room.length;i++)
       if(room[i].uidHotel==u)
       {
         for(int j=0;j<reservations.length;j++)
         if(room[i].uid==reservations[j].tipCamera&&reservations[j].status=='In progress')
         {
            l.add(reservations[j]);
           
         }
       }
      
     }
    return l;
  } 
  List<Reservation> getMyReservations(List<MyRooms>room,List<Reservation> reservations,String u){
    List<Reservation> l=[];
    if(reservations!=null&&room!=null)
     {
       int i;
       for(i=0;i<room.length;i++)
       if(room[i].uidHotel==u)
       {
         for(int j=0;j<reservations.length;j++)
         if(room[i].uid==reservations[j].tipCamera&&reservations[j].status!='In progress')
         {
            l.add(reservations[j]);
           
         }
       }
      
     }
    return l;
  } 
  MyCompanyInfo selectt(List<MyCompanyInfo> imgs,String u){
         
          if((imgs!=null))
          for(int i=0;i<imgs.length;i++)
          if(imgs[i].uid==u)
          {
              return imgs[i];
          }
          return null;
        }
}

      
  

