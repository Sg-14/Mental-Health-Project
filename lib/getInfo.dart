import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_signin/AuthServices.dart';

class GetInfo extends StatelessWidget {

  final String documentId;
  GetInfo({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(AuthService().inputData()!);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            Map <String,dynamic> data = snapshot.data!.data() as Map <String,dynamic>;
            return Text('Data: ${data}');
          }
          return Text('Loading..');
        });
  }
}
