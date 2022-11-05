import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'description_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List doctorInfo = [];
  bool doctorClicked = false;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/doctor_info.json")
        .then((value) {
      setState(() {
        doctorInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff4D7482),Color(0xFF87F9BB)],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top:70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Text("Psychologist", style: TextStyle(
                  fontSize: 35,
                  color: Color(0xFFfefeff)
              ),),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(70))
                ),
                child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                          children: [
                            SizedBox(width: 30,),
                            Text(
                              "Doctors Available",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:Color(0xFF2f2f51)
                              ),
                            ),
                          ]),
                      Expanded(
                          child:_listview()
                      )
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _listview() {
    return ListView.builder(
      itemCount: doctorInfo.length, // Add length of json file
      itemBuilder: (_, int index) {
        return GestureDetector(
          child: _widgetCard(index),
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>DescriptionScreen(
                    description: doctorInfo[index]["description"],
                    name: doctorInfo[index]["name"],
                    image: doctorInfo[index]['image'],
                    phone: doctorInfo[index]['phone'],
                    email: doctorInfo[index]['email'],
                    address: doctorInfo[index]['address'],
                    rating: doctorInfo[index]['rating'],
                )
            ),
            );
          },
        );
      }, // Build the ListView
    );
  }

  _widgetCard(int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      height: 125,
      width: 200,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(doctorInfo[index]["image"]))),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(doctorInfo[index]["name"],
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ),
              Container(
                child: Text(
                  doctorInfo[index]["experience"] + ' expeience',
                  style: TextStyle(color: Color(0xFFBAB9C0)),
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      'from' + doctorInfo[index]["rated_count"] + '@',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    child: Text(
                      "⭐ " + doctorInfo[index]["rating"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

