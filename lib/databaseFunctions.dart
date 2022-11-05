import 'package:cloud_firestore/cloud_firestore.dart';

create(String collName, String docName, String name, String city, String email, String age) async{
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName).set({
      'name':name, 'city':city, 'email':email, 'age':age
    });
  print('Database Updated');
}