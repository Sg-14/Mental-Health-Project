import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AuthServices.dart';
import 'quiz_screen.dart';
import 'show_report.dart';

class GetAnswers extends StatefulWidget {
  @override
  _GetAnswersState createState() => _GetAnswersState();
}

class _GetAnswersState extends State<GetAnswers> {
  final CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection(AuthService().inputData()!);

  Future<int> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    // print(allData);
    // print(allData.length);
    // print(allData[1]);
    return allData.length;
  }

  // late int i = getData() as int;
  // late int i = getData() as int;
  // async abc(i){i=getData();}

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              // print(i);
              Container(
                height: 150,
                child: const Center(
                  child: Text(
                    'Reports',
                    style: TextStyle(fontSize: 50, fontFamily: 'DancingScript'),
                  ),
                ),
              ),
              for (int j = 1; j <= 3; j++)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Showreport()));
                      },
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFEFEBE9),
                        ),
                        child: const Center(
                          child: Text(
                            'Test-1',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                )
            ],
          ),
        ));
  }
}