import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AuthServices.dart';
import 'questions.dart';

Brain questions = Brain();

class Showreport extends StatefulWidget {

  final String ans0;
  final String ans1;
  final String ans2;
  final String ans3;

  Showreport({required this.ans0, required this.ans1, required this.ans2, required this.ans3});

  @override
  State<Showreport> createState() => _ShowreportState();
}

class _ShowreportState extends State<Showreport> {
  int i = questions.total();
  void lol() {
    int k = questions.next();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEFEBE9),
        body: Column(
          children: [
            Container(
              height: 150,
              child: const Center(
                child: Text(
                  'Report of Test-1',
                  style: TextStyle(fontSize: 50, fontFamily: 'DancingScript'),
                ),
              ),
            ),
            Expanded(child: _listview())
          ],
        ),
      ),
    );
  }
}

_listview() {
  return ListView.builder(
      itemCount: questions.total(),
      itemBuilder: (_, int index) {
        return Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              child: _widgetCard(index),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        );
      });
}

_widgetCard(int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    // mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        ' ' + questions.lol() + ') ' + questions.getquestion2(index),
        style: TextStyle(fontSize: 20, fontFamily: 'Righteous'),
      )
    ],
  );
}