

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Main_Page/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Main_Page/SignIn.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';

import 'Mainmenu/Page3.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: LoginPage());
    // return Hpage();
  }


}
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(

    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went Wrong'));
        } else if (snapshot.hasData) {
          return Mainmenu();
        } else {
          return LoginPage();
        }
      },

    ),
  );
}
