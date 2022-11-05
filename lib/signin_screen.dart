import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signin/home_screen.dart';
import 'package:google_signin/userInfo.dart';
import 'doctor_page.dart';
import 'main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4DBD2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image(image: AssetImage('Assets/Images/LoginImage.jpeg')),
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              child: Text(
                'App Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'Righteous'
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                minimumSize: const Size.fromHeight(50), // NEW
                  padding: EdgeInsets.all(5),
                ),
                onPressed: () {
                  signup(context);
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24),
                ),),
            ),
          ]
        ),
      ),
    );
  }
}

final FirebaseAuth auth = FirebaseAuth.instance;
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email'
  ],
);

Future<void> signup(BuildContext context) async {
  final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    final User? user = auth.currentUser;
    final uid = user?.uid;
    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UserData(uid: uid.toString(),)));
    }
  }
}