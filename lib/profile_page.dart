import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_signin/AuthServices.dart';
import 'package:google_signin/signin_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name = '';
  String? age = '';
  String? city = '';
  String? email = '';

  Future getData() async{
    await FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid).get()
    .then((snapshot) async{
      if(snapshot.exists){
        setState(() {
          name = snapshot.data()!["name"];
          age = snapshot.data()!["age"];
          email = snapshot.data()!["email"];
          city = snapshot.data()!["city"];
        });
      }
    })
    ;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.end,
// crossAxisAlignment: CrossAxialAlignment.stretch, stretche the containers to span the whole width of screen
            children: <Widget>[
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('images/shivank.jpg'),
              ),
              Text(
                'Name: '+name!,
                style: TextStyle(
                  fontFamily: 'Parisienne',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Age: '+age!,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 19.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 220.0,
                child: Divider(
                  // Similar to hr tag of html
                  color: Colors.white60,
                ),
              ),
              Card(
                // Instead of card we can also use container but card is desigmed for this purpose only
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
// padding: EdgeInsets.all(5.0),   // Card widget does not support padding hence we have to wrap row with padding widget
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blueGrey,
                    ),
                    title: Text(
                      '+91 6266991360',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                // Instead of card we can also use container but card is a widget especially for tyhis type of data
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
// padding: EdgeInsets.all(5.0),   Card widget does not support padding hence we will have to row with a padding widget
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.blueGrey,
                    ),
                    title: Text(
                      'Email: '+email!,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
