import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_signin/getInfo.dart';
import 'AuthServices.dart';
import 'quiz_screen.dart';
import 'show_report.dart';

class GetAnswers extends StatefulWidget {
  @override
  _GetAnswersState createState() => _GetAnswersState();
}

class _GetAnswersState extends State<GetAnswers> {
  // final CollectionReference _collectionRef =
  // FirebaseFirestore.instance.collection(AuthService().inputData()!);
  //
  // Future getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await _collectionRef.get();
  //
  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //
  //   // print(allData);
  //   // print(allData.length);
  //   // print(allData[1]);
  //   print(allData);
  //   return allData.length;
  // }

  final user = FirebaseAuth.instance.currentUser;

  List<String> docIds = [];

  Future getDocIds() async{
    await FirebaseFirestore.instance.collection(AuthService().inputData()!).get().then(
            (snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docIds.add(element.reference.id);
            }));
  }
  // late int i = getData() as int;
  // late int i = getData() as int;
  // async abc(i){i=getData();}

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getDocIds();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Container(
            child: FutureBuilder(
              future: getDocIds(),
              builder: (context, snapshot){
                return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index){
                      return ListTile(
                          title: GetInfo(documentId: docIds[index]),
                          tileColor: Colors.greenAccent
                      );
                    }
                );
              },
            )
            ),
          )
        );
  }
}