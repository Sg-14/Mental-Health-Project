import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/Notes_Page_style.dart';
import 'package:google_signin/Notes_card.dart';
import 'package:google_signin/note_editor.dart';
import 'package:google_signin/note_reader.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.maincolor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('MyNotes'),
        centerTitle: true,
        backgroundColor: AppStyle.maincolor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('Your recent Notes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20,),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('Notes').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children: snapshot.data!.docs.map((note) => noteCard((){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>NoteReaderScreen(note)));
                    }, note)).toList(),
                    );
                  }

                  return Text(
                    'there\'s no notes',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteEditorScreen()));
          },
          label: Text('Add Notes'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
