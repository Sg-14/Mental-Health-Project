import 'package:flutter/material.dart';
import 'package:google_signin/getInfo.dart';
import 'questions.dart';

Brain questions = Brain();

class Showreport extends StatefulWidget {
  final String ans0;
  final String ans1;
  final String ans2;
  final String ans3;

  Showreport(
      {required this.ans0,
        required this.ans1,
        required this.ans2,
        required this.ans3});

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
            // Container(
            //   height: 150,
            //   child: Center(child: GetInfo(documentId: widget.ans0, index: 1)),
            // ),
            Container(
              height: 150,
              child: const Center(
                child: Text(
                  'Your Report',
                  style: TextStyle(fontSize: 50, fontFamily: 'DancingScript'),
                ),
              ),
            ),
            Container(
              height: 600,
              child: ListView.builder(
                itemCount: questions.total(),
                itemBuilder: (_, int index) {
                  return Column(
                    children: [
                      Container(
                        height: 147,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              height: 137,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    ' Q) ' +
                                        questions.getquestion2(index),
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'Righteous'),
                                  ),
                                  Text(''),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text('Ans) ',
                                        style: TextStyle(
                                          fontSize: 20, fontFamily: 'Righteous'
                                        ),
                                        ),
                                        GetInfo(
                                            documentId: widget.ans0, index: index),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  );
                },
              ),
            ),

            // Expanded(child: _listview(widget.ans0))
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
