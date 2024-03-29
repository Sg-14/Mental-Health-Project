import 'package:demoji/demoji.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/AuthServices.dart';
import 'home_screen.dart';
import 'questions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_date/dart_date.dart';
import 'package:google_signin/getAnswers.dart';

Brain quiz = Brain();

class Tests extends StatefulWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  int lol = 0;
  final _firestore = FirebaseFirestore.instance;
  List<dynamic> l = [1];
  int count = 0;
  int q_num = quiz.Get();

  // final List<dynamic> sub_collectionId = new List();
  List sub_collectionId = [];
  List SubCollectionId() {
    return sub_collectionId;
  }

  // getAnswers({ids: sub_collectionId});
  late int value;
  late String question;
  final name = DateTime.now().format('dd-MMMM-yyyy', 'de_US');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Center(
                          child: Text(
                            'Test',
                            style: TextStyle(
                                fontSize: 40, fontFamily: 'DancingScript'),
                          ),
                        ), //PRINT QUESTION TEXT
                        const SizedBox(
                          height: 100,
                          width: 300,
                          child: Center(
                            child: Text(
                              'Complete the test for your betterment',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontFamily: 'DancingScript'),
                            ),
                          ),
                        ), // PRINT COMPLETE THE TEST TEST
                        const SizedBox(
                          height: 50,
                        ), //SPACE
                        Container(
                          width: 350,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFEFEBE9),
                          ),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ), //SPACE
                              SizedBox(
                                width: 300,
                                height: 235,
                                child: Text(
                                  quiz.getquestion(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ), //QUESTIONS DISPLAY
                              SizedBox(
                                  width: 300,
                                  height: 135,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        count.toString(),
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      Slider(
                                        value: count.toDouble(),
                                        min: 0,
                                        max: 10,
                                        activeColor: const Color(0xFFFB1555),
                                        inactiveColor: const Color(0xFF8D8E98),
                                        onChanged: (double newvalue) {
                                          setState(() {
                                            count = newvalue.round();
                                          });
                                        },
                                      ),
                                    ],
                                  )) //ANSWER DISPLAY
                            ],
                          ),
                        ), //QUESTION AND ANSWER BOX
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () async {
                              final uid = AuthService().inputData();
                              setState(() {
                                question = quiz.getquestion();
                                print(question);
                                value = count;
                                q_num = quiz.Get();
                                l.add(value);
                                quiz.next();
                                sub_collectionId.add(name);
                                lol++;
                                if (lol >= 3) {
                                  showAlertDialog(
                                      context,
                                      'Thanks for completing the test',
                                      "AppName",
                                      "Ok");
                                }
                              });
                              ;
                              await _firestore.collection(uid!).doc('$name').set({
                                'question0': l[0],
                                'question1': l[1],
                                'question2': l[2],
                                'question3': l[3],
                              });
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(fontSize: 25, color: Colors.black),
                            )) //NEXT
                      ],
                    ) //Questions and complete the test
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

showAlertDialog(BuildContext context, String message, String heading,
    String buttonAcceptTitle) {
  // set up the buttons
  Widget continueButton = TextButton(
    child: Text(buttonAcceptTitle),
    onPressed: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homescreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(heading),
    content: Text(message),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

