import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_app/providers/companyInfo_provider.dart';
import 'package:travel_app/providers/images_provider.dart';
import 'package:travel_app/services/companyInfoService.dart';
import 'package:travel_app/services/imageService.dart';
import 'package:travel_app/providers/rooms_provider.dart';
import 'package:travel_app/services/roomService.dart';
//import 'package:flutter_auth/Screens/Welcome/components/background.dart';
//import 'package:flutter_svg/svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageService=ImageService();
    final roomService=RoomService();
    final icService=CompanyInfoService();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ImagesProvider()),
          StreamProvider(create: (context)=>imageService.getImage()),
          ChangeNotifierProvider(create: (context) => RoomsProvider()),
          StreamProvider(create: (context)=>roomService.getRoom()),
          ChangeNotifierProvider(create:(context)=>CompanyInfoProvider()),
          StreamProvider(create: (context)=>icService.getInfo()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: new MyLogin(),
        ));
  }
}
