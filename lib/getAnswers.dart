import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AuthServices.dart';
import 'quiz_screen.dart';


class GetAnswers extends StatefulWidget {

  @override
  _GetAnswersState createState() => _GetAnswersState();
}

class _GetAnswersState extends State<GetAnswers> {


  final CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection(AuthService().inputData()!);

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
    print(allData.length);
    print(allData[1]);
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}
