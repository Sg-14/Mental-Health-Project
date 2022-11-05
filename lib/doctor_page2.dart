// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_signin/getDoctorData.dart';
// import 'dart:convert';
//
// import 'description_screen.dart';
//
// class DoctorListPage extends StatefulWidget {
//   DoctorListPage({Key? key}) : super(key: key);
//
//   @override
//   _DoctorListPageState createState() => _DoctorListPageState();
// }
//
// class _DoctorListPageState extends State<DoctorListPage> {
//   List docIds = [];
//   List doctorInfo = [];
//   bool doctorClicked = false;
//
//   Future getDocIds() async{
//     await FirebaseFirestore.instance.collection('Doctors').get().then(
//             (snapshot) => snapshot.docs.forEach((doctor) {
//               docIds.add(doctor.reference.id);
//             })
//     );
//     print(docIds.length);
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     getDocIds();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [Color(0xff4D7482),Color(0xFF87F9BB)],
//             begin: const FractionalOffset(0.0, 0.4),
//             end: Alignment.topRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.only(top:70, left: 30, right: 30),
//               width: MediaQuery.of(context).size.width,
//               height: 200,
//               child: Text("Psychologist", style: TextStyle(
//                   fontSize: 35,
//                   color: Color(0xFFfefeff)
//               ),),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                     color:Colors.white,
//                     borderRadius: BorderRadius.only(topRight: Radius.circular(70))
//                 ),
//                 child: Column(
//                     children: [
//                       SizedBox(height: 10,),
//                       Row(
//                           children: [
//                             SizedBox(width: 30,),
//                             Text(
//                               "Doctors Available",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color:Color(0xFF2f2f51)
//                               ),
//                             ),
//                           ]),
//                       Expanded(
//                         child: FutureBuilder(
//                           future: getDocIds(),
//                             builder: (context, snapshot){
//                               return _listview();
//                             }),
//                       )
//                     ]
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _listview() {
//     return ListView.builder(
//       itemCount: docIds.length, // Add length of json file
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           child: _widgetCard(index),
//           onTap: (){
//             Navigator.push(context,
//               MaterialPageRoute(builder: (context)=>DescriptionScreen(
//                   description: GetData(documentId: docIds[index], dataValue: 'description',).toString(),
//                   name: GetData(documentId: docIds[index], dataValue: 'name',).toString(),
//                   image: GetData(documentId: docIds[index], dataValue: 'image',).toString(),
//                   phone: GetData(documentId: docIds[index], dataValue: 'phone',).toString(),
//                   email: GetData(documentId: docIds[index], dataValue: 'email',).toString(),
//                   address: GetData(documentId: docIds[index], dataValue: 'address',).toString(), rating: '',
//               )
//               ),
//             );
//           },
//         );
//       }, // Build the ListView
//     );
//   }
//
//   _widgetCard(int index) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
//       height: 125,
//       width: 200,
//       child: Row(
//         children: [
//           Container(
//             height: 100,
//             width: 100,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(doctorInfo[index]["image"]))),
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 child: Text(
//                     '${GetData(documentId: docIds[index],dataValue: 'name',)}',
//                     style:
//                     TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
//               ),
//               Container(
//                 child: Text(
//                   '${GetData(documentId: docIds[index],dataValue: 'experience',)} experience',
//                   style: TextStyle(color: Color(0xFFBAB9C0)),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     child: Text(
//                       // 'from' + doctorInfo[index]["rated_count"] + '@',
//                       'from ${GetData(documentId: docIds[index],dataValue: 'rating_count',)}',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 4,
//                   ),
//                   Container(
//                     child: Text(
//                       '* ${GetData(documentId: docIds[index],dataValue: 'rating',)}',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

