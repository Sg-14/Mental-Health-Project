import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatelessWidget {
  final String documentId;
  final String dataValue;

  GetData({required this.dataValue, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Doctors');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            Map<dynamic,dynamic> data =
                snapshot.data!.data() as Map<dynamic,dynamic>;
            return Text('${data[dataValue]}');
          }else{
            return Text('loading...');
          }
        })
    );
  }
}
