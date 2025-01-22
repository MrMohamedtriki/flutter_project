import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/firebase_options.dart';
import 'package:flutter_project/pages/login/login.dart';
import 'package:flutter_project/responsive/mobile.dart';
import 'package:flutter_project/responsive/responsive.dart';
import 'package:flutter_project/responsive/web.dart';
import 'package:flutter_project/screens/register.dart';
// import 'package:flutter_project/screens/sign_in.dart';

 void main() async { 
    WidgetsFlutterBinding.ensureInitialized();
    if (kIsWeb) {
      await Firebase.initializeApp(
         options: const FirebaseOptions(
           apiKey: "dddd",
           authDomain: "dddd",
           projectId: "dddd",
           storageBucket: "dddd",
           messagingSenderId: "dddd",
           appId: "dddd"));
  } else {
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,  
);
  }
 runApp(const MyApp());
 }



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light(useMaterial3: true),
      theme: ThemeData.dark(),
      home:Login()
      // Login()
          // Responsive(myMobileScreen: MobileScreen(), myWebScreen: WebScreen()),
    );
  }
}
