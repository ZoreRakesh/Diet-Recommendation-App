import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/log_and_signup/welcome_screen.dart';
import 'package:flutter_application_1/responsive/mobile_screen_layout.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyD4n2356evIuRlqkMuq5do3wTUzEL3kFeM",
      appId: "1:1094506106434:web:3dd15d07dd0a2389e527db",
      messagingSenderId: "1094506106434",
      projectId: "insta-clone-c4d7e",
      storageBucket: "insta-clone-c4d7e.appspot.com",
      databaseURL: "https://insta-clone-c4d7e-default-rtdb.firebaseio.com",
    ));
  } else {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyD4n2356evIuRlqkMuq5do3wTUzEL3kFeM",
      appId: "1:1094506106434:web:3dd15d07dd0a2389e527db",
      messagingSenderId: "1094506106434",
      projectId: "insta-clone-c4d7e",
      databaseURL: "https://insta-clone-c4d7e-default-rtdb.firebaseio.com",
    ));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project-app',
      theme: ThemeData(brightness: Brightness.light, fontFamily: "nunito")
          .copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),

      // home: BMI(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // Checking if the snapshot has any data or not
            if (snapshot.hasData) {
              // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
              return const MobileScreenLayout();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }

          // means connection to future hasnt been made yet
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return WelcomePage();
        },
      ),
    );
  }
}
