import 'package:flutter/material.dart';
import 'package:demoji/demoji.dart';
import 'package:google_signin/doctor_page.dart';
import 'package:google_signin/doctor_page2.dart';
import 'package:google_signin/profile_page.dart';
import 'package:google_signin/quiz_screen.dart';
import 'getAnswers.dart';
import 'thoughts.dart';

Thoughts feeling = Thoughts();

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // var fontSize = 20;
  //
  // void changeFontSize() async {
  //   setState(() {
  //     fontSize = fontSize + 10;
  //   });
  // }

  String a = 'How do you feel today?';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.home,
                size: 30,
                color: Color(0xFFFFD180),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.home,
                size: 30,
                color: Color(0xFFFFD180),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile()),
                );
              },
              child: const Icon(
                Icons.account_circle,
                size: 30,
                color: Color(0xFFFFD180),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.home,
                size: 30,
                color: Color(0xFFFFD180),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: const Center(
              child: Text(
                'Good morning',
                style: TextStyle(fontSize: 50, fontFamily: 'DancingScript'),
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                const Text(
                  'How do you feel today?',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            a = feeling.getsad();
                            const Text(
                              Demoji.disappointed,
                              style: TextStyle(fontSize: 60),
                            );
                          });
                        },
                        child: const Text(
                          Demoji.disappointed,
                          style: TextStyle(fontSize: 20),
                        )),
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            a  = feeling.getangry();
                            const Text(
                              Demoji.angry,
                              style: TextStyle(fontSize: 30,
                                color: Colors.red
                              ),
                            );
                          });
                        },
                        child: const Text(
                          Demoji.angry,
                          style: TextStyle(fontSize: 20),
                        )),
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            a = feeling.getcry();
                            const Text(
                              Demoji.sob,
                              style: TextStyle(fontSize: 30),
                            );
                          });
                        },
                        child: const Text(
                          Demoji.sob,
                          style: TextStyle(fontSize: 20),
                        )),
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            a = feeling.gethappy();
                            const Text(
                              Demoji.grinning,
                              style: TextStyle(fontSize: 30),
                            );
                          });
                        },
                        child: const Text(
                          Demoji.grinning,
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                )
              ],
            ),
          ), // How do you feel today
          Container(
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFEFEBE9),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  height: 130,
                  width: 180,
                  color: const Color(0xFFEFEBE9),
                  child: Text(
                    '$a',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Image.asset(
                  'Assets/Images/bh2.jpeg',
                  height: 130,
                  width: 150,
                ),
              ],
            ),
          ), // Thought of the day
          const Text(
            'Exercises',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Tests()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFEFEBE9),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'Assets/Images/tests.png',
                            height: 110,
                            width: 120,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            color: const Color(0xFFEFEBE9),
                            child: const Center(
                              child: Text(
                                'Tests',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //Tests
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFEFEBE9),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'Assets/Images/doctor.jpeg',
                            height: 110,
                            width: 120,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            color: const Color(0xFFEFEBE9),
                            child: const Center(
                              child: Text(
                                'Doctors',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //Doctors
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetAnswers()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFEFEBE9),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'Assets/Images/reports.png',
                            height: 110,
                            width: 120,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            color: const Color(0xFFEFEBE9),
                            child: const Center(
                              child: Text(
                                'Reports',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ) //Exercises
        ],
      ),
    ));
  }
}
