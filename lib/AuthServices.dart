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
}