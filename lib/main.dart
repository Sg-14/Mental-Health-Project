import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/home_screen.dart';
import 'signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing the firebase app
  await Firebase.initializeApp();

  // calling of runApp
  runApp(GooglesignIn());
}

class GooglesignIn extends StatefulWidget {
  GooglesignIn({Key? key}) : super(key: key);
  @override
  _GooglesignInState createState() => _GooglesignInState();
}

class _GooglesignInState extends State<GooglesignIn> {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: MaterialApp(
        //materialApp title
        title: 'SignIn ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SignInScreen(),
        )
    );
  }
}

