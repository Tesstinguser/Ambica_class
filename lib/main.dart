import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'LoginFiles/login_screen.dart';
import 'LoginFiles/student_listing.dart';
import 'LoginFiles/veryfy_orgcode.dart';
import 'Unusalbefile/crudimage.dart';
import 'Unusalbefile/imagefirebses.dart';
import 'Unusalbefile/imagestoredata.dart';
import 'Unusalbefile/login.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xff454283),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // useMaterial3: true,
      ),
       // home: LoginPage(),
      // home: LoginScreen(),
      home: Student_Listing(),
      // home: cbcrud(),

       // home: demo(),
      //  home: StudentDetailsPage(studentId: '1',),
    );
  }
}
  //chttps://youtu.be/rBnxI6udmXQ?si=WsGil3cJAvnzmZ9N