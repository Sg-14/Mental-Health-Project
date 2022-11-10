import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String? inputData() {
    final User? user = _firebaseAuth.currentUser;
    final uid = user?.uid;
    return uid;
  }

  getProfileImage() {
    if(_firebaseAuth.currentUser?.photoURL != null) {
      var photo =  _firebaseAuth.currentUser?.photoURL;
      return CircleAvatar(
        radius: 70,
          backgroundImage: NetworkImage(photo!)) ;
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }
}