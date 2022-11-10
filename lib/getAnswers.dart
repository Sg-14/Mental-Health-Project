import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_signin/getInfo.dart';
import 'AuthServices.dart';
import 'show_report.dart';

class GetAnswers extends StatefulWidget {
  @override
  _GetAnswersState createState() => _GetAnswersState();
}

class _GetAnswersState extends State<GetAnswers> {
  final user = FirebaseAuth.instance.currentUser;

  List<String> docIds = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection(AuthService().inputData()!)
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
      print(element.reference);
      docIds.add(element.reference.id);
    }));
    print(docIds.length);
    print(docIds[0]);
    print(GetInfo(documentId: docIds[2], index: 2));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 150,
              child: const Center(
                child: Text(
                  'Reports',
                  style: TextStyle(fontSize: 50, fontFamily: 'DancingScript'),
                ),
              ),
            ),
            Container(
              height: 500,
              child: FutureBuilder(
                future: getDocIds(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Showreport(
                                          ans0: docIds[index],
                                          // ans1: GetInfo(
                                          //   documentId: docIds[index],
                                          //   index: 1,
                                          // ).toString(),
                                          ans1: docIds[index],
                                          ans2: GetInfo(
                                            documentId: docIds[index],
                                            index: 2,
                                          ).toString(),
                                          ans3: GetInfo(
                                            documentId: docIds[index],
                                            index: 3,
                                          ).toString())));
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
                                  'Test-',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
