import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/Notes_Page_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  _NoteEditorScreenState createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardColor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add a new Note',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title'
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            SizedBox(height: 8,),
            Text(date),
            SizedBox(height: 28,),
            TextField(
              keyboardType: TextInputType.text,
              maxLines: null,
              controller: _mainController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note content'
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: ()async{
          FirebaseFirestore.instance.collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid).collection('Notes').add(
              {
                "note_title": _titleController.text,
                "creation_date": date,
                "note_content": _mainController.text,
                "color_id": color_id,
              }).then((value){
                print(value.id);
                Navigator.pop(context);
          }).catchError((error)=>print("Failed to add data due to $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
