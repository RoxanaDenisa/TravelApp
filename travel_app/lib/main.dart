import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/companyAdd.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_app/providers/images_provider.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ImagesProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: new MyLogin(),
        ));
  }
}
